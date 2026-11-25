package app.jofslash.patches.yallashoot.permissions

import app.jofslash.patches.yallashoot.shared.Constants.COMPATIBILITY_YALLA_SHOOT
import app.jofslash.patches.yallashoot.shared.editManifest
import app.jofslash.patches.yallashoot.shared.removeNamed
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val removeUnneededPermissionsPatch = resourcePatch(
    name = "Remove unneeded permissions",
    description = "Removes the permissions that only serve advertising and install tracking: the advertising ID, " +
            "Android's ad services (ad ID and attribution), the Google Play install referrer, the basic phone " +
            "state and the ad attestation permission the ad SDK asks for. With the ad patch on, nothing in the " +
            "app uses them.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_YALLA_SHOOT)

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
                    // Only the Google Mobile Ads SDK (and its Open Measurement attestation) reads these.
                    "android.permission.READ_BASIC_PHONE_STATE",
                    "com.amazon.privacypass.ATTEST",
                )
            )
        }
    }
}
