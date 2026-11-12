package app.template.patches.teams.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.TEAMS_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Ad-SDK auto-initialisation providers — the standard set. Microsoft Teams declares none of
 * these and ships **no ad SDK at all** (verified: no `com/google/android/gms/ads`, AppLovin,
 * Unity, ironSource, Vungle, Pangle or ByteDance classes, no `MobileAdsInitProvider`, no ad
 * unit ids). The list is kept so the patch also neutralises an ad SDK a future build might add.
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
 * Advertising / attribution permissions. Teams declares the install-referrer permission;
 * the advertising-ID / ad-services permissions are not declared (defensive entries).
 */
private val AD_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

/**
 * Removes advertising identifiers from Microsoft Teams.
 *
 * Teams ships no third-party ad SDK, so there are no ad views to remove; this patch strips the
 * advertising-ID / ad-services / install-referrer permissions and disables any ad-SDK init
 * provider, so no advertising ID can be read.
 */
@Suppress("unused")
val teamsRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "Microsoft Teams ships no ad SDK; this strips the advertising-ID, " +
        "ad-services and install-referrer permissions and disables any ad-SDK init provider.",
    default = true,
) {
    compatibleWith(TEAMS_COMPATIBILITY)

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
