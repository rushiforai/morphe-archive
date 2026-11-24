package app.jofslash.patches.kaloricketabulky.permissions

import app.jofslash.patches.kaloricketabulky.shared.Constants.COMPATIBILITY_KALORICKE_TABULKY
import app.jofslash.patches.kaloricketabulky.shared.editManifest
import app.jofslash.patches.kaloricketabulky.shared.removeNamed
import app.morphe.patcher.patch.resourcePatch

@Suppress("unused")
val removeUnneededPermissionsPatch = resourcePatch(
    name = "Remove unneeded permissions",
    description = "Removes the permissions that only serve advertising and install tracking: the advertising ID, " +
            "Android's ad services (ad ID, attribution, topics and custom audiences), the Google Play install " +
            "referrer and the Google Play license check.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_KALORICKE_TABULKY)

    execute {
        editManifest {
            it.removeNamed(
                "uses-permission",
                setOf(
                    // The ad networks, Firebase Analytics and the attribution SDKs only.
                    "com.google.android.gms.permission.AD_ID",
                    "android.permission.ACCESS_ADSERVICES_AD_ID",
                    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                    "android.permission.ACCESS_ADSERVICES_TOPICS",
                    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
                    // Where the install came from: read by Kochava, Facebook and AppLovin only.
                    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
                    // Google Play licensing: only AppLovin asks for it. A patched app isn't the Play
                    // Store's copy anyway.
                    "com.android.vending.CHECK_LICENSE",
                )
            )
        }
    }
}

@Suppress("unused")
val removeLocationAccessPatch = resourcePatch(
    name = "Remove location access",
    description = "Removes the location permission. Food court (restaurant meals near you) and the partner " +
            "benefits near you then can't use your location.",
    default = false
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_KALORICKE_TABULKY)

    execute {
        editManifest {
            it.removeNamed(
                "uses-permission",
                setOf("android.permission.ACCESS_FINE_LOCATION", "android.permission.ACCESS_COARSE_LOCATION")
            )
        }
    }
}
