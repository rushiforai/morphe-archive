package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.indexOfReference
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

private const val EXTENSION = "Lapp/mightymorphing/extension/joey/LoginWebView;"

@Suppress("unused")
val loginPagePatch = bytecodePatch(
    name = "Fix login page",
    description = "Makes Reddit's login page load and work properly inside Joey, and clears the cookie banner out of the way.",
) {
    compatibleWith(JOEY)

    extendWith("extensions/extension.mpe")

    execute {
        val setup = LoginPageLoadFingerprint.method
        val load = setup.indexOfReference("Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V")
        val call = setup.instructions[load] as FiveRegisterInstruction
        setup.replaceInstruction(
            load,
            "invoke-static {v${call.registerC}, v${call.registerD}}, $EXTENSION->load(Landroid/webkit/WebView;Ljava/lang/String;)V",
        )

        LoginPageFinishedFingerprint.method.insertAt(
            0,
            "invoke-static {p1, p2}, $EXTENSION->pageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V",
        )
    }
}
