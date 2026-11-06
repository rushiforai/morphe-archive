package app.lopikss.patches.xphero

import app.lopikss.patches.shared.Constants.XP_HERO_27
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.rawResourcePatch

/** XP Hero 27.0.0 local EXP reward and single-kill cap boost. */
@Suppress("unused")
val xp142MassiveExpMultiplier = rawResourcePatch(
    name = "XP Hero | Massive EXP Multiplier",
    description = "Monster EXP 1x–100000x (default 10000x). Optional EXPERIMENTAL level cap 2200; original max 1500 remains default. Extending player level might be rejected by server checks or break existing saves.",
    default = false,
) {
    compatibleWith(XP_HERO_27)

    val multiplier = intOption(
        key = "monsterExpMultiplier",
        default = 10000,
        title = "Monster EXP multiplier",
        description = "1x–100000x, default 10000x. Very large rewards are capped for 64-bit safety; actual EXP may be limited by game/server checks.",
        required = true,
        validator = { it != null && it in 1..100000 },
    )

    val maxPlayerLevel = intOption(
        key = "experimentalMaxPlayerLevel",
        default = 1500,
        title = "EXPERIMENTAL player level cap",
        description = "1500 = original XP Hero 27.0.0 maximum. 2200 = add unverified post-1500 EXP and base-stat rows. Risk of account/save incompatibility; back up your account first.",
        required = true,
        validator = { it != null && (it == 1500 || it == 2200) },
    )

    execute {
        val factor = multiplier.value ?: 10000
        val requestedMaxLevel = maxPlayerLevel.value ?: 1500
        val rewards = get(XP142ExpMultiplierData.ENEMY_EXP)
        val limit = get(XP142ExpMultiplierData.KILL_LIMIT)

        // Validate and generate BOTH complete resources before any write.
        val increasedExp = XP142ExpMultiplierData.multiplyEnemyExp(
            rewards.readBytes(), factor
        )
        val increasedLimit = XP142ExpMultiplierData.multiplyKillLimit(
            limit.readBytes(), factor, requestedMaxLevel
        )
        // All resource edits are validated before committing any writes.
        val playerFile = if (requestedMaxLevel == 2200) {
            get(XP142ExpMultiplierData.PLAYER_LEVEL)
        } else null
        val extendedPlayerData = playerFile?.let {
            XP142ExpMultiplierData.extendPlayerLevel(it.readBytes())
        }
        rewards.writeBytes(increasedExp)
        limit.writeBytes(increasedLimit)
        if (playerFile != null && extendedPlayerData != null) {
            playerFile.writeBytes(extendedPlayerData)
        }
    }
}
