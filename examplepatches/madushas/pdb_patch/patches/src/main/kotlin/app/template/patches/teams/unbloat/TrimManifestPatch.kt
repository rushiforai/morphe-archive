package app.template.patches.teams.unbloat

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.TEAMS_COMPATIBILITY
import org.w3c.dom.Element

/**
 * The launcher-badge permission zoo. Teams declares badge read/write permissions for ~14
 * third-party launchers (Samsung, HTC, Sony, Sony Ericsson, Huawei, OPPO and the "badger"
 * providers). They are pure manifest bulk on any device that is not running those exact
 * launchers, and removing them costs nothing: badging on unsupported launchers simply falls
 * back to the notification dot.
 */
private val BADGE_PERMISSIONS = listOf(
    "android.permission.READ_APP_BADGE",
    "com.sec.android.provider.badge.permission.READ",
    "com.sec.android.provider.badge.permission.WRITE",
    "com.htc.launcher.permission.READ_SETTINGS",
    "com.htc.launcher.permission.UPDATE_SHORTCUT",
    "com.sonyericsson.home.permission.BROADCAST_BADGE",
    "com.sonymobile.home.permission.PROVIDER_INSERT_BADGE",
    "com.anddoes.launcher.permission.UPDATE_COUNT",
    "com.majeur.launcher.permission.UPDATE_BADGE",
    "com.huawei.android.launcher.permission.CHANGE_BADGE",
    "com.huawei.android.launcher.permission.READ_SETTINGS",
    "com.huawei.android.launcher.permission.WRITE_SETTINGS",
    "com.oppo.launcher.permission.READ_SETTINGS",
    "com.oppo.launcher.permission.WRITE_SETTINGS",
    "me.everything.badger.permission.BADGE_COUNT_READ",
    "me.everything.badger.permission.BADGE_COUNT_WRITE",
)

/**
 * Trims Microsoft Teams' manifest.
 *
 * Teams requests 80 permissions, a large part of which are launcher-badge permissions for
 * launchers that are not installed. This patch removes those (and the install-referrer, which
 * the "Remove ads" patch also drops) to reduce the manifest's permission surface and the
 * install-time permission work, without touching anything Teams needs for messaging, calls,
 * notifications, files or enterprise (Intune) integration.
 */
@Suppress("unused")
val teamsTrimManifestPatch = resourcePatch(
    name = "Unbloat (trim manifest)",
    description = "Removes the third-party launcher-badge permission zoo Teams declares " +
        "(Samsung/HTC/Sony/Huawei/OPPO/badger), which only add manifest bulk.",
    default = true,
) {
    category("Unbloat")
    compatibleWith(TEAMS_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            var removed = 0
            val permissions = doc.getElementsByTagName("uses-permission")
            for (i in permissions.length - 1 downTo 0) {
                val el = permissions.item(i) as? Element ?: continue
                if (el.getAttribute("android:name") in BADGE_PERMISSIONS) {
                    el.parentNode.removeChild(el)
                    removed++
                }
            }
            println("[teamsTrimManifest] badge permissions removed: $removed")
        }
    }
}
