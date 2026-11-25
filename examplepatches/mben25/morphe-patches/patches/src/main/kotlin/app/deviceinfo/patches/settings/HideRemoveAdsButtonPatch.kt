package app.deviceinfo.patches.settings

import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.deviceinfo.patches.shared.resource.hideViewById
import app.deviceinfo.patches.shared.resource.removeElementById
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val hideRemoveAdsButtonPatch = resourcePatch(
    name = "Hide Remove Ads Button",
    description = "Removes the \"Remove Ads\" entry from the main overflow menu and the " +
        "\"Remove Ads\" / \"Donate\" button from the About screen.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    execute {
        // MainActivity's menu provider (`Lsi1;` in 3.4.4.0) null-checks `findItem(action_remove_ads)`
        // in onPrepareMenu and only ever hides it, and its click handler just compares item ids,
        // so dropping the item from the menu resource is safe.
        document("res/menu/menu_main.xml").use { it.removeElementById("action_remove_ads") }

        // AboutActivity only calls setText/setOnClickListener on btnDonate ("Remove Ads", or
        // "Donate" once ad-free) - it toggles the visibility of txtAdFree, never of the button -
        // so `gone` in the layout sticks.
        document("res/layout/activity_about.xml").use { it.hideViewById("btnDonate") }
    }
}
