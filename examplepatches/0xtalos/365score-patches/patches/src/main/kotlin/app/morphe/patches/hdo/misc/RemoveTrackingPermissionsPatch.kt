package app.morphe.patches.hdo.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.hdo.utils.COMPATIBILITY_HDO
import org.w3c.dom.Element

/** Permissions that exist only to let an ad or analytics SDK read an advertising id. */
private val TRACKING_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
)

/**
 * Removes the advertising id and Privacy Sandbox (AdServices) permissions.
 *
 * With ads and analytics gone nothing reads an advertising id any more, so the permissions are
 * dropped instead of merely being left unused, which also removes the Play Store listing entry
 * that is normally shown because of `com.google.android.gms.permission.AD_ID`.
 */
@Suppress("unused")
val removeTrackingPermissionsPatch = resourcePatch(
    name = "Remove tracking permissions",
    description = "Removes the advertising id (AD_ID) and Privacy Sandbox (AdServices) permissions.",
) {
    compatibleWith(*COMPATIBILITY_HDO)

    execute {
        document("AndroidManifest.xml").use { document ->
            val permissions = document.getElementsByTagName("uses-permission")
            val removable = buildList {
                for (i in 0 until permissions.length) {
                    val element = permissions.item(i) as? Element ?: continue
                    if (element.getAttribute("android:name") in TRACKING_PERMISSIONS) add(element)
                }
            }

            val found = removable.map { it.getAttribute("android:name") }.toSet()
            val missing = TRACKING_PERMISSIONS - found
            if (missing.isNotEmpty()) {
                throw PatchException("Tracking permissions missing from the manifest: $missing")
            }

            removable.forEach { it.parentNode.removeChild(it) }
        }
    }
}
