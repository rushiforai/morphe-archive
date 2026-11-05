package app.template.patches.truecaller.layout

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls

private const val FEATURE = "truecaller.hide_premium_tab"

// A Heval Controls feature: the tab helper of this patch and the Settings row's flag apply only
// while it is on. The Settings row follows the switch the next time Settings opens; the bottom bar
// is built at launch, hence the restart.
@Suppress("unused")
val hidePremiumTabPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide Premium tab",
        description = "Hides the Premium tab and the Premium entry in settings.",
        category = TruecallerControlsCategory.TABS,
        restartRequired = true,
    ),
    default = false,
) {
    // Links that open the Premium tab (upsell buttons) then leave the current tab selected:
    // selecting a tab that is not in the bar does nothing.
    hideBottomBarTabs("PREMIUM", featureId = FEATURE)

    // The "Premium" row of the main Settings screen (#53).
    hideSettingsCategory("isPremiumItemVisible", FEATURE)
}
