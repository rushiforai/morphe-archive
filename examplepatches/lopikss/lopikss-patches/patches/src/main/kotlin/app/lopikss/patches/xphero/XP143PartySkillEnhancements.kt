package app.lopikss.patches.xphero

import app.lopikss.patches.shared.Constants.XP_HERO_27
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

/**
 * XP Hero 27.0.0 PartySkillLevelData_8.
 *
 * The original XAPK contains 60 levels across six Boss Raid party skills.
 * Each level has three local material costs (180 fields in total).
 * This editor changes only those amounts, never the buff values, item
 * identities, skill levels, cooldowns, or other upgrade requirements.
 */
internal object XP143PartySkillCostEditor {
    const val ASSET = "assets/bin/Data/365a96aad1e884bcdb51af6b97b61396"
    private const val ORIGINAL_SHA256 =
        "d2779d5012a331585d38c43a9f8df2717e5c4a85d14b55c0a86547444dce7f95"

    private val costField = Regex("""("cost_amount_[123]":")([0-9]+)(")""")
    private val partySkillId = Regex("""("party_skill_id":")([1-6])(")""")

    fun freeEnhancements(input: ByteArray): ByteArray {
        val sha = MessageDigest.getInstance("SHA-256").digest(input)
            .joinToString("") { "%02x".format(it) }
        require(sha == ORIGINAL_SHA256) {
            "Unsupported XP Hero 27.0.0 PartySkillLevelData_8 asset"
        }

        val source = String(input, Charsets.ISO_8859_1)
        check("PartySkillLevelData_8" in source) {
            "Unexpected XP Hero party skill table"
        }

        val ids = partySkillId.findAll(source).map { it.groupValues[2].toInt() }.toList()
        check(ids.size == 60 && (1..6).all { id -> ids.count { it == id } == 10 }) {
            "Expected exactly 10 levels for each of six party skills"
        }

        val prices = costField.findAll(source).toList()
        check(prices.size == 180 && prices.count { it.groupValues[2] != "0" } == 174) {
            "Unexpected XP Hero party skill enhancement cost fields"
        }

        // Use the same width-preserving Unity TextAsset edit as the other
        // version-pinned free-cost patches. Keep every other byte untouched.
        val modified = costField.replace(source) { match ->
            match.groupValues[1] +
                "0".repeat(match.groupValues[2].length) +
                match.groupValues[3]
        }.toByteArray(Charsets.ISO_8859_1)

        check(modified.size == input.size && !modified.contentEquals(input)) {
            "Party skill enhancement asset unexpectedly changed"
        }
        return modified
    }
}

/**
 * Client-side material cost removal; actual enhancement completion still
 * depends on the game's native consumption flow and any server validation.
 */
@Suppress("unused")
val xp143FreePartySkillEnhancements = rawResourcePatch(
    name = "XP Hero | Free Party Skill Enhancements",
    description = "Experimental (27.0.0): zero all three material costs for 60 party-skill levels across six Boss Raid skills, including Battle Cry. In-game completion is not yet verified.",
    default = false,
) {
    compatibleWith(XP_HERO_27)

    execute {
        val file = get(XP143PartySkillCostEditor.ASSET)
        val edited = XP143PartySkillCostEditor.freeEnhancements(file.readBytes())
        file.writeBytes(edited)
    }
}
