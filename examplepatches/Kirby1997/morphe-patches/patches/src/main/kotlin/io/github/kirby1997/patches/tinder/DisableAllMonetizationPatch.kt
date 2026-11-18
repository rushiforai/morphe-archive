package io.github.kirby1997.patches.tinder

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import io.github.kirby1997.patches.shared.Constants

// Umbrella "one toggle" over every safe Tinder ad/upsell patch. Self-contained: it
// re-applies each individual patch's injection here (reusing the same public
// Fingerprint objects), every one wrapped in runCatching so a single drifted
// fingerprint can't abort the rest.
//
// IMPORTANT — default = false. The individual patches are default-on, so leaving
// this on would double-inject the same methods and corrupt them. Keep it OFF for the
// normal all-on build (the individual patches do the work); turn it ON only when you
// want a SINGLE selection to apply everything (e.g. on-device Morphe Manager, or
// morphe-cli --exclusive), in which case the individual patches are not selected and
// there is no collision. Do not enable this together with the individual patches.
//
// EXCLUDES the two default-off purchase-breakers (disablePaywallFlowPatch,
// disableDynamicPaywallPatch) and the CMP consent-prompt patch (privacy, not
// monetization) — those stay opt-in on their own.

private const val DISMISS_DIALOG_FRAGMENT = """
    invoke-virtual {p0}, Landroidx/fragment/app/q;->dismissAllowingStateLoss()V
    const/4 p1, 0x0
    return-object p1
"""

private const val DISMISS_DIALOG_FRAGMENT_RANGE = """
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/q;->dismissAllowingStateLoss()V
    const/4 v0, 0x0
    return-object v0
"""

private const val RETURN_FALSE_BOXED = """
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    return-object v0
"""

@Suppress("unused")
val disableAllTinderMonetizationPatch = bytecodePatch(
    name = "Disable all Tinder paywalls & ads",
    description = "Single toggle that applies every safe Tinder ad/upsell patch at once (Boost, MyLikes, " +
        "Platinum Likes, Primetime, Secret Admirer, headless purchase, Likes You Gold, rewarded video, " +
        "ads-bouncer paywall, and both swipe-stack ad injectors). Default-off: enable this on its own " +
        "instead of the individual patches, not alongside them. Excludes the purchase-breaking generic " +
        "paywall patches.",
    default = false,
) {
    compatibleWith(Constants.TINDER)

    execute {
        // DialogFragment upsells — dismiss + return null view.
        runCatching { PlatinumLikesUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT) }
        runCatching { MyLikesUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT) }
        runCatching { BoostUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT) }
        runCatching { HeadlessPurchaseUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT) }
        runCatching { PrimetimeBoostUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT) }
        runCatching { SecretAdmirerUpsellOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT) }

        // Rewarded-video bottom sheets — same dismiss, register-width-specific bodies.
        runCatching { AdsBouncerRewardedVideoOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT_RANGE) }
        runCatching { RewardedVideoModalOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT) }

        // Swipe-stack ad injectors + Likes You Gold gate — return boxed Boolean.FALSE.
        runCatching { MainCardStackShouldInsertAdRecFingerprint.method.addInstructions(0, RETURN_FALSE_BOXED) }
        runCatching { CuratedCardStackShouldInsertAdRecFingerprint.method.addInstructions(0, RETURN_FALSE_BOXED) }
        runCatching { ShouldShowGoldLikesYouBottomSheetFingerprint.method.addInstructions(0, RETURN_FALSE_BOXED) }
    }
}
