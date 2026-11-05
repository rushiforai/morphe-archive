package app.template.patches.brave.misc.dns

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// Chromium's PolicyProvider.notifySettingsAvailable(Bundle): every policy provider (app
// restrictions on Android) hands its policy bundle to CombinedPolicyProvider through it, which
// converts each key to a native policy. R8 renames and merges the class (1.98.63: bbf.a, with
// onSettingsAvailable inlined), so it is found by its log line and shape.
internal object PolicyProviderNotifySettingsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(string("#notifySettingsAvailable()", StringComparisonType.STARTS_WITH)),
)
