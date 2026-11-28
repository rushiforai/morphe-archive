package app.template.patches.skillshare.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.SKILLSHARE_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Ad-SDK auto-initialisation providers — the standard set. Skillshare 5.4.81 declares
 * **none** of these and bundles **no ad SDK at all** (verified: zero
 * `com/google/android/gms/ads` displays — the six `gms/ads` classes are the deprecated
 * `AdvertisingIdClient` identifier, no AppLovin/Unity/ironSource/Vungle/Pangle/ByteDance
 * classes, no ad placement in the manifest). The list is kept so the patch also
 * neutralises any ad SDK a future build might add.
 */
private val AD_INIT_PROVIDERS = listOf(
    "com.google.android.gms.ads.MobileAdsInitProvider",
    "com.applovin.sdk.AppLovinInitProvider",
    "com.vungle.ads.VungleProvider",
    "com.yandex.mobile.ads.core.initializer.YandexAdsInitializeProvider",
    "com.bytedance.sdk.openadsdk.multipro.TTMultiProvider",
    "com.bytedance.sdk.openadsdk.TTAdManagerActivity",
)

/**
 * Advertising / attribution permissions. Skillshare declares exactly these three
 * (`com.google.android.gms.permission.AD_ID`,
 * `android.permission.ACCESS_ADSERVICES_ATTRIBUTION`,
 * `android.permission.ACCESS_ADSERVICES_AD_ID`) — verified in the manifest.
 *
 * Removing them denies the advertising ID and the Privacy Sandbox ad-services at the OS
 * level. In this build the advertising ID is only read by Firebase measurement and by
 * Singular's attribution, both neutralised by
 * [app.template.patches.skillshare.trackers.skillshareDisableTrackersPatch], so stripping
 * the permissions costs the app nothing functional.
 *
 * `com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE` and
 * `com.android.vending.INSTALL_REFERRER` are deliberately left alone: they declare/protect
 * a Play service binding rather than exposing data to an ad network, and Singular (the
 * only install-referrer consumer) is already disabled at its init.
 */
private val AD_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
)

/**
 * Removes ads from Skillshare.
 *
 * The build ships **no ad SDK and no ad placement** (see [AD_INIT_PROVIDERS]): the
 * `gms/ads` package contains only the deprecated `AdvertisingIdClient` identifier
 * holder, which is an ad-tracking surface, not a display SDK. This patch therefore
 * (1) force-disables any ad-SDK init provider should one ever be bundled and (2) strips
 * the three advertising-ID / ad-services permissions so no advertising ID is exposed.
 */
@Suppress("unused")
val skillshareRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "Skillshare ships no ad SDK or ad placement; this additionally disables " +
        "any ad-SDK auto-init provider and removes the advertising-ID / ad-services " +
        "permissions so no advertising ID is exposed.",
    default = true,
) {
    compatibleWith(SKILLSHARE_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val providers = doc.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val node = providers.item(i)
                val name = node.attributes.getNamedItem("android:name")?.nodeValue ?: ""
                if (AD_INIT_PROVIDERS.any { name == it || name.contains(it) }) {
                    node.attributes.getNamedItem("android:enabled")
                        ?.let { it.nodeValue = "false" }
                        ?: run {
                            val attr = doc.createAttribute("android:enabled")
                            attr.value = "false"
                            node.attributes.setNamedItem(attr)
                        }
                }
            }

            val permissions = doc.getElementsByTagName("uses-permission")
            for (i in permissions.length - 1 downTo 0) {
                val el = permissions.item(i) as? Element ?: continue
                if (el.getAttribute("android:name") in AD_PERMISSIONS) {
                    el.parentNode.removeChild(el)
                }
            }
        }
    }
}