/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.appicon

import app.morphe.patcher.patch.ImageSize
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.imageOption
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.protonvpn.shared.PROTON_VPN
import app.morphe.patches.protonvpn.shared.PROTON_VPN_FOSS
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File

private const val LOG_TAG = "[protonvpn] appicon"

private val DENSITY_QUALIFIERS = listOf("-mdpi", "-hdpi", "-xhdpi", "-xxhdpi", "-xxxhdpi")
private val BITMAP_EXTENSIONS = listOf("webp", "png")
private const val CARRIER_PREFIX = "ic_launcher_lustx"
private const val ADAPTIVE_INSET = 0.66f
private const val REAL_APP_NAME = "Proton VPN"

// The only slots this patch will ever touch. main / retro / dark / activity keep
// their real Proton logos no matter what.
private val SPOOFED_SLOTS = listOf("calculator", "notes", "weather")

@Suppress("unused")
val changeAppIconPatch = resourcePatch(
    name = "Change App Icon",
    description = "Custom PNG icons + labels for the spoofed Calculator / Notes / Weather slots. " +
        "Real Proton logos are never touched.",
    default = false,
) {
    compatibleWith(PROTON_VPN, PROTON_VPN_FOSS)

    val allImage = imageOption(
        key = "allImage",
        default = null,
        title = "All three: icon",
        description = "PNG applied to all three spoofed slots (Calculator, Notes, Weather). " +
            "A per-slot icon below overrides this. Real Proton logos are never touched.",
        required = false,
        allowedExtensions = listOf("png"),
        recommendedSize = ImageSize(1024, 1024),
    ) { it == null || it.isNotBlank() }
    val allLabel = stringOption(
        key = "allLabel",
        default = "slot",
        values = null,
        title = "All three: label",
        description = "\"app\" = Proton VPN, \"slot\" = keep each slot's own name, any other text = " +
            "custom name. A per-slot label below overrides this.",
        required = false,
    ) { it == null || it.isNotBlank() }

    val calculatorImage = imageOption(
        key = "calculatorImage",
        default = null,
        title = "Calculator icon (override)",
        description = "PNG for the Calculator slot only. Blank = use \"All three\" icon.",
        required = false,
        allowedExtensions = listOf("png"),
        recommendedSize = ImageSize(1024, 1024),
    ) { it == null || it.isNotBlank() }
    val calculatorLabel = stringOption(
        key = "calculatorLabel",
        default = null,
        values = null,
        title = "Calculator label (override)",
        description = "Blank = use \"All three\" label. Otherwise \"app\", \"slot\", or a custom name.",
        required = false,
    ) { it == null || it.isNotBlank() }

    val notesImage = imageOption(
        key = "notesImage",
        default = null,
        title = "Notes icon (override)",
        description = "PNG for the Notes slot only. Blank = use \"All three\" icon.",
        required = false,
        allowedExtensions = listOf("png"),
        recommendedSize = ImageSize(1024, 1024),
    ) { it == null || it.isNotBlank() }
    val notesLabel = stringOption(
        key = "notesLabel",
        default = null,
        values = null,
        title = "Notes label (override)",
        description = "Blank = use \"All three\" label. Otherwise \"app\", \"slot\", or a custom name.",
        required = false,
    ) { it == null || it.isNotBlank() }

    val weatherImage = imageOption(
        key = "weatherImage",
        default = null,
        title = "Weather icon (override)",
        description = "PNG for the Weather slot only. Blank = use \"All three\" icon.",
        required = false,
        allowedExtensions = listOf("png"),
        recommendedSize = ImageSize(1024, 1024),
    ) { it == null || it.isNotBlank() }
    val weatherLabel = stringOption(
        key = "weatherLabel",
        default = null,
        values = null,
        title = "Weather label (override)",
        description = "Blank = use \"All three\" label. Otherwise \"app\", \"slot\", or a custom name.",
        required = false,
    ) { it == null || it.isNotBlank() }

    val flatOption = booleanOption(
        key = "flat",
        default = false,
        title = "Flat fallback",
        description = "Skip the adaptive retarget and use plain legacy bitmaps instead. " +
            "Enable this if a custom icon shows up blank after patching.",
    )

    val renameInAppOption = booleanOption(
        key = "renameInApp",
        default = true,
        title = "Restore in-app name",
        description = "Force the in-app name to \"$REAL_APP_NAME\" (rewrites app_name and the " +
            "application label), regardless of the launcher labels.",
    )

    finalize {
        val flat = flatOption.value == true
        val renameInApp = renameInAppOption.value == true

        val sharedImage = allImage.value?.trim()?.takeIf { it.isNotEmpty() }
        val sharedLabel = allLabel.value?.trim()?.takeIf { it.isNotEmpty() } ?: "slot"

        class Slot(val key: String, val source: PngImage, val labelMode: String) {
            var iconNames: List<String> = emptyList()
        }

        fun effectiveImage(perSlot: String?): String? = perSlot?.trim()?.takeIf { it.isNotEmpty() } ?: sharedImage
        fun effectiveLabel(perSlot: String?): String = perSlot?.trim()?.takeIf { it.isNotEmpty() } ?: sharedLabel

        val slots = buildList {
            effectiveImage(calculatorImage.value)?.let {
                add(Slot("calculator", decodePng(it), effectiveLabel(calculatorLabel.value)))
            }
            effectiveImage(notesImage.value)?.let {
                add(Slot("notes", decodePng(it), effectiveLabel(notesLabel.value)))
            }
            effectiveImage(weatherImage.value)?.let {
                add(Slot("weather", decodePng(it), effectiveLabel(weatherLabel.value)))
            }
        }
        if (slots.isEmpty()) {
            throw PatchException("$LOG_TAG: set allImage or at least one per-slot icon")
        }
        for (s in slots) {
            if (s.source.width < 8 || s.source.height < 8) {
                throw PatchException("$LOG_TAG: ${s.key} image is too small (${s.source.width}x${s.source.height})")
            }
            if (s.key !in SPOOFED_SLOTS) {
                throw PatchException("$LOG_TAG: refusing to touch non-spoofed slot ${s.key}")
            }
        }

        val written = mutableListOf<String>()

        fun elementsByTag(doc: Document, tag: String): List<Element> {
            val nl = doc.getElementsByTagName(tag)
            return (0 until nl.length).map { nl.item(it) as Element }
        }

        fun appString(name: String): String? = runCatching {
            document("res/values/strings.xml").use { strings ->
                elementsByTag(strings, "string")
                    .firstOrNull { it.getAttribute("name") == name }
                    ?.textContent
            }
        }.getOrNull()

        fun setAppString(name: String, value: String): Boolean = runCatching {
            document("res/values/strings.xml").use { strings ->
                val el = elementsByTag(strings, "string").firstOrNull { it.getAttribute("name") == name }
                if (el != null) {
                    el.textContent = value
                    true
                } else {
                    false
                }
            }
        }.getOrDefault(false)

        fun legacyBitmaps(name: String): List<File> = buildList {
            for (qualifier in DENSITY_QUALIFIERS) {
                for (ext in BITMAP_EXTENSIONS) {
                    val file = runCatching { resourceFile("res/mipmap$qualifier/$name.$ext") }.getOrNull()
                    if (file != null && file.exists()) add(file)
                }
            }
        }

        fun anydpiXmlPaths(name: String): List<String> = listOf(
            "res/mipmap-anydpi/$name.xml",
            "res/mipmap-anydpi-v26/$name.xml",
            "res/drawable-anydpi/$name.xml",
            "res/drawable-anydpi-v26/$name.xml",
        ).filter { path -> runCatching { resourceFile(path).exists() }.getOrDefault(false) }

        fun rendered(src: PngImage, targetWidth: Int, targetHeight: Int, inset: Float): ByteArray {
            val innerWidth = (targetWidth * inset).toInt().coerceIn(1, targetWidth)
            val innerHeight = (targetHeight * inset).toInt().coerceIn(1, targetHeight)
            return src.scaled(innerWidth, innerHeight)
                .centeredIn(targetWidth, targetHeight)
                .encodeToPng()
        }

        fun writePng(file: File, png: ByteArray) {
            file.outputStream().use { stream -> stream.write(png) }
            written += file.path
        }

        document("AndroidManifest.xml").use { doc ->
            val application = elementsByTag(doc, "application").firstOrNull()
                ?: throw PatchException("$LOG_TAG: no <application> in AndroidManifest.xml")
            val aliases = elementsByTag(doc, "activity-alias").filter {
                it.getAttribute("android:icon").isNotEmpty()
            }

            for (s in slots) {
                val matches = aliases.filter {
                    it.getAttribute("android:name").contains(s.key, ignoreCase = true)
                }
                if (matches.isEmpty()) {
                    throw PatchException(
                        "$LOG_TAG: no icon slot matches \"${s.key}\". Available: " +
                            aliases.joinToString(", ") { it.getAttribute("android:name") },
                    )
                }
                if (matches.size > 1) {
                    throw PatchException(
                        "$LOG_TAG: slot \"${s.key}\" is ambiguous: " +
                            matches.joinToString(", ") { it.getAttribute("android:name") },
                    )
                }
                val target = matches.first()
                val names = listOf("android:icon", "android:roundIcon").mapNotNull { attr ->
                    target.getAttribute(attr).takeIf { it.isNotEmpty() }?.substringAfter('/')
                }.distinct()
                if (names.isEmpty()) {
                    throw PatchException("$LOG_TAG: ${target.getAttribute("android:name")} has no android:icon")
                }
                s.iconNames = names

                when {
                    s.labelMode.equals("slot", true) -> {
                        // Keep the slot's own label.
                    }
                    s.labelMode.equals("app", true) -> {
                        val value = if (appString("app_name") != null) "@string/app_name" else REAL_APP_NAME
                        target.setAttribute("android:label", value)
                    }
                    else -> target.setAttribute("android:label", s.labelMode)
                }
            }

            if (renameInApp) {
                val realName = appString("app_name")?.takeIf { it.isNotBlank() } ?: REAL_APP_NAME
                application.setAttribute("android:label", realName)
                setAppString("app_name", realName)
                println("$LOG_TAG: in-app name -> $realName")
            }
        }

        for (s in slots) {
            val carrier = "${CARRIER_PREFIX}_${s.key}"

            if (flat) {
                for (name in s.iconNames) {
                    if (anydpiXmlPaths(name).isNotEmpty() && legacyBitmaps(name).isEmpty()) {
                        throw PatchException(
                            "$LOG_TAG: $name has no legacy mipmap bitmaps, so deleting its adaptive " +
                                "XML would leave a dangling icon resource — use adaptive mode instead",
                        )
                    }
                }
                for (name in s.iconNames) {
                    for (path in anydpiXmlPaths(name)) {
                        val file = resourceFile(path)
                        if (!file.delete() || file.exists()) {
                            throw PatchException("$LOG_TAG: could not delete $path in the workspace")
                        }
                        println("$LOG_TAG: deleted $path")
                    }
                }
            } else {
                val carriers = legacyBitmaps(s.iconNames.first())
                if (carriers.isEmpty()) {
                    throw PatchException("$LOG_TAG: no legacy mipmap bitmaps found for ${s.iconNames.first()}")
                }
                for (original in carriers) {
                    val (width, height) = imageDimensions(original.path)
                    writePng(
                        File(original.parentFile, "$carrier.png"),
                        rendered(s.source, width, height, inset = ADAPTIVE_INSET),
                    )
                }
                for (name in s.iconNames) {
                    val paths = anydpiXmlPaths(name)
                    if (paths.isEmpty()) {
                        println("$LOG_TAG: $name has no adaptive XML — legacy bitmaps cover it")
                        continue
                    }
                    for (path in paths) {
                        document(path).use { d ->
                            val foregrounds = elementsByTag(d, "foreground")
                            if (foregrounds.isEmpty()) {
                                throw PatchException("$LOG_TAG: no <foreground> in $path")
                            }
                            foregrounds.first().setAttribute("android:drawable", "@mipmap/$carrier")
                        }
                        println("$LOG_TAG: $path foreground -> @mipmap/$carrier")
                    }
                }
            }

            for (name in s.iconNames) {
                for (original in legacyBitmaps(name)) {
                    val (width, height) = imageDimensions(original.path)
                    writePng(original, rendered(s.source, width, height, inset = 1f))
                }
            }
            println("$LOG_TAG: ${s.key} label=${s.labelMode} icons=${s.iconNames.joinToString(",")}")
        }

        val missing = written.filterNot { File(it).exists() }
        if (missing.isNotEmpty()) {
            throw PatchException("$LOG_TAG: writes did not persist: $missing")
        }

        println("$LOG_TAG: mode=${if (flat) "flat" else "adaptive"} renameInApp=$renameInApp wrote ${written.size} files:")
        written.forEach { println("$LOG_TAG:   $it") }
    }
}
