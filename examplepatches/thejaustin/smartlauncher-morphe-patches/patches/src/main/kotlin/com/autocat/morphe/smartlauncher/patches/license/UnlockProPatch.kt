package com.autocat.morphe.smartlauncher.patches.license

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.autocat.morphe.smartlauncher.shared.Constants

object PurchasableItemFingerprint : Fingerprint(
    strings = listOf("PurchasableItem(activationString="),
)

object LicenseStatusFingerprint : Fingerprint(
    strings = listOf("LicenseStatus(hasSL3ProLicense="),
)

object PremiumManagerFingerprint : Fingerprint(
    strings = listOf("onPremiumLicenseEnabled(Landroid/content/Context;Z)V"),
)

/**
 * Unlocks Smart Launcher Pro and Feature Pack features.
 * When an APK is patched with custom modifications, its signing certificate changes,
 * preventing Google Play Billing from verifying previously purchased in-app licenses.
 * This patch restores and permanently activates Pro & Premium functionality.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro features",
    description = "Restores and unlocks Pro and Premium features when Google Play Billing verification is unavailable due to modified APK signatures.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // 1. Patch PurchasableItem
        val purchasableItemMatch = PurchasableItemFingerprint.matchOrNull()
            ?: throw PatchException("Could not find PurchasableItem class")
        val purchasableClass = purchasableItemMatch.classDef

        // Patch isPurchased() -> boolean method taking no parameters
        val isPurchasedMethod = purchasableClass.methods.firstOrNull {
            it.returnType == "Z" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("Could not find isPurchased method in PurchasableItem")

        isPurchasedMethod.removeInstructions(0, isPurchasedMethod.implementation!!.instructions.count())
        isPurchasedMethod.addInstructions(
            0,
            """
            const/4 v0, 0x1
            return v0
            """.trimIndent(),
        )

        // Patch setPurchased(Context, boolean) -> force boolean param to true
        val setPurchasedMethod = purchasableClass.methods.firstOrNull {
            it.returnType == "V" &&
                it.parameterTypes.size == 2 &&
                it.parameterTypes[0] == "Landroid/content/Context;" &&
                it.parameterTypes[1] == "Z"
        }
        if (setPurchasedMethod != null) {
            val regCount = setPurchasedMethod.implementation!!.registerCount
            val boolParamReg = "v${regCount - 1}"
            setPurchasedMethod.addInstruction(0, "const/4 $boolParamReg, 0x1")
        }

        // 2. Patch LicenseStatus
        val licenseStatusMatch = LicenseStatusFingerprint.matchOrNull()
            ?: throw PatchException("Could not find LicenseStatus class")
        val licenseStatusClass = licenseStatusMatch.classDef

        val initMethod = licenseStatusClass.methods.firstOrNull {
            it.name == "<init>" &&
                it.parameterTypes.size == 2 &&
                it.parameterTypes[0] == "Z" &&
                it.parameterTypes[1] == "Z"
        } ?: throw PatchException("Could not find LicenseStatus(ZZ) constructor")

        val booleanFields = licenseStatusClass.fields.filter { it.type == "Z" }
        val fieldA = booleanFields.getOrNull(0)?.name ?: "a"
        val fieldB = booleanFields.getOrNull(1)?.name ?: "b"
        val licenseStatusType = licenseStatusClass.type

        initMethod.removeInstructions(0, initMethod.implementation!!.instructions.count())
        initMethod.addInstructions(
            0,
            """
            invoke-direct {v0}, Ljava/lang/Object;-><init>()V
            const/4 v1, 0x1
            iput-boolean v1, v0, $licenseStatusType->$fieldA:Z
            const/4 v2, 0x1
            iput-boolean v2, v0, $licenseStatusType->$fieldB:Z
            return-void
            """.trimIndent(),
        )

        // 3. Patch PremiumManager
        val premiumManagerMatch = PremiumManagerFingerprint.matchOrNull()
            ?: throw PatchException("Could not find PremiumManager class")
        val premiumClass = premiumManagerMatch.classDef

        // Force all boolean checks (isPro, isPremium, hasLifetimeOrSubscription) to return true
        val booleanMethods = premiumClass.methods.filter {
            it.returnType == "Z" && it.parameterTypes.isEmpty()
        }
        for (m in booleanMethods) {
            m.removeInstructions(0, m.implementation!!.instructions.count())
            m.addInstructions(
                0,
                """
                const/4 v0, 0x1
                return v0
                """.trimIndent(),
            )
        }

        // Force getLicenseStatus() to return LicenseStatus(true, true)
        val getLicenseStatusMethod = premiumClass.methods.firstOrNull {
            it.returnType == licenseStatusType && it.parameterTypes.isEmpty()
        }
        if (getLicenseStatusMethod != null) {
            getLicenseStatusMethod.removeInstructions(0, getLicenseStatusMethod.implementation!!.instructions.count())
            getLicenseStatusMethod.addInstructions(
                0,
                """
                new-instance v0, $licenseStatusType
                const/4 v1, 0x1
                const/4 v2, 0x1
                invoke-direct {v0, v1, v2}, $licenseStatusType-><init>(ZZ)V
                return-object v0
                """.trimIndent(),
            )
        }
    }
}
