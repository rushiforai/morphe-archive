package app.template.patches.ganbaru

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.shared.Constants.GANBARU_COMPATIBILITY
import app.template.patches.shared.returnEarlyBoolean

@Suppress("unused")
val ganbaruUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Ganbaru Method Premium",
    description = "Unlock all Paid features",
    default = true
) {
    compatibleWith(GANBARU_COMPATIBILITY)

    execute {
        listOf(
            GanbaruUserIsMemberFingerprint to true,
            GanbaruUserIsLiteMemberFingerprint to false,
            GanbaruUserIsLifetimeMemberFingerprint to true,
            GanbaruUserIsYearlyMemberFingerprint to true,
            GanbaruUserIsAffiliateMemberFingerprint to true,
            GanbaruUserIsSingleProgramMemberFingerprint to true,
            GanbaruUserIsTrialFingerprint to false,
            GanbaruProgramTagCheckerIsPurchasedFingerprint to true,
            GanbaruWorkoutsViewModelIsPremiumMemberFingerprint to true,
            GanbaruViewProgramIsPurchasedThisProgramFingerprint to true
        ).forEach { (fingerprint, value) ->
            fingerprint.match(classDefBy(fingerprint.definingClass!!)).method.returnEarlyBoolean(value)
        }

        GanbaruSubscriptionTypeFromFingerprint
            .match(classDefBy(GanbaruSubscriptionTypeFromFingerprint.definingClass!!))
            .method
            .addInstructions(
                0,
                """
                    sget-object v0, Lcom/ganbaru/method/ui/settings/manageSubscription/SubscriptionType;->LIFETIME:Lcom/ganbaru/method/ui/settings/manageSubscription/SubscriptionType;
                    return-object v0
                """
            )
    }
}
