package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
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
 * The server flags each Meta AI row check reads in 587, and the one each imagine check reads. Meta renumbers them with
 * each release, so a check reading another release's numbers isn't taken. META_AI_SHARED_FLAG is the one every Meta AI
 * check reads.
 */
internal const val META_AI_SHARED_FLAG = 0x810606011b2d20L
internal val META_AI_ROW_FLAGS = setOf(META_AI_SHARED_FLAG, 0x81060601042d19L)
internal val META_AI_CHAT_FLAGS = setOf(META_AI_SHARED_FLAG, 0x81060600042cd6L)
internal const val META_AI_ENCRYPTED_FLAG = 0x81060600052cd7L
internal const val IMAGINE_ROW_FLAG = 0x81060600402ce7L
internal const val IMAGINE_YOURSELF_ROW_FLAG = 0x81060600f92d15L

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

/** The five checks, exactly one of each, all on one class, or none. */
internal fun findAiMentionRows(classes: Iterable<ClassDef>): List<Method> {
    metaAiFlagGetters = classes.flatMap { it.methods }.filter { it.readsOnlySharedFlag() }.map { it.hookId() }.toSet()
    val rows =classes.flatMap { cls -> cls.methods.mapNotNull { method -> method.aiMentionRow()?.let { it to method } } }
        .groupBy({ it.first }, { it.second })
    if (rows.size != 5 || rows.values.any { it.size != 1 }) return emptyList()
    return rows.values.map { it.single() }.takeIf { checks -> checks.map { it.definingClass }.toSet().size == 1 }.orEmpty()
}

internal fun MutableMethod.validateAiMentionRows() {
    if (aiMentionRow() == null) rowsChanged("unexpected check ${hookId()}")
    validateSwitch()
}

/** With the switch on each check answers false, as it does for an account without the feature, so its row isn't built. */
internal fun MutableMethod.injectAiMentionRows() {
    validateAiMentionRows()
    injectSwitch("$SETTINGS->hideMetaAi()Z", "0x0")
}
