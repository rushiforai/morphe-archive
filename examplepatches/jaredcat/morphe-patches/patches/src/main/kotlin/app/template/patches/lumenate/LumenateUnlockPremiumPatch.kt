package app.template.patches.lumenate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_LUMENATE

/**
 * Unlocks Lumenate Premium (entitlement id `"unlocked"`) for version 7.1.3.
 *
 * Prefer first-party gates over rewriting RevenueCat:
 * 1. [IsSubscriberFingerprint] — `SubscriptionManager` always reports subscribed and
 *    persists the SharedPreferences offline fallback as premium.
 * 2. [SetFullAppAccessFingerprint] — every `setFullAppAccess` / listener write forces
 *    `Lumenate.q = true` (and updates LiveData observers).
 * 3. [ProcessedCustomerInfoSubscribedFingerprint] — `ProcessedCustomerInfo.subscribed`
 *    always returns true if any path still constructs a free-tier result.
 * 4. [PremiumLiveDataInitFingerprint] — initial LiveData value is true so UI does not
 *    briefly treat the user as free before callbacks.
 * 5. [LumenateOnCreateFingerprint] — set `Lumenate.q` at Application start so Activity
 *    snapshots (Guide Begin lock, favourite overlays) see premium immediately.
 * 6. UI belts: Guide Begin click, session-landing favourite lock wiring, demo toast overlays.
 *
 * Leaves Nova hardware, journey progression, account/network, and real Play Billing
 * purchase flows untouched except for the entitlement result used for access checks.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Lumenate Premium without a subscription.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LUMENATE)

    execute {
        // Always treat CustomerInfo as an active "unlocked" subscriber.
        // p0 = this (companion), p1 = CustomerInfo, p2 = SharedPreferences
        IsSubscriberFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                const-string v1, "unlocked"
                sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

                invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v3
                const-string v4, "errorRetrievalBoolean"
                invoke-interface {v3, v4, v0}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v3
                invoke-interface {v3}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V

                invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v3
                const-string v4, "errorRetrievalStatus"
                invoke-interface {v3, v4, v1}, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v3
                invoke-interface {v3}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V

                invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v3
                const-string v4, "errorRetrievalRenewal"
                invoke-interface {v3, v4, v0}, Landroid/content/SharedPreferences${'$'}Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v3
                invoke-interface {v3}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V

                new-instance v3, Lcom/lumenate/lumenate/subscription/M;
                invoke-direct {v3, v0, v1, v2}, Lcom/lumenate/lumenate/subscription/M;-><init>(ZLjava/lang/String;Ljava/lang/Boolean;)V
                return-object v3
            """,
        )

        // Force the boolean premium argument (p1) before the original body runs.
        SetFullAppAccessFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x1
            """,
        )

        ProcessedCustomerInfoSubscribedFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // new I(Boolean.TRUE) instead of Boolean.FALSE (7.1.3 uses lifecycle.I)
        PremiumLiveDataInitFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Landroidx/lifecycle/I;
                sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-direct {v0, v1}, Landroidx/lifecycle/I;-><init>(Ljava/lang/Object;)V
                return-object v0
            """,
        )

        // Eager premium flag before any Activity onCreate snapshots Lumenate.q.
        LumenateOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                sput-boolean v0, Lcom/lumenate/lumenate/Lumenate;->q:Z
            """,
        )

        // Guide Begin: always take the OpenAIFlow path (never Paywall / UnlockAllContent).
        GuideBeginClickFingerprint.method.addInstructions(
            0,
            """
                const/4 p0, 0x1
            """,
        )

        // Free-tier favourite/download lock → wire premium handlers instead.
        SessionLandingLockFavoritesFingerprint.method.addInstructions(
            0,
            """
                invoke-direct {p0}, Lcom/lumenate/lumenate/landing/b;->I1()V
                return-void
            """,
        )

        // Demo landing unlock toasts (favourite / download overlays).
        DemoFavoriteUnlockToastFingerprint.method.addInstructions(0, "return-void")
        DemoDownloadUnlockToastFingerprint.method.addInstructions(0, "return-void")
    }
}
