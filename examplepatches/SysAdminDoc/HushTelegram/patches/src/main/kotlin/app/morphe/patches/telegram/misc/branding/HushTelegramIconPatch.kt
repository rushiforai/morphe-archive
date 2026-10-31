/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.branding

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.maps.ANDROID_NAMESPACE
import app.morphe.patches.telegram.misc.maps.readResourceXml
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File

private const val PATCH = "HushTelegram icon and name"
internal const val ICON = "hush_launcher"
internal const val ICON_REFERENCE = "@mipmap/$ICON"

/** The ring's outer dark blue, behind the badge wherever a launcher's shape shows past it. */
internal const val ICON_BACKGROUND = "#FF00218A"
internal val ICON_DENSITIES = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")

/** The badge for launchers older than Android 8, and an adaptive icon's two picture layers. */
internal val ICON_PICTURES = listOf(ICON, "${ICON}_foreground", "${ICON}_monochrome")
internal const val MAX_APP_NAME = 30
internal const val DEFAULT_ICON = "org.telegram.messenger.DefaultIcon"

/** Where scripts/gen-launcher-icon.py writes the pictures, inside the patch file. */
private const val BUNDLED = "/hushtelegram/icon"

/**
 * How the adaptive icon looks. The plain styles draw the H and plane alone in [glyph] over
 * [background]; launchers older than Android 8 show the badge whichever is picked.
 */
internal enum class IconStyle(val key: String, val label: String, val background: String, val glyph: String?) {
    HUSHTELEGRAM("hushtelegram", "HushTelegram colors", ICON_BACKGROUND, null),
    WHITE_ON_BLACK("white-on-black", "White on black", "#FF000000", "#FFFFFFFF"),
    BLACK_ON_WHITE("black-on-white", "Black on white", "#FFFFFFFF", "#FF000000"),
}

/**
 * The adaptive icon, for Android 8 and up: the badge over a color that matches its edge, or the
 * H and plane tinted for a plain style, and the H and plane alone for Android 13's themed icons,
 * which older versions skip.
 */
internal fun adaptiveIcon(style: IconStyle): String {
    // A bitmap's tint keeps only the picture's shape (SRC_IN), so the themed picture becomes the glyph.
    val foreground = when (val glyph = style.glyph) {
        null -> """<foreground android:drawable="@mipmap/${ICON}_foreground" />"""
        else -> """<foreground><bitmap android:src="@mipmap/${ICON}_monochrome" android:tint="$glyph" /></foreground>"""
    }
    return """
        <?xml version="1.0" encoding="utf-8"?>
        <adaptive-icon xmlns:android="$ANDROID_NAMESPACE">
            <background>
                <color android:color="${style.background}" />
            </background>
            $foreground
            <monochrome android:drawable="@mipmap/${ICON}_monochrome" />
        </adaptive-icon>
    """.trimIndent() + "\n"
}

@Suppress("unused")
val hushTelegramIconPatch = resourcePatch(
    name = PATCH,
    description = "Gives your patched Telegram HushTelegram's own home screen icon, with a themed version on Android 13 " +
        "and up, and can change the name under it. An alternate icon picked in Telegram's settings keeps its own " +
        "look. It isn't selected by default. Turn on Expert mode in Morphe Manager to pick it and name the app. " +
        "Only patching again without it puts Telegram's icon back.",
    default = false,
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.telegram())
    val appName by stringOption(
        key = "appName", default = null, title = "App name",
        description = "The name under the icon, up to $MAX_APP_NAME characters. Leave it empty to keep Telegram.",
        required = false,
    )
    val iconStyle by stringOption(
        key = "iconStyle", default = IconStyle.HUSHTELEGRAM.key, title = "Icon style",
        values = IconStyle.entries.associate { it.label to it.key },
        description = "HushTelegram colors is the blue badge. The plain styles draw just the H and plane, white on " +
            "black or black on white, on Android 8 and up. Every style keeps the themed icon on Android 13.",
        required = true,
    )
    execute { applyHushTelegramIcon(appName, iconStyle) }
}

/** The style the option names by key or label, the badge when it's empty. */
internal fun checkedIconStyle(raw: String?): IconStyle {
    val key = raw?.trim().orEmpty()
    if (key.isEmpty()) return IconStyle.HUSHTELEGRAM
    return IconStyle.entries.firstOrNull { it.key.equals(key, ignoreCase = true) || it.label.equals(key, ignoreCase = true) }
        ?: throw PatchException("$PATCH: iconStyle \"$key\" isn't a style. Pick one of " +
            IconStyle.entries.joinToString { it.key } + ". Nothing was changed.")
}

/** The name as it goes in the manifest, or null to keep Telegram's. */
internal fun checkedAppName(raw: String?): String? {
    val name = raw?.trim().orEmpty()
    if (name.isEmpty()) return null
    fun refuse(why: String): Nothing = throw PatchException("$PATCH: appName $why Nothing was changed.")
    if (name.length > MAX_APP_NAME) refuse("is longer than $MAX_APP_NAME characters.")
    // A leading @ or ? would be read as a resource reference, and aapt2 reads quotes and
    // backslashes in a manifest value as escapes.
    if (name[0] == '@' || name[0] == '?') refuse("can't start with @ or ?.")
    if (name.any { it.isISOControl() || it == '"' || it == '\'' || it == '\\' }) {
        refuse("can't hold quotes, backslashes or control characters.")
    }
    // Direction marks and zero-width characters show nothing and can flip or hide what the
    // launcher shows. The joiners stay: emoji like the family ones are built with the zero-width
    // joiner, and Persian, Kurdish and Indic names need the non-joiner. Read by code point, so a
    // format character past U+FFFF, such as a language tag, is caught too.
    if (name.codePoints().anyMatch { it != ZERO_WIDTH_JOINER && it != ZERO_WIDTH_NON_JOINER &&
            Character.getType(it).toByte().let { type ->
                type == Character.FORMAT || type == Character.LINE_SEPARATOR || type == Character.PARAGRAPH_SEPARATOR } }
    ) {
        refuse("can't hold invisible characters, such as direction marks or zero-width spaces.")
    }
    return name
}

private const val ZERO_WIDTH_JOINER = 0x200D
private const val ZERO_WIDTH_NON_JOINER = 0x200C

/** The pictures the patch adds, by their path under res, read before anything is written. */
internal fun bundledIconPictures(): Map<String, ByteArray> = ICON_DENSITIES.flatMap { density ->
    ICON_PICTURES.map { picture ->
        val path = "mipmap-$density/$picture.png"
        val bytes = HushTelegramIconFiles::class.java.getResourceAsStream("$BUNDLED/$path")?.use { it.readBytes() }
            ?: throw PatchException("$PATCH: the patch file is missing its icon picture $path. Nothing was changed.")
        path to bytes
    }
}.toMap()

private object HushTelegramIconFiles

internal fun ResourcePatchContext.applyHushTelegramIcon(rawName: String?, rawStyle: String? = null) {
    val style = checkedIconStyle(rawStyle)
    val name = checkedAppName(rawName)
    val pictures = bundledIconPictures()
    // Checked on a read-only copy first, so a refusal leaves the manifest's bytes alone.
    resolveLaunchers(readResourceXml(this["AndroidManifest.xml"], PATCH))
    // Patcher 2.0 decodes only the files a patch asks for, and an undecoded file doesn't exist yet,
    // so each path is asked for before the check that Telegram has nothing there.
    addIconFiles(get("res", false), pictures, style) { decode("res/$it") }
    document("AndroidManifest.xml").use { showIcon(it, name) }
}

/**
 * Writes the pictures and the adaptive icon under [res], refusing before the first write when it
 * can't. [decode] gets each path first, so a file Telegram already ships there is found.
 */
internal fun addIconFiles(
    res: File,
    pictures: Map<String, ByteArray>,
    style: IconStyle = IconStyle.HUSHTELEGRAM,
    decode: (String) -> Unit = {},
) {
    if (!res.isDirectory) throw PatchException("$PATCH: Telegram's resources weren't decoded. Nothing was changed.")
    val adaptivePath = "mipmap-anydpi-v26/$ICON.xml"
    val paths = pictures.keys + adaptivePath
    paths.forEach(decode)
    val adaptive = res.resolve(adaptivePath)
    paths.map { res.resolve(it) }.firstOrNull { it.exists() }?.let {
        throw PatchException("$PATCH: this Telegram already has ${it.relativeTo(res).invariantSeparatorsPath}. Nothing was changed.")
    }
    for ((path, bytes) in pictures) res.resolve(path).apply { parentFile.mkdirs() }.writeBytes(bytes)
    adaptive.apply { parentFile.mkdirs() }.writeText(adaptiveIcon(style))
}

/**
 * Points the application at the icon, and at [name] when there is one. The default launcher entry
 * shows the application's icon and name unless it names its own, and then it gets the new ones too.
 */
internal fun showIcon(manifest: Document, name: String?) {
    val (application, defaultIcon) = resolveLaunchers(manifest)
    application.setAttribute("android:icon", ICON_REFERENCE)
    application.setAttribute("android:roundIcon", ICON_REFERENCE)
    for (attribute in listOf("android:icon", "android:roundIcon")) {
        if (defaultIcon.hasAttribute(attribute)) defaultIcon.setAttribute(attribute, ICON_REFERENCE)
    }
    if (name != null) {
        application.setAttribute("android:label", name)
        if (defaultIcon.hasAttribute("android:label")) defaultIcon.setAttribute("android:label", name)
    }
}

/** Telegram's application element and its default launcher entry. */
internal fun resolveLaunchers(manifest: Document): Pair<Element, Element> {
    val root = manifest.documentElement
    requireShape(root.tagName == "manifest" && root.getAttribute("xmlns:android") == ANDROID_NAMESPACE,
        "the manifest's Android namespace changed")
    val applications = manifest.getElementsByTagName("application")
    requireShape(applications.length == 1 && applications.item(0).parentNode === root,
        "the manifest's application is missing or ambiguous")
    val application = applications.item(0) as Element
    requireShape(application.hasAttribute("android:icon"), "the application has no icon to replace")
    val aliases = manifest.getElementsByTagName("activity-alias")
    val defaults = (0 until aliases.length).map { aliases.item(it) as Element }
        .filter { it.getAttribute("android:name") == DEFAULT_ICON }
    requireShape(defaults.size == 1 && defaults.single().parentNode === application,
        "Telegram's default launcher entry is missing or ambiguous")
    return application to defaults.single()
}

private fun requireShape(valid: Boolean, reason: String) {
    if (!valid) throw PatchException("$PATCH: $reason. Nothing was changed.")
}
