package app.ckzombies.patches.compat

import app.ckzombies.patches.nativelib.jniGuardsPatch
import app.ckzombies.patches.shared.Constants.COMPATIBILITY_CK_ZOMBIES
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * The receivers and service of two dead services. Urban Airship delivered push over C2DM, which
 * Google shut down in 2015, yet its PushService still starts a process of its own on every launch;
 * the rest wake the game for boot, push and install-referrer broadcasts nothing sends any more.
 */
internal val REMOVED_COMPONENTS = listOf(
    "receiver" to "com.tapjoy.TapjoyReferralTracker",
    "receiver" to "com.glu.platform.android.GluPushHandler",
    "receiver" to "com.urbanairship.CoreReceiver",
    "receiver" to "com.urbanairship.push.c2dm.C2DMPushReceiver",
    "service" to "com.urbanairship.push.PushService",
)

/**
 * What only those components and the device identifiers needed. The C2D_MESSAGE permission is
 * named after the package, so it is listed by its suffix.
 */
internal val REMOVED_PERMISSIONS = listOf(
    ".permission.C2D_MESSAGE",
    "com.google.android.c2dm.permission.RECEIVE",
    "android.permission.ACCESS_WIFI_STATE",
    "android.permission.GET_ACCOUNTS",
    "android.permission.READ_PHONE_STATE",
    "android.permission.RECEIVE_BOOT_COMPLETED",
)

/**
 * Removes [REMOVED_COMPONENTS], every uses-permission in [REMOVED_PERMISSIONS], and the
 * C2D_MESSAGE permission the manifest defines for itself. Every one of them must be there:
 * a manifest that differs from Glu's is refused, not half edited.
 */
internal fun removeUnusedEntries(document: Document) {
    val packageName = document.documentElement.getAttribute("package")
    val wanted = REMOVED_COMPONENTS +
        REMOVED_PERMISSIONS.map { "uses-permission" to if (it.startsWith(".")) packageName + it else it } +
        ("permission" to "$packageName.permission.C2D_MESSAGE")

    // Find every one first, so a missing entry leaves the manifest as it was.
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
val unusedPermissionsPatch = resourcePatch(
    name = "Remove unused permissions",
    description = "Removes permissions the game no longer needs, such as phone and accounts, " +
        "along with the dead services that needed them.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    // Below Android 6 a permission the manifest leaves out makes getDeviceId() and
    // getAccountsByType() throw. The native library reaches both over JNI and never clears the
    // exception; these guards keep it from making the calls at all.
    dependsOn(jniGuardsPatch)

    execute {
        document("AndroidManifest.xml").use { removeUnusedEntries(it) }
    }
}
