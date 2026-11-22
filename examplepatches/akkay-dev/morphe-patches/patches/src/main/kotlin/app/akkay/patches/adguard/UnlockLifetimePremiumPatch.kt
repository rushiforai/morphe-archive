package app.akkay.patches.adguard

import app.akkay.patches.shared.Constants.COMPATIBILITY_ADGUARD
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

@Suppress("unused")
val unlockLifetimePremiumPatch = patch(
    name = "Unlock Lifetime Premium",
    description = "Unlocks AdGuard Lifetime Premium license status across all features without contacting the license backend.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ADGUARD)

    execute {
        // Resolve obfuscated PlusState.PaidLicense types dynamically from stable fingerprints.
        val paidLicenseClass = PaidLicenseToStringFingerprint.classDef
        val paidLicenseType = paidLicenseClass.type
        val plusStateInterface = paidLicenseClass.interfaces.first()
        val paidLicenseCtor = paidLicenseClass.methods.first {
            it.name == "<init>" && it.parameterTypes.size == 6
        }
        val licenseTypeEnum = paidLicenseCtor.parameterTypes[1].toString()
        val licenseDurationInterface = paidLicenseCtor.parameterTypes[2].toString()

        // Resolve PlusState.LicenseDuration.Lifetime singleton and its static instance field.
        val lifetimeClass = LifetimeDurationFingerprint.classDef
        val lifetimeType = lifetimeClass.type
        val lifetimeInstanceField = lifetimeClass.staticFields.first { it.type == lifetimeType }.name

        val constructPaidLicenseSmali = """
            new-instance v0, $paidLicenseType
            const-string v1, "ADGUARD-LIFETIME"
            sget-object v2, $licenseTypeEnum->Personal:$licenseTypeEnum
            sget-object v3, $lifetimeType->$lifetimeInstanceField:$lifetimeType
            const/4 v4, 0x1
            const/16 v5, 0x9
            const/4 v6, 0x0
            invoke-direct/range {v0 .. v6}, $paidLicenseType-><init>(Ljava/lang/String;$licenseTypeEnum${licenseDurationInterface}IILjava/lang/String;)V
        """.trimIndent()

        // 1. Short-circuit backend license status fetch to return Lifetime PaidLicense directly.
        BackendSupporterFetchStateFingerprint.method.addInstructions(
            0,
            """
                $constructPaidLicenseSmali
                return-object v0
            """.trimIndent()
        )

        // 2. Seed PlusManagerImpl._state in its constructor so offline / cold-start reads
        //    immediately see Lifetime PaidLicense before any background sync runs.
        val plusManagerClass = PlusManagerInitFingerprint.classDef
        val plusManagerType = plusManagerClass.type
        val stateField = plusManagerClass.instanceFields.first { it.type == plusStateInterface }
        val initMethod = PlusManagerInitFingerprint.method
        val returnVoidIndex = initMethod.implementation!!.instructions.lastIndex

        initMethod.addInstructions(
            returnVoidIndex,
            """
                $constructPaidLicenseSmali
                iput-object v0, p0, $plusManagerType->${stateField.name}:$plusStateInterface
            """.trimIndent()
        )
    }
}
