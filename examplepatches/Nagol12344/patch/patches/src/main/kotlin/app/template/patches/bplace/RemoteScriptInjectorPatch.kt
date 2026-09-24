package app.template.patches.bplace

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

val fixFilePickerPatch = bytecodePatch(
    name = "Fix file picker camera prompt",
    description = "Strips the capture attribute and forces the native chooser to use gallery-only file inputs.",
    default = true
) {
    compatibleWith(Compatibility(
            name = "Better Place",
            packageName = "com.bplace",
            appIconColor = 0x2196f2,
            targets = listOf(AppTarget(null), AppTarget("1.0.7"))
        ))
    extendWith("extensions/extension.mpe")

    execute {
        val webViewClientMethod = WebViewClientFingerprint.method
        webViewClientMethod.addInstructions(
            0,
            """
            move-object/from16 v0, p1
            invoke-static {v0}, ${ExtensionClasses.ScriptHook}->hookWebView(Landroid/webkit/WebView;)V
            """.trimIndent()
        )

        val fileChooserMatch = OpenFileChooserFingerprint.match()
        val fileChooserMethod = fileChooserMatch.method
        val captureCallIndex = fileChooserMatch.instructionMatches.single().index
        val captureResult = fileChooserMethod
            .getInstruction<OneRegisterInstruction>(captureCallIndex + 1)

        if (captureResult.opcode == Opcode.MOVE_RESULT) {
            fileChooserMethod.replaceInstruction(
                captureCallIndex + 1,
                "const/4 v${captureResult.registerA}, 0x0"
            )
        } else {
            check(captureResult.opcode == Opcode.CONST_4) {
                "Unexpected isCaptureEnabled result in ${fileChooserMethod.definingClass}."
            }
        }
    }
}
