package app.xperia.patches.sony.camera

import app.xperia.patches.sony.SONY_CAMERA
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Sideloaded on LineageOS, the camera app cannot see com.sonymobile.cameracommon (Android 11+ package
 * visibility) and nobody declares the Sony permissions it needs. On stock both are system apps.
 */
@Suppress("unused")
val cameraCommonVisibilityPatch = resourcePatch(
    name = "Camera common visibility",
    description = "Lets the camera app see and use com.sonymobile.cameracommon (camera status provider, " +
            "gyro calibration) when both are sideloaded: adds the <queries> entry and declares the " +
            "CAMERA_STATUS_PROVIDER and CAMERA_ADDON permissions.",
) {
    compatibleWith(SONY_CAMERA)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement

            val queries = (document.getElementsByTagName("queries").item(0) as? Element)
                ?: document.createElement("queries").also { manifest.insertBefore(it, manifest.firstChild) }
            queries.appendChild(document.createElement("package").apply {
                setAttribute("android:name", "com.sonymobile.cameracommon")
            })

            val firstUsesPermission = document.getElementsByTagName("uses-permission").item(0)
            listOf(
                "com.sonymobile.permission.CAMERA_STATUS_PROVIDER",
                "com.sonymobile.permission.CAMERA_ADDON",
            ).forEach { name ->
                val permission = document.createElement("permission").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:protectionLevel", "signature")
                }
                manifest.insertBefore(permission, firstUsesPermission)
            }
        }
    }
}
