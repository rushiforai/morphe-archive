package app.noam.patches.spotify.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * The method that builds the settings section containing the app-appearance rows.
 *
 * Spotify obfuscates every settings class, but the row ids are plain strings that have been stable
 * across releases, so they are what the patch anchors on. Everything the patch needs after that —
 * the row class, the accessor classes and the list builder — is read out of the matched method.
 */
internal object SettingsSectionFingerprint : Fingerprint(
    filters = listOf(
        string("appLanguage"),
        string(ANCHOR_ROW_ID),
    ),
)


/**
 * Builds the main settings menu.
 *
 * Its entries are collected into a list which is then converted for display; injecting just before
 * that conversion is what puts the Morphe row among them. Anchored on a settings page id, which is a
 * plain string and so unaffected by obfuscation.
 */
internal object MainSettingsMenuFingerprint : Fingerprint(
    returnType = "L",
    filters = listOf(
        string("notificationsPage"),
    ),
)
