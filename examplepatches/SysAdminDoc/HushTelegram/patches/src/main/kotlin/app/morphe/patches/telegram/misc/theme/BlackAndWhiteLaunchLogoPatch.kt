/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.theme

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.maps.readResourceXml
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult

private const val PATCH = "Black and white launch logo"

/**
 * The launch theme the patch adds with Telegram's original look, which BlackTheme looks up by this
 * name and names for the next start while AMOLED black is off.
 */
internal const val STOCK_THEME = "HushTelegramLaunchStock"
internal const val START_THEME = "Theme.TMessages.Start"
internal const val LOGO = "hush_launch_logo"
internal const val LOGO_SHAPE = "hush_launch_logo_shape"

/** Telegram's animated launch logo: a blue circle that grows in with a white paper plane on it. */
internal const val SPLASH = "drawable/tg_splash_320.xml"
/** Telegram's launch theme for Android 12 and up in light mode, where the light half of [STOCK_THEME] goes. */
internal const val LOGO_STYLES = "values-v31/styles.xml"
/** Telegram's launch theme in dark mode, which gets the white logo on black. */
internal const val NIGHT_STYLES = "values-night-v29/styles.xml"
internal const val SPLASH_BACKGROUND = "android:windowSplashScreenBackground"
internal const val SPLASH_ICON = "android:windowSplashScreenAnimatedIcon"
internal const val LOGO_CIRCLE = "#ffffff"
internal const val LOGO_PLANE = "#000000"
internal const val LOGO_BACKGROUND = "#ff000000"

@Suppress("unused")
val blackAndWhiteLaunchLogoPatch = resourcePatch(
    name = PATCH,
    description = "With AMOLED black on and your phone in dark mode, the launch screen shows Telegram's logo in white " +
        "on black instead of the blue one. It follows the switch on Android 13 and up. When Android reopens a " +
        "Telegram it closed in the background, it shows the black screen in dark mode even with the switch off, " +
        "since nothing can run that early. It isn't selected by default, since it has Morphe rebuild Telegram's " +
        "resources. Turn on Expert mode in Morphe Manager to pick it.",
    default = false,
) {
    category("Theme")
    dependsOn(amoledBlackPatch)
    compatibleWith(*AppCompatibilities.telegramOnly())
    // Patcher 2.0 decodes only the files a patch asks for, and an undecoded file doesn't exist yet,
    // so each file the logo reads or checks is asked for first.
    execute { addLaunchLogo(get("res", false)) { decode("res/$it") } }
}

/**
 * Adds a copy of Telegram's launch logo with a white circle and a black plane, keeping Telegram's
 * animation, and puts it on black in Telegram's own dark launch theme. That theme is the one Android
 * draws when it restarts a task whose process it killed, where a theme named through
 * setSplashScreenTheme isn't used, so the logo has to live there to show every time. A second theme
 * keeps Telegram's original look, light and dark, for BlackTheme to name while AMOLED black is off.
 * Everything is checked before the first write. [decode] gets each path under [res] before it's read
 * or checked, including the picture the logo names, which isn't known until the logo is read.
 */
internal fun addLaunchLogo(res: File, decode: (String) -> Unit = {}) {
    if (!res.isDirectory) refuse("Telegram's resources weren't decoded")
    fun decoded(path: String): File {
        decode(path)
        return res.resolve(path)
    }
    val splashFile = decoded(SPLASH)
    if (!splashFile.isFile) refuse("Telegram's launch logo $SPLASH is missing")
    val splash = readResourceXml(splashFile, PATCH)
    val animated = splash.documentElement
    requireShape(animated.tagName == "animated-vector", "Telegram's launch logo is no longer an animated vector")
    val reference = animated.getAttribute("android:drawable")
    val shapeName = reference.removePrefix("@drawable/")
    requireShape(reference.startsWith("@drawable/") && shapeName.isNotEmpty() && '/' !in shapeName && ':' !in shapeName,
        "Telegram's launch logo doesn't name its picture")
    val shapeFile = decoded("drawable/$shapeName.xml")
    if (!shapeFile.isFile) refuse("Telegram's launch logo picture drawable/$shapeName.xml is missing")
    val shape = readResourceXml(shapeFile, PATCH)
    requireShape(shape.documentElement.tagName == "vector", "Telegram's launch logo picture is no longer a vector")
    val circle = namedPath(shape, "circle")
    val plane = namedPath(shape, "plane")
    val stylesFile = decoded(LOGO_STYLES)
    if (!stylesFile.isFile) refuse("Telegram's $LOGO_STYLES is missing")
    val styles = readResourceXml(stylesFile, PATCH)
    requireShape(styles.documentElement.tagName == "resources", "Telegram's $LOGO_STYLES has another shape")
    listOf(LOGO, LOGO_SHAPE).map { decoded("drawable/$it.xml") }.firstOrNull { it.exists() }?.let {
        refuse("this Telegram already has ${it.relativeTo(res).invariantSeparatorsPath}")
    }
    requireShape(styleNamed(styles, START_THEME) != null, "Telegram's $LOGO_STYLES has no $START_THEME")
    val nightFile = decoded(NIGHT_STYLES)
    if (!nightFile.isFile) refuse("Telegram's $NIGHT_STYLES is missing")
    val night = readResourceXml(nightFile, PATCH)
    requireShape(night.documentElement.tagName == "resources", "Telegram's $NIGHT_STYLES has another shape")
    val nightStart = styleNamed(night, START_THEME) ?: refuse("Telegram's $NIGHT_STYLES has no $START_THEME")
    val background = singleItem(nightStart, SPLASH_BACKGROUND)
    val icon = singleItem(nightStart, SPLASH_ICON)
    requireShape(background.textContent.trim().isNotEmpty(), "Telegram's dark launch screen has no background")
    requireShape(icon.textContent.trim() == "@drawable/" + SPLASH.removePrefix("drawable/").removeSuffix(".xml"),
        "Telegram's dark launch screen no longer shows its launch logo")
    for (document in listOf(styles, night)) {
        if (styleNamed(document, STOCK_THEME) != null) refuse("this Telegram already has the style $STOCK_THEME")
    }

    circle.setAttribute("android:fillColor", LOGO_CIRCLE)
    plane.setAttribute("android:fillColor", LOGO_PLANE)
    write(shape, res.resolve("drawable/$LOGO_SHAPE.xml"))
    animated.setAttribute("android:drawable", "@drawable/$LOGO_SHAPE")
    write(splash, res.resolve("drawable/$LOGO.xml"))
    // Light mode: Telegram's launch theme as it is. Dark mode: the same, with the two values the
    // dark one had before the logo took their place.
    styles.documentElement.appendChild(stockTheme(styles))
    write(styles, stylesFile)
    night.documentElement.appendChild(stockTheme(night).apply {
        appendChild(item(night, SPLASH_BACKGROUND, background.textContent.trim()))
        appendChild(item(night, SPLASH_ICON, icon.textContent.trim()))
    })
    background.textContent = LOGO_BACKGROUND
    icon.textContent = "@drawable/$LOGO"
    write(night, nightFile)
}

private fun stockTheme(document: Document): Element = document.createElement("style").apply {
    setAttribute("name", STOCK_THEME)
    setAttribute("parent", "@style/$START_THEME")
}

/** The one style called [name], or null; two of them refuse. */
private fun styleNamed(document: Document, name: String): Element? {
    val styles = document.getElementsByTagName("style")
    val found = (0 until styles.length).map { styles.item(it) as Element }.filter { it.getAttribute("name") == name }
    requireShape(found.size <= 1, "Telegram has $name twice")
    return found.singleOrNull()
}

/** The one item called [name] in [style]. */
private fun singleItem(style: Element, name: String): Element {
    val items = style.getElementsByTagName("item")
    val found = (0 until items.length).map { items.item(it) as Element }.filter { it.getAttribute("name") == name }
    requireShape(found.size == 1, "Telegram's dark launch screen has no single $name")
    return found.single()
}

/** The one path called [name] in the logo, which has to carry a fill color to change. */
private fun namedPath(shape: Document, name: String): Element {
    val paths = shape.getElementsByTagName("path")
    val found = (0 until paths.length).map { paths.item(it) as Element }.filter { it.getAttribute("android:name") == name }
    requireShape(found.size == 1 && found.single().hasAttribute("android:fillColor"),
        "Telegram's launch logo has no single $name to recolor")
    return found.single()
}

private fun item(document: Document, name: String, value: String): Element =
    document.createElement("item").apply {
        setAttribute("name", name)
        textContent = value
    }

private fun write(document: Document, file: File) = file.outputStream().use { out ->
    TransformerFactory.newInstance().newTransformer().apply {
        setOutputProperty(OutputKeys.ENCODING, "utf-8")
    }.transform(DOMSource(document), StreamResult(out))
}

private fun requireShape(valid: Boolean, reason: String) {
    if (!valid) refuse(reason)
}

private fun refuse(reason: String): Nothing = throw PatchException("$PATCH: $reason. Nothing was changed.")
