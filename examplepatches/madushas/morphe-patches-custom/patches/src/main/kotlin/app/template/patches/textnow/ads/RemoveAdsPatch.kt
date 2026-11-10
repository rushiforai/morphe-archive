package app.template.patches.textnow.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.TEXTNOW_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Every ad-network component declared in TextNow's manifest. TextNow is ad-supported
 * and bundles several mediation SDKs; each registers activities/services/receivers/
 * providers that are only needed to *serve* ads. Setting `android:enabled="false"`
 * neutralises them while leaving the app's own code paths intact (calls into a disabled
 * component fail silently instead of crashing).
 */
private val AD_COMPONENTS = listOf(
    // AdMarvel
    "com.admarvel.android.ads.AdMarvelActivity",
    "com.admarvel.android.ads.AdMarvelMediationActivity",
    // Amazon Mobile Ads
    "com.amazon.device.ads.DTBActivity",
    // AppNext
    "com.appnext.actionssdk.ActionActivity",
    "com.appnext.actionssdk.ActionService",
    "com.appnext.core.AdsService",
    "com.appnext.base.services.OperationService",
    "com.appnext.base.services.ReceiverService",
    "com.appnext.base.receivers.imp.bootreceiver",
    "com.enflick.android.TextNow.ads.appnext.AppNextDbFileDownloadService",
    // Google Mobile Ads
    "com.google.android.gms.ads.AdActivity",
    // MoPub
    "com.mopub.common.MoPubBrowser",
    "com.mopub.common.privacy.ConsentDialogActivity",
    "com.mopub.mobileads.MoPubActivity",
    "com.mopub.mobileads.MraidActivity",
    "com.mopub.mobileads.MraidVideoPlayerActivity",
    "com.mopub.mobileads.RewardedMraidActivity",
)

/** Advertising / attribution permissions stripped (defensive — none are declared here). */
private val AD_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

/**
 * Removes ads from TextNow by disabling every bundled ad-network component (AdMarvel,
 * Amazon, AppNext, Google Mobile Ads, MoPub) and stripping the advertising-ID /
 * ad-services / install-referrer permissions. The ad SDK init calls are additionally
 * no-op'ed by [textnowDisableAdSdkPatch].
 */
@Suppress("unused")
val textnowRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "Disables every ad-network component TextNow declares (AdMarvel, Amazon, " +
        "AppNext, Google Mobile Ads, MoPub) and strips the ad-ID / ad-services / " +
        "install-referrer permissions.",
    default = true,
) {
    compatibleWith(TEXTNOW_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val elements = doc.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val el = elements.item(i) as? Element ?: continue
                val name = el.attributes?.getNamedItem("android:name")?.nodeValue ?: continue
                if (name in AD_COMPONENTS) {
                    el.setAttribute("android:enabled", "false")
                    if (el.tagName == "provider") el.setAttribute("android:exported", "false")
                }
            }

            val permissions = doc.getElementsByTagName("uses-permission")
            for (i in permissions.length - 1 downTo 0) {
                val el = permissions.item(i) as? Element ?: continue
                if (el.getAttribute("android:name") in AD_PERMISSIONS) el.parentNode.removeChild(el)
            }
        }
    }
}
