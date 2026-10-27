package app.hushmessenger.patches.misc

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.coexist.validateVersionCode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val LAUNCHER_ICON_PATCH = "Custom launcher icon"
internal const val LAUNCHER_ICON_KEY = "iconStyle"

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val ADAPTIVE_ICON = "adaptive-icon"

/**
 * The two looks #107 asked for, Hushfeed's plain styles. Each one draws Messenger's own themed-icon
 * shape (the adaptive icon's monochrome layer) in one color on a solid background, so no artwork ships.
 */
internal enum class LauncherIconStyle(val key: String, val label: String, val background: String, val glyph: String) {
    WHITE_ON_BLACK("white-on-black", "White on black", "#ff000000", "#ffffffff"),
    BLACK_ON_WHITE("black-on-white", "Black on white", "#ffffffff", "#ff000000"),
}

private fun refuse(reason: String): Nothing = throw PatchException("$LAUNCHER_ICON_PATCH: $reason. Nothing was changed.")

/** The chosen style by key or label, or a refusal that names the ones there are. */
internal fun launcherIconStyle(raw: String?): LauncherIconStyle {
    val key = raw?.trim().orEmpty()
    return LauncherIconStyle.entries.firstOrNull { it.key.equals(key, ignoreCase = true) || it.label.equals(key, ignoreCase = true) }
        ?: refuse("\"$key\" isn't a style. Pick one of ${LauncherIconStyle.entries.joinToString { it.key }}")
}

/**
 * The application's icon, `@mipmap/launcher_icon` on 584.1. The default launcher entry draws it, and Messenger sets no
 * round icon. One that differs would keep the old look on launchers that prefer it, so the patch refuses instead.
 */
internal fun applicationIcon(manifest: Document): String {
    val application = manifest.getElementsByTagName("application").item(0) as? Element ?: refuse("the manifest has no application")
    val icon = application.getAttribute("android:icon").takeIf { it.isNotEmpty() } ?: refuse("the app has no icon")
    val round = application.getAttribute("android:roundIcon")
    if (round.isNotEmpty() && round != icon) refuse("the app has a separate round icon ($round)")
    return icon
}

/** `@mipmap/launcher_icon` or `@com.facebook.orca:mipmap/launcher_icon` as type and name, or null for anything else. */
internal fun appResource(reference: String): Pair<String, String>? {
    val match = Regex("""@(?:([\w.]+):)?(\w+)/([\w.]+)""").matchEntire(reference.trim()) ?: return null
    if (match.groupValues[1] == "android") return null
    return match.groupValues[2] to match.groupValues[3]
}

/** The decoded glob that covers [icon] and every resource named after it, so one decode call reads them all. */
internal fun launcherIconGlob(icon: Pair<String, String>) = "res/${icon.first}*/${icon.second}*.xml"

/** The one decoded configuration of [icon] that is an adaptive icon (`res/mipmap-anydpi/launcher_icon.xml` on 584.1). */
internal fun adaptiveIconPath(decoded: List<String>, icon: Pair<String, String>, read: (String) -> Document): String {
    val (type, name) = icon
    val configurations = decoded.filter { path ->
        val folder = path.substringBeforeLast('/', "")
        path.substringAfterLast('/') == "$name.xml" && (folder == "res/$type" || folder.startsWith("res/$type-"))
    }
    val adaptive = configurations.filter { runCatching { read(it).documentElement.tagName == ADAPTIVE_ICON }.getOrDefault(false) }
    return adaptive.singleOrNull() ?: when {
        adaptive.isEmpty() -> refuse("Messenger's icon @$type/$name has no adaptive version. Use an unmodified Messenger ${MessengerTarget.supportedApks()}")
        else -> refuse("Messenger's icon has ${adaptive.size} adaptive versions (${adaptive.joinToString()}), so it can't tell which one the launcher shows")
    }
}

private fun Element.layer(tag: String): Element? =
    (0 until childNodes.length).map { childNodes.item(it) }.filterIsInstance<Element>().firstOrNull { it.tagName == tag }

/** The themed-icon picture the icon's monochrome layer draws, or a refusal when it has none to reuse. */
internal fun monochromeReference(icon: Document): Pair<String, String> {
    val root = icon.documentElement
    if (root?.tagName != ADAPTIVE_ICON) refuse("the icon isn't an adaptive icon")
    val drawable = root.layer("monochrome")?.getAttribute("android:drawable").orEmpty()
    return appResource(drawable) ?: refuse("the icon has no themed-icon layer to draw the logo from")
}

/**
 * Restyles one adaptive icon in place: the background becomes a solid color, and the foreground draws the monochrome
 * layer's picture tinted with the style's color. A bitmap's tint uses SRC_IN, so only the logo's shape takes the color.
 * Both layers are written inline, which AdaptiveIconDrawable reads when a layer names no drawable, so Messenger's own
 * drawables stay as they are for everything else that draws them. The monochrome layer stays, so Android 13 themed
 * icons still work. Every check runs before the first change.
 */
internal fun restyleLauncherIcon(icon: Document, style: LauncherIconStyle) {
    val (type, name) = monochromeReference(icon)
    val root = icon.documentElement
    val background = root.layer("background") ?: refuse("the icon has no background layer")
    val foreground = root.layer("foreground") ?: refuse("the icon has no foreground layer")
    if (!root.hasAttribute("xmlns:android")) root.setAttribute("xmlns:android", ANDROID_NS)
    background.drawInline(icon.createElement("color").apply { setAttribute("android:color", style.background) })
    foreground.drawInline(icon.createElement("bitmap").apply {
        setAttribute("android:src", "@$type/$name")
        setAttribute("android:tint", style.glyph)
    })
}

private fun Element.drawInline(drawable: Element) {
    removeAttribute("android:drawable")
    while (firstChild != null) removeChild(firstChild)
    appendChild(drawable)
}

private fun readXml(file: File): Document =
    DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file)

@Suppress("unused")
val customLauncherIconPatch = resourcePatch(
    name = LAUNCHER_ICON_PATCH,
    description = "Makes Messenger's home screen icon white on black or black on white. Pick it and its style in Morphe Manager's Expert mode. Works as soon as you patch it in, with no switch.",
    default = false,
) {
    category("Theme")
    compatibleWith(MessengerTarget.COMPATIBILITY)

    val style by stringOption(
        key = LAUNCHER_ICON_KEY,
        default = LauncherIconStyle.WHITE_ON_BLACK.key,
        values = LauncherIconStyle.entries.associate { it.label to it.key },
        title = "Icon style",
        description = "White on black draws Messenger's logo in white on a black icon. Black on white draws it in black on a white one.",
        required = true,
    )

    execute {
        validateVersionCode(packageMetadata.versionCode)
        val chosen = launcherIconStyle(style)
        val icon = applicationIcon(readXml(get("AndroidManifest.xml")))
        val resource = appResource(icon) ?: refuse("the app's icon $icon isn't one of Messenger's own resources")
        val path = adaptiveIconPath(decode(launcherIconGlob(resource)), resource) { readXml(get(it)) }
        // A dry run on a throwaway copy: a refusal leaves the icon file as it was.
        restyleLauncherIcon(readXml(get(path)), chosen)
        document(path).use { restyleLauncherIcon(it, chosen) }
    }
}
