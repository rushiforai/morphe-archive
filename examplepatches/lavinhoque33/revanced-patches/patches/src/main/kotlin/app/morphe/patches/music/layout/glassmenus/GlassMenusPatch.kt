/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/5123
 *
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.patches.music.layout.glassmenus

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.shared.drawable.drawableColorHookPatch
import app.morphe.patches.shared.layout.glassmenus.GLASS_MENUS_DESCRIPTION
import app.morphe.patches.shared.layout.glassmenus.GLASS_MENUS_NAME
import app.morphe.patches.shared.layout.glassmenus.hasGlassMenusVersion
import app.morphe.patches.shared.layout.glassmenus.installGlassMenus
import app.morphe.patches.shared.mapping.resourceMappingPatch
import app.morphe.util.adoptChild

private const val GLASS_MENUS_KEY = "morphe_glass_menus"
private const val SEEK_BAR_TAG = "app.morphe.extension.shared.settings.preference.SeekBarPreference"

@Suppress("unused")
val glassMenusPatch = bytecodePatch(GLASS_MENUS_NAME, GLASS_MENUS_DESCRIPTION) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    dependsOn(sharedExtensionPatch, settingsPatch, drawableColorHookPatch, resourceMappingPatch)

    execute {
        // The stock 6.20.51 APK also has the legacy sheet, fragment and Litho paint targets.
        if (!hasGlassMenusVersion(COMPATIBILITY_YOUTUBE_MUSIC, forcedVersion = "6.20.51")) return@execute
        if (installGlassMenus()) addGlassMenusPreferences()
    }
}

private fun addGlassMenusPreferences() {
    val category = CategoryType.GENERAL.value
    ResourceUtils.addPreferenceCategory(category)
    ResourceUtils.editPreferenceCategory(category) {
        adoptChild(ResourceUtils.PREFERENCE_SCREEN_TAG_NAME) {
            setAttribute("android:key", "${GLASS_MENUS_KEY}_screen")
            setAttribute("android:title", "@string/${GLASS_MENUS_KEY}_screen_title")
            setAttribute("android:orderingFromXml", "true")

            adoptChild(ResourceUtils.SWITCH_PREFERENCE_TAG_NAME) {
                setAttribute("android:key", GLASS_MENUS_KEY)
                setAttribute("android:title", "@string/${GLASS_MENUS_KEY}_title")
                setAttribute("android:summary", "@string/${GLASS_MENUS_KEY}_summary")
                setAttribute("android:defaultValue", "false")
            }

            for (suffix in listOf("opacity", "blur", "dim")) {
                val key = "${GLASS_MENUS_KEY}_$suffix"
                adoptChild(SEEK_BAR_TAG) {
                    setAttribute("android:key", key)
                    setAttribute("android:title", "@string/${key}_title")
                    setAttribute("android:dependency", GLASS_MENUS_KEY)
                }
            }
        }
    }
}
