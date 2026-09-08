package com.morphe.friendsturner.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.morphe.friendsturner.patches.Constants.COMPATIBILITY_FRIENDSTURNER

/**
 * Hide the banner ad.
 *
 * "Remove ads" only removes the full screen interstitial. The AdMob banner pinned to the
 * bottom of the main screen is a separate placement, built by a Compose `AndroidView`
 * factory.
 *
 * An alternative to [hideBannerAdSponsorLayoutPatch]. Both remove the same banner; pick
 * one. This patch leaves the layout untouched and neutralises the view itself, which does
 * not depend on the app keeping its sponsor branch.
 *
 * The factory is rewritten to return a plain [android.view.View] instead of an AdView:
 *
 *     new-instance   vAd, Landroid/view/View;
 *     invoke-direct  { vAd, vContext }, Landroid/view/View;-><init>(Landroid/content/Context;)V
 *
 * A bare View measures 0x0, so the space collapses instead of leaving an empty strip
 * where the banner used to be, and no ad request is ever made.
 */
@Suppress("unused")
val hideBannerAdPatch = bytecodePatch(
    name = "Hide banner ad",
    description = "Removes the banner ad at the bottom of the main screen by replacing it with an empty view. " +
        "An alternative to \"Hide banner ad (ad-free layout)\"; enable one or the other.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FRIENDSTURNER)

    execute {
        val method = BannerAdFingerprint.method
        val matches = BannerAdFingerprint.instructionMatches

        val constructorIndex = matches[0].index
        val loadAdIndex = matches[2].index

        // The AdView register and the Context register come from the constructor call:
        //   invoke-direct { vAdView, vContext }, AdView;-><init>(Context)V
        val constructor = method.getInstruction<FiveRegisterInstruction>(constructorIndex)
        val adViewRegister = constructor.registerC
        val contextRegister = constructor.registerD

        // `new-instance` sits immediately before its constructor call.
        val newInstanceIndex = constructorIndex - 1
        val newInstance = method.getInstruction(newInstanceIndex)
        if (newInstance.opcode != Opcode.NEW_INSTANCE ||
            (newInstance as OneRegisterInstruction).registerA != adViewRegister
        ) {
            throw PatchException(
                "Expected new-instance for the AdView at index $newInstanceIndex, " +
                    "found ${newInstance.opcode}",
            )
        }

        // Replace everything from allocating the AdView through loading the ad.
        method.removeInstructions(newInstanceIndex, loadAdIndex - newInstanceIndex + 1)
        method.addInstructions(
            newInstanceIndex,
            """
                new-instance v$adViewRegister, Landroid/view/View;
                invoke-direct { v$adViewRegister, v$contextRegister }, Landroid/view/View;-><init>(Landroid/content/Context;)V
            """,
        )
    }
}
