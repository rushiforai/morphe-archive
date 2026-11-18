package app.template.patches.instagram.scroll

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun Method.calls() = implementation?.instructions?.mapNotNull {
    (it as? ReferenceInstruction)?.reference as? MethodReference
}.orEmpty()

internal object DirectTextSendFingerprint : Fingerprint(
    strings = listOf("DirectThreadFragment.sendTextMessage", "DirectSendHelperImpl.sendSideChatContextualQuery"),
    returnType = "Z",
)

// Business-share logging strings disappeared from this callback in Instagram 447.
// Follow the sender's callback contract instead; do not match arbitrary delayed work.
internal class DirectSendCompletedFingerprint(callbacks: List<MethodReference>) : Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        method.parameterTypes.size == 4 && method.parameterTypes.last().toString() == "I" &&
            callbacks.any {
                it.definingClass in classDef.interfaces && it.name == method.name &&
                    it.returnType == method.returnType &&
                    it.parameterTypes.map { type -> type.toString() } ==
                        method.parameterTypes.map { type -> type.toString() }
            } &&
            method.calls().any {
                it.definingClass == "Landroid/view/View;" && it.name == "postDelayed" &&
                    it.parameterTypes == listOf("Ljava/lang/Runnable;", "J")
            }
    },
)

// The layout-time bottom-edge nudge is independent of the send-to-latest runnable.
internal object DirectViewportLayoutFingerprint : Fingerprint(
    strings = listOf(
        "DirectMessageListLinearLayoutManager.onLayoutChildren",
        "DirectThreadScrollBottomIntoViewportLayoutHelper.afterLayoutChildren",
    ),
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.size == 2 },
)

internal const val PIKO_SETTINGS = "Lapp/morphe/extension/instagram/settings"
internal const val SCREEN_BUILDER = "$PIKO_SETTINGS/preference/ScreenBuilder;"
internal const val HELPER = "$PIKO_SETTINGS/preference/Helper;"
internal const val HOOK = "Lpl/dudek/extension/instagram/KeepDmScrollPosition;"
