package app.fakh.patches.jira

import app.fakh.patches.jira.shared.Constants.COMPATIBILITY_JIRA
import app.fakh.patches.shared.pairip.pairipLicenseCheckPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val licenseCheckPatch = bytecodePatch(
    name = "Disable Play license check",
    description = "Stops the Google Play license check from blocking the patched app with a \"Get this app from Play\" screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JIRA)
    category("Feature")
    dependsOn(pairipLicenseCheckPatch)
}
