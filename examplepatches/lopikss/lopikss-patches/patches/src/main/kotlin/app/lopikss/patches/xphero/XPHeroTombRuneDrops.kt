package app.lopikss.patches.xphero

import app.lopikss.patches.shared.Constants.XP_HERO_27
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

internal object TombRuneDrops {
    const val DROP_TABLE = "assets/bin/Data/0dbcfca3374434d098924e93b5c44354" // HeroTombRuneDropData_9
    const val REWARD_TABLE = "assets/bin/Data/24e543787512040e4b28b9c0b61c2286" // RewardGroupData_152

    private const val DROP_SHA = "bfefd20f8e864bb567b86134d43cc1b303c56478e80a4fda6a8f31300f880f56"
    private const val REWARD_SHA = "f6497fb54771d036b0cc571db761519bf57ffceddad0784dad82c7dc596725f4"
    private const val PATCHED_SHA = "ba72679965bd8445869f7e3098b955decaa25d3bf3dcf7abdfb4f6ba351024d4"

    private val dropGroups = Regex(
        """"gacha_reward_id":"(\d+)","id":"\d+","reward_id":"(\d+)"\}"""
    )
    private val rarityRow = Regex(
        """\{"BundleGroup":"1","Group":"(\d+)","Rate":"(\d+)","RewardCount_Max":"1","RewardCount_Min":"1","RewardParam":"([1-8])","RewardType":"102","id":"\d+"\}"""
    )

    private fun sha(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes)
        .joinToString("") { "%02x".format(it) }

    fun apply(drops: ByteArray, rewards: ByteArray): ByteArray {
        require(sha(drops) == DROP_SHA) { "Unsupported XP Hero 27.0.0 Tomb drop table" }
        when (sha(rewards)) {
            PATCHED_SHA -> return rewards
            REWARD_SHA -> Unit
            else -> error("Unsupported or modified XP Hero 27.0.0 reward table")
        }

        // Only groups reached via the Tomb's main or bonus drops are in scope.
        val groupIds = dropGroups.findAll(drops.toString(Charsets.ISO_8859_1))
            .flatMap { sequenceOf(it.groupValues[1], it.groupValues[2]) }.toSet()
        val rowsByGroup = rarityRow.findAll(rewards.toString(Charsets.ISO_8859_1))
            .filter { it.groupValues[1] in groupIds }.groupBy { it.groupValues[1] }
        check(groupIds.size == 8 && rowsByGroup.keys == groupIds) { "Incomplete Tomb reward pools" }

        val result = rewards.copyOf()
        for (rows in rowsByGroup.values) {
            val highest = rows.filter { it.groupValues[2].toInt() > 0 }.maxOf { it.groupValues[3].single() }
            for (row in rows) {
                // Type 102 passes RewardParam (grade) to RuneRewardPicker. Redirect every rune
                // weight to the same grade. Even reweighting for a drop bonus retains this grade.
                // A one-byte edit leaves the roll boundaries, quantities and Unity layout intact.
                result[row.groups[3]!!.range.first] = highest.code.toByte()
            }
        }
        check(sha(result) == PATCHED_SHA) { "Unexpected Tomb reward rewrite" }
        return result
    }
}

@Suppress("unused")
val xpHeroHighestTombRuneDrops = rawResourcePatch(
    name = "XP Hero | Highest-Rarity Tomb Runes",
    description = "Every rune dropped in Heroes' Tomb uses the highest available grade for the selected difficulty, including three-ticket runs. Original loot counts and ticket costs apply.",
    default = false,
) {
    compatibleWith(XP_HERO_27)
    execute {
        val rewards = get(TombRuneDrops.REWARD_TABLE)
        val edited = TombRuneDrops.apply(get(TombRuneDrops.DROP_TABLE).readBytes(), rewards.readBytes())
        rewards.writeBytes(edited)
    }
}
