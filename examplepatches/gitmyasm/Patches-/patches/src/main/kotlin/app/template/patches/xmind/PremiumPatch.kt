package app.template.patches.xmind

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly

/**
 * Unlocks Xmind's locally enforced premium / Pro entitlements.
 *
 * Xmind stores entitlement state in two parallel models:
 *  1. the user's Subscription (rm.x) -> User profile (rm.j0)
 *  2. the TeamProfile (rm.b0)
 * Both feed into im.e3.b(), which returns an EditorEntitlements object
 * (subscribed, premium, collaborate, sheetLimitBypass) consumed by the UI.
 *
 * This patch forces every one of those checks to the "premium" value.
 * Server-side account features (cloud sync, account-tied templates, etc.)
 * are still decided by Xmind's servers and are not affected by this patch.
 */
@Suppress("unused")
val unlockPremiumPatch = patch(
    name = "Unlock Premium / Pro",
    description = "Unlocks Xmind Premium (Pro+) features that are checked locally.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_XMIND)

    execute {
        // --- 1. Subscription model ---------------------------------------
        // Treat every subscription as active, regardless of status/expiry.
        SubscriptionIsActiveFingerprint.method.returnEarly(true)

        // "is Pro" and "is subscribed" on the user profile.
        UserIsProFingerprint.method.returnEarly(true)
        UserIsSubscribedFingerprint.method.returnEarly(true)

        // --- 2. Team profile model ---------------------------------------
        TeamProfileIsActiveFingerprint.method.returnEarly(true)
        TeamProfileIsPremiumFingerprint.method.returnEarly(true)

        // --- 3. Final entitlements object --------------------------------
        // Return EditorEntitlements(subscribed=true, premium=true,
        // collaborate=true, sheetLimitBypass=true) directly.
        EditorEntitlementsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                new-instance v1, Lgm/a;
                invoke-direct {v1, v0, v0, v0, v0}, Lgm/a;-><init>(ZZZZ)V
                return-object v1
            """.trimIndent(),
        )

        // --- 4. Plan tier ------------------------------------------------
        // Report the Premium tier (gm.h.u) instead of Free/Pro.
        PlanTierFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lgm/h;->u:Lgm/h;
                return-object v0
            """.trimIndent(),
        )

        // --- 5. PairIP ---------------------------------------------------
        // A re-signed APK fails Play's license check, which otherwise shuts
        // the app down. Skip the check entirely.
        PairIpLicenseCheckFingerprint.method.returnEarly()

        // --- 6. Account UI -----------------------------------------------
        // The account screen still reads the raw server plan and prints
        // "Free Plan". Force the visible label to just "Premium".
        PlanLabelFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "Premium"
                return-object v0
            """.trimIndent(),
        )

        // The account screen reads the subscription label through this second
        // helper as well. Force it to the same value so no section can still
        // display "Free Plan" or "Pro Plan".
        SubscriptionLabelFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "Premium"
                return-object v0
            """.trimIndent(),
        )

        // The badge icon is selected from the raw plan enum. Override the
        // result at the single point where every branch converges, before
        // the profile header model is constructed.
        val badgeAnchorIndex = AccountBadgeFingerprint.match().instructionMatches.first().index
        AccountBadgeFingerprint.method.addInstructions(
            badgeAnchorIndex,
            """
                sget-object v4, Ly6/q;->r0:Ldh/p;
                invoke-virtual {v4}, Ldh/p;->getValue()Ljava/lang/Object;
                move-result-object v4
                check-cast v4, Lpr/b;
                move-object/from16 v28, v4
            """.trimIndent(),
        )
    }
}
