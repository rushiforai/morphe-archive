package app.plyrs1.patches.com_pertaminiku

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_PERTAMINIKU

/**
 * Lifetime Premium Patch - Mocks Google Play Billing to grant permanent watermark removal.
 * 
 * This patch intercepts queryPurchasesAsync responses and injects a mock "onetime_purchase"
 * entitlement that the Dart layer interprets as lifetime premium status.
 * 
 * Effect: Watermark is removed from all receipts permanently, no ads displayed,
 *        all 7 receipt templates unlocked (same as paying for subscription).
 */
val lifetimePremiumPatch = bytecodePatch(
    name = "Lifetime Premium",
    description = "Unlocks lifetime premium: removes watermark forever, disables ads, unlocks all templates.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PERTAMINIKU)
    
    // Merge extension DEX containing PurchaseMockHelper.buildMockPurchases()
    extendWith("extensions/extension.mpe")

    execute {
        /*
         * F2.a.f receives List<Purchase>. It immediately converts that list through
         * S1.a.o into Pigeon Q2.v records. Replacing p2 after that conversion puts
         * Purchase instances where the Flutter codec requires Q2.v, causing a
         * ClassCastException when a later platform-channel message is serialized.
         *
         * Replace the raw Purchase list before S1.a.o (instruction index 2) so the
         * app's own converter produces valid Q2.v values.
         */
        QueryPurchasesResponseFingerprint.method.addInstructions(
            2,
            """
                invoke-static {}, Lapp/plyrs1/extension/PurchaseMockHelper;->buildMockPurchases()Ljava/util/ArrayList;
                move-result-object p2
            """
        )
    }
}
