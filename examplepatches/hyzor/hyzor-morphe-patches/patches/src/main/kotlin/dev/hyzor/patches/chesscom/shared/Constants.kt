package dev.hyzor.patches.chesscom.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val CHESSCOM_PACKAGE = "com.chess"

    // The version the fingerprints were written against (versionCode 280075).
    const val CHESSCOM_VERSION = "4.10.18-googleplay"

    // Under test against the same fingerprints (versionCode 280100).
    const val CHESSCOM_VERSION_41023 = "4.10.23-googleplay"

    val COMPATIBILITY = Compatibility(
        packageName = CHESSCOM_PACKAGE,
        name = "Chess.com",
        targets = listOf(
            AppTarget(version = CHESSCOM_VERSION),
            AppTarget(version = CHESSCOM_VERSION_41023),
        ),
    )


    const val EXTENSION_FILE = "extensions/chesscom.mpe"
    const val EXTENSION_PACKAGE = "Ldev/hyzor/extension/chesscom"

    const val UTILS = "$EXTENSION_PACKAGE/Utils;"
    const val FEATURES = "$EXTENSION_PACKAGE/Features;"
    const val SETTINGS_ACTIVITY = "dev.hyzor.extension.chesscom.settings.MorpheSettingsActivity"
    const val UPSELLS = "$EXTENSION_PACKAGE/upsell/Upsells;"
}
