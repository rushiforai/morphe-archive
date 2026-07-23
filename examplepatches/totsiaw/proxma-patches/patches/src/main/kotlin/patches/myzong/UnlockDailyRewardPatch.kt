package patches.myzong

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * Claim MyZong's daily "watch ad to claim" reward with no popup and no ad.
 *
 * The reward-bubble tap is decided in one private helper in FragDailyRewards' click-listener class
 * (private static final (FragDailyRewards)V). After a 1000ms debounce it computes
 * areEqual(activeGameNo, "1") and branches on `if-eqz`:
 *   - result true  -> access$showAdAlert  (the "Enjoy your free daily reward after this short Ad" popup
 *                     -> rewarded-interstitial ad -> claim)
 *   - result false -> access$claimReward  (the app's OWN direct claim: POST /api/v2/rewards/claimdailyreward,
 *                     no popup, no ad)
 * The claim is granted client-side (not server-verified against the ad), so we force that comparison to
 * false — every tap takes the existing direct-claim branch. One instruction, upstream of both the popup
 * and the ad, reusing the app's genuine claim accessor (identical to what the post-ad callback calls).
 *
 * Verified (workflow, 3 adversarial lenses): the helper has exactly one caller (the bubble-tap lambda),
 * touches no shared dialog/ad component, and reaches the real claim network call.
 *
 * Names are R8-obfuscated per build, so we anchor on structure: private/static/final, returns V, one
 * (FragDailyRewards) param, and the debounce (SystemClock.elapsedRealtime) + Intrinsics.areEqual it
 * contains — then inject `const/4 v<reg>, 0x0` right after the areEqual move-result.
 */

private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val FRAG_DAILY_REWARDS = "Lcom/zong/customercare/view/ui/FragDailyRewards;"

// The bubble-tap decision helper (ad-popup vs direct-claim).
internal val dailyRewardBubbleTapFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(FRAG_DAILY_REWARDS),
    custom = { m, _ ->
        val calledNames = m.implementation?.instructions?.toList().orEmpty()
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .map { it.name }
        "elapsedRealtime" in calledNames && "areEqual" in calledNames
    },
)

// Any rewarded ad's show wrapper (AdmobRewardedInterKt) — used by other placements (e.g. home).
internal val showRewardedInterstitialFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", FUNCTION0),
    custom = { m, _ -> m.name == "showRewardedInterstitial" },
)
internal val showRewardedAdFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", FUNCTION0),
    custom = { m, _ -> m.name == "showRewardedAd" },
)

@Suppress("unused")
val unlockDailyRewardPatch = bytecodePatch(
    name = "Unlock daily reward (skip ad)",
    description = "Claim MyZong's daily reward with no 'watch ad' popup and no ad. Forces the reward-bubble " +
        "tap to take the app's own direct-claim branch (the same claim call the post-ad path makes), " +
        "upstream of both the popup and the rewarded ad.",
) {
    compatibleWith(COMPATIBILITY_MYZONG)

    execute {
        // Primary fix: force areEqual(activeGameNo,"1") result to 0 so the existing `if-eqz` always
        // branches to the direct-claim path — no popup, no ad, genuine claim.
        try {
            val method = dailyRewardBubbleTapFingerprint.method
            val insns = method.implementation!!.instructions.toList()
            val eqIdx = insns.indexOfFirst {
                it is ReferenceInstruction && (it.reference as? MethodReference)?.name == "areEqual"
            }
            val moveResult = insns.getOrNull(eqIdx + 1)
            // ponytail: result reg is inside .locals 6 (v0-v5) so const/4 encodes it; if a future build
            // spills it above v15, switch this to const/16.
            if (eqIdx >= 0 && moveResult is OneRegisterInstruction) {
                method.addInstructions(eqIdx + 2, "const/4 v${moveResult.registerA}, 0x0")
            }
        } catch (_: Exception) {
            // fingerprint didn't resolve — skip
        }

        // Secondary: make any other rewarded-ad placement grant immediately (invoke its on-reward
        // Function0, no ad). The daily-reward direct-claim path above never reaches these.
        val grantAndReturn = """
            invoke-interface {p1}, $FUNCTION0->invoke()Ljava/lang/Object;
            return-void
        """.trimIndent()
        fun stubShow(fp: Fingerprint) {
            try {
                fp.method.addInstructions(0, grantAndReturn)
            } catch (_: Exception) {
            }
        }
        stubShow(showRewardedInterstitialFingerprint)
        stubShow(showRewardedAdFingerprint)
    }
}
