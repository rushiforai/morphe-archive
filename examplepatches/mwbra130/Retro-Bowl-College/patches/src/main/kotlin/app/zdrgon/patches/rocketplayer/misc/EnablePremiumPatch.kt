package app.zdrgon.patches.rocketplayer.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.rocketplayer.shared.Constants.COMPATIBILITY_ROCKET_PLAYER

/**
 * Rocket Player — Enable Premium.
 *
 * In 6.3.4 the paywall's own comparison table is honest about what
 * Premium is: the player, unlimited playlists and the equalizer are
 * in BOTH tiers — Premium adds "No Ads" and a VIP-support label. The
 * paid product is a subscription sold through the ZipoApps
 * PremiumHelper SDK 5.2.1 that sits on top of the app (direct Play
 * Billing 7.0.0; the legacy Rocket Player Premium Unlocker app also
 * counts as premium). Whichever route a buyer takes, the result
 * lands in ONE local value that everything consults:
 *
 *   Lcom/zipoapps/premiumhelper/c;->h()Z
 *     = SharedPreferences "premium_helper_data" boolean
 *       "has_active_purchase"
 *
 * Every forced ad path asks that reader before doing anything
 * (22 call sites in 19 methods, census-verified): BannerManager's
 * loadBanner checks it FIRST and aborts for premium users;
 * InterstitialManager's eligibility check and its
 * showInterstitialAd both stop at it ("User is Premium. Don't show
 * ad"); the auto-interstitial setup, the splash's interstitial wait,
 * the relaunch/onboarding offering logic and the banner placeholder
 * view (which collapses to zero height) all read it too. The
 * VIP-support settings gate reads the same reader. No developer
 * server verifies entitlement at read time — the SDK's Toto service
 * only supplies the paywall's offers and prices; the entitlement
 * answer is the local flag the billing layer writes from Play.
 *
 * This patch pins the reader to true at its entry — the exact answer
 * a live subscription produces — so no banner or interstitial ever
 * loads and the app behaves as a subscriber's copy. It creates no
 * purchase, forges no receipt, and touches nothing in the billing
 * library; it only changes the app's own answer to its own question.
 * Pinning the reader (rather than the stored preference) also
 * survives billing reconciliation, which can rewrite the stored flag
 * after empty Play queries but cannot change what the reader
 * returns. The SDK's rewarded-ad manager is deliberately left
 * alone: rewarded ads are only ever shown from explicit
 * watch-an-ad offers, never automatically.
 *
 * No companion patch is needed: 6.3.4 has NO PairIP (the manifest
 * Application is the app's own AMPApp) and no app-own signature or
 * installer check anywhere in app or SDK code, so a re-signed build
 * launches and the pin takes effect without an installer spoof.
 *
 * Cosmetic note: stored state is untouched, so Settings surfaces
 * that read the stored purchase record directly may still show no
 * active subscription, and the paywall can still be opened manually
 * and will still display its offers/prices. That page is
 * display/purchase only — every ad path and premium gate reads the
 * pinned reader.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Grants Premium, whose only features over Basic are no ads and VIP support: removes all banner and interstitial ads (the player, playlists and equalizer are already free).",
    default = true
) {
    compatibleWith(COMPATIBILITY_ROCKET_PLAYER)

    execute {
        HasActivePurchaseFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent()
        )
    }
}
