package dev.alastorkaneki.morphe.patches.operagx

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import dev.alastorkaneki.morphe.patches.operagx.Constants.OPERA_GX
import org.w3c.dom.Element

private const val DOWNLOADER_ACTIVITY =
    "dev.alastorkaneki.morphe.extension.operagx.GxModDownloadActivity"
private const val OVERLAY_INIT_PROVIDER =
    "dev.alastorkaneki.morphe.extension.operagx.GxModOverlayInitProvider"
private const val OVERLAY_PROVIDER_AUTHORITY =
    "com.opera.gx.gxmoddownloader.init"

/** Registers the downloader, visible overlay initializer, and share fallback. */
@Suppress("unused")
internal val addGxModDownloaderManifestPatch = resourcePatch(
    description = "Registers the visible GX mod downloader button and share fallback."
) {
    compatibleWith(OPERA_GX)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application =
                document.getElementsByTagName("application").item(0) as Element

            // Required only on Android 9 and older. Harmless on newer builds because
            // maxSdkVersion prevents it from being requested there.
            val permissionAlreadyPresent =
                (0 until document.getElementsByTagName("uses-permission").length)
                    .map { document.getElementsByTagName("uses-permission").item(it) as Element }
                    .any {
                        it.getAttribute("android:name") ==
                            "android.permission.WRITE_EXTERNAL_STORAGE"
                    }

            if (!permissionAlreadyPresent) {
                document.createElement("uses-permission").also { permission ->
                    permission.setAttribute(
                        "android:name",
                        "android.permission.WRITE_EXTERNAL_STORAGE"
                    )
                    permission.setAttribute("android:maxSdkVersion", "28")
                    manifest.insertBefore(permission, application)
                }
            }

            val providerAlreadyPresent =
                (0 until application.getElementsByTagName("provider").length)
                    .map { application.getElementsByTagName("provider").item(it) as Element }
                    .any { it.getAttribute("android:name") == OVERLAY_INIT_PROVIDER }

            if (!providerAlreadyPresent) {
                application.appendChild(document.createElement("provider").apply {
                    setAttribute("android:name", OVERLAY_INIT_PROVIDER)
                    setAttribute("android:authorities", OVERLAY_PROVIDER_AUTHORITY)
                    setAttribute("android:exported", "false")
                    setAttribute("android:enabled", "true")
                    setAttribute("android:initOrder", "100")
                })
            }

            val activityAlreadyPresent =
                (0 until application.getElementsByTagName("activity").length)
                    .map { application.getElementsByTagName("activity").item(it) as Element }
                    .any { it.getAttribute("android:name") == DOWNLOADER_ACTIVITY }

            if (!activityAlreadyPresent) {
                val activity = document.createElement("activity").apply {
                    setAttribute("android:name", DOWNLOADER_ACTIVITY)
                    setAttribute("android:exported", "true")
                    setAttribute("android:excludeFromRecents", "true")
                    setAttribute("android:noHistory", "true")
                    setAttribute("android:label", "Download GX Mod")
                    setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
                }

                val intentFilter = document.createElement("intent-filter").apply {
                    appendChild(document.createElement("action").apply {
                        setAttribute("android:name", "android.intent.action.SEND")
                    })
                    appendChild(document.createElement("category").apply {
                        setAttribute("android:name", "android.intent.category.DEFAULT")
                    })
                    appendChild(document.createElement("data").apply {
                        setAttribute("android:mimeType", "text/plain")
                    })
                }

                activity.appendChild(intentFilter)
                application.appendChild(activity)
            }
        }
    }
}

@Suppress("unused")
val downloadGxModsAsFilesPatch = bytecodePatch(
    name = "Download GX mods as files",
    description =
        "Adds a visible Download Mod button in Opera GX, with URL auto-detection and a Share fallback.",
    default = true
) {
    compatibleWith(OPERA_GX)
    dependsOn(addGxModDownloaderManifestPatch)
    extendWith("extensions/extension.mpe")

    // The button is initialized through an injected ContentProvider. This avoids
    // brittle fingerprints against Opera GX's frequently obfuscated UI classes.
    execute { }
}
