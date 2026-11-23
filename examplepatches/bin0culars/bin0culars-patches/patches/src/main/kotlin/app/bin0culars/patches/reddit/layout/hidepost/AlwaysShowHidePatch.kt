package app.bin0culars.patches.reddit.layout.hidepost

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.POSTS
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/AlwaysShowHidePatch;"

@Suppress("unused")
val alwaysShowHidePatch =
    patch(
        name = "Always show Hide",
        description = "Keeps the Hide option in the post menu on Home, even when Reddit swaps it for recommendation options. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "always_show_hide",
                    section = POSTS,
                    title = "Always show Hide",
                    summary = "Keeps Hide in a post's ⋮ menu on Home. Reddit sometimes replaces it with \"Show fewer posts like this\" and \"Why was I recommended this?\"; those stay too.",
                    default = false,
                ),
            )

            val method = LoggedInPostMenuFingerprint.method
            val callIndex = LoggedInPostMenuFingerprint.instructionMatches[1].index
            val moveResultInstruction = method.getInstruction(callIndex + 1)
            if (moveResultInstruction.opcode != Opcode.MOVE_RESULT) {
                throw PatchException("Instruction after (FeedType)Z call in ${method.name} is not MOVE_RESULT")
            }
            val registerX = (moveResultInstruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("MOVE_RESULT instruction is not a OneRegisterInstruction")

            val invokeInstruction = if (registerX > 15) {
                "invoke-static/range { v$registerX .. v$registerX }, $EXTENSION_CLASS->hideReplaced(Z)Z"
            } else {
                "invoke-static { v$registerX }, $EXTENSION_CLASS->hideReplaced(Z)Z"
            }

            method.addInstructions(
                callIndex + 2,
                """
                    $invokeInstruction
                    move-result v$registerX
                """.trimIndent(),
            )
        }
    }
