package app.template.patches.shima.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.SHIMA_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Ad-SDK auto-initialisation providers — the standard set. Shima+ 0.5.1 declares **none**
 * of these and bundles **no ad SDK at all** (verified: single dex, no
 * `com/google/android/gms/ads`, AppLovin, Unity, ironSource, Vungle, Pangle or ByteDance
 * classes, no AdMob application ID, no ad permissions). The list is kept so the patch also
 * neutralises any ad SDK that a future build might add.
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
 * Advertising / attribution permissions. None is declared by Shima+ 0.5.1 — this is a
 * defensive strip so no advertising ID can ever be read.
 */
private val AD_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

/**
 * Removes ads from Shima+ (Dynamic Island).
 *
 * The app ships **no ad SDK and no ad placement**; this patch therefore (1) force-disables
 * any ad-SDK init provider should one ever be bundled and (2) strips the advertising-ID /
 * ad-services / install-referrer permissions.
 */
@Suppress("unused")
val shimaRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "Shima+ ships no ad SDK or ad placement; this additionally disables any " +
        "ad-SDK auto-init provider and removes the advertising-ID / ad-services / " +
        "install-referrer permissions so no advertising ID is exposed.",
    default = true,
) {
    compatibleWith(SHIMA_COMPATIBILITY)

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
