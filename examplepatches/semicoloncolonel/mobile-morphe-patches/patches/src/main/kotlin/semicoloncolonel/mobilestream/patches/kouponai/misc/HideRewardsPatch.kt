package semicoloncolonel.mobilestream.patches.kouponai.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.Constants
import semicoloncolonel.mobilestream.patches.kouponai.shared.requireNativeLibsPatch
import semicoloncolonel.mobilestream.patches.kouponai.shared.disableCodePushPatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// Koupon 3.1.6 — Hide rewards.
//
// Koupon's reward points are earned by signing up, referring friends, posting
// about the app, and reporting expired codes, and are spent on items Koupon
// ships. For people who only want the deals, two places that show them are
// removed in the Hermes bundle (bytecode version 96):
//
//   USHomeTopBar   the home screen's top row is [search box, points pill]
//                  in r4. The pill's store, PutOwnByIndex (0x44) r4 r5 1,
//                  becomes two LoadConstUndefined (0x76) of r5, so only the
//                  search box is drawn.
//   EarnedPoints   the points card on the Me screen ("100 more pts to unlock
//                  next reward", View points), which now renders nothing.
//
// The tour's "100 points" pop-up is removed by Hide pop-ups. The points stay
// on the account; only the app's display changes.
//
// Koupon's over-the-air updates are turned off so that the patched bundle
// stays in use (DisableCodePushPatch).
// ─────────────────────────────────────────────────────────────────────────────

private const val PUT_OWN_BY_INDEX = 0x44
private const val LOAD_CONST_UNDEFINED = 0x76

private val hideRewardsInBundlePatch = rawResourcePatch {
    execute {
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.replaceInstructions(
            "USHomeTopBar",
            listOf("pointsButtonContainer", "Earn"),
            forVersion = 96,
            find = byteArrayOf(PUT_OWN_BY_INDEX.toByte(), 4, 5, 1),
            replace = byteArrayOf(LOAD_CONST_UNDEFINED.toByte(), 5, LOAD_CONST_UNDEFINED.toByte(), 5),
        )
        bundle.returnAtStart("EarnedPoints", HermesBundle.Value.NULL)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val hideRewardsPatch = resourcePatch(
    name = "Hide rewards",
    description = "Removes the reward points from the home screen and the Me screen, for people who only want the deals.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(requireNativeLibsPatch)

    dependsOn(hideRewardsInBundlePatch, disableCodePushPatch)
}
