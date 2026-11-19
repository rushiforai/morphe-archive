package app.ahmedyarub.patches.reddit.pro

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val MAX_CONST_4_REGISTER = 15

@Suppress("unused")
val removeRedditProSectionPatch = bytecodePatch(
    name = "Remove Reddit Pro section",
    description = "Removes the Reddit Pro section from the community drawer, and the Reddit " +
            "Pro promos: the post creation and subreddit join upsell sheets, and the " +
            "Reddit Pro banner on the profile feed.",
    default = true
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        // Report every viewer as ineligible for a Reddit Pro promo.
        //
        // This is a suspend function, so its return value is either the resolved value or
        // COROUTINE_SUSPENDED. Returning the value immediately completes the call without
        // suspending, which is what the function already does on its own early-out paths.
        ProPromoEligibilityFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $PRO_PROMO_ELIGIBILITY_CLASS->NONE:$PRO_PROMO_ELIGIBILITY_CLASS
                return-object v0
            """
        )

        // Drop the profile feed upsell element before it reaches the feed.
        //
        // Returning null here is an existing code path: the factory already returns null for
        // an unrecognised promo type or a disabled feature flag, and callers handle it.
        ProfileFeedUpsellElementFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )

        // Remove the Reddit Pro section from the community drawer.
        //
        // Reporting no Pro status makes the drawer take the branch that clears the section
        // header, the "Trends"/"Try Reddit Pro" entry and the "Links" entry, which is a state
        // the app already handles for accounts without Reddit Pro.
        CommunityDrawerProStatusFingerprint.let {
            val moveResultIndex = it.instructionMatches[1].index

            it.method.apply {
                val register = getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

                // const/4 only encodes a 4 bit register.
                val setNull = if (register <= MAX_CONST_4_REGISTER) {
                    "const/4 v$register, 0x0"
                } else {
                    "const/16 v$register, 0x0"
                }

                addInstruction(moveResultIndex + 1, setNull)
            }
        }
    }
}
