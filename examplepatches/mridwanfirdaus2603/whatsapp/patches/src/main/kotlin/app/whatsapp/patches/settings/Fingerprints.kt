package app.whatsapp.patches.settings

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for locating WhatsApp's main Settings Activity.
 *
 * WhatsApp uses custom Settings activities (Settings / SettingsTabActivity)
 * rather than AndroidX PreferenceFragmentCompat.
 */

object SettingsTabOnResumeFingerprint : Fingerprint(
    definingClass = "/SettingsTabActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

object SettingsTabOnCreateFingerprint : Fingerprint(
    definingClass = "/SettingsTabActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

object SettingsOnResumeFingerprint : Fingerprint(
    definingClass = "/Settings;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

object SettingsOnCreateFingerprint : Fingerprint(
    definingClass = "/Settings;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
