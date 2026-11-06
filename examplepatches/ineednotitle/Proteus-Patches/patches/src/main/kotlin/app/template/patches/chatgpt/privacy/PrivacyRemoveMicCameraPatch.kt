package app.template.patches.chatgpt.privacy

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.CHATGPT_COMPATIBILITY
import org.w3c.dom.Element

/**
 * ChatGPT (com.openai.chatgpt), analyzed on stock 1.2026.293 (2629319).
 *
 * Privacy hardening: cuts the app's ability to ever reach the microphone or
 * camera, declared at the manifest level — Android cannot grant what is not
 * declared, regardless of how aggressively in-app code asks. Voice Mode,
 * Advanced Voice Mode, and the camera/scanner attachment flow are the two
 * removal side effects (their UI remains visible but cannot acquire audio or
 * video without the OS permission prompt, which no longer exists).
 *
 * Deliberately kept: INTERNET, PUT notifications, calendars/contacts and the
 * storage story. File upload/download in this app uses the Storage Access
 * Framework + MediaStore, which need no declared permissions at all, so the
 * file picker keeps working untouched.
 */
private val STRIP_PERMISSIONS = setOf(
    "android.permission.RECORD_AUDIO",
    "android.permission.CAMERA",
    // Companion to RECORD_AUDIO: useless and video-out  once the mic is gone,
    // and it lets a background service spot-owner the mic indicator.
    "android.permission.FOREGROUND_SERVICE_MICROPHONE",
)

private val STRIP_FEATURE_PREFIXES = listOf(
    "android.hardware.camera",
    "android.hardware.microphone",
)

@Suppress("unused")
val privacyRemoveMicCameraPatch = resourcePatch(
    name = "Privacy: no mic or camera",
    description = "Removes RECORD_AUDIO, CAMERA, FOREGROUND_SERVICE_MICROPHONE plus all camera/" +
        "microphone uses-feature declarations from the manifest. Voice Mode and camera " +
        "capture become impossible (not merely denied - the grant dialog itself is gone). " +
        "File storage, notifications and everything else are untouched.",
    default = true,
) {
    compatibleWith(CHATGPT_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val seed = document.documentElement

            val usesPermissions = seed.getElementsByTagName("uses-permission")
            for (i in (usesPermissions.length - 1) downTo 0) {
                val node = usesPermissions.item(i) as Element
                if (node.getAttribute("android:name") in STRIP_PERMISSIONS) {
                    seed.removeChild(node)
                }
            }

            val usesPermissionsSdk23 = seed.getElementsByTagName("uses-permission-sdk-23")
            for (i in (usesPermissionsSdk23.length - 1) downTo 0) {
                val node = usesPermissionsSdk23.item(i) as Element
                if (node.getAttribute("android:name") in STRIP_PERMISSIONS) {
                    seed.removeChild(node)
                }
            }

            val features = seed.getElementsByTagName("uses-feature")
            for (i in (features.length - 1) downTo 0) {
                val node = features.item(i) as Element
                val name = node.getAttribute("android:name")
                if (name != null && STRIP_FEATURE_PREFIXES.any { name.startsWith(it) }) {
                    seed.removeChild(node)
                }
            }
        }
    }
}
