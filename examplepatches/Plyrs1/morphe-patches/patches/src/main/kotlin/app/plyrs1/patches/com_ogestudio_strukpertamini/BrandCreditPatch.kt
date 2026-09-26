package app.plyrs1.patches.com_ogestudio_strukpertamini

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_STRUKPERTAMINI

// Internal patch: name = null hides it from the user patch selection in Morphe Manager/CLI,
// but it is automatically executed when any patch that dependsOn(brandCreditPatch) is selected.
val brandCreditPatch = bytecodePatch(
    name = null,
    description = "Displays 'Patched with ❤️ by Plyrs' at the bottom of the setting page, linking to the GitHub repository.",
    default = true
) {
    compatibleWith(COMPATIBILITY_STRUKPERTAMINI)

    extendWith("extensions/extension.mpe")

    execute {
        // In SettingFragment.onCreateView:
        // Right after getRoot() is called and stored in p1, inject:
        // SettingCreditHelper.setupCreditText(p1) at index 8 (before return-object p1).
        SettingFragmentOnCreateViewFingerprint.method.addInstructions(
            8,
            """
                invoke-static {p1}, Lapp/plyrs1/extension/SettingCreditHelper;->setupCreditText(Landroid/view/View;)V
            """
        )
    }
}
