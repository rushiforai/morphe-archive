package app.template.patches.adidas.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.ADIDAS_RUNNING_COMPATIBILITY
import org.w3c.dom.Element

/** Ad-SDK auto-init providers (none are declared by adidas — kept defensively). */
private val AD_INIT_PROVIDERS = listOf(
    "com.google.android.gms.ads.MobileAdsInitProvider",
    "com.applovin.sdk.AppLovinInitProvider",
    "com.vungle.ads.VungleProvider",
)

/**
 * Advertising / attribution permissions. adidas ships only the *advertising-ID*
 * client (`com.google.android.gms.ads.identifier.AdvertisingIdClient`) — no ad-serving
 * SDK — so the effective "ad block" is denying the advertising ID and the Privacy
 * Sandbox ad services, and removing the install-referrer permission.
 */
private val AD_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

/** Removes ads from adidas Running. */
@Suppress("unused")
val adidasRemoveAdsPatch = resourcePatch(
    name = "Remove ads",
    description = "adidas Running ships no ad-serving SDK; this denies the advertising ID " +
        "and the Privacy-Sandbox ad services and removes the install-referrer permission.",
    default = true,
) {
    compatibleWith(ADIDAS_RUNNING_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val providers = doc.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val node = providers.item(i)
                val name = node.attributes.getNamedItem("android:name")?.nodeValue ?: ""
                if (AD_INIT_PROVIDERS.any { name == it || name.contains(it) }) {
                    (node as? Element)?.setAttribute("android:enabled", "false")
                }
            }

            // Privacy-Sandbox ad-services declaration.
            val extensions = doc.getElementsByTagName("property")
            for (i in extensions.length - 1 downTo 0) {
                val el = extensions.item(i) as? Element ?: continue
                if (el.getAttribute("android:name").contains("adservices")) el.parentNode.removeChild(el)
            }

            val permissions = doc.getElementsByTagName("uses-permission")
            for (i in permissions.length - 1 downTo 0) {
                val el = permissions.item(i) as? Element ?: continue
                if (el.getAttribute("android:name") in AD_PERMISSIONS) el.parentNode.removeChild(el)
            }
        }
    }
}
