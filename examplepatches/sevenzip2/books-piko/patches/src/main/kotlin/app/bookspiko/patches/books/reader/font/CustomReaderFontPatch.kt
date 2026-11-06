package app.bookspiko.patches.books.reader.font

import app.bookspiko.patches.books.misc.extension.sharedExtensionPatch
import app.bookspiko.patches.books.shared.Constants.COMPATIBILITY_PLAY_BOOKS
import app.bookspiko.patches.books.shared.Constants.FONT_EXTENSION_CLASS
import app.bookspiko.patches.books.shared.Constants.FONT_SETTINGS_ACTIVITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.smali.ExternalLabel
import org.w3c.dom.Element
import java.io.File

private val FONT_MIME_TYPES = listOf(
    "font/ttf",
    "font/otf",
    "font/sfnt",
    "font/collection",
    "application/x-font-ttf",
    "application/x-font-otf",
    "application/x-font-truetype",
    "application/x-font-opentype",
    "application/font-sfnt",
    "application/vnd.ms-opentype",
)

/** Bundled font copied into the APK at patch time; used when no font was picked on the device. */
internal const val BUNDLED_FONT_ASSET = "piko_fonts/bundled_regular"

private fun customReaderFontResourcePatch(
    launcherShortcutOption: app.morphe.patcher.patch.Option<Boolean>,
    bundledFontOption: app.morphe.patcher.patch.Option<String>,
) = resourcePatch {
    execute {
        bundledFontOption.value?.takeIf { it.isNotBlank() }?.let { path ->
            val font = File(path)
            if (!font.isFile) throw PatchException("Font file not found: $path")
            val asset = get("assets/$BUNDLED_FONT_ASSET")
            asset.parentFile.mkdirs()
            font.copyTo(asset, overwrite = true)
        }

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            fun Element.child(tagName: String, vararg attributes: Pair<String, String>) =
                document.createElement(tagName).also { child ->
                    attributes.forEach { (name, value) -> child.setAttribute(name, value) }
                    appendChild(child)
                }

            val activity = application.child(
                "activity",
                "android:name" to FONT_SETTINGS_ACTIVITY,
                "android:label" to "Books 글꼴",
                "android:exported" to "true",
                "android:theme" to "@android:style/Theme.DeviceDefault.DayNight",
                "android:excludeFromRecents" to "false",
            )

            // "Open with" / "Share" a font file to install it.
            listOf("android.intent.action.VIEW", "android.intent.action.SEND").forEach { action ->
                activity.child("intent-filter").apply {
                    child("action", "android:name" to action)
                    child("category", "android:name" to "android.intent.category.DEFAULT")
                    FONT_MIME_TYPES.forEach { child("data", "android:mimeType" to it) }
                }
            }

            if (launcherShortcutOption.value == true) {
                val icon = application.getAttribute("android:icon")
                application.child(
                    "activity-alias",
                    "android:name" to "$FONT_SETTINGS_ACTIVITY.Launcher",
                    "android:targetActivity" to FONT_SETTINGS_ACTIVITY,
                    "android:label" to "Books 글꼴",
                    "android:exported" to "true",
                ).apply {
                    if (icon.isNotEmpty()) setAttribute("android:icon", icon)
                    child("intent-filter").apply {
                        child("action", "android:name" to "android.intent.action.MAIN")
                        child("category", "android:name" to "android.intent.category.LAUNCHER")
                    }
                }
            }
        }
    }
}

@Suppress("unused")
val customReaderFontPatch = bytecodePatch(
    name = "Custom reader font",
    description = "Replaces the fonts of the EPUB reader with a TTF/OTF you pick on the device " +
        "(Settings > Ebook reading > Custom font, or open/share a font file with Play Books). " +
        "Optionally forces it over publisher fonts while keeping bold, italic and monospace text.",
) {
    compatibleWith(COMPATIBILITY_PLAY_BOOKS)

    val launcherShortcutOption = booleanOption(
        key = "fontSettingsLauncherShortcut",
        default = false,
        title = "Font settings launcher shortcut",
        description = "Also adds a \"Books 글꼴\" launcher icon. The font settings are always available in " +
            "Play Books under Settings > Ebook reading > Custom font.",
    )

    val bundledFontOption = stringOption(
        key = "bundledFontPath",
        default = null,
        title = "Bundled font file",
        description = "Optional path to a TTF/OTF file to embed in the APK. It is used until a font is " +
            "picked on the device.",
    )

    dependsOn(sharedExtensionPatch, customReaderFontResourcePatch(launcherShortcutOption, bundledFontOption))

    execute {
        ReaderInterceptRequestFingerprint.method.apply {
            if (implementation!!.registerCount - parameters.size - 1 < 1) {
                throw PatchException("No free register in $definingClass->$name")
            }
            // WebView and URL are passed as a range so this works with any register layout.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p1 .. p2 }, $FONT_EXTENSION_CLASS->interceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
                    move-result-object v0
                    if-eqz v0, :original
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        addFontSettingsEntry()
    }
}
