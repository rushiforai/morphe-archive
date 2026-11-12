package app.template.patches.nikerunclub.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.NIKE_RUN_CLUB_COMPATIBILITY
import org.w3c.dom.Element

/** Ad-SDK auto-init providers — the standard set. */
private val AD_INIT_PROVIDERS = listOf(
    "com.google.android.gms.ads.MobileAdsInitProvider",
    "com.applovin.sdk.AppLovinInitProvider",
    "com.vungle.ads.VungleProvider",
    "com.yandex.mobile.ads.core.initializer.YandexAdsInitializeProvider",
    "com.bytedance.sdk.openadsdk.multipro.TTMultiProvider",
)

/**
 * Advertising / attribution permissions. `AD_ID` is read by Adobe and Branch; removing
 * it denies the advertising ID at the OS level. `ACCESS_ADSERVICES_*` disable the
 * Privacy-Sandbox ad services, and the install-referrer permission stops Play from
 * attaching an attribution referrer to the install.
 */
private val AD_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

/**
 * Removes ads from Nike Run Club.
 *
 * NRC does not declare an ad SDK in its manifest (the `com.google.android.gms.ads`
 * classes in the dex are an unused transitive dependency — there is no
 * `MobileAdsInitProvider`, no App ID meta-data and no ad surface). This patch keeps the
 * standard set of ad-init providers disabled defensively and strips the advertising-ID /
 * ad-services / install-referrer permissions so no advertising ID can be read.
 */
@Suppress("unused")
val nikeRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "Nike Run Club ships no ad SDK or placement; this disables any ad-SDK " +
        "auto-init provider and removes the advertising-ID / ad-services / referrer " +
        "permissions so no advertising ID is exposed.",
    default = true,
) {
    compatibleWith(NIKE_RUN_CLUB_COMPATIBILITY)

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
