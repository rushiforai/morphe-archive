package app.template.patches.meowdoku

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

private const val HELPER = "Lapp/template/extension/RewardAdSkipper;"

val COMPATIBILITY_MEOWDOKU = Compatibility(
    name = "Meowdoku",
    packageName = "com.oakever.meowdoku",
    // Plain 0xRRGGBB: Compatibility rejects any alpha byte, so 0xFFF2C879 throws.
    appIconColor = 0xF2C879,
    targets = listOf(AppTarget(version = "1.22.1"))
)

/**
 * Rewarded ads are never shown, but the app receives the callbacks of a fully watched ad,
 * so "watch an ad to retry / to get a reward" resolves instantly.
 *
 * Two hooks:
 * - `MaxAdWrapper.isValid()` always reports true, so the game offers the button even when no
 *   ad could ever be loaded (blocked network, no fill). Stock behaviour hides the button in
 *   that case.
 * - `MaxAdapter.doShowRewardedAd` is taken over completely and drives the adapter's own
 *   notify methods, which is what MAX's listener would do. This works with no ad loaded at
 *   all, where the plain `showAd` hook could not: it needs a live ad to hand a listener to.
 *
 * Only parameter registers are used, so `.registers` never has to change.
 */
val skipRewardedAdsPatch = bytecodePatch(
    name = "Block rewarded ads",
    description = "Blocks rewarded ads, keeps the button visible without a loaded ad and grants the reward instantly.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MEOWDOKU)

    extendWith("extensions/extension.mpe")

    val blockRewardedAds by booleanOption(
        key = "Block rewarded ads",
        description = "Skip the ad, keep the button visible and grant the reward right away.",
        default = true
    )

    execute {
        // With the option off the app keeps its stock behaviour.
        if (blockRewardedAds != true) return@execute

        val valid = MaxRewardedValidFingerprint.matchOrNull()
            ?: throw PatchException("MaxAdWrapper.isValid() was not found; re-check the ad wrapper.")
        valid.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // The real gate. The app SDK only asks the wrapper when a cached ad exists at all:
        // MaxAdapter.isValid(placement) looks it up in mCachedAdMap and answers false when it
        // is absent, so without this the button stays hidden and the wrapper hook never runs.
        val adapterValid = MaxAdapterIsValidFingerprint.matchOrNull()
            ?: throw PatchException("MaxAdapter.isValid(String) was not found; re-check the ad wrapper.")
        adapterValid.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        val show = MaxAdapterShowRewardedFingerprint.matchOrNull()
            ?: throw PatchException(
                "MaxAdapter.doShowRewardedAd(String, TrackingContext, MaxRewardedAd) was not found. " +
                    "The app SDK version probably changed; re-check the rewarded flow."
            )
        show.method.addInstructions(
            0,
            """
                invoke-static {p0, p1, p2, p3}, $HELPER->rewardedClick(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
                return-void
            """
        )

        println("Block rewarded ads: the button stays visible and the reward is faked.")
    }
}
