package app.morphed.patches.twitch.misc.log

import app.morphe.patcher.Fingerprint

/**
 * Fills the Settings, Preferences screen (theme, background audio, autoplay, feed and popout switches).
 */
object PreferencesScreenFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("user_theme", "mute_feed_by_default_20.5"),
)

/**
 * Handles a flipped switch on the Preferences screen: (switch row, checked).
 */
object PreferencesSwitchFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Z"),
    strings = listOf("mute_feed_by_default_20.5", "block_whispers_from_strangers_enabled"),
)
