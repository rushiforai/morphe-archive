package app.deviceinfo.patches.settings

import app.deviceinfo.patches.settings.resource.preferenceScreen
import app.deviceinfo.patches.settings.resource.removePreferenceCategory
import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val hideSupportUsSectionPatch = resourcePatch(
    name = "Hide Support Us Section",
    description = "Removes the \"Support Us\" preference category (Rate Us, Donate / Remove " +
        "Ads) from the Settings screen.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    execute {
        // SettingsActivity inflates res/xml/settings.xml into a PreferenceFragmentCompat
        // (Ljg2; in this build) - the "Support Us" category (@string/support_us, holding
        // @string/rate_us and @string/donate_remove_ads) is declared there directly, so removing
        // it from the resource is the surgical fix rather than patching the fragment's inflation
        // bytecode.
        preferenceScreen("res/xml/settings.xml") {
            removePreferenceCategory("@string/support_us")
        }
    }
}
