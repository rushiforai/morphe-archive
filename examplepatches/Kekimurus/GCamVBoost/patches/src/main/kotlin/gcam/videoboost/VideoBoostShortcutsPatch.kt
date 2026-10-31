package gcam.videoboost

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private const val VIDEO_ACTION = "android.media.action.VIDEO_CAMERA"

@Suppress("unused")
val videoBoostShortcutsPatch = resourcePatch(
    name = "Video Boost shortcuts",
    description = "Adds two launcher shortcuts that open video mode with Video Boost on or off " +
            "(\"Video VB On\" and \"Video VB Off\" by default)."
) {
    compatibleWith(
        "com.google.android.GoogleCameraEng",
        "com.google.android.GoogleCamera"
    )

    // Reads the shortcut's intent extra when the camera opens.
    dependsOn(videoBoostStartupPatch)

    val onLabel by stringOption(
        key = "onLabel",
        default = "Video VB On",
        title = "Video Boost on label",
        description = "Name of the shortcut that opens video mode with Video Boost on.",
        required = true
    ) { !it.isNullOrBlank() }

    val offLabel by stringOption(
        key = "offLabel",
        default = "Video VB Off",
        title = "Video Boost off label",
        description = "Name of the shortcut that opens video mode with Video Boost off.",
        required = true
    ) { !it.isNullOrBlank() }

    val keepOriginal by booleanOption(
        key = "keepOriginalVideoShortcut",
        default = false,
        title = "Keep original Video shortcut",
        description = "Also keep the stock \"Video\" shortcut. Most launchers only show the first 4 shortcuts."
    )

    execute {
        val labels = listOf(
            Triple("video_vb_on", onLabel!!.trim(), true),
            Triple("video_vb_off", offLabel!!.trim(), false),
        )

        // 1. Label strings. Shortcut labels must be string resources.
        document("res/values/strings.xml").use { document ->
            val resources = document.documentElement
            labels.forEach { (id, label, _) ->
                listOf("short", "long").forEach { kind ->
                    val string = document.createElement("string")
                    string.setAttribute("name", "morphe_shortcut_${id}_${kind}_label")
                    string.textContent = label
                    resources.appendChild(string)
                }
            }
        }

        // 2. Shortcut XML, as referenced by the launcher activity.
        var shortcutsXml = "shortcuts"
        document("AndroidManifest.xml").use { document ->
            val metaData = document.getElementsByTagName("meta-data")
            for (i in 0 until metaData.length) {
                val element = metaData.item(i) as Element
                if (element.getAttribute("android:name") == "android.app.shortcuts") {
                    shortcutsXml = element.getAttribute("android:resource").removePrefix("@xml/")
                }
            }
        }

        document("res/xml/$shortcutsXml.xml").use { document ->
            val shortcutNodes = document.getElementsByTagName("shortcut")
            val videoShortcut = (0 until shortcutNodes.length)
                .map { shortcutNodes.item(it) as Element }
                .firstOrNull { shortcut ->
                    val intents = shortcut.getElementsByTagName("intent")
                    (0 until intents.length).any {
                        (intents.item(it) as Element).getAttribute("android:action") == VIDEO_ACTION
                    }
                } ?: throw PatchException("Could not find the Video shortcut in res/xml/$shortcutsXml.xml")

            val parent = videoShortcut.parentNode
            val insertBefore = videoShortcut.nextSibling

            // Copies keep the current android:targetPackage, so they also work on a cloned package.
            labels.forEach { (id, _, videoBoost) ->
                val copy = videoShortcut.cloneNode(true) as Element
                copy.setAttribute("android:shortcutId", id)
                copy.setAttribute("android:shortcutShortLabel", "@string/morphe_shortcut_${id}_short_label")
                copy.setAttribute("android:shortcutLongLabel", "@string/morphe_shortcut_${id}_long_label")

                val intent = copy.getElementsByTagName("intent").item(0) as Element
                val extra = document.createElement("extra")
                extra.setAttribute("android:name", VIDEO_BOOST_EXTRA)
                extra.setAttribute("android:value", videoBoost.toString())
                intent.appendChild(extra)

                parent.insertBefore(copy, insertBefore)
            }

            if (keepOriginal != true) parent.removeChild(videoShortcut)
        }
    }
}
