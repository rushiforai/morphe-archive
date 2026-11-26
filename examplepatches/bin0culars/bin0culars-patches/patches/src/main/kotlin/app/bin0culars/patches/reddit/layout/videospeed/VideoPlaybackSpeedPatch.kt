package app.bin0culars.patches.reddit.layout.videospeed

import app.bin0culars.patches.reddit.misc.settings.BinocularsModsChoice
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSection.MEDIA
import app.bin0culars.patches.reddit.misc.settings.BinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.addBinocularsModsSetting
import app.bin0culars.patches.reddit.misc.settings.binocularsModsSettingsPatch
import app.bin0culars.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/VideoPlaybackSpeedPatch;"

@Suppress("unused")
val videoPlaybackSpeedPatch =
    patch(
        name = "Video playback speed",
        description = "Adds Reddit's playback speed controls to the full-screen video player. Turn it on in Settings → bin0culars mods.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_REDDIT)
        dependsOn(binocularsModsSettingsPatch)
        extendWith("extensions/extension.mpe")

        execute {
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "video_playback_speed",
                    section = MEDIA,
                    title = "Video playback speed",
                    summary = "Adds playback speed controls (0.5× to 2×) to the full-screen video player. Restart Reddit after changing this.",
                    default = false,
                ),
            )
            addBinocularsModsSetting(
                BinocularsModsSetting(
                    key = "video_playback_speed_controls",
                    section = MEDIA,
                    title = "Speed controls",
                    summary = "Where the speed controls appear.",
                    parentKey = "video_playback_speed",
                    choices = listOf(
                        BinocularsModsChoice("menu", "In the ⋮ menu"),
                        BinocularsModsChoice("menu_hold", "Menu and hold to speed up"),
                    ),
                    defaultChoice = "menu_hold",
                ),
            )

            val method = VideoPlaybackSpeedParserFingerprint.method
            val instructions = method.instructions
            val areEqualMatchIndex = VideoPlaybackSpeedParserFingerprint.instructionMatches.last().index

            var checkCastIndex = -1
            var register = -1

            for (i in (areEqualMatchIndex + 1) until (instructions.size - 1)) {
                val instruction = instructions[i]
                val nextInstruction = instructions[i + 1]
                if (instruction.opcode == Opcode.CHECK_CAST &&
                    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type ==
                    "Lcom/reddit/features/VideoPlaybackSpeedVariant;" &&
                    nextInstruction.opcode == Opcode.RETURN_OBJECT
                ) {
                    checkCastIndex = i
                    register = (instruction as? OneRegisterInstruction)?.registerA
                        ?: throw PatchException("CHECK_CAST instruction is not a OneRegisterInstruction")
                    break
                }
            }

            if (checkCastIndex == -1) {
                throw PatchException("Could not find CHECK_CAST to VideoPlaybackSpeedVariant followed by RETURN_OBJECT")
            }

            val returnIndex = checkCastIndex + 1
            val invokeSmali = if (register > 15) {
                "invoke-static/range {v$register .. v$register}, $EXTENSION_CLASS->variant(Ljava/lang/Object;)Ljava/lang/Object;"
            } else {
                "invoke-static {v$register}, $EXTENSION_CLASS->variant(Ljava/lang/Object;)Ljava/lang/Object;"
            }
            val smali =
                """
                    $invokeSmali
                    move-result-object v$register
                    check-cast v$register, Lcom/reddit/features/VideoPlaybackSpeedVariant;
                """.trimIndent()

            method.addInstructions(returnIndex, smali)
        }
    }
