package com.morphe.friendsturner.patches

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.morphe.friendsturner.patches.Constants.COMPATIBILITY_FRIENDSTURNER

/**
 * Hide the banner ad by taking the app's own ad-free layout path.
 *
 * An alternative to [hideBannerAdPatch]. Both remove the same banner; pick one.
 *
 * The app already hides the banner for sponsors, behind an `if-nez` on the ad-free flag.
 * This forces that conditional so the banner is skipped by the app's own layout code,
 * which means the surrounding spacing is exactly what a sponsor sees. [hideBannerAdPatch]
 * instead leaves the layout in place and substitutes an empty view for the AdView.
 *
 * Only the branch feeding the banner is forced. The flag itself is untouched, so the
 * button still reads "Sponsor to remove ads" rather than claiming a purchase, and the
 * billing code keeps its real state.
 *
 * The `move-result` that feeds the branch is replaced with a constant 1:
 *
 *     invoke-virtual { v }, Ljava/lang/Boolean;->booleanValue()Z
 *     const/16 v, 0x1        # was: move-result v
 *     if-nez v, :skip_banner
 */
@Suppress("unused")
val hideBannerAdSponsorLayoutPatch = bytecodePatch(
    name = "Hide banner ad (ad-free layout)",
    description = "Removes the banner ad by taking the layout path the app already uses for sponsors. " +
        "An alternative to \"Hide banner ad\"; enable one or the other.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FRIENDSTURNER)

    execute {
        val method = BannerAdSponsorGateFingerprint.method
        val matches = BannerAdSponsorGateFingerprint.instructionMatches

        val moveResultIndex = matches[1].index
        val branchIndex = matches[2].index

        val resultRegister = method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA
        val branchRegister = method.getInstruction<OneRegisterInstruction>(branchIndex).registerA
        if (resultRegister != branchRegister) {
            throw PatchException(
                "The banner conditional reads v$branchRegister but the boolean lands in " +
                    "v$resultRegister, so forcing it would change the wrong value",
            )
        }

        method.replaceInstruction(moveResultIndex, "const/16 v$resultRegister, 0x1")
    }
}
