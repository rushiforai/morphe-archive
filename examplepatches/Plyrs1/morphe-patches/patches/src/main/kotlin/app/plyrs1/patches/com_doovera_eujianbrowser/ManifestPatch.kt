package app.plyrs1.patches.com_doovera_eujianbrowser

import app.morphe.patcher.patch.resourcePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_EUJIANBROWSER
import org.w3c.dom.Element

/**
 * Manifest modifications for E-Ujian Browser:
 *
 * 1. Background Persistence Permissions:
 *    - android.permission.WAKE_LOCK
 *    - android.permission.FOREGROUND_SERVICE
 *    - android.permission.FOREGROUND_SERVICE_SPECIAL_USE
 *
 * 2. Background Service Declaration:
 *    - com.doovera.eujianbrowser.ExamKeepAliveService
 *    - foregroundServiceType="specialUse"
 *    - stopWithTask="false"
 *
 * 3. Anti-Pin / Recent Apps Enablement:
 *    - Removes android:lockTaskMode="if_whitelisted" from ExamActivity
 *    - Removes android:excludeFromRecents="true" from ExamActivity
 *    - Sets android:resizeableActivity="true" on ExamActivity
 */
@Suppress("unused")
val manifestPatch = resourcePatch(
    name = "Manifest: Background Persistence Permissions",
    description = "Adds WAKE_LOCK, FOREGROUND_SERVICE, and FOREGROUND_SERVICE_SPECIAL_USE " +
            "permissions, registers ExamKeepAliveService, and removes lockTaskMode/excludeFromRecents from ExamActivity.",
    default = true
) {
    compatibleWith(COMPATIBILITY_EUJIANBROWSER)
    dependsOn(backgroundPersistencePatch)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement

            // ── 1. Permissions ──────────────────────────────────────────────────
            val permissionsToAdd = listOf(
                "android.permission.WAKE_LOCK",
                "android.permission.FOREGROUND_SERVICE",
                "android.permission.FOREGROUND_SERVICE_SPECIAL_USE"
            )

            val existingPermissions = manifest.getElementsByTagName("uses-permission")
            val lastPermission = existingPermissions.item(existingPermissions.length - 1)

            for (permName in permissionsToAdd) {
                val elem = doc.createElement("uses-permission")
                elem.setAttribute("android:name", permName)
                manifest.insertBefore(elem, lastPermission.nextSibling)
            }

            // ── 2. Service declaration ──────────────────────────────────────────
            val application = manifest.getElementsByTagName("application").item(0) as Element

            val service = doc.createElement("service")
            service.setAttribute("android:name", "com.doovera.eujianbrowser.ExamKeepAliveService")
            service.setAttribute("android:exported", "false")
            service.setAttribute("android:stopWithTask", "false")
            service.setAttribute("android:foregroundServiceType", "specialUse")

            val property = doc.createElement("property")
            property.setAttribute("android:name", "android.app.PROPERTY_SPECIAL_USE_FGS_SUBTYPE")
            property.setAttribute("android:value", "keepAlive")
            service.appendChild(property)

            application.appendChild(service)

            // ── 3. Remove lockTaskMode and excludeFromRecents on ExamActivity ────
            val activities = manifest.getElementsByTagName("activity")
            for (i in 0 until activities.length) {
                val act = activities.item(i) as? Element ?: continue
                if (act.getAttribute("android:name") == "com.doovera.eujianbrowser.ExamActivity") {
                    act.removeAttribute("android:lockTaskMode")
                    act.removeAttribute("android:excludeFromRecents")
                    act.setAttribute("android:resizeableActivity", "true")
                }
            }
        }
    }
}
