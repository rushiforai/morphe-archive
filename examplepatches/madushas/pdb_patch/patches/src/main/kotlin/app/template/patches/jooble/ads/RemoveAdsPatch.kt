package app.template.patches.jooble.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.JOOBLE_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Ad-SDK auto-initialisation providers — the standard set. Jooble declares none of these, but
 * it **does** bundle Google Mobile Ads (AdMob), which auto-initialises from the
 * `com.google.android.gms.ads.APPLICATION_ID` meta-data (there is no explicit
 * `MobileAds.initialize` call in the dex — the Flutter admob plugin relies on AdMob's
 * provider-less auto-init). Removing that meta-data is therefore what actually stops the ad
 * SDK from starting.
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
 * Advertising / attribution permissions. Jooble **declares all of these**; removing them denies
 * the advertising ID and the Privacy Sandbox ad-services at the OS level.
 */
private val AD_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

/**
 * Removes ads from Jooble.
 *
 * Jooble renders its ad slots through the Flutter Google Mobile Ads plugin, so the ad *layout*
 * lives in the Dart AOT blob (`libapp.so`) and cannot be edited. This patch instead stops the
 * ad stack at the Android layer: it removes the AdMob `APPLICATION_ID` meta-data (so Mobile
 * Ads never initialises), disables any ad-SDK init provider and strips the advertising-ID /
 * ad-services / install-referrer permissions. Ad slots then fail to fill and stay empty.
 */
@Suppress("unused")
val joobleRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "Stops Google Mobile Ads from initialising (removes the AdMob app id) and " +
        "strips the advertising-ID, ad-services and install-referrer permissions. Ad slots " +
        "in the Flutter UI cannot be removed, but they no longer fill.",
    default = true,
) {
    compatibleWith(JOOBLE_COMPATIBILITY)

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

            // AdMob auto-initialises from this meta-data — drop it.
            val metas = doc.getElementsByTagName("meta-data")
            for (i in metas.length - 1 downTo 0) {
                val el = metas.item(i) as? Element ?: continue
                if (el.getAttribute("android:name") == "com.google.android.gms.ads.APPLICATION_ID") {
                    el.parentNode.removeChild(el)
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
