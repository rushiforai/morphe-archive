package app.jouss.patches.morolingo.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.morolingo.shared.Constants.COMPATIBILITY_MOROLINGO

@Suppress("unused")
val morolingoPremiumPatch = bytecodePatch(
    name = "Morolingo Premium",
    description = "Unlocks premium features in the Morolingo Darija & Amazigh learning app."
) {
    compatibleWith(COMPATIBILITY_MOROLINGO)

    execute {
        // 1. Bypass Pairip license check — force responseCode to 0 (LICENSED)
        PairipProcessResponseFingerprint.method.addInstructions(0, """
            const/4 p1, 0x0
            return-void
        """)

        // 2. Skip Pairip RSA signature validation
        PairipValidateResponseFingerprint.method.addInstructions(0, """
            return-void
        """)

        // 3. Force RevenueCat EntitlementInfo.isActive() to always return true
        EntitlementInfoIsActiveFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // 4. Force EntitlementInfo.getWillRenew() to return true
        EntitlementInfoGetWillRenewFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // 5. Force EntitlementInfo.getVerification() to return VERIFIED
        EntitlementInfoGetVerificationFingerprint.method.addInstructions(0, """
            sget-object v0, Lcom/revenuecat/purchases/VerificationResult;->VERIFIED:Lcom/revenuecat/purchases/VerificationResult;
            return-object v0
        """)

        // 6. THE KEY FIX: Force CustomerInfo.getActiveSubscriptions() to return a non-empty set.
        //    The JS app's hasActiveEntitlementOrSubscription() checks activeSubscriptions.length > 0 FIRST.
        //    If the user never subscribed, RevenueCat returns an empty set → the app shows the paywall.
        //    Our EntitlementInfo.isActive() patch above is useless when there are ZERO EntitlementInfo objects.
        //    This patch makes the JS app see an active subscription and call setIsPremiumUser(true).
        CustomerInfoGetActiveSubscriptionsFingerprint.method.addInstructions(0, """
            const-string v0, "premium"
            invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;
            move-result-object v0
            return-object v0
        """)

        // 7. Force Superwall subscription status to always be ACTIVE.
        //    The React Native layer mirrors RevenueCat state into Superwall via
        //    SuperwallReactNativeModule.setSubscriptionStatus -> Entitlements.setSubscriptionStatus.
        //    If RevenueCat has no entitlements configured, the JS app sends an empty entitlement list
        //    which Superwall downgrades to INACTIVE. This patch replaces the incoming status with
        //    a synthetic ACTIVE status containing one entitlement, so the app treats the user as
        //    subscribed regardless of RevenueCat state.
        val activeClass = "Lcom/superwall/sdk/models/entitlements/SubscriptionStatus\$Active;"
        SuperwallSetSubscriptionStatusFingerprint.method.addInstructions(0, """
            new-instance v0, Lcom/superwall/sdk/models/entitlements/Entitlement;
            const-string v1, "premium"
            invoke-direct {v0, v1}, Lcom/superwall/sdk/models/entitlements/Entitlement;-><init>(Ljava/lang/String;)V
            invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;
            move-result-object v0
            new-instance v1, ${activeClass}
            invoke-direct {v1, v0}, ${activeClass}-><init>(Ljava/util/Set;)V
            move-object p1, v1
        """)
    }
}
