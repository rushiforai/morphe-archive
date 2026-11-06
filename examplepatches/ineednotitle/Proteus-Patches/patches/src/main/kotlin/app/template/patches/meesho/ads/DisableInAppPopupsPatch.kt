package app.template.patches.meesho.ads

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MEESHO_COMPATIBILITY
import org.w3c.dom.Element

// Disable Meesho's in-app popup/upsell surface.
//
// The manifest declares com.meesho.inapppopup.impl.InAppPopupActivity, the
// full-screen in-app popup host (promo modals, referral nudges, coins
// banners). Setting android:enabled="false" makes any startActivity for it a
// no-op (ActivityNotFoundException is swallowed by the caller's try/catch in
// the common case), so popups never render.
//
// CAUTION: if Meesho routes a required flow (e.g. a mandate or address
// confirmation) through this activity, that flow breaks. Opt-in
// (default = false) until the popup routing is verified against the real APK.
//
// Fail-safe: if the activity is absent from the manifest, nothing changes.

private const val IN_APP_POPUP_ACTIVITY = "com.meesho.inapppopup.impl.InAppPopupActivity"

@Suppress("unused")
val meeshoDisableInAppPopupsPatch = resourcePatch(
    name = "Disable in-app popup upsells",
    description = "Disables Meesho's InAppPopupActivity so full-screen promo/upsell popups " +
        "never render. May break a flow that legitimately routes through it — verify first.",
    default = false,
) {
    compatibleWith(MEESHO_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? Element ?: continue
                if (activity.getAttribute("android:name") == IN_APP_POPUP_ACTIVITY) {
                    activity.setAttribute("android:enabled", "false")
                }
            }
        }
    }
}
