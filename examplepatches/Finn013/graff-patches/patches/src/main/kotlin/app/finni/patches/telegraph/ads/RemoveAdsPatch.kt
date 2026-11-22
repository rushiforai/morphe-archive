package app.finni.patches.telegraph.ads

import app.finni.patches.telegraph.shared.Constants.COMPATIBILITY_TELEGRAPH_PLUS
import app.finni.patches.telegraph.shared.removeElements
import app.finni.patches.telegraph.signature.disableSignatureCheckPatch
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.returnEarly

private val AD_PROVIDERS = setOf(
    "com.google.android.gms.ads.MobileAdsInitProvider",
    "com.applovin.sdk.AppLovinInitProvider",
    "com.facebook.ads.AudienceNetworkContentProvider",
)

@Suppress("unused")
val removeAdsPatch = patch(
    name = "Remove ads",
    description = "Stops the ad SDKs (AppLovin MAX, InMobi, AdMob mediation) from initialising, removes their " +
        "auto-start providers and the advertising ID / Ad Services permissions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TELEGRAPH_PLUS)
    dependsOn(disableSignatureCheckPatch)

    execute {
        AdSdkInitFingerprint.match().method.returnEarly()

        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.removeElements("uses-permission") { name ->
                name.endsWith("permission.AD_ID") || name.contains("ADSERVICES_")
            }
            manifest.removeElements("provider") { it in AD_PROVIDERS }
        }
    }
}
