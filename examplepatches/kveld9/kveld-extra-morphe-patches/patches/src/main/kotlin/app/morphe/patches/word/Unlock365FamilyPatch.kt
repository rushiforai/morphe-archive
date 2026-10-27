package app.morphe.patches.word

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants.COMPATIBILITY_WORD
import app.morphe.patches.shared.clearTryBlocks
import app.morphe.patches.shared.ensureRegisterCount
import app.morphe.patches.shared.replaceWithReturnVoid
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val wordUnlock365FamilyPatch = bytecodePatch(
    name = "Unlock 365 Family",
    description = "Unlocks Microsoft 365 Family subscription features locally.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WORD)

    execute {
        var patched = 0

        getLicensingStateFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, """
                sget-object v0, Lcom/microsoft/office/licensing/LicensingState;->ConsumerPremium:Lcom/microsoft/office/licensing/LicensingState;
                return-object v0
            """)
            patched++
        }
        licenseSessionStateFingerprint.method.apply {
            addInstructions(0, """
                const/4 p1, 0x0
                const/4 p3, 0x6
            """)
            patched++
        }

        hasFamilyPlanFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            patched++
        }
        hasPersonalPlanFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            patched++
        }
        hasPremiumPlanFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            patched++
        }

        licensingFGFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(2)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, """
                const/4 v0, 0x0
                new-array v0, v0, [Lcom/microsoft/office/licensing/OlsEntitlement;
                new-instance v1, Lcom/microsoft/office/licensing/LicenseInfo;
                invoke-direct {v1, v0}, Lcom/microsoft/office/licensing/LicenseInfo;-><init>([Lcom/microsoft/office/licensing/OlsEntitlement;)V
                return-object v1
            """)
            patched++
        }

        subscriptionStatusYFingerprint.method.replaceWithReturnVoid()
        patched++

        isPremiumPlanUpsellEnabledFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            patched++
        }
        isEnterpriseViewOLSCheckEnabledFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            patched++
        }

        subscriptionDataIsTrialFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            patched++
        }

        licenseStatusIsPremiumFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            patched++
        }

        accountProfileInfoHasProfileFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            patched++
        }

        storageQuotaCheckFingerprint.method.apply {
            clearTryBlocks()
            ensureRegisterCount(1)
            implementation?.let { removeInstructions(0, it.instructions.count()) }
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
            patched++
        }

        accountSwitcherRunnableFingerprint.apply {
            val getActiveIdentityIdx = instructionMatches[1].index
            val moveResultIdx = getActiveIdentityIdx + 1
            val moveResultIns = method.implementation?.instructions?.elementAtOrNull(moveResultIdx)
            val reg = (moveResultIns as? OneRegisterInstruction)?.registerA
                ?: error("[Unlock 365 Family] Could not extract register from instruction at index $moveResultIdx in ${method.definingClass}->${method.name}")
            method.addInstructionsWithLabels(moveResultIdx + 1, """
                if-nez v$reg, :has_identity
                return-void
                :has_identity
                nop
            """)
            patched++
        }

        println("[Unlock 365 Family] Applied $patched hooks -> Microsoft 365 Family features unlocked.")
    }
}
