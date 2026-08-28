package app.smashhit.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.smashhit.patches.shared.Constants.COMPATIBILITY_SMASHHIT

/**
 * Smash Hit Premium Unlock
 *
 * Based on proven approaches from Entree3k/okish-morphe-patches.
 *
 * How it works:
 *
 * 1. AndroidStore.ownsPremiumProduct() → return true.
 *    Gates ad loading in OnSyncCompleted().
 *
 * 2. CommandThreadsafeModel.isProductOwned() → return true.
 *    Inject at index 1 (after monitor-enter) with proper monitor-exit.
 *    Core ownership check used by native C++ engine.
 *
 * 3. GooglePlaySystem.OnSyncCompleted() → return immediately.
 *    Skips ad loading entry point entirely.
 *
 * 4. hasrefreshedownedproducts → return "true".
 *    Tells native engine products have been refreshed.
 *
 * 5. ispremiumproductrestored → return "true".
 *    Tells native engine premium has been restored.
 *
 * 6. AndroidStore.startPurchaseFlow() → return immediately.
 *    Prevents Play Store from opening when user tries to buy premium.
 */
@Suppress("unused")
val smashhitPremiumPatch = bytecodePatch(
    name = "Smash Hit Premium Unlock",
    description = "Unlocks premium and all game modes without purchase.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SMASHHIT)

    execute {
        // 1. AndroidStore.ownsPremiumProduct() → return true
        OwnsPremiumProductFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """.trimIndent())

        // 2. CommandThreadsafeModel.isProductOwned() → return true
        // IMPORTANT: inject at index 1 (after monitor-enter), not index 0
        // Must call monitor-exit before return for synchronized method
        IsProductOwnedFingerprint.method.addInstructions(1, """
            const/4 p1, 0x1
            monitor-exit p0
            return p1
        """.trimIndent())

        // 3. GooglePlaySystem.OnSyncCompleted() → return immediately (skip ad loading)
        OnSyncCompletedFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())

        // 4. hasrefreshedownedproducts → return "true"
        HasRefreshedOwnedProductsFingerprint.method.addInstructions(0, """
            const-string p1, "true"
            return-object p1
        """.trimIndent())

        // 5. ispremiumproductrestored → return "true"
        IsPremiumProductRestoredFingerprint.method.addInstructions(0, """
            const-string p1, "true"
            return-object p1
        """.trimIndent())

        // 6. AndroidStore.startPurchaseFlow() → return immediately (prevent Play Store)
        StartPurchaseFlowFingerprint.method.addInstructions(0, """
            return-void
        """.trimIndent())
    }
}
