package app.plyrs1.patches.com_ogestudio_strukpertamini

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_STRUKPERTAMINI

@Suppress("unused")
val hidePremiumButtonPatch = bytecodePatch(
    name = "Hide Premium Button",
    description = "Hides the Premium upgrade button from both the top action bar on the Home screen and the Settings menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_STRUKPERTAMINI)
    dependsOn(brandCreditPatch)

    execute {
        // 1. Hide the premium button in HomeFragment top action bar menu:
        // After menuInflater.inflate(R.menu.menu_search_sort_premium, menu) in HomeFragment$4.onCreateMenu,
        // remove menu_premium (id: 0x7f09019d) so it won't be shown.
        HomeFragmentOnCreateMenuFingerprint.method.addInstructions(
            2,
            """
                const v0, 0x7f09019d
                invoke-interface {p1, v0}, Landroid/view/Menu;->removeItem(I)V
            """
        )

        // 2. Hide btnPremium in SettingFragment:
        // In SettingFragment.clickConfiguration(), set btnPremium visibility to View.GONE (8).
        SettingFragmentClickConfigurationFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, Lcom/ogestudio/strukpertamini/ui/setting/SettingFragment;->view:Lcom/ogestudio/strukpertamini/databinding/FragmentSettingBinding;
                if-eqz v0, :cond_skip
                iget-object v0, v0, Lcom/ogestudio/strukpertamini/databinding/FragmentSettingBinding;->btnPremium:Landroid/widget/LinearLayout;
                if-eqz v0, :cond_skip
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V
                :cond_skip
            """
        )
    }
}
