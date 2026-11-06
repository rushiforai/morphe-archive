package app.swiftbackup.patches.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/** Settings construction contains both hidden controls; pin the class/name to the verified 5.1.0 layout. */
object SettingsTransferVisibilityFingerprint : Fingerprint(
    definingClass = "Lpa7;",
    name = "l",
    parameters = listOf(),
    returnType = "V",
    filters = listOf(string("export_settings"), string("import_settings"))
)

/** The shared preference handler separately checks anonymous status before opening either file picker. */
object SettingsTransferClickFingerprint : Fingerprint(
    definingClass = "Lpa7;",
    name = "d",
    parameters = listOf("Landroidx/preference/Preference;"),
    returnType = "Z",
    filters = listOf(string("export_settings"))
)
