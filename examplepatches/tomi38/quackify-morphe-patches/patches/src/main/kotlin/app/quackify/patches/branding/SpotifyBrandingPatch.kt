package app.quackify.patches.branding

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import kotlin.math.roundToInt

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val APP_NAME = "Spotify"
private const val ORIGINAL_NAME = "Quackify"

// Quackify's orange duck icon, shown next to the app in Morphe Manager.
private const val QUACKIFY_ICON_COLOR = 0xFF9F1A

// All three GitHub Releases flavors ship identical resources; only the application id differs.
private fun quackify(name: String, packageName: String) = Compatibility(
    name = name,
    packageName = packageName,
    apkFileType = ApkFileType.APK,
    appIconColor = QUACKIFY_ICON_COLOR,
    targets = listOf(AppTarget(version = null)), // Resources only: any Quackify version.
)

private val quackifyStandard = quackify("Quackify", "com.quackify.app")
private val quackifySpotify = quackify("Quackify (Spotify package)", "com.spotify.music")
private val quackifyApple = quackify("Quackify (Apple Music package)", "com.apple.android.music")

private const val SPOTIFY_MARK_PATH = """M70.563,50.822C61.537,45.462 46.65,44.97 38.034,47.585C36.65,48.005 35.187,47.223 34.768,45.84C34.348,44.455 35.129,42.993 36.513,42.573C46.404,39.57 62.846,40.15 73.236,46.318C74.481,47.057 74.889,48.664 74.151,49.907C73.413,51.151 71.804,51.561 70.563,50.822ZM70.267,58.761C69.634,59.789 68.29,60.111 67.264,59.48C59.74,54.855 48.266,53.515 39.363,56.217C38.209,56.566 36.99,55.915 36.639,54.763C36.291,53.609 36.942,52.391 38.095,52.041C48.264,48.954 60.907,50.449 69.549,55.76C70.575,56.392 70.898,57.736 70.267,58.761ZM66.841,66.386C66.338,67.211 65.264,67.469 64.441,66.966C57.866,62.948 49.59,62.04 39.844,64.267C38.905,64.482 37.969,63.893 37.755,62.955C37.539,62.015 38.126,61.079 39.067,60.865C49.733,58.427 58.882,59.476 66.262,63.986C67.085,64.488 67.344,65.563 66.841,66.386ZM54,26C38.536,26 26,38.536 26,53.999C26,69.465 38.536,82 54,82C69.464,82 82,69.465 82,53.999C82,38.536 69.464,26 54,26L54,26Z"""

private val spotifyBackground = """
    <?xml version="1.0" encoding="utf-8"?>
    <vector xmlns:android="http://schemas.android.com/apk/res/android"
        android:width="108dp"
        android:height="108dp"
        android:viewportWidth="108"
        android:viewportHeight="108">
        <path
            android:fillColor="#000000"
            android:pathData="M0,0h108v108h-108z" />
    </vector>
""".trimIndent() + "\n"

// Android 13+ themed icon layer: the mark alone, which the launcher tints to the wallpaper colors.
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

private const val MONOCHROME_DRAWABLE = "spotify_monochrome"

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

private val DENSITIES = mapOf(
    "mdpi" to 1.0,
    "hdpi" to 1.5,
    "xhdpi" to 2.0,
    "xxhdpi" to 3.0,
    "xxxhdpi" to 4.0,
)

/** A bundled PNG set (see scripts/RenderIcons.java) and the dp size of the WebP it replaces. */
private class RasterIcon(val kind: String, val baseDp: Int)

// Quackify's launcher icons are WebP bitmaps, so they are overwritten with pre-rendered PNGs.
// Android decodes bitmap resources by content, so PNG data under a .webp name loads fine.
private val RASTER_ICONS = mapOf(
    "ic_launcher_foreground" to RasterIcon("foreground", 108), // Adaptive icon foreground layer.
    "ic_launcher" to RasterIcon("legacy", 48), // Pre-Android 8 launcher icon.
    "ic_launcher_round" to RasterIcon("legacy", 48),
    "ic_launcher_default" to RasterIcon("legacy", 48), // Settings > App icon: "Default" preview.
    "ic_launcher_normal" to RasterIcon("legacy", 108), // "Normal" launcher alias and its preview.
)

private val BUNDLED_SIZES = mapOf(
    "foreground" to listOf(108, 162, 216, 324, 432),
    "legacy" to listOf(48, 72, 96, 144, 192, 432),
)

private object BrandingResources

private fun bundledPng(kind: String, px: Int): ByteArray {
    // Pick the exact size, or the smallest larger one (falling back to the largest available).
    val sizes = BUNDLED_SIZES.getValue(kind)
    val size = sizes.firstOrNull { it >= px } ?: sizes.last()
    val path = "quackify/branding/$kind-$size.png"
    return BrandingResources::class.java.classLoader.getResourceAsStream(path)
        ?.use { it.readBytes() }
        ?: error("Bundled resource $path is missing from the patches file")
}

/** Renames Quackify to Spotify and replaces its duck icons with the Spotify mark. */
@Suppress("unused")
val spotifyBrandingPatch = resourcePatch(
    name = "Spotify branding",
    description = "Renames Quackify to Spotify and replaces the launcher (both icon choices, plus the Android 13+ themed icon), splash, widget and notification icons with the Spotify mark.",
    default = true,
) {
    compatibleWith(quackifyStandard, quackifySpotify, quackifyApple)

    execute {
        // The Spotify and Apple flavors reuse those apps' package names, so make sure this really is Quackify.
        check(get("res/drawable/ic_stat_duck.xml").exists()) {
            "This APK is not Quackify (res/drawable/ic_stat_duck.xml was not found)"
        }

        // Launcher label: release builds set a literal "Quackify" on the application, MainActivity
        // and both launcher aliases (LauncherDefault / LauncherNormal).
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: error("Quackify manifest has no application element")
            application.setAttributeNS(ANDROID_NAMESPACE, "android:label", APP_NAME)

            listOf("activity", "activity-alias").forEach { tag ->
                val elements = manifest.getElementsByTagName(tag)
                (0 until elements.length)
                    .mapNotNull { elements.item(it) as? Element }
                    .filter { it.hasAttributeNS(ANDROID_NAMESPACE, "label") }
                    .forEach { it.setAttributeNS(ANDROID_NAMESPACE, "android:label", APP_NAME) }
            }
        }

        // Widget picker labels ("Quackify 4x1" ...), plus app_name if a build still ships it.
        // The About screen (credits, copyright, project description) is left untouched.
        val renamedStrings = setOf("app_name", "widget_4x1_label", "widget_3x2_label", "widget_3x3_label")
        val stringElementPattern = Regex(
            """<string\b(?=[^>]*\bname\s*=\s*["'](?:${renamedStrings.joinToString("|")})["'])[^>]*>""",
        )
        listDecodableFiles("res/values*/strings.xml").forEach { path ->
            if (!stringElementPattern.containsMatchIn(get(path).readText())) return@forEach

            document(path).use { strings ->
                val resources = strings.getElementsByTagName("string")
                (0 until resources.length)
                    .mapNotNull { resources.item(it) as? Element }
                    .filter { it.getAttribute("name") in renamedStrings }
                    .forEach { it.textContent = it.textContent.replace(ORIGINAL_NAME, APP_NAME) }
            }
        }

        // Overwrites an existing drawable only: a new, unreferenced file would not be in the resource table.
        fun replace(path: String, content: String) {
            val file = get(path)
            check(file.exists()) { "$path was not found in Quackify" }
            file.writeText(content)
        }

        // Adaptive icon background (the orange gradient) becomes black; the foreground is a raster below.
        replace("res/drawable/ic_launcher_background.xml", spotifyBackground)

        // Themed icon: Quackify's adaptive icons have no monochrome layer, so add a new drawable and
        // reference it from every adaptive launcher icon (ic_launcher / ic_launcher_round).
        get("res/drawable/$MONOCHROME_DRAWABLE.xml", copy = false).apply {
            parentFile?.mkdirs()
            writeText(spotifyMonochrome)
        }
        var addedMonochrome = false
        listDecodableFiles("res/mipmap-anydpi*/*.xml").forEach { path ->
            document(path).use { icon ->
                val adaptiveIcon = icon.documentElement
                if (adaptiveIcon.tagName != "adaptive-icon") return@use

                val existing = adaptiveIcon.getElementsByTagName("monochrome")
                (0 until existing.length).mapNotNull { existing.item(it) }.forEach { adaptiveIcon.removeChild(it) }

                adaptiveIcon.appendChild(
                    icon.createElement("monochrome").apply {
                        setAttributeNS(ANDROID_NAMESPACE, "android:drawable", "@drawable/$MONOCHROME_DRAWABLE")
                    },
                )
                addedMonochrome = true
            }
        }
        check(addedMonochrome) { "Quackify adaptive launcher icons were not found" }

        // Media playback notification status bar icon.
        replace("res/drawable/ic_stat_duck.xml", spotifyNotification)

        // The widgets' fallback cover (logo_duck) is a layer-list around @mipmap/ic_launcher, so it follows.
        // Resources are decoded on request, so a res/ directory listing would be empty: ask the patcher
        // for the WebP paths instead, and replace them without decoding the originals.
        var replacedForeground = false
        listDecodableFiles("res/mipmap-*/*.webp").forEach { path ->
            val name = path.substringAfterLast('/').removeSuffix(".webp")
            val icon = RASTER_ICONS[name] ?: return@forEach
            val density = path.substringBeforeLast('/').substringAfterLast('/')
                .split('-').firstNotNullOfOrNull { DENSITIES[it] }
                ?: return@forEach

            val file = get(path, copy = false)
            file.parentFile?.mkdirs()
            file.writeBytes(bundledPng(icon.kind, (icon.baseDp * density).roundToInt()))
            if (name == "ic_launcher_foreground") replacedForeground = true
        }
        check(replacedForeground) {
            "Quackify launcher foreground icons were not found (mipmap files: " +
                listDecodableFiles("res/mipmap*/**").joinToString() + ")"
        }
    }
}
