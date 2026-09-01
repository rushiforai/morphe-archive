package com.user.patches.medium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

val pairIpPatch = bytecodePatch(
    name = "Bypass Play Store Check",
    description = "Bypasses PairIP signature and license checks (Play Store version error).",
    default = true
) {
    compatibleWith(mediumCompatibility)

    execute {
        // Bypass SignatureCheck.verifyIntegrity
        val verifyIntegrityFingerprint = Fingerprint(
            name = "verifyIntegrity",
            returnType = "V",
            parameters = listOf("Landroid/content/Context;")
        )
        verifyIntegrityFingerprint.matchAllOrNull()?.forEach { match ->
            if (match.classDef.type == "Lcom/pairip/SignatureCheck;") {
                match.method.removeInstructions(0)
                match.method.addInstructions(0, "return-void")
            }
        }

        // Bypass LicenseClient.checkLicense and mock the check state
        val checkLicenseFingerprint = Fingerprint(
            name = "checkLicense",
            returnType = "V",
            parameters = listOf("Landroid/content/Context;")
        )
        checkLicenseFingerprint.matchAllOrNull()?.forEach { match ->
            if (match.classDef.type == "Lcom/pairip/licensecheck/LicenseClient;") {
                match.method.removeInstructions(0)
                match.method.addInstructions(0, """
                    sget-object v0, Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;->LOCAL_CHECK_OK:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                    sput-object v0, Lcom/pairip/licensecheck/LicenseClient;->licenseCheckState:Lcom/pairip/licensecheck/LicenseClient${'$'}LicenseCheckState;
                    return-void
                """)
            }
        }

        // Disable LicenseActivity entirely by finishing immediately in onStart
        val onStartFingerprint = Fingerprint(
            name = "onStart",
            returnType = "V",
            parameters = listOf()
        )
        onStartFingerprint.matchAllOrNull()?.forEach { match ->
            if (match.classDef.type == "Lcom/pairip/licensecheck/LicenseActivity;") {
                match.method.removeInstructions(0)
                match.method.addInstructions(0, """
                    move-object/from16 v0, p0
                    invoke-super {v0}, Landroid/app/Activity;->onStart()V
                    invoke-virtual {v0}, Landroid/app/Activity;->finish()V
                    return-void
                """)
            }
        }
    }
}
