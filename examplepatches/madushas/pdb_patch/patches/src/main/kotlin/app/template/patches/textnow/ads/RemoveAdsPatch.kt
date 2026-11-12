package app.template.patches.textnow.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.TEXTNOW_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Ad-network components declared in TextNow 26.45.0.0's manifest. Each is only needed
 * to *serve* ads; setting `android:enabled="false"` neutralises it while leaving the
 * app's own code paths intact (calls into a disabled component fail silently instead
 * of crashing). The partner SDKs themselves are never started — their initializer
 * `setup()` methods are no-op'ed by [textnowDisableAdSdkPatch].
 */
private val AD_COMPONENTS = listOf(
    // Facebook Audience Network (the primary ad SDK in this build).
    "com.facebook.ads.AudienceNetworkActivity",
    "com.facebook.ads.AudienceNetworkContentProvider",
    // Amazon Publisher Services / DTB.
    "com.amazon.aps.ads.activity.ApsInterstitialActivity",
    "com.amazon.device.ads.DTBInterstitialActivity",
)

/** Advertising / attribution permissions stripped. */
private val AD_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.appsflyer.referrer.INSTALL_PROVIDER",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

/**
 * Removes ads from TextNow 26.45.0.0: disables every ad-network component declared in
 * the manifest (Facebook Audience Network, Amazon APS/DTB) and strips the
 * advertising-ID / ad-services / install-referrer permissions.
 */
@Suppress("unused")
val textnowRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "Disables every ad-network component TextNow declares (Facebook " +
        "Audience Network, Amazon APS/DTB) and strips the ad-ID / ad-services / " +
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
