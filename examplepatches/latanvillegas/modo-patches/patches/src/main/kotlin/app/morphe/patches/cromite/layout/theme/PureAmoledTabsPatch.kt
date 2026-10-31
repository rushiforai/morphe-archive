package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

// Avoid TabGridView.s(): it previously caused an ART VerifyError.
// This existing dialog hook is register-free and delegates runtime selection.
private val tabGridDialogBackgroundFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/tasks/tab_management/TabGridDialogView;",
    name = "b",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

@Suppress("unused")
val pureAmoledTabsPatch = bytecodePatch(
    name = "AMOLED - Tabs and tab strip",
    description = "Resolves saved System / Pure Black / Pure White at runtime for the tab grid dialog surface.",
    default = false,
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))
    dependsOn(cromiteAmoledBrightnessPatch)

    execute {
        tabGridDialogBackgroundFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, " +
                "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->applyTabDialogBackground(Landroid/view/View;)V",
        )
    }
}
