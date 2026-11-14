package mightymich.morphe.patches.com.piriform.ccleaner

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * Unlocks CCleaner Premium / Pro features.
 *
 * Strategy (resilient to R8 method-name obfuscation):
 * 1. Force AclLicenseInfo isPremium/isActive boolean getter → true
 * 2. Force PremiumServiceImpl premium checks → true
 *
 * Class names (AclLicenseInfo, PremiumServiceImpl) are stable (not obfuscated).
 * Method names are Unicode-obfuscated, so we match by signature + structure.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks CCleaner Premium / Pro features (Ultimate Multi + Lifetime style).",
    default = true
) {
    compatibleWith(CCleanerCompatibility.CCLEANER)

    val licenseIsPremiumFingerprint = Fingerprint(
        definingClass = "Lcom/avast/cleaner/billing/api/AclLicenseInfo;",
        returnType = "Z",
        parameters = emptyList(),
        custom = { method, _ ->
            val insns = method.implementation?.instructions ?: return@Fingerprint false
            insns.count() <= 4 &&
                insns.any { it.toString().contains("iget-boolean") }
        }
    )

    val premiumServiceIsPremiumFingerprint = Fingerprint(
        definingClass = "Lcom/avast/android/cleaner/subscription/premiumService/PremiumServiceImpl;",
        returnType = "Z",
        parameters = emptyList(),
        custom = { method, _ ->
            val insns = method.implementation?.instructions ?: return@Fingerprint false
            insns.any {
                it.toString().contains("AclLicenseInfo") ||
                    it.toString().contains("StateFlow")
            }
        }
    )

    val premiumServiceSecondaryFingerprint = Fingerprint(
        definingClass = "Lcom/avast/android/cleaner/subscription/premiumService/PremiumServiceImpl;",
        returnType = "Z",
        parameters = emptyList(),
        custom = { method, _ ->
            val insns = method.implementation?.instructions ?: return@Fingerprint false
            insns.any {
                it.toString().contains("AclProductType") ||
                    it.toString().contains("CCA_MULTI")
            }
        }
    )

    execute {
        val licenseMethod = licenseIsPremiumFingerprint.method
            ?: throw PatchException(
                "Could not find AclLicenseInfo boolean premium getter (iget-boolean)."
            )
        licenseMethod.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        val isPremiumMethod = premiumServiceIsPremiumFingerprint.method
            ?: throw PatchException(
                "Could not find PremiumServiceImpl isPremium check."
            )
        isPremiumMethod.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        try {
            val secondary = premiumServiceSecondaryFingerprint.method
            secondary.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        } catch (_: Exception) {
        }
    }
}
