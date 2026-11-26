package app.template.patches.slot

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.template.patches.shared.Constants.COMPATIBILITY_SLOT

/**
 * slot. for Android declares minSdkVersion 31 (Android 12). Nothing in its Kotlin code needs
 * an API newer than Android 11 (API 30) without a version check, so lowering the manifest
 * requirement is the whole change.
 *
 * Known limitation: the Bluetooth status icon relies on the BLUETOOTH_CONNECT runtime
 * permission, which does not exist before Android 12. On Android 11 it stays hidden.
 * That is cosmetic; nothing else depends on it.
 */
@Suppress("unused")
val android11SupportPatch = patch(
    name = "Android 11 support",
    description = "Lowers the minimum Android version from 12 (API 31) to 11 (API 30) so the app can be installed on Android 11.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SLOT)

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.elements("uses-sdk").first().setAttribute("android:minSdkVersion", "30")
        }
    }
}
