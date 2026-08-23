package app.noam.patches.spotify.shared

internal object Constants {
    const val SPOTIFY_PACKAGE = "com.spotify.music"

    const val EXTENSION_PACKAGE = "Lapp/noam/extension/spotify"

    const val SETTINGS_TILE_CLASS = "$EXTENSION_PACKAGE/settings/SettingsTile;"
    const val LOCAL_SERVER_HOOK_CLASS = "$EXTENSION_PACKAGE/localserver/LocalServerHook;"
    const val BEAUTIFUL_LYRICS_CLASS = "$EXTENSION_PACKAGE/lyrics/BeautifulLyrics;"
    const val HOME_PINS_CLASS = "$EXTENSION_PACKAGE/home/HomePins;"
    const val SETTINGS_ACTIVITY = "app.noam.extension.spotify.settings.MorpheSettingsActivity"
    const val FILE_PROVIDER = "app.noam.extension.spotify.localserver.ServerFileProvider"

    /** The scheme the Morphe settings row navigates to. */
    const val SETTINGS_SCHEME = "morphe"
}
