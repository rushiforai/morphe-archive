package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The checks behind the Meta AI, imagine and imagine yourself rows in Messenger's newer @ list (584 on). That list is a
 * render of its own that asks these checks directly instead of running the mention plugin dispatchers. The Meta AI row
 * asks a different check per chat type: regular chats, encrypted chats and community channels.
 */
internal const val AI_MENTION_ROWS = "ai_mention_rows"

internal const val CAPABILITIES = "Lcom/facebook/xapp/messaging/capability/vector/Capabilities;"

/**
 * The server flags each Meta AI row check reads in 588, and the one each imagine check reads. Meta renumbers them with
 * each release, so a check reading another release's numbers isn't taken. META_AI_SHARED_FLAG is the one every Meta AI
 * check reads.
 */
internal const val META_AI_SHARED_FLAG = 0x8105fd011b2d32L
internal val META_AI_ROW_FLAGS = setOf(META_AI_SHARED_FLAG, 0x8105fd01042d2bL)
internal val META_AI_CHAT_FLAGS = setOf(META_AI_SHARED_FLAG, 0x8105fd00042ce8L)
internal const val META_AI_ENCRYPTED_FLAG = 0x8105fd00052ce9L
internal const val IMAGINE_ROW_FLAG = 0x8105fd00402cf9L
internal const val IMAGINE_YOURSELF_ROW_FLAG = 0x8105fd00f92d27L

private fun rowsChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the @ list's Meta AI checks moved ($detail)")

private fun Method.serverFlags(): Set<Long> = implementation?.instructions
    ?.filter { it.opcode == Opcode.CONST_WIDE }
    ?.mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }
    ?.toSet().orEmpty()

/**
 * Family B reads the shared flag in a static ()Z getter of its own that the Meta AI checks call, so a call to one counts
 * as reading it. Their ids, set by [findAiMentionRows] before anything asks [aiMentionRow].
 */
internal var metaAiFlagGetters: Set<String> = emptySet()

private fun Method.readsOnlySharedFlag() = AccessFlags.STATIC.isSet(accessFlags) && parameterTypes.isEmpty() && returnType == "Z" &&
    serverFlags() == setOf(META_AI_SHARED_FLAG)

private fun Method.rowFlags(): Set<Long> {
    val flags = serverFlags()
    val asks = implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() in metaAiFlagGetters } == true
    return if (asks) flags + META_AI_SHARED_FLAG else flags
}

/**
 * Which row this instance check answers for, by its parameters and the server flag it reads:
 *
 *     ()Z                                                  both META_AI_ROW_FLAGS: Meta AI in community channels
 *     (FbUserSession, Capabilities)Z                       both META_AI_CHAT_FLAGS: Meta AI in regular chats
 *     (FbUserSession)Z                                     the shared flag and META_AI_ENCRYPTED_FLAG: Meta AI in
 *                                                          encrypted chats (583 wrapped this in a (session,
 *                                                          Capabilities) check, 584 inlined that into the callers)
 *     (FbUserSession, ThreadKey, Capabilities, Z, Z)Z      IMAGINE_ROW_FLAG: imagine
 *     (FbUserSession, ThreadKey, Capabilities)Z            IMAGINE_YOURSELF_ROW_FLAG: imagine yourself
 */
internal fun Method.aiMentionRow(): String? {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" || implementation == null) return null
    val params = parameterTypes.map { it.toString() }
    val flags = rowFlags()
    return when {
        params.isEmpty() && flags.containsAll(META_AI_ROW_FLAGS) -> "meta_ai"
        params == listOf(FB_USER_SESSION, CAPABILITIES) && flags.containsAll(META_AI_CHAT_FLAGS) -> "meta_ai_chats"
        params == listOf(FB_USER_SESSION) && flags.containsAll(setOf(META_AI_SHARED_FLAG, META_AI_ENCRYPTED_FLAG)) -> "meta_ai_encrypted"
        params == listOf(FB_USER_SESSION, THREAD_KEY_TYPE, CAPABILITIES, "Z", "Z") && IMAGINE_ROW_FLAG in flags -> "imagine"
        params == listOf(FB_USER_SESSION, THREAD_KEY_TYPE, CAPABILITIES) && IMAGINE_YOURSELF_ROW_FLAG in flags -> "imagine_yourself"
        else -> null
    }
}

internal val sharedFlagReaders = methodCheck { _, method -> method.readsOnlySharedFlag() }

/** The parameters each row's check takes, the part of [aiMentionRow] that doesn't need [metaAiFlagGetters]. */
private val AI_MENTION_PARAMETERS = setOf<List<String>>(
    emptyList(),
    listOf(FB_USER_SESSION, CAPABILITIES),
    listOf(FB_USER_SESSION),
    listOf(FB_USER_SESSION, THREAD_KEY_TYPE, CAPABILITIES, "Z", "Z"),
    listOf(FB_USER_SESSION, THREAD_KEY_TYPE, CAPABILITIES),
)

/** The instance checks with a row's parameters, before their flags are read: a call to a getter only counts once they're known. */
internal val aiMentionShapes = methodCheck { _, method ->
    !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" && method.implementation != null &&
        method.parameterTypes.map { it.toString() } in AI_MENTION_PARAMETERS
}

/** What an inlined imagine yourself gate asks before it decides: the flag's answer, or no while Hide Meta AI is on. */
internal const val META_AI_ROW_SHOWN = "$SETTINGS->metaAiRowShown(I)Z"

/** Methods reading the imagine yourself flag: its check, or the renders 588 inlined that check into. */
internal val imagineYourselfReaders = methodCheck { _, method -> IMAGINE_YOURSELF_ROW_FLAG in method.serverFlags() }

/**
 * 588 inlined the imagine yourself check into the renders that build its row. Each reads the flag through a static
 * (Object, J)Z getter and skips the row on false:
 *
 *     const-wide vW, IMAGINE_YOURSELF_ROW_FLAG
 *     invoke-static {vO, vW, vW+1}, (Object, J)Z
 *     move-result vA
 *     if-eqz vA, :no_row              the gate, where the hook asks META_AI_ROW_SHOWN first
 *
 * The gates' indexes, or null when a read of the flag has another shape, a branch lands inside it or a try covers it.
 */
internal fun Method.imagineYourselfGates(): List<Int>? {
    val code = implementation?.instructions?.toList() ?: return null
    val reads = code.indices.filter { code[it].opcode == Opcode.CONST_WIDE && (code[it] as WideLiteralInstruction).wideLiteral == IMAGINE_YOURSELF_ROW_FLAG }
    if (reads.isEmpty()) return null
    val targets = jumpTargets()
    val addresses = IntArray(code.size + 1).also { for (i in code.indices) it[i + 1] = it[i] + code[i].codeUnits }
    val tries = implementation!!.tryBlocks
    return reads.map { at ->
        val wide = (code[at] as OneRegisterInstruction).registerA
        val call = code.getOrNull(at + 1)
        val args = call as? FiveRegisterInstruction
        val getter = (call as? ReferenceInstruction)?.reference as? MethodReference
        val answer = code.getOrNull(at + 2)
        val gate = code.getOrNull(at + 3)
        val shaped = call?.opcode == Opcode.INVOKE_STATIC && args?.registerCount == 3 && args.registerD == wide &&
            args.registerE == wide + 1 && args.registerC != wide && args.registerC != wide + 1 && getter?.returnType == "Z" &&
            getter.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;", "J") &&
            answer?.opcode == Opcode.MOVE_RESULT && gate?.opcode == Opcode.IF_EQZ &&
            (gate as OneRegisterInstruction).registerA == (answer as OneRegisterInstruction).registerA &&
            (at + 1..at + 3).none { it in targets } &&
            tries.none { it.startCodeAddress <= addresses[at + 3] && addresses[at + 3] < it.startCodeAddress + it.codeUnitCount }
        if (!shaped) return null
        at + 3
    }
}

/**
 * The five checks, exactly one of each, all on one class, or none. 588 keeps four of them and inlines the imagine
 * yourself check into the renders that build its row, so there the four come with those renders.
 */
internal fun findAiMentionRows(classes: Iterable<ClassDef>): List<Method> {
    metaAiFlagGetters = sharedFlagReaders.methods(classes).map { it.hookId() }.toSet()
    val rows = aiMentionShapes.methods(classes).mapNotNull { method -> method.aiMentionRow()?.let { it to method } }
        .groupBy({ it.first }, { it.second })
    if (rows.values.any { it.size != 1 }) return emptyList()
    val checks = rows.values.map { it.single() }.takeIf { checks -> checks.map { it.definingClass }.toSet().size == 1 }.orEmpty()
    if (rows.size == 5) return checks
    if (rows.size != 4 || "imagine_yourself" in rows || checks.isEmpty()) return emptyList()
    val renders = imagineYourselfReaders.methods(classes).filter { it.aiMentionRow() == null }
    if (renders.isEmpty() || renders.any { it.imagineYourselfGates() == null }) return emptyList()
    return checks + renders
}

internal fun MutableMethod.validateAiMentionRows() {
    if (aiMentionRow() != null) validateSwitch()
    else if (imagineYourselfGates() == null) rowsChanged("unexpected check ${hookId()}")
}

/**
 * With the switch on each check answers false, as it does for an account without the feature, so its row isn't built.
 * A render with the check inlined asks [META_AI_ROW_SHOWN] at each gate instead, which answers false the same way.
 */
internal fun MutableMethod.injectAiMentionRows() {
    validateAiMentionRows()
    if (aiMentionRow() != null) {
        injectSwitch("$SETTINGS->hideMetaAi()Z", "0x0")
        return
    }
    // Last gate first, so each insert leaves the earlier gates' indexes as they were.
    for (gate in imagineYourselfGates()!!.sortedDescending()) {
        val answer = (getInstruction(gate) as OneRegisterInstruction).registerA
        val call = if (answer < 16) "invoke-static {v$answer}" else "invoke-static/range {v$answer .. v$answer}"
        addInstructions(gate, "$call, $META_AI_ROW_SHOWN\nmove-result v$answer")
    }
}
