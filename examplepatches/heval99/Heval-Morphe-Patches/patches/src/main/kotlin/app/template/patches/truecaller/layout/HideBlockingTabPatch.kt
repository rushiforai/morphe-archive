package app.template.patches.truecaller.layout

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls

private const val FEATURE = "truecaller.hide_blocking_tab"

// A Heval Controls feature: the tab helper of this patch (its own one, so the other tab patches
// are not affected) hides the tabs only while it is on. The bottom bar is built at launch, hence
// the restart.
@Suppress("unused")
val hideBlockingTabPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Hide Blocking tab",
        description = "Hides the Blocking tab from the bottom navigation bar.",
        category = TruecallerControlsCategory.TABS,
        restartRequired = true,
    ),
    default = false,
) {
    // Family Protect members get FAMILY_PROTECTION_CONFIG in the same slot, also labelled
    // "Blocking". With "Hide Scam feed" the Scam Feed slot falls back to these tabs, so it
    // stays empty.
    hideBottomBarTabs("BLOCKING", "FAMILY_PROTECTION_CONFIG", featureId = FEATURE)
}
