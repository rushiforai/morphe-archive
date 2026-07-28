package app.template.patches.bullethell

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ROOST
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Original player-bullet size in pixels (first `PlayerBullet` constructor argument,
 * `La9/q;->e:F`). Smali: `const/high16 vXX, 0x40c00000  # 6.0f`.
 */
private const val ORIGINAL_BULLET_SIZE_PX = 6.0f

/**
 * Tripled bullet size (6.0f -> 18.0f).
 */
private const val PATCHED_BULLET_SIZE_PX = ORIGINAL_BULLET_SIZE_PX * 3

@Suppress("unused")
val bulletSizePatch = bytecodePatch(
    name = "Triple Bullet Size",
    description = "Triples the on-screen size of the player's bullets in the Bullet Hell minigame " +
        "(sizePx 6.0 -> 18.0).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ROOST)

    execute {
        // instructionMatches[0] is the sizePx literal (const/high16 6.0f).
        val sizeIndex = PlayerBulletSpawnFingerprint.instructionMatches[0].index

        PlayerBulletSpawnFingerprint.method.apply {
            val sizeRegister = getInstruction<OneRegisterInstruction>(sizeIndex).registerA
            replaceInstruction(sizeIndex, "const/high16 v$sizeRegister, ${PATCHED_BULLET_SIZE_PX}f")
        }
    }
}
