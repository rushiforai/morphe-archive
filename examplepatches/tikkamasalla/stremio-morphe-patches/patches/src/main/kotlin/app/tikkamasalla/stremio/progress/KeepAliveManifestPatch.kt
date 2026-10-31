package app.tikkamasalla.stremio.progress

import app.morphe.patcher.patch.resourcePatch
import app.tikkamasalla.stremio.introskip.Constants

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val SERVICE_NAME = "app.tikkamasalla.stremio.progress.KeepAliveService"
private const val PERMISSION = "android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK"
private val PLAYER_PACKAGES = listOf(
    "net.gtvbox.videoplayer",
    "com.mxtech.videoplayer.ad",
    "com.mxtech.videoplayer.pro",
    "org.videolan.vlc",
    "is.xyz.mpv",
)

/**
 * Declares the keep-alive service used by External player progress, so the idle app is not
 * killed while a long episode plays in another app. Runs with External player progress.
 */
val keepAliveManifestPatch = resourcePatch(
    name = "External player progress manifest",
    description = "Declares the keep-alive service for External player progress. Runs with that patch.",
    default = true,
) {
    compatibleWith(Constants.STREMIO_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val application = manifest.getElementsByTagName("application").item(0) ?: return@execute

            // Lets the app see the external players, so it can address the chosen one directly
            // instead of showing Android's "Open with" chooser.
            val existing = manifest.getElementsByTagName("queries").item(0)
            val queries = existing ?: doc.createElement("queries").also { manifest.insertBefore(it, application) }
            val declared = HashSet<String>()
            val packages = (queries as org.w3c.dom.Element).getElementsByTagName("package")
            for (i in 0 until packages.length) {
                packages.item(i).attributes?.getNamedItem("android:name")?.nodeValue?.let { declared.add(it) }
            }
            for (name in PLAYER_PACKAGES) {
                if (name in declared) continue
                val element = doc.createElement("package")
                element.setAttributeNS(ANDROID_NS, "android:name", name)
                queries.appendChild(element)
            }

            val services = doc.getElementsByTagName("service")
            for (i in 0 until services.length) {
                if (services.item(i).attributes?.getNamedItem("android:name")?.nodeValue == SERVICE_NAME) {
                    return@execute
                }
            }

            val permission = doc.createElement("uses-permission")
            permission.setAttributeNS(ANDROID_NS, "android:name", PERMISSION)
            manifest.insertBefore(permission, application)

            val service = doc.createElement("service")
            service.setAttributeNS(ANDROID_NS, "android:name", SERVICE_NAME)
            service.setAttributeNS(ANDROID_NS, "android:exported", "false")
            service.setAttributeNS(ANDROID_NS, "android:foregroundServiceType", "mediaPlayback")
            application.appendChild(service)
        }
    }
}
