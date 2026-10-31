package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// Reconstructed from the original 1.50.0 PureAmoledToolbarPatchKt bytecode.
// Verified target: ToolbarTablet.i(IZ)V in Cromite 153.0.8010.37.
private val toolbarTabletBackgroundFingerprint = Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/toolbar/top/ToolbarTablet;",
    name = "i",
    returnType = "V",
    parameters = listOf("I", "Z"),
)

private const val TOOLBAR_RUNTIME_BACKGROUND = """
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object p1
    invoke-static {p1}, Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->resolvedPureThemeColor(Landroid/content/Context;)I
    move-result p1
"""

@Suppress("unused")
val pureAmoledToolbarPatch = bytecodePatch(
    name = "AMOLED - Toolbar",
    description = "Uses the saved runtime AMOLED theme for the verified Cromite ToolbarTablet background setter.",
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))

    dependsOn(cromiteAmoledBrightnessPatch)

    execute {
        toolbarTabletBackgroundFingerprint.method.addInstructions(
            0,
            TOOLBAR_RUNTIME_BACKGROUND,
        )
    }
}
