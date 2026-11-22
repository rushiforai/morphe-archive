package app.ckzorigins.patches.compat

import app.ckzorigins.patches.mono.gluBackupPatch
import app.ckzorigins.patches.shared.Constants.COMPATIBILITY
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Referrer receivers and the boot receiver that pinged S3. Flurry and Tune are already
 * stubbed by Disable telemetry; NotificationReceiver only needed RECEIVE_BOOT_COMPLETED.
 */
internal val REMOVED_COMPONENTS = listOf(
    "receiver" to "com.flurry.android.InstallReceiver",
    "receiver" to "com.mobileapptracker.Tracker",
    "receiver" to "com.glu.plugins.NotificationReceiver",
)

/**
 * Phone, accounts, location, and wifi are the ad/tracker identifiers. Boot is the
 * notification receiver. CHECK_LICENSE is Play LVL for the expansion download, which
 * [bundleObbPatch] already removed. WRITE_EXTERNAL_STORAGE and WAKE_LOCK stay:
 * UnityPlayer uses both (saves on Gingerbread, screen-on during play).
 *
 * Gingerbread throws SecurityException when GET_ACCOUNTS or READ_PHONE_STATE is
 * missing. NativeEdits.JNI_GUARDS returns from GWallet's account-name and
 * device-id JNI before those calls, same idea as CK Zombies jniGuards.
 */
internal val REMOVED_PERMISSIONS = listOf(
    "android.permission.READ_PHONE_STATE",
    "android.permission.GET_ACCOUNTS",
    "android.permission.ACCESS_COARSE_LOCATION",
    "android.permission.ACCESS_WIFI_STATE",
    "android.permission.RECEIVE_BOOT_COMPLETED",
    "com.android.vending.CHECK_LICENSE",
)

/**
 * Removes [REMOVED_COMPONENTS] and every uses-permission in [REMOVED_PERMISSIONS].
 * Glu merged the same permission from several SDKs, so each name can appear more
 * than once; every copy must be there, or the manifest is refused, not half edited.
 */
internal fun removeUnusedEntries(document: Document) {
    val wanted = REMOVED_COMPONENTS + REMOVED_PERMISSIONS.map { "uses-permission" to it }
    val found = wanted.map { (tag, name) ->
        val list = document.getElementsByTagName(tag)
        val matches = (0 until list.length).map { list.item(it) as Element }
            .filter { it.getAttribute("android:name") == name }
        if (matches.isEmpty()) throw PatchException("AndroidManifest.xml has no <$tag> named $name")
        matches
    }
    found.flatten().forEach { it.parentNode.removeChild(it) }
}

@Suppress("unused")
val unusedPermissionsPatch = patch(
    name = "Remove unused permissions",
    description = "Removes permissions the game no longer needs, such as phone and accounts, " +
        "along with the dead services that needed them.",
) {
    compatibleWith(COMPATIBILITY)
    dependsOn(gluBackupPatch)

    execute {
        document("AndroidManifest.xml").use { removeUnusedEntries(it) }
    }
}
