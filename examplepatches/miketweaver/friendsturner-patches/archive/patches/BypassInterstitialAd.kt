package com.morphe.friendsturner.patches

import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.morphe.friendsturner.patches.Constants.COMPATIBILITY_FRIENDSTURNER

/**
 * Remove ads.
 *
 * MainActivity.F()V reads the ad-free flag (Lp8/b;->z) and a single conditional
 * branch diverts non-sponsors to the ad code (:cond_0), which shows the
 * interstitial ad (this.S / this.P) before starting the tool via E()V.
 *
 * Removing that branch makes F()V always fall through to the ad-free
 * E()V / return-void path -- exactly what a sponsored user gets -- so the
 * interstitial is never shown and no purchase state has to be faked.
 *
 * Verified by applying the identical smali change to the real classes.dex:
 * the rebuilt dex assembles cleanly and F()V flows straight to E()V.
 */
@Suppress("unused")
val bypassInterstitialAdPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes the interstitial ad by making MainActivity.F() always take the ad-free path.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FRIENDSTURNER)

    execute {
         // instructionMatches[1] is the IF_EQZ filter -- the branch to the ad code.
        val branch = MainActivityFAdGateFingerprint.instructionMatches[1]
        MainActivityFAdGateFingerprint.method.removeInstruction(branch.index)
        }
}
