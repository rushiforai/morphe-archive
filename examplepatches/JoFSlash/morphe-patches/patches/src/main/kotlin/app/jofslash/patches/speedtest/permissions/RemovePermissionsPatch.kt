package app.jofslash.patches.speedtest.permissions

import app.jofslash.patches.speedtest.shared.Constants.COMPATIBILITY_SPEEDTEST
import app.jofslash.patches.speedtest.shared.editManifest
import app.jofslash.patches.speedtest.shared.removeNamed
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val removeUnneededPermissionsPatch = resourcePatch(
    name = "Remove unneeded permissions",
    description = "Removes the permissions that only serve advertising and install tracking: the advertising ID, " +
            "Android's ad services (ad ID, attribution and topics) and the Google Play install referrer. " +
            "With the ad and tracking patches on, nothing in the app uses them.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_SPEEDTEST)

    execute {
        editManifest {
            it.removeNamed(
                "uses-permission",
                setOf(
                    // The advertising ID and Android's ad-services APIs: ads and attribution only.
                    "com.google.android.gms.permission.AD_ID",
                    "android.permission.ACCESS_ADSERVICES_AD_ID",
                    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                    "android.permission.ACCESS_ADSERVICES_TOPICS",
                    // Where the install came from: install-attribution trackers only.
                    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
                )
            )
        }
    }
}
