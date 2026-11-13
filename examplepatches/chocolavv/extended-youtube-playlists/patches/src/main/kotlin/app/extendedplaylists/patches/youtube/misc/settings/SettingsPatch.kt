package app.extendedplaylists.patches.youtube.misc.settings

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.readXml
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.resourceXmlOrNull
import java.io.InputStream
import java.nio.file.Files

/**
 * The settings patch of Morphe Patches merges this file of add-on bundles into the Morphe
 * settings and then deletes it. Add-on bundles cannot use the preference classes of that bundle.
 */
private const val ADD_ON_PREFERENCES = "morphe_addon_prefs.xml"

/** Folders of the bundled strings: English first, then the translations. */
private val STRING_FOLDERS = listOf("values", "values-ru")

private fun bundled(path: String): InputStream =
    object {}.javaClass.classLoader.getResourceAsStream("settings/$path")
        ?: throw IllegalArgumentException("Missing bundled resource: settings/$path")

/** Adds the preferences of this bundle to the Morphe settings, and their strings to the app. */
internal val settingsPatch = patch {
    execute {
        STRING_FOLDERS.forEach { folder ->
            bundled("$folder/strings.xml").use { readXml(it) }.use { source ->
                resourceXml("res/$folder/strings.xml", copy = false).use { app ->
                    source.root.children.forEach { app.root.appendCopy(it) }
                }
            }
        }

        // Another add-on may have declared its preferences already.
        val declared = resourceXmlOrNull(ADD_ON_PREFERENCES)
        if (declared == null) {
            bundled(ADD_ON_PREFERENCES).use { Files.copy(it, resourceFile(ADD_ON_PREFERENCES, false).toPath()) }
        } else declared.use { target ->
            bundled(ADD_ON_PREFERENCES).use { readXml(it) }.use { source ->
                source.root.children.forEach { target.root.appendCopy(it) }
            }
        }
    }
}
