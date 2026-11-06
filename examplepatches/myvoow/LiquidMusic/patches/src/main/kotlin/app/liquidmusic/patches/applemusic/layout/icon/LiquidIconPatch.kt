/*
 * LiquidMusic - Liquid Glass for Apple Music (patches compatible with Morphe).
 * Licensed under the GNU General Public License v3.0, see LICENSE.
 */
package app.liquidmusic.patches.applemusic.layout.icon

import app.liquidmusic.patches.applemusic.shared.Constants.COMPATIBILITY_APPLE_MUSIC
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.io.File

/** Where the icon files are, in the patches file. Rendered by tools/icon/render.js. */
private const val ICON_RESOURCES = "liquidmusic/icon"

/** Loads files from the patches file itself (inside execute, javaClass is the patcher's context). */
private object IconFiles

private val DENSITIES = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")

@Suppress("unused")
val liquidIconPatch = resourcePatch(
    name = "Liquid Glass icon",
    description = "Replaces the app icon with the LiquidMusic icon: a drop of glass over the colors. " +
        "It also has a themed icon for Android 13+.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_APPLE_MUSIC)

    execute {
        // Decode the launcher icons so their folders exist with their decoded names.
        decode("res/mipmap*/ic_launcher*")
        val res = get("res")
        val folders = res.listFiles { file -> file.isDirectory }.orEmpty()

        // The folder without qualifiers, or with only a version one ("mipmap-hdpi-v4"), but never
        // a higher version than the adaptive icon's: drawable-v31 would not exist on Android 8-11.
        fun folderFor(prefix: String): File =
            folders.firstOrNull { it.name == prefix }
                ?: folders.firstOrNull { it.name.matches(Regex("${Regex.escape(prefix)}-v([0-9]+)")) && it.name.substringAfterLast("-v").toInt() <= 26 }
                ?: res.resolve(prefix).apply { mkdirs() }

        fun copy(resource: String, target: File) {
            val stream = IconFiles::class.java.classLoader.getResourceAsStream("$ICON_RESOURCES/$resource")
                ?: throw PatchException("Missing icon file in the patches: $resource")
            stream.use { input -> target.outputStream().use { input.copyTo(it) } }
        }

        // Raster icons: the full-bleed layer of the adaptive icon, and the legacy icons that
        // android:roundIcon and older launchers use.
        for (density in DENSITIES) {
            val folder = folderFor("mipmap-$density")
            for (name in listOf("liquidmusic_icon_background.png", "ic_launcher.png", "ic_launcher_round.png")) {
                copy("mipmap-$density/$name", folder.resolve(name))
            }
        }

        copy("drawable/liquidmusic_icon_monochrome.xml", folderFor("drawable").resolve("liquidmusic_icon_monochrome.xml"))

        // The adaptive icon, in place of Apple's.
        val adaptive = folders.filter { it.name.startsWith("mipmap-anydpi") }
            .map { it.resolve("ic_launcher.xml") }
            .filter(File::isFile)
        if (adaptive.isEmpty()) throw PatchException("Could not find the adaptive icon of Apple Music")
        adaptive.forEach { copy("mipmap-anydpi-v26/ic_launcher.xml", it) }
    }
}
