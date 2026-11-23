package app.ffn.patches.privacy

import app.ffn.patches.shared.Constants.COMPATIBILITY_FANFICTION
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml

// Pulled in by the Firebase/Play Services SDKs. The app shows no ads.
private val AD_TRACKING_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

@Suppress("unused")
val removeAdTrackingPermissionsPatch = patch(
    name = "Remove ad tracking permissions",
    description = "Removes the advertising ID, ad attribution and install referrer permissions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FANFICTION)

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.elements("uses-permission")
                .filter { it.attribute("android:name") in AD_TRACKING_PERMISSIONS }
                .toList()
                .forEach { it.remove() }

            manifest.elements("property")
                .filter { it.attribute("android:name") == "android.adservices.AD_SERVICES_CONFIG" }
                .toList()
                .forEach { it.remove() }
        }
    }
}
