/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.settings

import app.crimera.patches.settings.SettingStrings
import app.crimera.patches.settings.SettingsCategory
import app.crimera.patches.settings.SettingsPatchConfig
import app.crimera.patches.settings.ToggleSettingDefinition
import app.crimera.patches.settings.settingsToggle
import app.morphe.patcher.patch.BytecodePatchBuilder

/**
 * Instagram's binding of the shared settings DSL (`piko-patches-library`): its base patch, ID and
 * string naming rules, and error label. Every ID and default declared here has a twin in the
 * extension's `Settings` class, which reads the value at runtime.
 */
internal val INSTAGRAM_SETTINGS_CONFIG: SettingsPatchConfig by lazy {
    SettingsPatchConfig(
        basePatch = instagramSettingsPatch,
        idPattern = Regex("instagram\\.[a-z0-9._-]+"),
        resourceNamePattern = Regex("piko_ig_[a-z0-9_]+"),
        label = "Instagram",
    )
}

internal object Categories {
    val ADS =
        SettingsCategory(
            id = "instagram.ads",
            titleResourceName = "piko_ig_category_ads_title",
            summaryResourceName = "piko_ig_category_ads_summary",
            iconResourceName = "instagram_shield_outline_24",
            order = 100,
        )

    val DOWNLOADS =
        SettingsCategory(
            id = "instagram.downloads",
            titleResourceName = "piko_ig_category_downloads_title",
            summaryResourceName = "piko_ig_category_downloads_summary",
            iconResourceName = "instagram_download_outline_24",
            order = 200,
        )

    val GHOST =
        SettingsCategory(
            id = "instagram.ghost",
            titleResourceName = "piko_ig_category_ghost_title",
            summaryResourceName = "piko_ig_category_ghost_summary",
            iconResourceName = "instagram_eye_off_outline_24",
            order = 300,
        )
}

internal fun BytecodePatchBuilder.instagramToggle(
    id: String,
    category: SettingsCategory,
    strings: SettingStrings,
    order: Int = 0,
    defaultValue: Boolean,
): ToggleSettingDefinition =
    settingsToggle(INSTAGRAM_SETTINGS_CONFIG, id, category, strings, order, defaultValue)
