package io.github.jordanwoodson.patches.shared.apps

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchBuilder
import app.morphe.patcher.patch.ResourcePatchContext
import io.github.jordanwoodson.patches.shared.settings.ChoiceSetting
import io.github.jordanwoodson.patches.shared.settings.Section
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.nio.file.Files
import java.nio.file.StandardCopyOption

/** A launcher icon as the manifest names it: `@mipmap/ic_launcher`, and its round variant if there is one. */
internal data class IconResources(val icon: String, val roundIcon: String?)

/** The icons in the patched APK: [lurk] shows Lurk's icon, [original] still shows the app's own. */
internal class InstalledIcons(val lurk: IconResources, val original: IconResources)

/** How Lurk icon gives an app its launcher icon. */
internal sealed interface LauncherIcon {
    /**
     * Installs Lurk's icon. [original] is the app's launcher icon as the manifest named it before; it must keep
     * showing the app's own icon under the names this returns, for the Original launcher entry.
     */
    fun ResourcePatchContext.install(app: LurkApp, original: IconResources): InstalledIcons
}

/** The class loader of this bundle, which holds the artwork under patches/src/main/resources/. */
private val bundleResources: ClassLoader get() = LauncherIcon::class.java.classLoader

/**
 * Lurk's figure from Rumble's artwork, recolored to [color] on Lurk's dark background, as a new adaptive icon
 * (also the themed icon) that the manifest then points to. The app's own icon stays as it is. Only for apps that
 * require Android 8 or newer, so every supported device understands adaptive vector icons.
 */
internal class RecoloredFigure(private val color: String) : LauncherIcon {
    override fun ResourcePatchContext.install(app: LurkApp, original: IconResources): InstalledIcons {
        val foreground = bundleResources.getResourceAsStream(FIGURE)
            ?.bufferedReader()?.use { it.readText() }
            ?.takeIf { FIGURE_COLOR in it }
            ?: throw PatchException("Bundled Lurk artwork missing, or its logo is no longer $FIGURE_COLOR")
        get("res/drawable/lurk_launcher_foreground.xml").apply {
            parentFile.mkdirs()
            writeText(foreground.replace(FIGURE_COLOR, color))
        }
        get("res/drawable/lurk_launcher_background.xml").writeText("""
            <shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle">
                <solid android:color="#181D24" />
            </shape>
        """.trimIndent())
        get("res/mipmap-anydpi-v26/lurk_launcher.xml").apply {
            parentFile.mkdirs()
            writeText("""
                <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                    <background android:drawable="@drawable/lurk_launcher_background" />
                    <foreground android:drawable="@drawable/lurk_launcher_foreground" />
                    <monochrome android:drawable="@drawable/lurk_launcher_foreground" />
                </adaptive-icon>
            """.trimIndent())
        }
        // The application's icon too, which Android's app info page shows.
        document(MANIFEST).use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:icon", ICON)
            application.setAttribute("android:roundIcon", ICON)
        }
        return InstalledIcons(lurk = IconResources(ICON, ICON), original = original)
    }

    private companion object {
        /** The figure's vector in Rumble's artwork, and the logo color it is drawn in there. */
        const val FIGURE = "rumble/icon/drawable/ic_launcher_foreground.xml"
        const val FIGURE_COLOR = "#89DA44"
        const val ICON = "@mipmap/lurk_launcher"
    }
}

/**
 * Artwork made for the app by `bin/app-icon <app> <artwork.png>` under patches/src/main/resources/[directory]/.
 * Each of [files] (paths under res/) replaces the file the app ships under the same name, so resource IDs and
 * the manifest's icon references stay untouched. The app's own files are kept first as `lurk_original_<name>`.
 */
internal class LauncherArtwork(private val directory: String, private val files: List<String>) : LauncherIcon {
    override fun ResourcePatchContext.install(app: LurkApp, original: IconResources): InstalledIcons {
        val targets = files.associateWith { get("res/$it") }
        val missing = targets.filterValues { !it.isFile }.keys
        if (missing.isNotEmpty()) {
            throw PatchException("${app.name}: launcher icon files not found: ${missing.joinToString()}. " +
                "This patch targets ${app.name} ${app.version}; recheck res/ before updating compatibility.")
        }

        val kept = keepOriginals(app)
        targets.forEach { (path, target) ->
            val icon = bundleResources.getResourceAsStream("$directory/$path")
                ?: throw PatchException("Bundled icon file missing: $directory/$path")
            icon.use { Files.copy(it, target.toPath(), StandardCopyOption.REPLACE_EXISTING) }
        }
        return InstalledIcons(
            lurk = original,
            original = IconResources(kept(original.icon), original.roundIcon?.let(kept)),
        )
    }

    /**
     * Copies each of [files] to `lurk_original_<name>` next to it, before the artwork overwrites it. In the copies,
     * references to the other files (the adaptive icon's layers) point to their copies as well. Returns what a
     * reference to one of the files (`@mipmap/ic_launcher`) becomes (`@mipmap/lurk_original_ic_launcher`).
     */
    private fun ResourcePatchContext.keepOriginals(app: LurkApp): (String) -> String {
        // (type, name): mipmap-hdpi/ic_launcher.webp is the mipmap ic_launcher.
        val names = files.map { it.substringBefore('/').substringBefore('-') to it.substringAfter('/').substringBefore('.') }
            .toSet()
        fun rename(text: String) = REFERENCE.replace(text) { match ->
            val (type, name) = match.destructured
            if ((type to name) in names) "@$type/$ORIGINAL_PREFIX$name" else match.value
        }
        files.forEach { path ->
            val file = get("res/$path")
            val copy = get("res/${path.substringBeforeLast('/')}/$ORIGINAL_PREFIX${path.substringAfterLast('/')}")
            if (copy.exists()) throw PatchException("${app.name}: res/$path was already copied")
            if (path.endsWith(".xml")) copy.writeText(rename(file.readText())) else Files.copy(file.toPath(), copy.toPath())
        }
        return ::rename
    }

    private companion object {
        const val ORIGINAL_PREFIX = "lurk_original_"
        /** A resource reference in a resource file or the manifest: `@drawable/ic_launcher_foreground`. */
        val REFERENCE = Regex("@([a-z]+)/([A-Za-z0-9_.]+)")
    }
}

private const val MANIFEST = "AndroidManifest.xml"

/**
 * The two launcher entries of a patched app: activity-aliases of its launcher activity, each with the launcher's
 * intent filter. The names are outside the app's package, so Clone app leaves them as they are and the extension
 * (extensions/shared settings/AppIcon.java, which has the same names) finds them in a clone too.
 */
private const val LURK_ENTRY = "io.github.jordanwoodson.extension.shared.settings.LurkIcon"
private const val ORIGINAL_ENTRY = "io.github.jordanwoodson.extension.shared.settings.OriginalIcon"

/**
 * The choice between the two entries, the same in every app. Changing it enables the chosen entry and then
 * disables the other (AppIcon.java). Lurk's icon by default, as without the choice.
 */
private val appIconSetting
    get() = ChoiceSetting(
        "app_icon",
        "App icon",
        "The icon the launcher shows for the app. The launcher can take a moment to update, and some launchers " +
            "remove the app's shortcut from the home screen when it changes. Does nothing on a root mount install.",
        Section.INTERFACE,
        default = "0",
        choices = listOf("Lurk" to "0", "Original" to "1"),
    )

/**
 * The body of an app's "Lurk icon" patch: installs the app's [LurkApp.icon] and moves the launcher entry to two
 * activity-aliases of the launcher activity, one with Lurk's icon (enabled) and one with the app's own (disabled),
 * which the App icon choice in Lurk settings switches between. [settingsPatch] is the app's settings patch: the
 * choice is one of its settings, and the extension it starts applies the choice.
 */
internal fun ResourcePatchBuilder.lurkIcon(app: LurkApp, settingsPatch: BytecodePatch) {
    compatibleWith(app.compatibility)
    dependsOn(settingsPatch)

    execute {
        val original = document(MANIFEST).use { it.launcherIcon(app) }
        val icons = with(app.icon) { install(app, original) }
        document(MANIFEST).use { it.addLauncherEntries(app, icons) }
        app.settings.add(appIconSetting)
    }
}

/** The launcher activity's icon as the manifest names it: the activity's own if it has one, else the app's. */
private fun Document.launcherIcon(app: LurkApp): IconResources {
    val application = getElementsByTagName("application").item(0) as Element
    val owner = application.launcherActivity(app).takeIf { it.hasAttribute("android:icon") } ?: application
    val icon = owner.getAttribute("android:icon").ifEmpty {
        throw PatchException("${app.name}: the launcher has no icon in the manifest")
    }
    return IconResources(icon, owner.getAttribute("android:roundIcon").ifEmpty { null })
}

/**
 * Moves the launcher activity's MAIN/LAUNCHER intent filter to two new aliases of it, Lurk's (enabled) and the
 * original (disabled). Its other intent filters (links) stay on the activity, which keeps its name, so explicit
 * intents, links and tasks still reach it whichever entry is enabled.
 */
private fun Document.addLauncherEntries(app: LurkApp, icons: InstalledIcons) {
    val packageName = documentElement.getAttribute("package")
    val application = getElementsByTagName("application").item(0) as Element
    val launcher = application.launcherActivity(app)
    val filters = launcher.childElements("intent-filter").filter { it.isLauncherFilter() }
    filters.forEach { launcher.removeChild(it) }
    // A launcher reads static shortcuts from the launcher activity, which is now the alias.
    val shortcuts = launcher.childElements("meta-data").filter { it.getAttribute("android:name") == "android.app.shortcuts" }
    // Fully qualified: Clone app changes the package, and a relative name would then name a class that doesn't exist.
    val target = launcher.getAttribute("android:name").let { name ->
        when {
            name.startsWith('.') -> packageName + name
            '.' !in name -> "$packageName.$name"
            else -> name
        }
    }
    listOf(Triple(LURK_ENTRY, icons.lurk, true), Triple(ORIGINAL_ENTRY, icons.original, false)).forEach { (name, icon, enabled) ->
        // After the activity, as Android requires of an alias. Without a label it shows the app's (Change app name).
        application.appendChild(
            createElement("activity-alias").apply {
                setAttribute("android:name", name)
                setAttribute("android:targetActivity", target)
                setAttribute("android:enabled", enabled.toString())
                setAttribute("android:exported", "true")
                setAttribute("android:icon", icon.icon)
                icon.roundIcon?.let { setAttribute("android:roundIcon", it) }
                (filters + shortcuts).forEach { appendChild(it.cloneNode(true)) }
            },
        )
    }
}

/** The one activity the launcher starts (MAIN/LAUNCHER). */
private fun Element.launcherActivity(app: LurkApp): Element {
    val launchers = childElements().filter { element ->
        element.tagName in setOf("activity", "activity-alias") &&
            element.childElements("intent-filter").any { it.isLauncherFilter() }
    }
    val found = launchers.joinToString { "${it.tagName} ${it.getAttribute("android:name")}" }.ifEmpty { "none" }
    return launchers.singleOrNull()?.takeIf { it.tagName == "activity" } ?: throw PatchException(
        "${app.name}: expected one launcher activity, found $found. This patch targets ${app.name} " +
            "${app.version}; recheck the manifest before updating compatibility.",
    )
}

private fun Element.isLauncherFilter(): Boolean =
    childElements("action").any { it.getAttribute("android:name") == "android.intent.action.MAIN" } &&
        childElements("category").any { it.getAttribute("android:name") == "android.intent.category.LAUNCHER" }
