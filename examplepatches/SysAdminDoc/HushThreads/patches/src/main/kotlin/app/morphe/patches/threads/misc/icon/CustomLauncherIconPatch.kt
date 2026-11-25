/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at f2ba4ca60 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.threads.misc.icon

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

internal const val ICON_PATCH = "Custom launcher icon"
internal const val ADAPTIVE_ICON = "adaptive-icon"
private const val VECTOR = "vector"
private const val FILL_COLOR = "android:fillColor"

private fun refuse(reason: String): Nothing = throw PatchException("$ICON_PATCH: $reason. Nothing was changed.")

private fun Element.childElements(): List<Element> =
    (0 until childNodes.length).mapNotNull { childNodes.item(it) as? Element }

private fun Element.layer(tag: String): Element? = childElements().firstOrNull { it.tagName == tag }

/**
 * The application's icon, `@mipmap/barcelona` on 457, which the launcher activity shows too since it
 * names none of its own. A separate round icon would keep Threads' look on launchers that prefer it,
 * so the patch refuses one instead.
 */
internal fun applicationIcon(manifest: Document): String {
    val application = manifest.getElementsByTagName("application").item(0) as? Element
        ?: refuse("Threads' manifest has no application")
    val icon = application.getAttribute("android:icon").takeIf { it.isNotEmpty() } ?: refuse("Threads' application has no icon")
    val round = application.getAttribute("android:roundIcon")
    if (round.isNotEmpty() && round != icon) refuse("Threads has a separate round icon ($round)")
    return icon
}

/** `@mipmap/barcelona` or `@com.instagram.barcelona:mipmap/barcelona` as type and name, or null for a framework or theme reference. */
internal fun appResource(reference: String): Pair<String, String>? {
    val match = Regex("""@(?:([\w.]+):)?(\w+)/([\w.]+)""").matchEntire(reference.trim()) ?: return null
    if (match.groupValues[1] == "android") return null
    return match.groupValues[2] to match.groupValues[3]
}

/** The decoded glob that covers every configuration of [resource]. */
internal fun resourceGlob(resource: Pair<String, String>) = "res/${resource.first}*/${resource.second}.xml"

/**
 * The one decoded configuration of [resource] whose root is [root] (`res/mipmap-anydpi/barcelona.xml`
 * for the icon on 457), read through [read].
 */
internal fun singleXml(decoded: List<String>, resource: Pair<String, String>, root: String, read: (String) -> Document): String {
    val (type, name) = resource
    val matches = decoded.filter { path ->
        val folder = path.substringBeforeLast('/', "")
        path.substringAfterLast('/') == "$name.xml" && (folder == "res/$type" || folder.startsWith("res/$type-")) &&
            runCatching { read(path).documentElement.tagName == root }.getOrDefault(false)
    }
    return matches.singleOrNull() ?: when {
        matches.isEmpty() -> refuse("Threads' @$type/$name has no <$root> version")
        else -> refuse("Threads' @$type/$name has ${matches.size} <$root> versions (${matches.joinToString()}), so it can't tell which one is drawn")
    }
}

/** A 108 by 108 vector holding [children], the size of an adaptive icon's layer. */
private fun Document.vector(vararg children: Element): Element =
    createElement(VECTOR).apply {
        setAttribute("android:width", "108dp")
        setAttribute("android:height", "108dp")
        setAttribute("android:viewportWidth", "108")
        setAttribute("android:viewportHeight", "108")
        children.forEach(::appendChild)
    }

private fun Document.path(color: String, data: String, evenOdd: Boolean = false): Element =
    createElement("path").apply {
        setAttribute(FILL_COLOR, color)
        if (evenOdd) setAttribute("android:fillType", "evenOdd")
        setAttribute("android:pathData", data)
    }

/**
 * Draws HushThreads' logo into [icon] in place: its blue as the background; the H, the shadow above
 * the ribbon clipped to the H's bars, and the ribbon as the foreground; and the H with the ribbon cut
 * out as the themed-icon layer, which Android 13 and newer tint with the wallpaper's colors. Each
 * layer is written inline, which AdaptiveIconDrawable reads when a layer names no drawable, so
 * Threads' own drawables stay as they are for anything else that draws them. Every check runs before
 * the first change, so a refusal leaves [icon] as it was.
 */
internal fun drawHushThreadsIcon(icon: Document) {
    val root = icon.documentElement
    if (root?.tagName != ADAPTIVE_ICON) refuse("Threads' icon isn't an adaptive icon")
    val back = root.layer("background") ?: refuse("Threads' icon has no background layer")
    val front = root.layer("foreground") ?: refuse("Threads' icon has no foreground layer")

    val mono = root.layer("monochrome") ?: icon.createElement("monochrome").also { root.appendChild(it) }
    back.drawInline(icon.createElement("color").apply { setAttribute("android:color", HushThreadsLogo.BLUE) })
    val groove = icon.createElement("group").apply {
        appendChild(icon.createElement("clip-path").apply { setAttribute("android:pathData", HushThreadsLogo.H) })
        appendChild(icon.path(HushThreadsLogo.GROOVE, HushThreadsLogo.GROOVE_PATH))
    }
    front.drawInline(
        icon.vector(
            icon.path(HushThreadsLogo.WHITE, HushThreadsLogo.H, evenOdd = true),
            groove,
            icon.path(HushThreadsLogo.CYAN, HushThreadsLogo.RIBBON),
        ),
    )
    // Themed icons tint the layer's shape, so its one fill color doesn't show.
    mono.drawInline(icon.vector(icon.path("#ffffffff", HushThreadsLogo.H + HushThreadsLogo.RIBBON, evenOdd = true)))
}

private fun Element.drawInline(drawable: Element) {
    removeAttribute("android:drawable")
    while (firstChild != null) removeChild(firstChild)
    appendChild(drawable)
}

/** Redraws the adaptive icon the manifest names, after a dry run on a throwaway copy. */
private val launcherIconResourcePatch = resourcePatch {
    execute {
        // Read with a plain parser: a document() closes by writing its file back.
        val read = { path: String -> DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(get(path)) }
        val icon = appResource(applicationIcon(read("AndroidManifest.xml")))
            ?: refuse("Threads' icon isn't one of its own resources")
        // Patcher 2.0 decodes only the files a patch asks for: an undecoded file does not exist yet.
        val iconPath = singleXml(decode(resourceGlob(icon)), icon, ADAPTIVE_ICON, read)
        drawHushThreadsIcon(read(iconPath))
        document(iconPath).use { drawHushThreadsIcon(it) }
    }
}

/**
 * Swaps Threads' home screen icon for HushThreads' logo (#26), so a patched copy is easy to tell
 * from Meta's. Threads' launcher is its main activity, which shows the application's icon, an
 * adaptive icon on every build HushThreads patches, so redrawing that one icon is all it takes. It's
 * written when you patch rather than picked in settings, because Threads has no launcher alias to
 * swap at run time: its own shortcuts and HushThreads' settings shortcut belong to the main activity.
 */
@Suppress("unused")
val customLauncherIconPatch = bytecodePatch(
    name = "Custom launcher icon",
    description = "Swaps the Threads icon on your home screen for the HushThreads logo, with a one-color version " +
        "for themed icons, so a patched copy is easy to spot. It isn't selected by default. Works as soon as you " +
        "patch it in, with no switch.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, threadsExtensionPatch, launcherIconResourcePatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        enableStatus("customLauncherIcon")
    }
}
