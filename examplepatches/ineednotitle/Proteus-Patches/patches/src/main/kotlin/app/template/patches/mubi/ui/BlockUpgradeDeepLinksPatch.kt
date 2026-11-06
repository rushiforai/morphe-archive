package app.template.patches.mubi.ui

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.MUBI_COMPATIBILITY
import org.w3c.dom.Element

// Block external upgrade / sale entry points in MUBI.
//
// MUBI's manifest exposes:
//   • com.mubi.ui.subscriptions.UpgradeSubscriptionsActivity — exported, so any
//     app or browser link can drop the user straight into the purchase flow.
//   • a `mubi://` intent filter with hard-coded hosts: upgrade-yearly,
//     blackfriday, subscription-settings, subscribe, retrospective, sign-in.
//   • https App Links for promo paths such as /app_flash_sale2024 and
//     /summer_sale_2024.
//
// This patch makes the upgrade activity non-exported (internal navigation still
// works, so a genuine upgrade initiated inside the app is unaffected) and points
// the promo hosts/paths at a sentinel that can never be produced.
//
// Why rewrite instead of delete: within one <intent-filter>, Android treats the
// <data> children as a combined scheme/host/path set. Deleting the only host of
// a `mubi` filter would leave a scheme-only filter that matches *every*
// mubi:// URI — the opposite of blocking. Rewriting the attribute keeps the
// filter's matching structure intact and simply makes the promo route
// unreachable.
//
// This patch does NOT touch entitlement checks, purchases or playback: MUBI's
// subscription is validated server-side, and this only removes externally
// reachable marketing routes.
//
// Fail-safe: every edit is conditional on the exact host/path/class name being
// present. A future manifest that renames them simply keeps the stock behavior.

private const val UPGRADE_ACTIVITY = "com.mubi.ui.subscriptions.UpgradeSubscriptionsActivity"

private val PROMO_HOSTS = setOf(
    "upgrade-yearly",
    "blackfriday",
)

private val PROMO_PATHS = setOf(
    "/app_flash_sale2024",
    "/summer_sale_2024",
)

private const val BLOCKED_HOST = "proteus-blocked.invalid"
private const val BLOCKED_PATH = "/__proteus_blocked__"

@Suppress("unused")
val mubiBlockUpgradeDeepLinksPatch = resourcePatch(
    name = "Block upgrade & sale deep links",
    description = "Makes MUBI's upgrade screen non-exported and disables the " +
        "upgrade-yearly / blackfriday / flash-sale deep links. Playback and " +
        "entitlements are unchanged.",
    default = true,
) {
    compatibleWith(MUBI_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? Element ?: continue
                if (activity.getAttribute("android:name") == UPGRADE_ACTIVITY) {
                    activity.setAttribute("android:exported", "false")
                }
            }

            val dataNodes = document.getElementsByTagName("data")
            for (index in 0 until dataNodes.length) {
                val data = dataNodes.item(index) as? Element ?: continue

                if (data.hasAttribute("android:host") &&
                    data.getAttribute("android:host") in PROMO_HOSTS
                ) {
                    data.setAttribute("android:host", BLOCKED_HOST)
                }

                listOf("android:path", "android:pathPattern", "android:pathPrefix").forEach { attribute ->
                    if (data.hasAttribute(attribute) && data.getAttribute(attribute) in PROMO_PATHS) {
                        data.setAttribute(attribute, BLOCKED_PATH)
                    }
                }
            }
        }
    }
}
