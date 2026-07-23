package app.tiaruebar.patches.device_tycoon.premium

import app.morphe.patcher.patch.rawResourcePatch
import app.tiaruebar.patches.device_tycoon.shared.Constants.COMPATIBILITY_DEVICE_TYCOON

/**
 * Devices Tycoon is a Cordova hybrid app (Construct 3 game engine).
 * All game logic — including IAP and ad handling — lives in JavaScript assets,
 * not Java bytecode. Both patches modify assets/www/scripts/main.js directly.
 *
 * IAP products:
 *   Non-consumable: remove_ads
 *   Consumable:     get_1000_researchcoins_v2, get_3000_researchcoins,
 *                   get_5000_researchcoins, get_300m_budget, get_750m_budget,
 *                   get_1b_budget
 *
 * Patch 1 — Remove Ads bypass (non-consumable):
 *   _ToProductInfo() reports owned=true for remove_ads so the game's
 *   ProductOwned("remove_ads") condition always passes.
 *
 * Patch 2 — Purchase bypass (all products):
 *   _OnPurchase(productId) normally calls store.order() to start a real Google
 *   Play purchase flow. We replace it to skip the store and immediately fire
 *   _OnProductOwned() + _OnPurchaseSuccess() + _OnTransactionFinished(), which
 *   is the exact sequence a real completed transaction produces. This clears the
 *   loading spinner on consumables and grants the reward instantly on tap.
 *
 * Patch 3 — Ad removal:
 *   _GetApi() always returns C3MobileAdvertsAPI.fake — a no-op stub that reports
 *   success instantly without showing any real ads.
 */
@Suppress("unused")
val deviceTycoonPremiumPatch = rawResourcePatch(
    name = "Devices Tycoon Premium",
    description = "Instantly completes all IAP purchases (remove ads, research coins, budget) on tap and disables all ads in Devices Tycoon."
) {
    compatibleWith(COMPATIBILITY_DEVICE_TYCOON)

    execute {
        val mainJs = get("assets/www/scripts/main.js")
        var content = mainJs.readText()

        // --- Patch 1: Remove Ads IAP bypass (non-consumable) ---
        // Force owned=true for remove_ads in _ToProductInfo() so the game's
        // ProductOwned("remove_ads") condition always evaluates to true.
        val iapOriginal = "owned:!!e.owned,canPurchase:!!e.canPurchase"
        val iapPatched  = """owned:e.id==="remove_ads"?!0:!!e.owned,canPurchase:!!e.canPurchase"""
        check(content.contains(iapOriginal)) {
            "Patch 1: could not find _ToProductInfo target in main.js — app may have updated"
        }
        content = content.replace(iapOriginal, iapPatched)

        // --- Patch 2: Purchase bypass (all products) ---
        // Original _OnPurchase calls store.order() which triggers a real Play Store
        // purchase dialog. We replace just the store.order() call to skip the store
        // and immediately simulate a fully completed transaction.
        //
        // The full success sequence the game expects:
        //   1. _OnProductOwned(product)      → fires OnProductOwned trigger (grants reward)
        //   2. _OnPurchaseSuccess(product)   → posts "purchase-success" to runtime
        //   3. _OnTransactionFinished({...}) → posts "transaction-finished" to runtime,
        //                                      which clears the loading spinner for consumables
        //
        // Without step 3, consumables get stuck on a loading spinner because the game
        // waits for "transaction-finished" before resetting the purchase UI.
        val purchaseOrderCall = "this._store.order(t.getOffer()).then((e=>{e&&e.isError?this._OnPurchaseFail(t,e):this._OnPurchaseSuccess(t)}))"
        check(content.contains(purchaseOrderCall)) {
            "Patch 2: could not find store.order() call in main.js — app may have updated"
        }
        content = content.replace(
            purchaseOrderCall,
            "this._OnProductOwned(t),this._OnPurchaseSuccess(t),this._OnTransactionFinished({transactionId:'patched',products:[t]})"
        )

        // --- Patch 3: Ad removal ---
        // Always return the fake/stub ad API so no real ads are loaded or shown.
        val adOriginal = "return self.cordova?self.C3MobileAdvertsAPI.real:self.cordova||\$t?\$t?self.C3MobileAdvertsAPI.fake:void 0:self.C3MobileAdvertsAPI.web"
        val adPatched  = "return self.C3MobileAdvertsAPI.fake"
        check(content.contains(adOriginal)) {
            "Patch 3: could not find _GetApi() target in main.js — app may have updated"
        }
        content = content.replace(adOriginal, adPatched)

        mainJs.writeText(content)
    }
}
