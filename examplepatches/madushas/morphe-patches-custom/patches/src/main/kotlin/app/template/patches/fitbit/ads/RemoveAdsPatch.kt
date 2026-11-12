package app.template.patches.fitbit.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.FITBIT_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Ad-SDK auto-initialisation providers — the standard set. Fitbit (Health) declares
 * **none** of these (verified against the base manifest: no `com/google/android/gms/ads`,
 * AppLovin, Unity, ironSource, Vungle, Pangle or ByteDance ad class exists in the eight
 * dex files, no ad-unit IDs and no ad view). The list is kept so the patch also
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
 * Advertising / attribution permissions. Removing these denies the advertising ID and the
 * Privacy Sandbox ad-services at the OS level. None of them is declared by Fitbit 5.11.1,
 * so this is a defensive strip only.
 */
private val AD_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

/**
 * Removes ads from Fitbit / Health.
 *
 * The app ships **no ad SDK and no ad placement**; recon of the base APK found no ad
 * classes, no `MobileAdsInitProvider`, no AdMob application ID and no ad surface. This
 * patch therefore (1) force-disables any ad-SDK init provider should one ever be bundled
 * and (2) strips the advertising-ID / ad-services / install-referrer permissions so no
 * advertising ID can be read.
 */
@Suppress("unused")
val fitbitRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "Fitbit ships no ad SDK or ad placement; this additionally disables any " +
        "ad-SDK auto-init provider and removes the advertising-ID / ad-services / " +
        "install-referrer permissions so no advertising ID is exposed.",
    default = true,
) {
    category("Ads")
    compatibleWith(FITBIT_COMPATIBILITY)

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
