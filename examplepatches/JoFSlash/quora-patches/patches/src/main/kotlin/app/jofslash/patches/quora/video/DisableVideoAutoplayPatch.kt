package app.jofslash.patches.quora.video

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.shared.registerSetting
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object InitWebViewFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/fragments/qwvf/QWebViewController;",
    name = "initWebView",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/webkit/WebSettings;",
            name = "setMediaPlaybackRequiresUserGesture",
        )
    )
)

@Suppress("unused")
val disableVideoAutoplayPatch = bytecodePatch(
    name = "Disable video autoplay",
    description = "Videos in the feed and in answers only play when you tap them.",
    default = true
) {
    category("Reading")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    execute {
        registerSetting("disableVideoAutoplay", "Disable video autoplay")
        // Quora calls WebSettings.setMediaPlaybackRequiresUserGesture(false), which lets pages
        // start videos on their own. Pass true instead.
        InitWebViewFingerprint.let {
            it.method.apply {
                // Found in the current instructions: other patches may have added some at the start.
                val index = implementation!!.instructions.indexOfFirst { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name ==
                            "setMediaPlaybackRequiresUserGesture"
                }
                if (index < 0) throw PatchException("setMediaPlaybackRequiresUserGesture call not found")
                val register = getInstruction<FiveRegisterInstruction>(index).registerD
                addInstructions(
                    index,
                    """
                        invoke-static { v$register }, Lapp/jofslash/extension/quora/NativeTweaksPatch;->requireGestureForMedia(Z)Z
                        move-result v$register
                    """
                )
            }
        }
    }
}
