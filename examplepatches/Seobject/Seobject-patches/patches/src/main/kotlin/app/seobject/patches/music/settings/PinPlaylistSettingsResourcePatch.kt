package app.seobject.patches.music.settings

import app.morphe.patcher.patch.resourcePatch

private val preferenceFiles = listOf(
    "res/xml/morphe_prefs.xml",
    "res/xml/morphe_prefs_icons.xml",
    "res/xml/morphe_prefs_icons_bold.xml",
)

private val emptyMorphePreferenceRoot = """
    <?xml version="1.0" encoding="utf-8"?>
    <PreferenceScreen
        xmlns:android="http://schemas.android.com/apk/res/android"
        xmlns:app="http://schemas.android.com/apk/res-auto"
        android:key="morphe_settings_root_screen_sort_by_key">
    </PreferenceScreen>
""".trimIndent() + "\n"

/**
 * Ensures the XML roots consumed by Morphe's preference fragment exist.
 *
 * Player and the single feature switch are materialized at runtime by the
 * extension after the preference XML has been inflated. Keeping this patch to
 * canonical root-file creation makes it independent of patch execution and
 * finalization order.
 */
internal val pinPlaylistSettingsResourcePatch = resourcePatch(
    description = "Provides standalone preference roots for Pin playlists."
) {
    execute {
        preferenceFiles.forEach { preferencePath ->
            val preferenceFile = get(preferencePath)
            if (preferenceFile.exists()) return@forEach

            preferenceFile.parentFile.mkdirs()
            preferenceFile.writeText(emptyMorphePreferenceRoot)
        }
    }
}
