package app.morphed.patches.twitch.quality

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphed.patches.twitch.settings.checkNoJumpTo
import app.morphed.patches.twitch.settings.patchSettingsPatch
import app.morphed.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import app.morphed.patches.twitch.shared.markIncluded
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HIGHEST_CLASS = "Lapp/morphed/extension/twitch/quality/HighestQuality;"
private const val PLAYER = "Lcom/amazonaws/ivs/player/Player;"

@Suppress("unused")
val highestQualityPatch = bytecodePatch(
    name = "Highest quality",
    description = "Adds a Highest quality switch to the video player's Options: with it on, every stream starts at " +
        "its highest quality instead of Auto. A quality chosen afterwards stays as chosen.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    dependsOn(patchSettingsPatch)
    extendWith("extensions/twitch.mpe")

    execute {
        markIncluded("highestQuality")

        // React Native player: right after it gets its player, before it reads the qualities for its Options.
        EmitQualitiesFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val getPlayer = instructions.indexOfFirst {
                it.opcode.name.startsWith("invoke") &&
                    it.getReference<MethodReference>()?.returnType == MEDIA_PLAYER
            }
            check(getPlayer >= 0 && instructions[getPlayer + 1].opcode == Opcode.MOVE_RESULT_OBJECT) {
                "IvsPlayerController.emitQualities doesn't get its player as expected; the patch needs an update"
            }
            val player = getInstruction<OneRegisterInstruction>(getPlayer + 1).registerA
            checkNoJumpTo(this, getPlayer + 2, "the highest quality call")
            addInstructions(
                getPlayer + 2,
                "invoke-static/range { v$player .. v$player }, $HIGHEST_CLASS->onQualities($PLAYER)V"
            )
        }

        // Native player: on READY (its qualities known). The extension waits for the app to finish that call: in it,
        // the app puts back the quality it saved last time, and the stream's start is the switch's.
        NativeStateChangedFingerprint.method.apply {
            val call = readyPlayerCall(this)
            val player = getInstruction<FiveRegisterInstruction>(call).registerC
            check(player <= 15) { "The native player's READY call uses a register above v15; the patch needs an update" }
            checkNoJumpTo(this, call, "the highest quality call")
            addInstructions(call, "invoke-static { v$player }, $HIGHEST_CLASS->onReady($PLAYER)V")
        }
    }
}
