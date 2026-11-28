package app.template.patches.welovedeals.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.WE_LOVE_DEALS_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Ad-SDK auto-initialisation providers — the standard set. We Love Deals 1.2.0 declares
 * **none** of these and bundles **no ad SDK at all** (verified: 0 classes for GMS Ads
 * display, AppLovin, Unity, ironSource, Vungle, Pangle, ByteDance, MoPub, InMobi,
 * AppsFlyer, Adjust, Amplitude, Segment, Mixpanel, Sentry, Singular, Blueshift, Firebase,
 * OneSignal — the `com.google.android.gms` tree is present only for Maps). Kept so the
 * patch also neutralises any ad SDK a future build adds.
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
 * Advertising permissions — **This build declares none**, so nothing is stripped here.
 *
 * Verified against the 1.2.0 manifest: the complete `uses-permission` set is
 * `ACCESS_COARSE_LOCATION`, `ACCESS_FINE_LOCATION`, `ACCESS_NETWORK_STATE`, `INTERNET`,
 * plus `com.android.vending.CHECK_LICENSE`. There is no `AD_ID`, no
 * `ACCESS_ADSERVICES_*`, and no install-referrer permission. (An earlier draft of this
 * file wrongly claimed the ad-ID permissions were declared here — that inventory belongs
 * to Skillshare, not We Love Deals.)
 *
 * The list is kept empty on purpose: a non-empty list that matches nothing would make
 * this patch claim to strip permissions it never touches.
 */
private val AD_PERMISSIONS = emptyList<String>()

/**
 * Play licensing permissions that are vestigial once the gate is bypassed.
 *
 * `com.android.vending.CHECK_LICENSE` is declared because the build ships the PairIP
 * licence check. [app.template.patches.welovedeals.pairip.welovedealsBypassPairIpPatch]
 * neutralises the check itself, so the permission remains only as a declaration — and
 * removing it also keeps the licensing service from ever being bound.
 */
private val LICENSE_PERMISSIONS = listOf(
    "com.android.vending.CHECK_LICENSE",
)

/**
 * Removes ads from We Love Deals.
 *
 * The build ships **no ad SDK, no ad placement and no advertising permission** (see
 * [AD_PERMISSIONS] — verified, and that verification is why this patch has almost nothing
 * to do). The real work this patch performs is:
 *
 *  1. force-disables any ad-SDK init provider for future builds, and
 *  2. strips the now-vestigial `com.android.vending.CHECK_LICENSE` permission, since the
 *     PairIP gate it exists for is bypassed.
 */
@Suppress("unused")
val welovedealsRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "We Love Deals ships no ad SDK, no ad placement and no advertising " +
        "permission. This only disables any ad-SDK auto-init provider for future builds " +
        "and removes the vestigial Play-licence permission.",
    default = true,
) {
    compatibleWith(WE_LOVE_DEALS_COMPATIBILITY)

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
                val name = el.getAttribute("android:name")
                if (name in AD_PERMISSIONS || name in LICENSE_PERMISSIONS) {
                    el.parentNode.removeChild(el)
                }
            }
        }
    }
}