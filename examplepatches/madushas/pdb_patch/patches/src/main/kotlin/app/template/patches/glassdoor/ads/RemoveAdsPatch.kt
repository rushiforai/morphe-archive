package app.template.patches.glassdoor.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.GLASSDOOR_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Ad-SDK auto-initialisation providers — the standard set. Glassdoor 13.15.1 declares none
 * of these and ships **no ad view SDK** (the app's own ad slots are served in-app; there is
 * no `com/google/android/gms/ads`, AppLovin, Unity, ironSource, Vungle or Pangle). The list
 * is kept so the patch also neutralises any ad SDK a future build might add.
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
 * Advertising / attribution permissions. Glassdoor 13.15.1 **does declare** these — removing
 * them denies the advertising ID, the Privacy Sandbox ad-services and the Play
 * install-referrer at the OS level.
 */
private val AD_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
    "com.android.vending.INSTALL_REFERRER",
)

/**
 * Removes ads and advertising identifiers from Glassdoor.
 *
 * The app ships no third-party ad view SDK, so this patch (1) force-disables any ad-SDK init
 * provider should one ever be bundled and (2) strips the advertising-ID / ad-services /
 * install-referrer permissions, so no advertising ID can be read by anything in the app.
 */
@Suppress("unused")
val glassdoorRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "Removes the advertising-ID, ad-services and install-referrer permissions " +
        "(and disables any ad-SDK init provider). Glassdoor ships no third-party ad SDK.",
    default = true,
) {
    category("Ads")
    compatibleWith(GLASSDOOR_COMPATIBILITY)

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
