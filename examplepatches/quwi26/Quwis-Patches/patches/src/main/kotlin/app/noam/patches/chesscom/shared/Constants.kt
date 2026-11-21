package app.noam.patches.chesscom.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val CHESSCOM_PACKAGE = "com.chess"

    // Checked against the same fingerprints, with its own branches where 4.10.27 moved a class.
    const val CHESSCOM_VERSION_41027 = "4.10.27-googleplay"

    // First build with the Go Premium rebrand and the rewritten Puzzles hub, with its own branches
    // where those moved a class. Checked on a phone like 4.10.27.
    const val CHESSCOM_VERSION_41028 = "4.10.28-googleplay"

    val COMPATIBILITY = Compatibility(
        packageName = CHESSCOM_PACKAGE,
        name = "Chess.com",
        appIconColor = 0x69923E,
        targets = listOf(
            AppTarget(version = CHESSCOM_VERSION_41028),
            AppTarget(version = CHESSCOM_VERSION_41027),
        ),
    )

    // Patches that have not been ported to 4.10.28 yet keep the 4.10.27 target only.
    val COMPATIBILITY_41027 = Compatibility(
        packageName = CHESSCOM_PACKAGE,
        name = "Chess.com",
        appIconColor = 0x69923E,
        targets = listOf(AppTarget(version = CHESSCOM_VERSION_41027)),
    )

    const val EXTENSION_FILE = "extensions/chesscom.mpe"
    const val EXTENSION_PACKAGE = "Lapp/noam/extension/chesscom"

    const val UTILS = "$EXTENSION_PACKAGE/Utils;"
    const val FEATURES = "$EXTENSION_PACKAGE/Features;"
    const val SETTINGS_ACTIVITY = "app.noam.extension.chesscom.settings.MorpheSettingsActivity"
    const val UPSELLS = "$EXTENSION_PACKAGE/upsell/Upsells;"
}
