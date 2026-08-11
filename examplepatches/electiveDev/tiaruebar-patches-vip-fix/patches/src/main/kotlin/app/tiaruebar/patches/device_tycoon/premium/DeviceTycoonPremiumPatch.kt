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
 *   _OnProductOwned() + _OnPurchaseSuccess() + _OnTransactionFinished({products:[]})
 *   are fired so the reward is delivered once and the purchase spinner is cleared.
 *   The empty products list avoids re-emitting ProductOwned or resolving the store.
 * Patch 3 — Ad removal:
 *   _GetApi() always returns C3MobileAdvertsAPI.fake. Its show callbacks are
 *   patched to complete immediately with the JSON reward payload expected by
 *   Construct's rewarded-ad runtime, without showing any real ads.
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
        //   3. _OnTransactionFinished({products:[]}) → posts "transaction-finished"
        //                                      without a second ProductOwned callback
        //
        // Without step 3, consumables get stuck on a loading spinner because the game
        // waits for "transaction-finished" before resetting the purchase UI.
        val purchaseOrderCall = "this._store.order(t.getOffer()).then((e=>{e&&e.isError?this._OnPurchaseFail(t,e):this._OnPurchaseSuccess(t)}))"
        check(content.contains(purchaseOrderCall)) {
            "Patch 2: could not find store.order() call in main.js — app may have updated"
        }
        content = content.replace(
            purchaseOrderCall,
            "this._OnProductOwned(t),this._OnPurchaseSuccess(t),this._OnTransactionFinished({transactionId:'patched',products:[]})"
        )

        // --- Patch 3: Ad removal ---
        // Always return the fake/stub ad API so no real ads are loaded or shown.
        val adOriginal = "return self.cordova?self.C3MobileAdvertsAPI.real:self.cordova||\$t?\$t?self.C3MobileAdvertsAPI.fake:void 0:self.C3MobileAdvertsAPI.web"
        val adPatched  = "return self.C3MobileAdvertsAPI.fake"
        check(content.contains(adOriginal)) {
            "Patch 3: could not find _GetApi() target in main.js — app may have updated"
        }
        content = content.replace(adOriginal, adPatched)

        // The bundled fake API rejects repeated Create calls even though the
        // Construct runtime can recreate its plugin instance on a new layout.
        // Make creation idempotent so a stale fake state cannot turn the next
        // ad request into a permanent loading state.
        val adCreateFixes = listOf(
            Triple(
                """Dt("CreateBannerAdvert",(async(...e)=>{const[t,i]=Wt("CreateBannerAdvert",e);await xt(50),Nt?i("Banner already exists"):(Nt="ready",i(null,"Created banner"))}))""",
                """Dt("CreateBannerAdvert",(async(...e)=>{const[t,i]=Wt("CreateBannerAdvert",e);await xt(50),Nt="ready",i(null,"Created banner")}))""",
                "Patch 3a: could not find fake banner create target in main.js — app may have updated"
            ),
            Triple(
                """Dt("CreateInterstitialAdvert",(async(...e)=>{const[t,i]=Wt("CreateInterstitialAdvert",e);await xt(50),Gt?i("Intersitial already exists"):(Gt="ready",i(null,"Created interstitial"))}))""",
                """Dt("CreateInterstitialAdvert",(async(...e)=>{const[t,i]=Wt("CreateInterstitialAdvert",e);await xt(50),Gt="ready",i(null,"Created interstitial")}))""",
                "Patch 3b: could not find fake interstitial create target in main.js — app may have updated"
            ),
            Triple(
                """Dt("CreateVideoAdvert",(async(...e)=>{const[t,i]=Wt("CreateVideoAdvert",e);await xt(50),Ft?i("Video already exists"):(Ft="ready",i(null,"Created video"))}))""",
                """Dt("CreateVideoAdvert",(async(...e)=>{const[t,i]=Wt("CreateVideoAdvert",e);await xt(50),Ft="ready",i(null,"Created video")}))""",
                "Patch 3c: could not find fake video create target in main.js — app may have updated"
            ),
            Triple(
                """Dt("CreateRewardedAdvert",(async(...e)=>{const[t,i]=Wt("CreateRewardedAdvert",e);await xt(50),Ht?i("Rewarded already exists"):(Ht="ready",i(null,"Created rewarded"))}))""",
                """Dt("CreateRewardedAdvert",(async(...e)=>{const[t,i]=Wt("CreateRewardedAdvert",e);await xt(50),Ht="ready",i(null,"Created rewarded")}))""",
                "Patch 3d: could not find fake rewarded create target in main.js — app may have updated"
            ),
            Triple(
                """Dt("CreateRewardedInterstitialAdvert",(async(...e)=>{const[t,i]=Wt("CreateRewardedInterstitialAdvert",e);await xt(50),Ut?i("Rewarded intersitial already exists"):(Ut="ready",i(null,"Created rewarded interstitial"))}))""",
                """Dt("CreateRewardedInterstitialAdvert",(async(...e)=>{const[t,i]=Wt("CreateRewardedInterstitialAdvert",e);await xt(50),Ut="ready",i(null,"Created rewarded interstitial")}))""",
                "Patch 3e: could not find fake rewarded interstitial create target in main.js — app may have updated"
            )
        )
        for ((original, patched, error) in adCreateFixes) {
            check(content.contains(original)) { error }
            content = content.replace(original, patched)
        }

        // Complete all show calls with the expected reward tuple and leave the
        // fake state consumed so the next Create call can prepare it again.
        val adShowFixes = listOf(
            Triple(
                """Dt("ShowInterstitialAdvert",(async(...e)=>{const[t,i]=Wt("ShowInterstitialAdvert",e);await xt(50),"ready"!=Gt?i("Cannot show interstitial"):(Gt=null,i(null,"Interstitial shown"))}))""",
                """Dt("ShowInterstitialAdvert",(async(...e)=>{const[t,i]=Wt("ShowInterstitialAdvert",e);await xt(50),Gt=null,i(null,"Interstitial shown")}))""",
                "Patch 3a: could not find fake interstitial show target in main.js — app may have updated"
            ),
            Triple(
                """Dt("ShowVideoAdvert",(async(...e)=>{const[t,i]=Wt("ShowVideoAdvert",e);await xt(50),"ready"!=Ft?i("Cannot show video"):(Ft=null,i(null,'["example type", 20]'))}))""",
                """Dt("ShowVideoAdvert",(async(...e)=>{const[t,i]=Wt("ShowVideoAdvert",e);await xt(50),Ft=null,i(null,'["example type", 20]')}))""",
                "Patch 3b: could not find fake video show target in main.js — app may have updated"
            ),
            Triple(
                """Dt("ShowRewardedAdvert",(async(...e)=>{const[t,i]=Wt("ShowRewardedAdvert",e);await xt(50),"ready"!=Ht?i("Cannot show rewarded"):(Ht=null,i(null,'["example type", 20]'))}))""",
                """Dt("ShowRewardedAdvert",(async(...e)=>{const[t,i]=Wt("ShowRewardedAdvert",e);await xt(50),Ht=null,i(null,'["example type", 20]')}))""",
                "Patch 3c: could not find fake rewarded show target in main.js — app may have updated"
            ),
            Triple(
                """Dt("ShowRewardedInterstitialAdvert",(async(...e)=>{const[t,i]=Wt("ShowRewardedInterstitialAdvert",e);await xt(50),"ready"!=Ut?i("Cannot show rewarded interstitial"):(Ut=null,i(null,"Rewarded interstitial shown"))}))""",
                """Dt("ShowRewardedInterstitialAdvert",(async(...e)=>{const[t,i]=Wt("ShowRewardedInterstitialAdvert",e);await xt(50),Ut=null,i(null,'["example type", 20]')}))""",
                "Patch 3d: could not find fake rewarded interstitial show target in main.js — app may have updated"
            )
        )
        for ((original, patched, error) in adShowFixes) {
            check(content.contains(original)) { error }
            content = content.replace(original, patched)
        }

        mainJs.writeText(content)
    }
}
