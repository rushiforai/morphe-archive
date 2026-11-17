package app.zdrgon.patches.moises.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.moises.shared.Constants.COMPATIBILITY_MOISES
import java.util.logging.Logger

/**
 * Moises — Enable Pro.
 *
 * Moises sells Premium and Pro ($199.99/yr, $29.99/mo) through
 * RevenueCat, but the app itself never gates on RevenueCat: the
 * plan state every feature reads is the backend-issued User
 * object (api.moises.ai), whose UserSubscription carries the
 * plan as plain data — isPro / isPremium booleans, a
 * SubscriptionPlan enum (Free / Premium / Pro), the AI Stem
 * credit balance and the monthly usage. Feature gates across
 * the app consult exactly those getters (plan switch-maps and
 * comparisons in a dozen classes, the credit pre-check in pq9,
 * the on-demand credit readers mfd / vid). There is no second
 * local source of truth.
 *
 * This patch pins the getters at their entries so every local
 * reader sees a genuine Pro subscription: isPro and isPremium
 * true, the plan enum Pro, 999999 available credits, 0 monthly
 * usage, and an on-demand credit balance of 999999 of 999999.
 * The local credit pre-check (pq9 throws when the balance reads
 * <= 0) passes, and every plan-gated picker, editor and display
 * opens — the same client state a real Pro account produces.
 *
 * What this does NOT do, stated plainly: Moises' separation is
 * executed on its servers (CreateJobMutation with a workflow
 * name; the Hi-Fi models and drum-part variants are workflow
 * parameters, not local files), and the credit quota is metered
 * per account server-side. The patch grants the Pro client, not
 * the Pro service — whether the server runs Pro workflows for
 * the account is the server's decision. Full per-feature table
 * in the workdir RECON.md.
 *
 * It creates no purchase, forges no receipt and touches nothing
 * in RevenueCat or the billing library; it only changes the
 * answers the app's own entitlement object gives.
 */
@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Turns on the app's Pro plan state (plan-gated features, Hi-Fi and drum-part pickers, advanced creative control, credit checks) as if the Pro plan were active. Note: stem separation itself runs on Moises' servers, which meter the account separately.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MOISES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // The plan booleans and the plan enum: every plan gate in
        // the app reads one of these three.
        IsProFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
        IsPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
        SubscriptionPlanFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lai/moises/data/user/model/User${'$'}SubscriptionPlan;->Pro:Lai/moises/data/user/model/User${'$'}SubscriptionPlan;
                return-object v0
            """.trimIndent()
        )
        logger.info("Moises: plan pinned to Pro (isPro/isPremium true, subscriptionPlan = Pro).")

        // The credit state: the local pre-check and every credit
        // display read these. 999999 = 0xF423F.
        AvailableCreditsFingerprint.method.addInstructions(
            0,
            """
                const v0, 0xF423F
                invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v0
                return-object v0
            """.trimIndent()
        )
        MonthlyUsageFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v0
                return-object v0
            """.trimIndent()
        )
        OnDemandRemainingFingerprint.method.addInstructions(
            0,
            """
                const v0, 0xF423F
                return v0
            """.trimIndent()
        )
        OnDemandTotalFingerprint.method.addInstructions(
            0,
            """
                const v0, 0xF423F
                return v0
            """.trimIndent()
        )
        logger.info("Moises: credits pinned (available 999999, monthly usage 0, on-demand 999999 of 999999).")

        // Defensive: a billing account-hold state can only block;
        // it reads false on any healthy account already.
        IsAccountHoldFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent()
        )
        logger.info("Moises: account-hold state pinned to false.")
    }
}
