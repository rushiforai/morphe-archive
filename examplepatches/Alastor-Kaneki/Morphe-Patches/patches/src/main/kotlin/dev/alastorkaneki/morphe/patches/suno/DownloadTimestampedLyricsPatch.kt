package dev.alastorkaneki.morphe.patches.suno

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import dev.alastorkaneki.morphe.patches.suno.Constants.SUNO
import org.w3c.dom.Element

private const val EXPORT_ACTIVITY =
    "dev.alastorkaneki.morphe.extension.suno.SunoLyricsExportActivity"
private const val OVERLAY_INIT_PROVIDER =
    "dev.alastorkaneki.morphe.extension.suno.SunoLyricsOverlayInitProvider"
private const val OVERLAY_PROVIDER_AUTHORITY =
    "com.suno.android.morphe.timestampedlyrics.init"

/** Registers the exporter, floating entry point, and Android share target. */
@Suppress("unused")
internal val addSunoTimestampedLyricsManifestPatch = resourcePatch(
    description = "Registers the Suno timestamped-lyrics exporter and overlay."
) {
    compatibleWith(SUNO)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application =
                document.getElementsByTagName("application").item(0) as Element

            val internetAlreadyPresent =
                (0 until document.getElementsByTagName("uses-permission").length)
                    .map { document.getElementsByTagName("uses-permission").item(it) as Element }
                    .any {
                        it.getAttribute("android:name") ==
                            "android.permission.INTERNET"
                    }

            if (!internetAlreadyPresent) {
                document.createElement("uses-permission").also { permission ->
                    permission.setAttribute(
                        "android:name",
                        "android.permission.INTERNET"
                    )
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
                    .any { it.getAttribute("android:name") == EXPORT_ACTIVITY }

            if (!activityAlreadyPresent) {
                val activity = document.createElement("activity").apply {
                    setAttribute("android:name", EXPORT_ACTIVITY)
                    setAttribute("android:exported", "true")
                    setAttribute("android:excludeFromRecents", "true")
                    setAttribute("android:label", "Timestamped Lyrics")
                    setAttribute("android:launchMode", "singleTask")
                    setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
                }

                activity.appendChild(document.createElement("intent-filter").apply {
                    appendChild(document.createElement("action").apply {
                        setAttribute("android:name", "android.intent.action.SEND")
                    })
                    appendChild(document.createElement("category").apply {
                        setAttribute("android:name", "android.intent.category.DEFAULT")
                    })
                    appendChild(document.createElement("data").apply {
                        setAttribute("android:mimeType", "text/plain")
                    })
                })

                application.appendChild(activity)
            }
        }
    }
}

@Suppress("unused")
val downloadTimestampedLyricsPatch = bytecodePatch(
    name = "Download timestamped lyrics",
    description =
        "Adds an in-app Lyrics button and share target that exports Suno timing data as LRC, enhanced LRC, SRT, WebVTT, or JSON.",
    default = true
) {
    compatibleWith(SUNO)
    dependsOn(addSunoTimestampedLyricsManifestPatch)
    extendWith("extensions/extension.mpe")

    // Startup and UI integration are handled by the injected ContentProvider,
    // avoiding brittle fingerprints against Suno's frequently changing UI.
    execute { }
}
