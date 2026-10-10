/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/2691
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.shared.misc.settings

import app.morphe.patcher.patch.BytecodePatchContext
import app.tada.patches.shared.misc.settings.preference.ListPreference
import app.tada.patches.shared.misc.settingsmenu.PreferenceGroupFindPreferenceFingerprint
import app.tada.patches.shared.misc.settingsmenu.PreferenceSetTitleFingerprint

private const val EXTENSION_CLASS = "Lapp/morphe/extension/shared/patches/SettingsNamePatch;"

/**
 * Key of the TADa entry added to the app settings screen. The entry declares its name in XML,
 * so renaming it is only possible after it is inflated, by looking it up with this key.
 */
internal const val SETTINGS_NAME_PREFERENCE_KEY = "tada_settings_root"

internal fun customSettingsNamePreference() = ListPreference(
    key = "tada_settings_name",
    tag = "app.morphe.extension.shared.settings.preference.SettingsNamePreference"
)

/**
 * Renames the entry keyed [SETTINGS_NAME_PREFERENCE_KEY], and does nothing if the user
 * set no name of their own. All three registers must be free at the insertion point.
 *
 * @param getPreferenceScreen Instructions that leave the root PreferenceScreen in [screenRegister].
 */
context(patchContext: BytecodePatchContext)
internal fun customSettingsNameInstructions(
    getPreferenceScreen: String,
    screenRegister: Int,
    preferenceRegister: Int,
    nameRegister: Int
) = """
    invoke-static { }, $EXTENSION_CLASS->getCustomSettingsName()Ljava/lang/String;
    move-result-object v$nameRegister
    if-eqz v$nameRegister, :tada_settings_name_exit

    $getPreferenceScreen
    if-eqz v$screenRegister, :tada_settings_name_exit

    const-string v$preferenceRegister, "$SETTINGS_NAME_PREFERENCE_KEY"
    invoke-virtual { v$screenRegister, v$preferenceRegister }, ${PreferenceGroupFindPreferenceFingerprint.method}
    move-result-object v$preferenceRegister
    if-eqz v$preferenceRegister, :tada_settings_name_exit

    invoke-virtual { v$preferenceRegister, v$nameRegister }, ${PreferenceSetTitleFingerprint.method}

    :tada_settings_name_exit
    nop
"""
