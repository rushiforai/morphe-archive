package app.template.patches.bullethell

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ROOST
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Original player-bullet damage (second `PlayerBullet` constructor argument,
 * `La9/q;->d:I`). Smali: `const/16 vXX, 0x1`.
 */
private const val ORIGINAL_BULLET_DAMAGE = 1

/**
 * 10x bullet damage (1 -> 10). Applied to both enemies and the boss, since the same
 * value is decremented from `La9/m;->d:I` (enemy) and `La9/C1779a;->b:I` (boss).
 */
private const val PATCHED_BULLET_DAMAGE = ORIGINAL_BULLET_DAMAGE * 10

@Suppress("unused")
val bulletDamagePatch = bytecodePatch(
    name = "10x Bullet Damage",
    description = "Multiplies the player's bullet damage by 10 in the Bullet Hell minigame " +
        "(damage 1 -> 10), applied to both enemies and bosses.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ROOST)

    execute {
        // instructionMatches[1] is the damage literal (const/16 ... 1) feeding the
        // PlayerBullet constructor's second argument.
        val damageIndex = PlayerBulletSpawnFingerprint.instructionMatches[1].index

        PlayerBulletSpawnFingerprint.method.apply {
            val damageRegister = getInstruction<OneRegisterInstruction>(damageIndex).registerA
            replaceInstruction(damageIndex, "const/16 v$damageRegister, $PATCHED_BULLET_DAMAGE")
        }
    }
}
