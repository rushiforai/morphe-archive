package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Hides Gold-gated UI instead of spoofing it.
 *
 * Gold features are server-authorized, so forcing isGold=true only shows
 * entries that fail server checks. This patch forces every Gold check to
 * FALSE (Account.isGold/isGoldUser + all 3 GoldUtilsKt overloads) so
 * Gold rows/badges stay hidden rather than broken. Independent toggle from
 * the Plus spoof — enable alongside it on a free account.
 */
@Suppress("unused")
val hideGoldPatch = bytecodePatch(
    name = "Hide Gold features",
    description = "Forces Account.isGold/isGoldUser and all GoldUtilsKt.isGold overloads to false. Hides server-gated Gold UI instead of spoofing it.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        IsGoldFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        IsGoldUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        GoldUtilsProfileFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        GoldUtilsRankedUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        GoldUtilsStoryUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
