package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.shared.*

private const val VIEW = "Landroid/view/View;"

private object FullscreenInsetListenerFingerprint : Fingerprint(
    name = "onApplyWindowInsets",
    filters = listOf(
        literal(655),
        literal(527),
        methodCall(
            definingClass = VIEW,
            name = "setPadding",
            parameters = listOf("I", "I", "I", "I"),
        )
    ),
)

internal fun BytecodePatchContext.injectUiFullscreenInsets() {
    val target = FullscreenInsetListenerFingerprint.originalMethod
    resolveUiInsetHooks(target)
    val method = FullscreenInsetListenerFingerprint.method
    injectUiInsetFilter(method)
}

internal data class UiInsetHook(val callIndex: Int, val maskRegister: Int, val viewRegister: Int)

internal fun resolveUiInsetHooks(method: Method): List<UiInsetHook> {
    require(method.isInstance(listOf(VIEW, method.returnType), method.returnType)) {
        "UI settings: fullscreen inset listener signature changed."
    }
    val code = method.code()
    val view = requireNotNull(method.implementation).registerCount - 2
    return listOf(655, 527).map { literal ->
        val index = code.indices.filter { code[it].opcode == Opcode.CONST_16 &&
            (code[it] as? NarrowLiteralInstruction)?.narrowLiteral == literal }.uniqueHook("fullscreen inset type mask $literal")
        val mask = (code[index] as OneRegisterInstruction).registerA
        val call = code.getOrNull(index + 1)
        val arguments = call as? FiveRegisterInstruction
        val reference = (call as? ReferenceInstruction)?.reference as? MethodReference
        require(call?.opcode == Opcode.INVOKE_VIRTUAL && arguments != null && arguments.registerCount == 2 &&
            arguments.registerD == mask && arguments.registerC != mask && reference != null &&
            reference.parameterTypes.map(CharSequence::toString) == listOf("I") && reference.returnType.startsWith("L") &&
            code.getOrNull(index + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT && view in 0..15 && mask in 0 until view) {
            "UI settings: fullscreen inset query changed."
        }
        UiInsetHook(index + 1, mask, view)
    }
}

internal fun injectUiInsetFilter(method: MutableMethod) {
    resolveUiInsetHooks(method).sortedByDescending { it.callIndex }.forEach { hook ->
        method.insertBeforeWithLabels(hook.callIndex, """
            invoke-static {v${hook.viewRegister}, v${hook.maskRegister}}, $UI_SETTINGS->filterWindowInsetTypes(Landroid/view/View;I)I
            move-result v${hook.maskRegister}
        """)
    }
}
