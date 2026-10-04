package app.threadripper.patches.youtube.settings

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Adds a "Thread Ripper" screen to the Morphe settings menu of the official Morphe Patches.
 *
 * Morphe's settings patch copies its preference XML files in execute and adds its preferences in
 * finalize. Every execute runs before any finalize, so the files exist when this finalize runs,
 * whatever the order of the two finalize blocks; both only append to the root screen. Morphe's
 * settings screen ignores preferences without a Morphe Setting, and Android stores their values in
 * the same shared preferences ("morphe_prefs"), where the extension's Config reads them.
 * Without the official settings patch the files do not exist and nothing is added; the debug.tr.*
 * properties and defaults still apply.
 */
internal val settingsResourcePatch = resourcePatch {
    finalize {
        listOf("morphe_prefs", "morphe_prefs_icons", "morphe_prefs_icons_bold").forEach { name ->
            val path = "res/xml/$name.xml"
            if (!get(path, copy = false).exists()) return@forEach
            document(path).use { document ->
                val root = document.getElementsByTagName("PreferenceScreen").item(0) as Element
                root.appendChild(document.threadRipperScreen())
            }
        }
    }
}

private fun Document.threadRipperScreen() = element(
    "PreferenceScreen",
    "key" to "tr_settings",
    "title" to "Thread Ripper",
    "summary" to "Buffer preload, multi-connection download and stall recovery for spoofed video streams",
).apply {
    appendChild(
        element("PreferenceCategory", "key" to "tr_preload_category", "title" to "Buffer preload").apply {
            appendChild(
                element(
                    "SwitchPreference",
                    "key" to "tr_preload_enabled",
                    "defaultValue" to "true",
                    "title" to "Buffer preload",
                    "summaryOn" to "The player keeps loading until the target below is buffered",
                    "summaryOff" to "The app's own buffer limits apply",
                ),
            )
            appendChild(
                number(
                    "tr_preload_seconds", "900", "tr_preload_enabled",
                    "Preload target (seconds of video)",
                    "Default 900. Loading continues until this much video is buffered or the memory limit is reached.",
                ),
            )
            appendChild(
                number(
                    "tr_preload_mib", "250", "tr_preload_enabled",
                    "Preload memory limit (MiB)",
                    "Default 250, 16 to 300. The app has 512 MiB of memory and uses 100-170 MiB itself.",
                ),
            )
        },
    )
    appendChild(
        element("PreferenceCategory", "key" to "tr_download_category", "title" to "Multi-connection download").apply {
            appendChild(
                element(
                    "SwitchPreference",
                    "key" to "tr_download_enabled",
                    "defaultValue" to "true",
                    "title" to "Multi-connection download",
                    "summaryOn" to "Video ranges of 1 MiB or more are downloaded over several connections",
                    "summaryOff" to "The app downloads each range with one request",
                ),
            )
            appendChild(
                number(
                    "tr_download_threads", "8", "tr_download_enabled",
                    "Connections per range", "Default 8, 1 to 32.",
                ),
            )
        },
    )
    appendChild(
        element("PreferenceCategory", "key" to "tr_rebuffer_category", "title" to "Stall recovery").apply {
            appendChild(
                element(
                    "SwitchPreference",
                    "key" to "tr_rebuffer_enabled",
                    "defaultValue" to "false",
                    "title" to "Resume sooner after a stall",
                    "summaryOn" to "Playback resumes once the amount below is buffered; it may stall again sooner",
                    "summaryOff" to "After a stall the app waits for 5 seconds of video",
                ),
            )
            appendChild(
                number(
                    "tr_rebuffer_ms", "1600", "tr_rebuffer_enabled",
                    "Resume after (milliseconds of video)",
                    "Default 1600, the app's own threshold for the first start. 0 to 5000.",
                ),
            )
        },
    )
}

private fun Document.number(key: String, default: String, dependency: String, title: String, summary: String) = element(
    "EditTextPreference",
    "key" to key,
    "defaultValue" to default,
    "dependency" to dependency,
    "inputType" to "number",
    "title" to title,
    "summary" to summary,
)

private fun Document.element(tag: String, vararg attributes: Pair<String, String>): Element =
    createElement(tag).apply { attributes.forEach { (name, value) -> setAttribute("android:$name", value) } }
