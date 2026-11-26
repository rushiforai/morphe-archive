package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * #213: Messenger's own pinned message bar under a chat's name.
 *
 * A chat's banners are gathered in ThreadViewBannerDataFetch, which adds the pinned messages loader only for some chats:
 * the ones whose thread key answers yes to one check, and otherwise only behind a server flag most accounts don't get.
 * The loader is the class whose static initializer names PinnedMessagesMsysBannerDataSource. The thread key check's
 * answer goes through the extension first, which says yes while Show pinned messages is on, so every chat takes the
 * path those chats take and Messenger's bar shows the chat's pinned messages.
 *
 * The check is the ThreadKey ()Z call whose move-result feeds the if-nez that lands on the loader's new-instance, or in
 * 588 the if-eqz right above that new-instance, which skips the loader on a no. Other
 * banners sit behind gates of the same shape, so the loader found with the hooks picks which gate is the pinned one. The
 * fetch class keeps its own name in every build.
 */
internal const val PINNED_BAR = "pinned_bar"
internal const val PINNED_BAR_CALL = "Lapp/hushmessenger/extension/PinnedBar;->show(Z)Z"
internal const val PINNED_BAR_SOURCE = "PinnedMessagesMsysBannerDataSource"
internal const val BANNER_FETCH = "Lcom/facebook/messaging/msys/thread/banner/datafetch/ThreadViewBannerDataFetch;"

/** The pinned messages loader of the build being patched, found with the hooks. */
internal var pinnedBarLoader: String? = null

/** Where the thread key's answer lands: the move-result's index and register, and whether the hook is in already. */
internal class PinnedGate(val index: Int, val register: Int, val hooked: Boolean)

private fun Instruction.isThreadKeyCheck(): Boolean {
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return opcode == Opcode.INVOKE_VIRTUAL && call.definingClass == THREAD_KEY_TYPE && call.returnType == "Z" && call.parameterTypes.isEmpty()
}

/** The gate in front of [loader]'s new-instance, or null when [this] has no such gate. */
internal fun Method.pinnedBarGate(loader: String): PinnedGate? {
    val code = implementation?.instructions?.toList() ?: return null
    val made = code.indices.singleOrNull {
        code[it].opcode == Opcode.NEW_INSTANCE && (code[it] as ReferenceInstruction).reference.toString() == loader
    } ?: return null
    // 587 jumps onto the loader with an if-nez. 588 falls into it from an if-eqz right above that skips it, and nothing
    // else may land on the loader then.
    val jumps = code.indices.filter { code[it].opcode == Opcode.IF_NEZ && code.branchTarget(it) == made }
    val branch = when {
        jumps.size == 1 -> jumps.single()
        jumps.isEmpty() && made >= 1 && code[made - 1].opcode == Opcode.IF_EQZ && code.branchTarget(made - 1) > made &&
            made !in jumpTargets() -> made - 1
        else -> return null
    }
    if (branch < 2 || branch in jumpTargets()) return null
    val register = (code[branch] as OneRegisterInstruction).registerA
    val result = code[branch - 1]
    if (result.opcode != Opcode.MOVE_RESULT || (result as OneRegisterInstruction).registerA != register || register > 0xff) return null
    val read = code[branch - 2]
    if (read.opcode == Opcode.INVOKE_STATIC_RANGE && (read as ReferenceInstruction).reference.toString() == PINNED_BAR_CALL) {
        // Hooked already: the key's own call and its move-result sit right above.
        if (branch < 4 || code[branch - 3].opcode != Opcode.MOVE_RESULT || !code[branch - 4].isThreadKeyCheck()) return null
        return PinnedGate(branch - 3, register, true)
    }
    if (!read.isThreadKeyCheck()) return null
    return PinnedGate(branch - 1, register, false)
}

/** The pinned messages loader, by the data source it names. */
internal val pinnedBarLoaders = ClassCheck(loadsString(PINNED_BAR_SOURCE))

internal fun resolvePinnedBarLoader(classes: Iterable<ClassDef>): String? = pinnedBarLoaders.classes(classes).singleOrNull()?.type

/** The banner fetch method, taken only while exactly one loader class names the source and one method gates it. */
internal fun findPinnedBar(classes: Iterable<ClassDef>, loader: String? = resolvePinnedBarLoader(classes)): List<Method> {
    loader ?: return emptyList()
    val fetch = classes.firstOrNull { it.type == BANNER_FETCH } ?: return emptyList()
    return listOfNotNull(fetch.methods.singleOrNull { it.pinnedBarGate(loader) != null })
}

private fun pinnedChanged(method: Method): Nothing =
    throw PatchException("Messenger controls: the chat banner fetch ${method.hookId()} no longer matches the tested build")

internal fun Method.validatePinnedBar(): PinnedGate = pinnedBarGate(pinnedBarLoader ?: pinnedChanged(this)) ?: pinnedChanged(this)

/** The thread key's answer goes through the extension, which says yes while the switch is on and passes it along otherwise. */
internal fun MutableMethod.injectPinnedBar() {
    val gate = validatePinnedBar()
    if (gate.hooked) return
    addInstructions(gate.index + 1, """
        invoke-static/range {v${gate.register} .. v${gate.register}}, $PINNED_BAR_CALL
        move-result v${gate.register}
    """.trimIndent())
}
