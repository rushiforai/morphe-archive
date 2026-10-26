package app.sqzass.patches.all.spoofing

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import java.io.File
import java.io.IOException
import java.util.logging.Logger

private val logger = Logger.getLogger("CustomFontPatch")

// Supported font file extensions.
private val SUPPORTED_EXTENSIONS = setOf("ttf", "otf", "woff2")

// XML element attributes that hold a font family reference.
private val FONT_FAMILY_ATTRS = listOf("android:fontFamily", "app:fontFamily")

// Internal font resource name written into the APK.
private const val FONT_RESOURCE_NAME = "sqz_custom_font"

// Font-family XML template written to res/font/sqz_custom_font.xml.
// Both android: and app: namespace variants are included for API 26+ and
// the AndroidX compat library respectively.
private fun fontFamilyXml(fontResourceName: String): String =
    "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
    "<font-family xmlns:android=\"http://schemas.android.com/apk/res/android\"\n" +
    "    xmlns:app=\"http://schemas.android.com/apk/res-auto\">\n" +
    "    <font\n" +
    "        android:font=\"@font/$fontResourceName\"\n" +
    "        android:fontStyle=\"normal\"\n" +
    "        android:fontWeight=\"400\"\n" +
    "        app:font=\"@font/$fontResourceName\"\n" +
    "        app:fontStyle=\"normal\"\n" +
    "        app:fontWeight=\"400\" />\n" +
    "</font-family>\n"

// Requested in https://github.com/sqzass/patches/issues/5 by @jozinho-netizen
@Suppress("unused")
val customFontPatch = resourcePatch(
    name = "Custom font",
    description = "Injects a custom TTF/OTF/WOFF2 font file into the app and rewrites every" +
        " android:fontFamily and app:fontFamily attribute across resource XMLs to use it." +
        " Requested in https://github.com/sqzass/patches/issues/5.",
    default = false,
) {
    category("Interface")

    val fontPathOption = stringOption(
        key = "fontPath",
        default = "",
        title = "Font File Path",
        description = "Absolute path to a .ttf, .otf, or .woff2 font file. " +
            "Leave empty to skip injection.",
        required = true,
        validator = { value ->
            if (value.isNullOrBlank()) return@stringOption true
            val ext = value.substringAfterLast('.', "").lowercase()
            ext in SUPPORTED_EXTENSIONS
        },
    )

    val rewriteAttributesOption = booleanOption(
        key = "rewriteFontAttributes",
        default = true,
        title = "Rewrite Font Attributes",
        description = "Replace android:fontFamily and app:fontFamily attributes in all " +
            "resource XML files with the injected font.",
    )

    val rewriteManifestFontOption = booleanOption(
        key = "rewriteManifestFont",
        default = false,
        title = "Set Application-level Font",
        description = "Add android:fontFamily to the <application> element in the manifest " +
            "as a global fallback (API 26+ / Android 8.0+ only).",
    )

    execute {
        val rawPath = fontPathOption.value?.trim().orEmpty()
        if (rawPath.isEmpty()) {
            logger.info("No font file path provided — skipping.")
            return@execute
        }

        val sourceFile = File(rawPath)
        if (!sourceFile.exists() || !sourceFile.isFile) {
            logger.warning("Font file not found: $rawPath")
            return@execute
        }

        val ext = rawPath.substringAfterLast('.', "").lowercase()
        if (ext !in SUPPORTED_EXTENSIONS) {
            logger.warning(
                "Unsupported font extension '$ext'. Supported: ${SUPPORTED_EXTENSIONS.joinToString()}.",
            )
            return@execute
        }

        // 1. Copy the font binary into res/font/.
        val fontEntryName = "$FONT_RESOURCE_NAME.$ext"
        val fontDest = get("res/font/$fontEntryName")
        fontDest.parentFile?.mkdirs()
        sourceFile.copyTo(fontDest, overwrite = true)
        logger.info("Embedded font binary as res/font/$fontEntryName.")

        // 2. Write the <font-family> XML descriptor.
        val xmlDest = get("res/font/$FONT_RESOURCE_NAME.xml")
        xmlDest.parentFile?.mkdirs()
        xmlDest.writeText(fontFamilyXml(FONT_RESOURCE_NAME), Charsets.UTF_8)
        logger.info("Wrote font-family XML at res/font/$FONT_RESOURCE_NAME.xml.")

        // 3. Rewrite fontFamily attributes across all non-font resource XML files.
        var rewritten = 0
        if (rewriteAttributesOption.value == true) {
            val resDir = get("res")
            if (resDir.exists()) {
                val xmlFiles = resDir.walkTopDown().filter { file ->
                    file.isFile &&
                        file.extension.equals("xml", ignoreCase = true) &&
                        !file.parentFile.name.equals("font", ignoreCase = true)
                }.toList()

                for (file in xmlFiles) {
                    val relativePath = "res/" + file.relativeTo(resDir).path.replace('\\', '/')
                    try {
                        // Explicitly stage the file via get() so it is guaranteed to exist
                        // on disk before Document opens its InputStream.  Without this call
                        // arsclib may not have extracted the entry yet, causing a
                        // FileNotFoundException that would silently skip the file.
                        get(relativePath)
                        document(relativePath).use { doc ->
                            val allNodes = doc.getElementsByTagName("*")
                            for (i in 0 until allNodes.length) {
                                val element = allNodes.item(i) as? org.w3c.dom.Element ?: continue
                                for (attr in FONT_FAMILY_ATTRS) {
                                    if (element.hasAttribute(attr)) {
                                        element.setAttribute(attr, "@font/$FONT_RESOURCE_NAME")
                                        rewritten++
                                    }
                                }
                            }
                        }
                    } catch (_: IOException) {
                        // Skip entries that are binary or not valid XML (e.g. compiled drawables
                        // with a .xml extension that haven't been decoded to text form).
                    }
                }
            }
            logger.info("Rewrote $rewritten fontFamily attribute(s) in resource XML files.")
        }

        // 4. Optionally patch the <application> element in the manifest.
        if (rewriteManifestFontOption.value == true) {
            document("AndroidManifest.xml").use { doc ->
                val appNodes = doc.getElementsByTagName("application")
                if (appNodes.length > 0) {
                    (appNodes.item(0) as? org.w3c.dom.Element)
                        ?.setAttribute("android:fontFamily", "@font/$FONT_RESOURCE_NAME")
                    logger.info("Set android:fontFamily on <application> element in manifest.")
                }
            }
        }

        logger.info("Custom font patch complete: embedded $fontEntryName, rewrote $rewritten attribute(s).")
    }
}
