package app.template.patches.materialcapsule.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MATERIAL_CAPSULE_COMPATIBILITY

/**
 * Ad-SDK auto-initialisation providers, the standard set. Material Capsule declares
 * **none** of these (verified: no `com/google/android/gms/ads`, AppLovin, Unity, ironSource,
 * Vungle, Pangle, … classes exist in the dex and no ad-unit IDs or ad views are present —
 * the app is an ad-free theming tool). The list is kept so the patch also neutralises any
 * ad SDK that a future build might add.
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
 * Privacy Sandbox ad-services at the OS level. `AD_ID` is used here only by Firebase
 * measurement (its collection is switched off by *Disable trackers*), so stripping it
 * costs the app nothing functional.
 */
private val AD_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
)

/**
 * Removes ads from Material Capsule.
 *
 * The app ships **no ad SDK and no ad placement** (see the class doc on [AD_INIT_PROVIDERS]);
 * recon of the dex found only Firebase measurement's internal "AdMob ad impression logged"
 * debug string and the app's own `apps` catalog table (which merely records the AdMob app id
 * of *other* installed apps it themes) — neither is an ad surface. This patch therefore
 * (1) force-disables any ad-SDK init provider should one ever be bundled, and
 * (2) strips the advertising-ID / ad-services permissions so no advertising ID can be read.
 */
@Suppress("unused")
val materialCapsuleRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "Material Capsule ships no ad SDK or ad placement; this additionally " +
        "disables any ad-SDK auto-init provider and removes the advertising-ID / " +
        "ad-services permissions so no advertising ID is exposed.",
    default = true,
) {
    category("Ads")
    compatibleWith(MATERIAL_CAPSULE_COMPATIBILITY)

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
                val el = permissions.item(i) as? org.w3c.dom.Element ?: continue
                val name = el.getAttribute("android:name")
                if (name in AD_PERMISSIONS) el.parentNode.removeChild(el)
            }
        }
    }
}
