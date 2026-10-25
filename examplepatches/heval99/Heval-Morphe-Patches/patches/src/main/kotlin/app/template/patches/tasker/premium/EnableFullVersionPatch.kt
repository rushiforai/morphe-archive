package app.template.patches.tasker.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TASKER
import app.morphe.util.returnEarly
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags

@Suppress("unused")
val enableFullVersionPatch = bytecodePatch(
    name = "Enable Full Version",
    description = "Unlocks the full version."
) {
    compatibleWith(COMPATIBILITY_TASKER)

    execute {
        // 1. LVL / licence-server response mapping: every status getter reports Licensed.
        val statusGetters = LicenseResponseFingerprint.classDef.methods.filter {
            it.returnType == LICENSE_STATUS && it.parameterTypes.isEmpty() && it.implementation != null
        }
        if (statusGetters.isEmpty()) throw PatchException("LicenseStatus getter not found")
        statusGetters.forEach {
            it.addInstructionsChecked(
                0,
                """
                    sget-object v0, $LICENSE_STATUS->Licensed:$LICENSE_STATUS
                    return-object v0
                """.trimIndent()
            )
        }

        // 2. Local "is licensed" checks: cached status and its (Context) overload.
        CachedLicenseFingerprint.method.returnEarly(true)
        FreshLicenseFingerprint.method.returnEarly(true)

        // 3. Static facade over the (Context) overload, used by the task executor.
        Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
            returnType = "Z",
            parameters = listOf("Landroid/content/Context;"),
            filters = listOf(methodCall(FreshLicenseFingerprint.originalMethod)),
        ).method.returnEarly(true)

        // 4. Startup check result: treat any LicenseStatus (including the Unlicensed fallback
        // when Play cannot be reached) as licensed, so no "not licensed" notification or exit.
        LicenseResultFingerprint.method.returnEarly(true)
    }
}
