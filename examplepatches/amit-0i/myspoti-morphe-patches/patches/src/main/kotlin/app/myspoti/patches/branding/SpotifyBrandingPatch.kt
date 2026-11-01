package app.myspoti.patches.branding

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

private val myspotiBeta = Compatibility(
    name = "MySpoti",
    packageName = "app.myspoti",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x1ED760,
    targets = listOf(AppTarget(version = null)), // Any MySpoti version; this patch changes resources only.
)

private val myspotiStable = Compatibility(
    name = "MySpoti",
    packageName = "app.myspoti.stable",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x1ED760,
    targets = listOf(AppTarget(version = null)),
)

private const val SPOTIFY_MARK_PATH = """M70.563,50.822C61.537,45.462 46.65,44.97 38.034,47.585C36.65,48.005 35.187,47.223 34.768,45.84C34.348,44.455 35.129,42.993 36.513,42.573C46.404,39.57 62.846,40.15 73.236,46.318C74.481,47.057 74.889,48.664 74.151,49.907C73.413,51.151 71.804,51.561 70.563,50.822ZM70.267,58.761C69.634,59.789 68.29,60.111 67.264,59.48C59.74,54.855 48.266,53.515 39.363,56.217C38.209,56.566 36.99,55.915 36.639,54.763C36.291,53.609 36.942,52.391 38.095,52.041C48.264,48.954 60.907,50.449 69.549,55.76C70.575,56.392 70.898,57.736 70.267,58.761ZM66.841,66.386C66.338,67.211 65.264,67.469 64.441,66.966C57.866,62.948 49.59,62.04 39.844,64.267C38.905,64.482 37.969,63.893 37.755,62.955C37.539,62.015 38.126,61.079 39.067,60.865C49.733,58.427 58.882,59.476 66.262,63.986C67.085,64.488 67.344,65.563 66.841,66.386ZM54,26C38.536,26 26,38.536 26,53.999C26,69.465 38.536,82 54,82C69.464,82 82,69.465 82,53.999C82,38.536 69.464,26 54,26L54,26Z"""

private val spotifyForeground = """
    <?xml version="1.0" encoding="utf-8"?>
    <vector xmlns:android="http://schemas.android.com/apk/res/android"
        android:width="108dp"
        android:height="108dp"
        android:viewportWidth="108"
        android:viewportHeight="108">
        <path
            android:fillColor="#1ED760"
            android:pathData="$SPOTIFY_MARK_PATH" />
    </vector>
""".trimIndent() + "\n"

private val spotifyBackground = """
    <?xml version="1.0" encoding="utf-8"?>
    <shape xmlns:android="http://schemas.android.com/apk/res/android"
        android:shape="rectangle">
        <solid android:color="#000000" />
    </shape>
""".trimIndent() + "\n"

private val spotifyMonochrome = """
    <?xml version="1.0" encoding="utf-8"?>
    <vector xmlns:android="http://schemas.android.com/apk/res/android"
        android:width="108dp"
        android:height="108dp"
        android:viewportWidth="108"
        android:viewportHeight="108">
        <path
            android:fillColor="#FFFFFFFF"
            android:pathData="$SPOTIFY_MARK_PATH" />
    </vector>
""".trimIndent() + "\n"

private val spotifyNotification = """
    <?xml version="1.0" encoding="utf-8"?>
    <vector xmlns:android="http://schemas.android.com/apk/res/android"
        android:width="24dp"
        android:height="24dp"
        android:viewportWidth="108"
        android:viewportHeight="108">
        <group
            android:scaleX="1.4464286"
            android:scaleY="1.4464286"
            android:translateX="-24.107143"
            android:translateY="-24.107143">
            <path
                android:fillColor="#FFFFFFFF"
                android:pathData="$SPOTIFY_MARK_PATH" />
        </group>
    </vector>
""".trimIndent() + "\n"

/** Renames MySpoti to Spotify and replaces all app-identifying icon variants. */
@Suppress("unused")
val spotifyBrandingPatch = resourcePatch(
    name = "Spotify branding",
    description = "Renames MySpoti to Spotify and replaces every launcher, themed, supporter-preview, splash, widget, and notification mark with Spotify branding.",
    default = true,
) {
    compatibleWith(myspotiBeta, myspotiStable)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: error("MySpoti manifest has no application element")
            application.setAttributeNS(ANDROID_NAMESPACE, "android:label", "Spotify")

            val receivers = manifest.getElementsByTagName("receiver")
            val widgetReceiver = (0 until receivers.length)
                .mapNotNull { receivers.item(it) as? Element }
                .firstOrNull {
                    it.getAttributeNS(ANDROID_NAMESPACE, "name") ==
                        "com.music.spotui.widget.NowPlayingWidget"
                }
            widgetReceiver?.setAttributeNS(ANDROID_NAMESPACE, "android:label", "Spotify")
        }

        var foundAppName = false
        val appNameElementPattern = Regex("""<string\b(?=[^>]*\bname\s*=\s*["']app_name["'])[^>]*>""")
        listDecodableFiles("res/values*/strings.xml").forEach { path ->
            val source = get(path).readText()
            if (!appNameElementPattern.containsMatchIn(source)) return@forEach

            document(path).use { strings ->
                val resources = strings.getElementsByTagName("string")
                val appName = (0 until resources.length)
                    .mapNotNull { resources.item(it) as? Element }
                    .firstOrNull { it.getAttribute("name") == "app_name" }
                if (appName != null) {
                    appName.textContent = "Spotify"
                    foundAppName = true
                }
            }
        }
        check(foundAppName) { "MySpoti app_name string was not found" }

        // Update every launcher foreground. MySpoti has green, blue, purple, pink, and
        // orange variants used by its launcher aliases and supporter-icon previews; all
        // should show the same Spotify brand mark after this patch.
        listOf(
            "res/drawable/ic_launcher_foreground.xml",
            "res/drawable/ic_launcher_foreground_blue.xml",
            "res/drawable/ic_launcher_foreground_purple.xml",
            "res/drawable/ic_launcher_foreground_pink.xml",
            "res/drawable/ic_launcher_foreground_orange.xml",
        ).forEach { path -> get(path).writeText(spotifyForeground) }

        get("res/drawable/ic_launcher_background.xml").writeText(spotifyBackground)

        // Android themed icons, the About/supporter previews, splash screen, and widget
        // consume the shared foreground/background resources or the monochrome layer below.
        get("res/drawable/ic_launcher_monochrome.xml").writeText(spotifyMonochrome)

        // The status-bar/media notification mark is separate from launcher artwork.
        get("res/drawable/msp_ic_notification.xml").writeText(spotifyNotification)
    }
}
