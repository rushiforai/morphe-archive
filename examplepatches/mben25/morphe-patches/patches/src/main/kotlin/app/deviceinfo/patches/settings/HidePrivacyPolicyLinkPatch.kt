package app.deviceinfo.patches.settings

import app.deviceinfo.patches.settings.resource.preferenceScreen
import app.deviceinfo.patches.settings.resource.removePreference
import app.deviceinfo.patches.shared.Constants.COMPATIBILITY_DEVICEINFO
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val hidePrivacyPolicyLinkPatch = resourcePatch(
    name = "Hide Privacy Policy Link",
    description = "Removes the \"Privacy Policy\" link from the About section of the Settings " +
        "screen.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DEVICEINFO)

    execute {
        // `privacy_policy_pref` only opens the policy URL; the fragment null-checks its lookup.
        // The neighbouring "Privacy Options" entry (`privacy_options_pref`, the ad consent form)
        // is a different key and stays.
        preferenceScreen("res/xml/settings.xml") {
            removePreference("privacy_policy_pref")
        }
    }
}
