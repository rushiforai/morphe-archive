/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2029
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-14
 */

package app.morphe.patches.music.layout.hide.settingsmenu

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

private const val SETTINGS_HEADERS_FRAGMENT_CLASS =
    "Lcom/google/android/apps/youtube/music/settings/fragment/SettingsHeadersFragment;"

/**
 * YT Music top-level Settings fragment. Capture the native fragment field read before its peer
 * and parameter registers are reused, so settings hooks can retain the actual fragment until exit.
 */
internal object SettingsHeadersOnCreatePreferencesFingerprint : Fingerprint(
    definingClass = SETTINGS_HEADERS_FRAGMENT_CLASS,
    name = "onCreatePreferences",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = SETTINGS_HEADERS_FRAGMENT_CLASS
        )
    )
)
