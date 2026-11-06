package app.lopikss.patches.xphero

import app.lopikss.patches.shared.Constants.XP_HERO
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

/**
 * XP Hero 26.2.0 specific price changes.
 * Each patch is opt-in and fails closed if a version checksum differs.
 */
private object XP132 {
    const val RUNE = "assets/bin/Data/5c71a89120ce9496491d806af04862a5"
    const val PRESET = "assets/bin/Data/1790c1cc9250a4537b46cbac83a93f97"
    const val ARM64 = "lib/arm64-v8a/libil2cpp.so"
    private const val RUNE_SHA = "39fde9fe03d9c58da0661a56dc6adb4cdc28b1f7034fe7c40108f8b1ad9c6469"
    private const val PRESET_SHA = "bba3c112e32ca87b6c040f513001f24239d423db581cc0aaddf7d30a8df7f0c5"
    private const val ARM64_SHA = "88b591e6099c55b1147b865847a14651b108f9bd6837707371766a054c8df443"

    private fun hash(data: ByteArray): String =
        MessageDigest.getInstance("SHA-256").digest(data)
            .joinToString("") { "%02x".format(it) }

    private fun zeroCostValues(
        original: ByteArray, sha: String, rows: Int, vararg fields: String
    ): ByteArray {
        require(hash(original) == sha) { "Unsupported XP Hero resource" }
        var text = String(original, Charsets.ISO_8859_1)
        for (field in fields) {
            val rule = Regex("\"" + Regex.escape(field) + "\":\"([0-9]+)\"")
            check(rule.findAll(text).count() == rows) {
                "Unexpected XP Hero cost table row count for " + field
            }
            text = rule.replace(text) { found ->
                "\"" + field + "\":\"" + "0".repeat(found.groupValues[1].length) + "\""
            }
        }
        val output = text.toByteArray(Charsets.ISO_8859_1)
        check(output.size == original.size && !output.contentEquals(original))
        return output
    }

    fun runes(data: ByteArray) =
        zeroCostValues(data, RUNE_SHA, 1440, "cost_value_1", "cost_value_2")

    fun presets(data: ByteArray) =
        zeroCostValues(data, PRESET_SHA, 4, "load_cost_amount", "save_cost_amount")

    /**
     * ARM64 native CalculateRollCost(int lockedTraits) override:
     * Return zero coins for 0..5 locked traits (and any other count).
     * All call sites, including TryConsumeRollCost, receive the same zero.
     * The implementation doesn't change unrelated coin expenditures.
     */
    fun traitRerolls(data: ByteArray): ByteArray = XP135NativeEditor.freeTraitRerolls(data)
}

@Suppress("unused")
val xp132FreeRuneUpgrades = rawResourcePatch(
    name = "XP Hero | Free Rune Upgrades",
    description = "Experimental: zero both resource costs for all 1,440 rune upgrade levels.",
    default = false,
) {
    compatibleWith(XP_HERO)
    execute {
        val file = get(XP132.RUNE)
        file.writeBytes(XP132.runes(file.readBytes()))
    }
}

@Suppress("unused")
val xp132FreeTraitPresets = rawResourcePatch(
    name = "XP Hero | Free Trait Presets",
    description = "Experimental: zero save/load costs for four trait presets (not rerolls).",
    default = false,
) {
    compatibleWith(XP_HERO)
    execute {
        val file = get(XP132.PRESET)
        file.writeBytes(XP132.presets(file.readBytes()))
    }
}

@Suppress("unused")
val xp132ZeroTraitRerollCoins = rawResourcePatch(
    name = "XP Hero | Free Trait Rerolls",
    description = "Experimental: change the ARM64 trait reroll cost calculator to return 0, including for locked traits.",
    default = false,
) {
    compatibleWith(XP_HERO)
    execute {
        val library = get(XP132.ARM64)
        library.writeBytes(XP132.traitRerolls(library.readBytes()))
    }
}
