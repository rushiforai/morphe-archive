package app.template.patches.tasker.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TASKER
import app.morphe.util.returnEarly

@Suppress("unused")
val enableFullVersionPatch = bytecodePatch(
    name = "Enable Full Version",
    description = "Bypasses the Play license check so the paid app runs as licensed."
) {
    compatibleWith(COMPATIBILITY_TASKER)

    execute {
        // LVL / licence-server response mapping: always report Licensed.
        LicenseStatusFingerprint.methodOrNull?.addInstructions(
            0,
            """
                sget-object v0, Lcom/joaomgcd/taskerm/licensing/LicenseStatus;->Licensed:Lcom/joaomgcd/taskerm/licensing/LicenseStatus;
                return-object v0
            """.trimIndent()
        )

        // Local "is licensed" checks: cached status and fresh check.
        CachedLicenseFingerprint.methodOrNull?.returnEarly(true)
        FreshLicenseFingerprint.methodOrNull?.returnEarly(true)
        StaticLicenseFingerprint.methodOrNull?.returnEarly(true)
    }
}
