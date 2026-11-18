package io.github.jordanwoodson.patches.kick.player

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import io.github.jordanwoodson.patches.kick.settings.kickMatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.settings.kickSettingsPatch
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KEY = "fill_screen"

@Suppress("unused")
val fillScreenPatch = bytecodePatch(
    name = "Fill screen",
    description = "Zooms streams and videos to fill the screen in landscape, cropping their top and bottom instead " +
        "of showing black bars at the sides, on phones taller than 16:9. Vertical videos and the player next to " +
        "the chat keep their bars. Starts off. Turn it on in Lurk settings > Playback.",
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickSettingsPatch)

    execute {
        // Kick's player is a Media3 PlayerView, whose video frame (AspectRatioFrameLayout) sizes the video by its
        // resize mode while measuring. Kick never sets a content fit, so the mode stays FIT. The hook goes where the
        // frame reads the mode, after it has compared the video's width / height with its own: KickPlayer.resizeMode
        // gets the mode and both ratios and may hand back ZOOM. The frame measures again on every layout, so rotating
        // or entering picture-in-picture checks again.
        AspectRatioMeasureFingerprint.kickMatch("video frame measure").method.apply {
            Locators.record("kick.fill_screen.video_frame_measure", this)
            val code = implementation!!.instructions.toList()
            fun field(name: String, type: String) = "Landroidx/media3/ui/AspectRatioFrameLayout;->$name:$type"
            val modeField = field("resizeMode", "I")
            val ratioField = field("videoAspectRatio", "F")
            val read = code.indices.singleOrNull { i ->
                code[i].opcode == Opcode.IGET && (code[i] as ReferenceInstruction).reference.toString() == modeField
            } ?: throw PatchException("Kick: expected one resize mode read in the video frame")
            val mode = (code[read] as TwoRegisterInstruction).registerA
            // The view's own ratio: the first float division, of its measured width by its measured height.
            val division = code.firstOrNull { it.opcode == Opcode.DIV_FLOAT } as? ThreeRegisterInstruction
                ?: throw PatchException("Kick: the video frame no longer divides its width by its height")
            val viewRatio = division.registerA
            // A scratch register for the video's ratio: the one the instruction after the read overwrites without
            // reading it.
            val next = code.getOrNull(read + 1)
            val scratch = (next as? OneRegisterInstruction)?.registerA
            if (next == null || next.opcode !in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) ||
                scratch == null || scratch == mode || scratch == viewRatio ||
                code.subList(code.indexOf(division as Instruction) + 1, read).any {
                    it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == viewRatio
                }
            ) {
                throw PatchException("Kick: the video frame's registers around the resize mode changed")
            }
            addInstructions(
                read + 1,
                """
                    iget v$scratch, p0, $ratioField
                    ${invokeStatic("$KICK_PLAYER->resizeMode(Landroid/view/View;IFF)I",
                        parameterRegister(0), mode, scratch, viewRatio)}
                    move-result v$mode
                """,
            )
        }
        kickSettings.add(
            SwitchSetting(
                KEY,
                "Fill screen",
                "Zoom streams to fill the screen in landscape instead of showing bars at the sides, cropping their " +
                    "top and bottom. Not for vertical videos, next to the chat or in picture-in-picture.",
                Section.PLAYBACK,
                default = false,
            ),
        )
    }
}
