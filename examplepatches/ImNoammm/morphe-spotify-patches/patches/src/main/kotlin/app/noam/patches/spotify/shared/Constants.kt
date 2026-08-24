package app.noam.patches.spotify.shared

internal object Constants {
    const val SPOTIFY_PACKAGE = "com.spotify.music"

    const val EXTENSION_PACKAGE = "Lapp/noam/extension/spotify"

    const val SETTINGS_TILE_CLASS = "$EXTENSION_PACKAGE/settings/SettingsTile;"
    const val LOCAL_SERVER_HOOK_CLASS = "$EXTENSION_PACKAGE/localserver/LocalServerHook;"
    const val HOME_PINS_CLASS = "$EXTENSION_PACKAGE/home/HomePins;"
    const val SETTINGS_ACTIVITY = "app.noam.extension.spotify.settings.MorpheSettingsActivity"
    const val FILE_PROVIDER = "app.noam.extension.spotify.localserver.ServerFileProvider"

    const val SETTINGS_SCHEME = "morphe"
}
