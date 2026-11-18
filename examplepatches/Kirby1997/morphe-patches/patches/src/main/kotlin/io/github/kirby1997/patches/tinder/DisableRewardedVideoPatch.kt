package io.github.kirby1997.patches.tinder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// The rewarded-video ad surfaces ("watch an ad to keep swiping / get a Rewind
// back") are BottomSheetDialogFragments. Dismiss + return a null view at the top
// of onCreateView. The disable body differs by register width: RewardedVideoModal
// has few locals so p0/p1 are addressable by the 4-bit forms; the adsbouncer sheet
// has .locals 18 (p0=v18, p1=v19) which those forms cannot reach, so it uses
// invoke-virtual/range and stashes null in a low local.
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

// RewardedVideoBottomSheet — "Watch an ad to keep swiping" (AdsBouncer paywall).
object AdsBouncerRewardedVideoOnCreateViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    definingClass = "Lcom/tinder/feature/adsbouncerpaywall/internal/presentation/RewardedVideoBottomSheet;",
    name = "onCreateView",
)

@Suppress("unused")
val disableAdsBouncerPaywallPatch = bytecodePatch(
    name = "Disable ads-bouncer rewarded-video paywall",
    description = "Suppresses the \"Watch an ad to keep swiping\" rewarded-video bottom sheet shown when out of likes.",
) {
    compatibleWith(Constants.TINDER)

    execute {
        AdsBouncerRewardedVideoOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT_RANGE)
    }
}

// Sibling rewarded-video modal outside the adsbouncer feature module —
// e.g. the "watch an ad to get a Rewind back" prompt. Same shape, same disable.
object RewardedVideoModalOnCreateViewFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
    definingClass = "Lcom/tinder/rewardedvideomodal/internal/ui/RewardedVideoBottomSheetFragment;",
    name = "onCreateView",
)

@Suppress("unused")
val disableRewardedVideoModalPatch = bytecodePatch(
    name = "Disable rewarded-video modal",
    description = "Suppresses the standalone rewarded-video bottom sheet (e.g. \"watch an ad to get a Rewind\").",
) {
    compatibleWith(Constants.TINDER)

    execute {
        RewardedVideoModalOnCreateViewFingerprint.method.addInstructions(0, DISMISS_DIALOG_FRAGMENT)
    }
}
