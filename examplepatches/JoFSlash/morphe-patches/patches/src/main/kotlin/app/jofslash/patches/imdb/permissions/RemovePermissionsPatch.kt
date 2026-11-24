package app.jofslash.patches.imdb.permissions

import app.jofslash.patches.imdb.shared.Constants.COMPATIBILITY_IMDB
import app.jofslash.patches.imdb.shared.editManifest
import app.jofslash.patches.imdb.shared.removeNamed
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val removeUnneededPermissionsPatch = resourcePatch(
    name = "Remove unneeded permissions",
    description = "Removes the permissions that only serve advertising and tracking: the advertising ID, " +
            "Android's ad services (ad ID, attribution and topics), the Play install referrer, the phone-state " +
            "read and Amazon's metrics collection. With the ad and tracking patches on, nothing in the app uses them.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_IMDB)

    execute {
        editManifest {
            it.removeNamed(
                "uses-permission",
                setOf(
                    // The advertising ID and Android's ad-services APIs: ads and attribution only.
                    "com.google.android.gms.permission.AD_ID",
                    // The same, as GmsCore support renames it when it runs first.
                    "app.revanced.android.gms.permission.AD_ID",
                    "android.permission.ACCESS_ADSERVICES_AD_ID",
                    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                    "android.permission.ACCESS_ADSERVICES_TOPICS",
                    // Where the install came from: install-attribution trackers only.
                    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
                    // Device/phone identifiers; the core browse and search don't need them.
                    "android.permission.READ_PHONE_STATE",
                    // Amazon's metrics collection.
                    "amazon.permission.COLLECT_METRICS",
                )
            )
        }
    }
}
