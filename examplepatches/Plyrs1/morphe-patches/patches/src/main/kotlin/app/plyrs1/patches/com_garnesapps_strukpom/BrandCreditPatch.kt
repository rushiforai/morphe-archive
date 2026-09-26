package app.plyrs1.patches.com_garnesapps_strukpom

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_STRUKPOM

// Internal patch: name = null hides it from the user patch selection in Morphe Manager/CLI,
// but it is automatically executed when any patch that dependsOn(brandCreditPatch) is selected.
val brandCreditPatch = bytecodePatch(
    name = null,
    description = "Displays 'Patched with ❤️ by Plyrs' at the bottom of the navigation drawer, linking to the GitHub repository.",
    default = true
) {
    compatibleWith(COMPATIBILITY_STRUKPOM)

    extendWith("extensions/extension.mpe")

    execute {
        // In MenuActivity.kalem():
        // Inject static call to DrawerCreditHelper.setupCreditText(this) at index 0.
        // kalem() is called at the end of MenuActivity.onCreate after all views are inflated.
        MenuActivityKalemFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, Lapp/plyrs1/extension/DrawerCreditHelper;->setupCreditText(Landroid/app/Activity;)V
            """
        )
    }
}
