package app.template.patches.bullethell

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ROOST
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

/**
 * Factor to multiply the player's firing speed by. Firing speed = 1 / fire-interval,
 * so the cooldown interval is divided by this.
 */
private const val FIRE_RATE_MULTIPLIER = 10f

/**
 * The player auto-fires on a cooldown timer (`La9/r;->k:F`) that, after each shot, is reset
 * to a fire interval. One interval is used (smali: `LB7/m;->a`, the fire-cooldown reset):
 *  - 0.15f (`0x3e19999a`) normally.
 * Note: in v1.4.12 a second interval (0.1f, rapid-fire powerup) existed but was removed in v1.4.19.
 */
private val ORIGINAL_FIRE_INTERVALS = listOf(0.15f)

@Suppress("unused")
val beamOfDeathPatch = bytecodePatch(
    name = "Beam of Death (10x Fire Rate)",
    description = "Multiplies the player's firing speed by 10 in the Bullet Hell minigame " +
        "(fire interval 0.15 -> 0.015) for a near-continuous beam.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ROOST)

    execute {
        PlayerBulletSpawnFingerprint.method.apply {
            ORIGINAL_FIRE_INTERVALS.forEach { originalInterval ->
                val patchedInterval = originalInterval / FIRE_RATE_MULTIPLIER

                // Each interval is set with a full 32-bit `const vX, <float bits>`.
                val index = implementation!!.instructions.indexOfFirst {
                    (it as? WideLiteralInstruction)?.wideLiteral == originalInterval.toRawBits().toLong()
                }
                require(index >= 0) {
                    "Beam of Death: fire interval ${originalInterval}f not found in the player fire method"
                }

                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(index, "const v$register, 0x%08x".format(patchedInterval.toRawBits()))
            }
        }
    }
}
