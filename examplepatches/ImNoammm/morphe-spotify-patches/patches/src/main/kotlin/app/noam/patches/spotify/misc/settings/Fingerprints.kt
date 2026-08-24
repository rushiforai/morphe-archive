package app.noam.patches.spotify.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

internal object SettingsSectionFingerprint : Fingerprint(
    filters = listOf(
        string("appLanguage"),
        string(ANCHOR_ROW_ID),
    ),
)

internal object MainSettingsMenuFingerprint : Fingerprint(
    returnType = "L",
    filters = listOf(
        string("notificationsPage"),
    ),
)
