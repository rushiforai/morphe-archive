/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.media.speed

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.facebook.shared.FacebookTargets
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private val extensionPatch = sharedExtensionPatch("facebook", false)

private const val SPEED_CONTROLLER =
    "Lapp/morphe/extension/facebook/media/ReelsPlaybackSpeed;"
private const val OVERRIDE_SPEED =
    "$SPEED_CONTROLLER->overrideSpeed(Ljava/lang/Object;F)F"
private const val OVERRIDE_GETTER =
    "$SPEED_CONTROLLER->overrideGetter(F)F"
private const val ON_PLAYER_READ =
    "$SPEED_CONTROLLER->onPlayerRead(Ljava/lang/Object;)V"

@Suppress("unused")
val reels2xSpeedPatch = bytecodePatch(
    name = "Reels 2x speed",
    description = "Adds hold-to-speed and slide-to-lock gestures for Shorts.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(extensionPatch)

    execute {
        if (packageMetadata.versionName != FacebookTargets.V580) return@execute

        val setter = ReelsPlaybackSpeedSetterFingerprint.method
        setter.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $OVERRIDE_SPEED
                move-result p1
            """.trimIndent(),
        )

        val getter = ReelsPlaybackSpeedGetterFingerprint.method
        getter.addInstructions(
            0,
            """
                invoke-static {p0}, $ON_PLAYER_READ
            """.trimIndent(),
        )

        val returns = getter.implementation!!.instructions.withIndex()
            .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN }
            .map { (index, instruction) ->
                index to (instruction as OneRegisterInstruction).registerA
            }
        check(returns.isNotEmpty()) {
            "Reels playback speed getter has no return site"
        }
        returns.asReversed().forEach { (index, register) ->
            check(register == 0) {
                "Reels playback speed getter returns an unexpected register v$register"
            }
            getter.addInstructions(
                index,
                """
                    invoke-static {p0}, $OVERRIDE_GETTER
                    move-result p0
                """.trimIndent(),
            )
        }

        println(
            "[Reels2xSpeed] setter=${setter.definingClass}->${setter.name} " +
                "getter=${getter.definingClass}->${getter.name} returns=${returns.size}",
        )
    }
}

object ReelsPlaybackSpeedSetterFingerprint : Fingerprint(
    definingClass = "LX/5BR;",
    name = "A1V",
    returnType = "V",
    parameters = listOf("F"),
)

object ReelsPlaybackSpeedGetterFingerprint : Fingerprint(
    definingClass = "LX/5BR;",
    name = "Brl",
    returnType = "F",
    parameters = emptyList(),
)
