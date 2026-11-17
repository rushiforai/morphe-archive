/*
 * Original HushPinterest implementation, 2026, after HushGram's launch screen.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.patch.ImageSize
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.imageOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import java.util.Locale
import kotlin.math.max
import kotlin.math.sqrt

private const val PATCH = "Custom splash logo"

/** The theme Pinterest's launcher activity wears, which names the launch screen's icon. */
internal const val PINTEREST_LAUNCH_THEME = "Theme.Pinterest.SplashScreen.Launch"

/** The theme the patch adds, which the extension's SplashLogo hands to Android by this name. */
internal const val SPLASH_LOGO_THEME = "HushPinterestSplashLogo"

/** The picture, copied in as it is, and the drawable placing it inside the launch screen's circle. */
internal const val SPLASH_LOGO = "hushpinterest_splash_logo"
internal const val SPLASH_MARK = "hushpinterest_splash_mark"

/**
 * AndroidX's attribute for the launch screen's icon, which Pinterest's launch theme sets, and
 * Android 12's, which AndroidX's Android 12 theme points at AndroidX's. The theme added sets both.
 */
internal const val SPLASH_ICON = "windowSplashScreenAnimatedIcon"
internal const val ANDROID_SPLASH_ICON = "android:$SPLASH_ICON"

/** HushPinterest's mark, carried in the bundle, for a patch with no picture picked. */
internal const val BUNDLED_LOGO = "splash-logo/hushpinterest.png"

/** The longest side taken, in pixels. Android's own process loads the picture on every start. */
internal const val LOGO_MAX_SIDE = 2048

internal const val LOGO_OPTION = "splashLogo"

private fun refuse(why: String): Nothing = throw PatchException("$PATCH: $why")

/** A picture's kind, as its first bytes say, which is also the extension it's copied in with, and its size in pixels. */
internal data class LogoPicture(val extension: String, val width: Int, val height: Int)

/**
 * The kind and size of a PNG, JPEG or WebP picture, read from its header, or null for anything
 * else. Manager patches on the phone, where Java's image classes don't exist, so the header is read
 * here. The size is the one stored, which is what Android draws: it doesn't turn a JPEG by its
 * camera orientation for a drawable.
 */
internal fun readLogoPicture(bytes: ByteArray): LogoPicture? =
    (pngSize(bytes) ?: jpegSize(bytes) ?: webpSize(bytes))?.takeIf { it.width > 0 && it.height > 0 }

private val PNG_SIGNATURE = byteArrayOf(0x89.toByte(), 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A)

/** A PNG's first chunk is its header: the width and height, four bytes each. */
private fun pngSize(bytes: ByteArray): LogoPicture? {
    if (bytes.size < 24 || PNG_SIGNATURE.indices.any { bytes[it] != PNG_SIGNATURE[it] }) return null
    if (bytes.ascii(12, 4) != "IHDR") return null
    return LogoPicture("png", bytes.int32be(16), bytes.int32be(20))
}

/** The JPEG markers starting a frame, which carry its size: C0 to CF but DHT (C4), JPG (C8) and DAC (CC). */
private val JPEG_FRAMES = (0xC0..0xCF).toSet() - setOf(0xC4, 0xC8, 0xCC)

/** Walks a JPEG's segments to its frame header: precision, then height and width, two bytes each. */
private fun jpegSize(bytes: ByteArray): LogoPicture? {
    if (bytes.size < 4 || bytes.u8(0) != 0xFF || bytes.u8(1) != 0xD8) return null
    var at = 2
    while (at + 1 < bytes.size) {
        if (bytes.u8(at) != 0xFF) return null
        val marker = bytes.u8(at + 1)
        when {
            // A fill byte ahead of the marker.
            marker == 0xFF -> at++
            // Markers with nothing after them.
            marker == 0x01 || marker in 0xD0..0xD8 -> at += 2
            // The end, or the compressed picture, with no frame header before it.
            marker == 0xD9 || marker == 0xDA -> return null
            else -> {
                if (at + 3 >= bytes.size) return null
                val length = bytes.u16be(at + 2)
                if (length < 2) return null
                if (marker in JPEG_FRAMES) {
                    if (at + 8 >= bytes.size) return null
                    return LogoPicture("jpg", bytes.u16be(at + 7), bytes.u16be(at + 5))
                }
                at += 2 + length
            }
        }
    }
    return null
}

/** A WebP's first chunk says how it's coded, and each coding keeps the size its own way. */
private fun webpSize(bytes: ByteArray): LogoPicture? {
    if (bytes.ascii(0, 4) != "RIFF" || bytes.ascii(8, 4) != "WEBP") return null
    return when (bytes.ascii(12, 4)) {
        // Lossy: a key frame's start code, then the width and height, fourteen bits each.
        "VP8 " -> if (bytes.size >= 30 && bytes.u8(23) == 0x9D && bytes.u8(24) == 0x01 && bytes.u8(25) == 0x2A) {
            LogoPicture("webp", bytes.u16le(26) and 0x3FFF, bytes.u16le(28) and 0x3FFF)
        } else null
        // Lossless: its signature byte, then the width and height less one, fourteen bits each.
        "VP8L" -> if (bytes.size >= 25 && bytes.u8(20) == 0x2F) {
            val bits = bytes.u16le(21) or (bytes.u16le(23) shl 16)
            LogoPicture("webp", (bits and 0x3FFF) + 1, ((bits ushr 14) and 0x3FFF) + 1)
        } else null
        // Extended: the canvas's width and height less one, three bytes each.
        "VP8X" -> if (bytes.size >= 30) LogoPicture("webp", bytes.u24le(24) + 1, bytes.u24le(27) + 1) else null
        else -> null
    }
}

private fun ByteArray.u8(at: Int): Int = this[at].toInt() and 0xFF
private fun ByteArray.u16be(at: Int): Int = (u8(at) shl 8) or u8(at + 1)
private fun ByteArray.u16le(at: Int): Int = u8(at) or (u8(at + 1) shl 8)
private fun ByteArray.u24le(at: Int): Int = u16le(at) or (u8(at + 2) shl 16)
private fun ByteArray.int32be(at: Int): Int = (u16be(at) shl 16) or u16be(at + 2)
private fun ByteArray.ascii(at: Int, length: Int): String? =
    if (at + length <= size) String(this, at, length, Charsets.ISO_8859_1) else null

/**
 * How far in from the launch screen icon's edges the picture is drawn, as fractions of the icon's
 * side: left and right first, then top and bottom.
 *
 * Android 12 and newer show an icon with no background of its own through a circle two thirds of
 * the icon across, cut to the phone's icon shape, which always holds that circle. The picture is
 * scaled to fit inside the circle, its corners on it, so none of it is cut whatever its shape.
 * [round] is for a picture whose round shape fills its square, as HushPinterest's mark does: its
 * longer side spans the circle instead.
 */
internal fun logoInsets(width: Int, height: Int, round: Boolean): Pair<Double, Double> {
    val circle = 2.0 / 3.0
    val scale = if (round) circle / max(width, height) else circle / sqrt(width.toDouble() * width + height.toDouble() * height)
    return (1 - scale * width) / 2 to (1 - scale * height) / 2
}

/**
 * The drawable Android draws as the launch screen's icon: [logo] with [insets] around it. The insets
 * are fractions of the icon's own size, so the picture sits the same whatever size Android draws
 * the icon at.
 */
internal fun splashMarkXml(logo: String, insets: Pair<Double, Double>): String {
    fun percent(fraction: Double) = String.format(Locale.US, "%.4f%%", fraction * 100)
    return """
<?xml version="1.0" encoding="utf-8"?>
<inset xmlns:android="http://schemas.android.com/apk/res/android"
    android:drawable="@drawable/$logo"
    android:insetLeft="${percent(insets.first)}"
    android:insetRight="${percent(insets.first)}"
    android:insetTop="${percent(insets.second)}"
    android:insetBottom="${percent(insets.second)}" />
""".trimStart()
}

private fun Document.styles(): List<Element> {
    val list = getElementsByTagName("style")
    return (0 until list.length).map { list.item(it) as Element }
}

private fun Element.items(): List<Element> {
    val list = getElementsByTagName("item")
    return (0 until list.length).map { list.item(it) as Element }
}

/**
 * Adds [SPLASH_LOGO_THEME] to the decoded res/values/styles.xml: Pinterest's launch theme with
 * [SPLASH_MARK] as the launch screen's icon. The background, its night version and the theme
 * Pinterest moves on to all come from Pinterest's. Refuses unless Pinterest's theme is there and
 * names an icon, so a build drawing its launch screen another way isn't patched blind, and refuses
 * a second theme of this name.
 */
internal fun addSplashTheme(styles: Document) {
    val all = styles.styles()
    val launch = all.firstOrNull { it.getAttribute("name") == PINTEREST_LAUNCH_THEME }
        ?: refuse("res/values/styles.xml has no $PINTEREST_LAUNCH_THEME")
    if (launch.items().none { it.getAttribute("name").substringAfterLast(':') == SPLASH_ICON }) {
        refuse("$PINTEREST_LAUNCH_THEME names no launch screen icon")
    }
    if (all.any { it.getAttribute("name") == SPLASH_LOGO_THEME }) refuse("res/values/styles.xml already has a $SPLASH_LOGO_THEME")
    val style = styles.createElement("style")
    style.setAttribute("name", SPLASH_LOGO_THEME)
    style.setAttribute("parent", "@style/$PINTEREST_LAUNCH_THEME")
    for (name in listOf(SPLASH_ICON, ANDROID_SPLASH_ICON)) {
        val item = styles.createElement("item")
        item.setAttribute("name", name)
        item.textContent = "@drawable/$SPLASH_MARK"
        style.appendChild(item)
    }
    styles.documentElement.appendChild(style)
}

private object BundledLogo

/** HushPinterest's mark as the bundle carries it. */
internal fun bundledLogo(): ByteArray =
    BundledLogo::class.java.classLoader.getResourceAsStream(BUNDLED_LOGO)?.use { it.readBytes() }
        ?: refuse("the patches carry no $BUNDLED_LOGO")

/**
 * Adds the theme, the picture at [picked] (HushPinterest's mark when nothing was picked) and the
 * drawable placing it. Refuses a file that isn't a PNG, JPEG or WebP picture, or one over
 * [LOGO_MAX_SIDE] pixels a side, before anything changes.
 */
internal fun ResourcePatchContext.addSplashLogo(picked: String?) {
    val path = picked?.trim().orEmpty()
    val bytes = if (path.isEmpty()) bundledLogo() else File(path).let { file ->
        if (!file.isFile) refuse("can't find the picked logo, $path")
        file.readBytes()
    }
    val picture = readLogoPicture(bytes) ?: refuse("the picked logo isn't a PNG, JPEG or WebP picture, $path")
    if (max(picture.width, picture.height) > LOGO_MAX_SIDE) {
        refuse("the picked logo is ${picture.width} by ${picture.height} pixels. Pick a copy $LOGO_MAX_SIDE pixels a side or smaller")
    }
    // Patcher 2 decodes only the files a patch asks for. The two names are asked for so a build
    // that already has either shows up here and is refused.
    decode("res/values/styles.xml", "res/drawable*/$SPLASH_LOGO.*", "res/drawable*/$SPLASH_MARK.*")
    val res = get("res")
    val taken = res.listFiles { file -> file.isDirectory && file.name.startsWith("drawable") }.orEmpty()
        .flatMap { it.listFiles().orEmpty().asList() }
        .filter { it.nameWithoutExtension == SPLASH_LOGO || it.nameWithoutExtension == SPLASH_MARK }
    if (taken.isNotEmpty()) refuse("res already has ${taken.first().relativeTo(res).invariantSeparatorsPath}")
    document("res/values/styles.xml").use(::addSplashTheme)
    val logo = File(res, "drawable-nodpi/$SPLASH_LOGO.${picture.extension}")
    logo.parentFile.mkdirs()
    logo.writeBytes(bytes)
    val mark = File(res, "drawable/$SPLASH_MARK.xml")
    mark.parentFile.mkdirs()
    mark.writeText(splashMarkXml(SPLASH_LOGO, logoInsets(picture.width, picture.height, round = path.isEmpty())))
    patchLog.info(
        "$PATCH: ${if (path.isEmpty()) "HushPinterest's mark" else "the picked logo"}, " +
            "${picture.width} by ${picture.height} ${picture.extension}, added as $SPLASH_LOGO_THEME.",
    )
}

/** The picture picked when patching, which the resource patch below reads as it runs. */
private var logoOption: Option<String>? = null

private val splashLogoResourcesPatch = resourcePatch {
    execute {
        addSplashLogo(logoOption?.value)
    }
}

/**
 * A logo picked when patching on the screen Android shows while Pinterest starts. Included in the
 * default selection with its switch off.
 *
 * Android draws that screen itself, from the launch theme, before any of Pinterest's code runs, so
 * the picture has to be in the APK: Manager copies it in as the patch runs. The patch adds a theme
 * next to Pinterest's launch theme with the picture as its icon, and the extension, on Android 13
 * and newer, tells Android to use it for later starts while the switch is on
 * (Activity.getSplashScreen().setSplashScreenTheme). Android keeps that answer itself, so the switch
 * costs a start nothing. Android 12 and older only ever use the manifest's theme, so they keep
 * Pinterest's screen.
 */
@Suppress("unused")
val customSplashLogoPatch = bytecodePatch(
    name = PATCH,
    description = "Shows a logo you pick on the screen you see while Pinterest starts, in place of Pinterest's, " +
        "on Android 13 and newer. Pick the picture in the patch's Logo option when you patch. Leave it empty " +
        "for HushPinterest's logo. Starts off. Turn it on in HushPinterest settings > Interface.",
) {
    category("Theme")
    dependsOn(settingsPatch, pinterestExtensionPatch, splashLogoResourcesPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    logoOption = imageOption(
        key = LOGO_OPTION,
        default = null,
        title = "Logo",
        description = "A PNG, JPEG or WebP picture, up to $LOGO_MAX_SIDE pixels a side. All of it shows, " +
            "centered inside a circle, so a square picture with a clear background looks best. Leave it " +
            "empty for HushPinterest's logo.",
        required = false,
        allowedExtensions = listOf("png", "jpg", "jpeg", "webp"),
        recommendedSize = ImageSize(512, 512),
    )

    execute {
        requireStatusMethod("customSplashLogo")
        enableStatus("customSplashLogo")
    }
}
