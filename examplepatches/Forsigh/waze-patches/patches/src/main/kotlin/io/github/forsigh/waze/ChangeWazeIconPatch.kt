package io.github.forsigh.waze

import app.morphe.patcher.patch.ImageSize
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.imageOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE
import org.w3c.dom.Element
import java.io.File

/**
 * Change Waze icon - one row, three ways to skin the launcher icon.
 *
 *  - Forsigh Reaper: the artwork embedded in the bundle, ready for the adaptive crop.
 *  - Waze ghost: the stock vector, with the backdrop painted any colour (blue by default).
 *  - Custom image: any square picture the user supplies at patch time.
 *
 * Custom images must be square and at least 192x192; 432x432 is the recommended size because one
 * file is reused for every density (there is no image library in the patcher on a phone, so nothing
 * is resized at patch time). PNG, JPEG and WebP are accepted. The picture fills the whole icon, so
 * the launcher mask will crop its edges - keep the subject inside the middle.
 */
val changeWazeIconPatch = resourcePatch(
    name = "Change Waze icon",
    description = "Reaper artwork, the stock ghost in any colour, or your own image " +
        "(square PNG/JPG/WebP, 432x432 recommended, 192x192 minimum).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    val style by stringOption(
        key = "style",
        default = "reaper",
        values = mapOf(
            "reaper" to "Forsigh Reaper",
            "ghost" to "Waze ghost (any colour)",
            "custom" to "Custom image",
        ),
        title = "Icon",
        description = "Forsigh Reaper, the stock Waze ghost, or your own picture.",
    )
    val background by colorOption(
        key = "background",
        default = "#FF33CCFF",
        title = "Ghost background",
        description = "Only used by the Waze ghost option. Stock is #FF33CCFF.",
    )
    val iconPath by imageOption(
        key = "icon",
        default = "",
        allowedExtensions = listOf("png", "webp", "jpg", "jpeg"),
        recommendedSize = ImageSize(432, 432),
        title = "Custom image",
        description = "Square, 432x432 recommended, 192x192 minimum. PNG, JPG or WebP. Fills the icon.",
    )

    execute {
        when (resolveStyle(style)) {
            "reaper" -> {
                writeIconArtwork(REAPER_ARTWORK_PNG, "embedded Reaper artwork")
            }
            "custom" -> {
                val path = iconPath?.trim().orEmpty()
                if (path.isEmpty()) {
                    throw PatchException(
                        "Change Waze icon: 'Custom image' is selected but no file was chosen. " +
                            "Pick a square PNG/JPG/WebP, 432x432 recommended, 192x192 minimum.",
                    )
                }
                val file = File(path)
                if (!file.isFile) {
                    throw PatchException("Change Waze icon: no file at $path")
                }
                val bytes = file.readBytes()
                validateImage(bytes, file.name)
                writeIconArtwork(bytes, file.name)
            }
            "ghost" -> paintGhostBackdrop(background)
            else -> throw PatchException("Change Waze icon: unreachable style")
        }
    }
}

/**
 * The Manager can hand back either the option key ("reaper") or the label it displayed
 * ("Forsigh Reaper"), so both are accepted here. Anything else fails with the valid list.
 */
private fun resolveStyle(raw: String?): String {
    val v = raw?.trim().orEmpty().lowercase()
    return when {
        v.isEmpty() -> "reaper"
        v.contains("reaper") || v.contains("forsigh") -> "reaper"
        v.contains("ghost") -> "ghost"
        v.contains("custom") || v.contains("own") -> "custom"
        else -> throw PatchException(
            "Change Waze icon: unknown icon option '${raw}'. Use Forsigh Reaper, Waze ghost or Custom image.",
        )
    }
}

internal const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
internal const val ADAPTIVE_ICON = "res/A8b.xml"
internal const val FOREGROUND_VECTOR = "res/q1K.xml"

internal val DENSITY_BITMAPS = listOf(
    "res/VZx.webp", // mdpi
    "res/_Ko.webp", // hdpi
    "res/2ix.webp", // xhdpi
    "res/gRC.webp", // xxhdpi
    "res/yPg.webp", // xxxhdpi
)

private const val MIN_ICON_EDGE = 192

/** Rejects what a launcher cannot render well, before anything is written. */
private fun validateImage(bytes: ByteArray, name: String) {
    if (bytes.size < 100) {
        throw PatchException("Change Waze icon: $name is empty (${bytes.size} bytes)")
    }
    val magic = bytes.take(4).joinToString("") { "%02x".format(it) }
    val size = when {
        magic == "89504e47" -> pngSize(bytes)
        magic.startsWith("ffd8") -> jpegSize(bytes)
        magic == "52494646" -> null // WebP: dimensions not sniffed, trust the picker
        else -> throw PatchException(
            "Change Waze icon: $name is not a PNG, JPG or WebP (magic $magic)",
        )
    } ?: return

    val (w, h) = size
    if (w < MIN_ICON_EDGE || h < MIN_ICON_EDGE) {
        throw PatchException(
            "Change Waze icon: $name is ${w}x$h, too small. " +
                "Use a square image of at least ${MIN_ICON_EDGE}x${MIN_ICON_EDGE}, 432x432 recommended.",
        )
    }
    if (kotlin.math.abs(w - h) > maxOf(4, w / 50)) {
        throw PatchException(
            "Change Waze icon: $name is ${w}x$h, not square. " +
                "Launcher icons must be square - crop or pad it first.",
        )
    }
}

private fun pngSize(b: ByteArray): Pair<Int, Int>? {
    if (b.size < 24) return null
    fun i32(o: Int) = ((b[o].toInt() and 0xFF) shl 24) or ((b[o + 1].toInt() and 0xFF) shl 16) or
        ((b[o + 2].toInt() and 0xFF) shl 8) or (b[o + 3].toInt() and 0xFF)
    return i32(16) to i32(20)
}

private fun jpegSize(b: ByteArray): Pair<Int, Int>? {
    var i = 2
    while (i + 9 < b.size) {
        if ((b[i].toInt() and 0xFF) != 0xFF) { i++; continue }
        val marker = b[i + 1].toInt() and 0xFF
        if (marker in 0xC0..0xCF && marker != 0xC4 && marker != 0xC8 && marker != 0xCC) {
            val h = ((b[i + 5].toInt() and 0xFF) shl 8) or (b[i + 6].toInt() and 0xFF)
            val w = ((b[i + 7].toInt() and 0xFF) shl 8) or (b[i + 8].toInt() and 0xFF)
            return w to h
        }
        val len = ((b[i + 2].toInt() and 0xFF) shl 8) or (b[i + 3].toInt() and 0xFF)
        if (len < 2) return null
        i += 2 + len
    }
    return null
}

/**
 * Installs artwork as the launcher icon.
 *
 * The picture becomes its own mipmap resource and the adaptive icon's foreground is pointed at it.
 * The earlier approach reused `mipmap/launch_icon` - the adaptive icon itself - as its own
 * background, which resolves back to the same XML and sends the launcher into a loop: generic
 * Android placeholder and a crash in the app. A separate resource cannot recurse.
 */
private fun app.morphe.patcher.patch.ResourcePatchContext.writeIconArtwork(bytes: ByteArray, label: String) {
    val resDir = get("res")
    if (resDir == null || !resDir.isDirectory) {
        throw PatchException("Change Waze icon: res directory missing - unsupported Waze build")
    }
    listOf("mipmap-xxxhdpi", "mipmap-xxhdpi", "mipmap-xhdpi", "mipmap-hdpi", "mipmap-mdpi").forEach { dpi ->
        val dir = resDir.resolve(dpi).apply { mkdirs() }
        dir.resolve("morphe_waze_icon.png").writeBytes(bytes)
    }

    val icon = document(ADAPTIVE_ICON)
    icon.use {
        val root = icon.documentElement
        if (root.nodeName != "adaptive-icon") {
            throw PatchException("Change Waze icon: $ADAPTIVE_ICON is not an adaptive icon (${root.nodeName})")
        }
        val foreground = root.getElementsByTagName("foreground").item(0) as? Element
            ?: throw PatchException("Change Waze icon: no <foreground> layer in $ADAPTIVE_ICON")
        val drawableAttr = foreground.getAttributeNode("android:drawable")
            ?: throw PatchException("Change Waze icon: <foreground> has no android:drawable attribute")
        drawableAttr.nodeValue = "@mipmap/morphe_waze_icon"
        if (foreground.getAttribute("android:drawable") != "@mipmap/morphe_waze_icon") {
            throw PatchException("Change Waze icon: could not repoint the foreground layer")
        }
        // Opaque artwork: the backdrop only shows if the picture has transparent edges.
        val background = root.getElementsByTagName("background").item(0) as? Element
        background?.setAttribute("android:drawable", "@color/brand_waze")
        println("Change Waze icon: $label installed as @mipmap/morphe_waze_icon")
    }
}

/** Keeps the stock ghost and paints [colour] behind it. */
private fun app.morphe.patcher.patch.ResourcePatchContext.paintGhostBackdrop(colour: String?) {
    val value = colour?.trim().orEmpty()
    if (!value.matches(Regex("#[0-9a-fA-F]{6,8}"))) {
        throw PatchException("Change Waze icon: background must be a hex colour like #FF33CCFF (got '$value')")
    }
    val argb = if (value.length == 7) "#ff" + value.substring(1) else "#" + value.substring(1)

    val doc = document(FOREGROUND_VECTOR)
    doc.use {
        val root = doc.documentElement
        if (root.nodeName != "vector") {
            throw PatchException("Change Waze icon: $FOREGROUND_VECTOR is not a vector drawable (${root.nodeName})")
        }
        val backdrop = doc.createElement("path") as Element
        backdrop.setAttributeNS(ANDROID_NS, "android:pathData", "M0,0H108V108H0Z")
        backdrop.setAttributeNS(ANDROID_NS, "android:fillColor", argb)
        root.insertBefore(backdrop, root.firstChild)
        println("Change Waze icon: stock ghost kept, backdrop $argb prepended")
    }
}
