package app.morphe.patches.kicktv.hidepinned

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patches.kicktv.KICK_TV
import app.morphe.patches.kicktv.settings.settingsPatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kicktv/hidepinned/"

/**
 * Chat panel composable. The pinned message is rendered as an
 * `AnimatedVisibility` card whose first argument is the "visible" flag:
 * `rr0.b != null`. The card is built by the `tw5.b(...)` composition call.
 *
 * Passing that flag through the preference helper removes the whole card
 * (including the pinned ad text) when the tweak is enabled.
 */
private object ChatPanelPinnedFingerprint : Fingerprint(
    definingClass = "La79;",
    name = "a",
    parameters = listOf(
        "Lrw0;",
        "Ljava/util/List;",
        "Lkotlin/jvm/functions/Function0;",
        "Lkotlin/jvm/functions/Function1;",
        "Ljava/util/List;",
        "Lvz2;",
        "Z",
        "Lp73;",
        "I",
    ),
    returnType = "V",
    filters = listOf(
        string("AnimatedVisibility"),
        methodCall(definingClass = "Ltw5;", name = "b"),
    ),
)

/**
 * HIDE PINNED tweak. Removes the pinned message card from the top of the KICK
 * chat. The toggle lives in the SEYTTINGS menu provided by the base patch
 * this patch depends on.
 */
@Suppress("unused")
val hidePinnedChatPatch = patch(
    name = "HIDE PINNED",
    description = "Hides the pinned message card (and the ad banner attached to " +
        "it) at the top of the KICK chat. Toggle it in SEYTTINGS. Requires the " +
        "SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(KICK_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/KickHidePinned.mpe")

    execute {
        ChatPanelPinnedFingerprint.apply {
            // instructionMatches: [AnimatedVisibility string, tw5.b visibility call]
            val index = instructionMatches[1].index
            val instruction = method.getInstruction(index)
            val register = when (instruction) {
                is RegisterRangeInstruction -> instruction.startRegister
                is FiveRegisterInstruction -> instruction.registerC
                else -> error("Unexpected pinned visibility call: $instruction")
            }

            method.addInstructions(
                index,
                """
                    invoke-static {v$register}, ${EXTENSION_CLASS}PinnedChatPrefs;->shouldShowPinned(Z)Z
                    move-result v$register
                """,
            )
        }
    }
}
