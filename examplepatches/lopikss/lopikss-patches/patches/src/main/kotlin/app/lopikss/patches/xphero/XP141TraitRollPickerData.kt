package app.lopikss.patches.xphero

import java.security.MessageDigest

/**
 * XP Hero 27.0.0: make S-ticket rolls choose a configured rarity, stat and
 * synergy by preserving table entries and allocating their existing total
 * probabilities to the chosen entry.
 *
 * Coin-roll rarity and synergy pools stay unchanged. The stat option table
 * is shared across both roll modes: a rare coin roll at the chosen rarity
 * will use the selected stat too. No existing trait is rewritten.
 * Expects the unmodified three Unity TextAsset files from the 27.0.0 XAPK.
 */
internal object XP141TraitRollPickerData {
    const val ROLLS = "assets/bin/Data/06e9ff6d34f254a88877b32bc34f7754"
    const val OPTIONS = "assets/bin/Data/0693dabf45121403a9b0fb7b1e635c67"
    const val SYNERGIES = "assets/bin/Data/a65c8cfce7ffa48968944d4a416faf30"

    private const val ROLLS_SHA = "8c80b394d9a800ed939fa09451fc7e254200683448df5271a597858f7b55262a"
    private const val OPTIONS_SHA = "a8968828bd42abcdf40f68bdfb0ffd5fa2b847d8614e8d8948bcf07278be9eb8"
    private const val SYNERGIES_SHA = "7cac57a66b25d21e9876db7263435be0341f7d8ceb745d12e8ee41e9414734e7"

    val validStats = setOf(1, 2, 5, 9, 10, 18, 19, 20, 21)
    val validRarities = setOf(6, 7, 8)
    val validSynergies = setOf(1, 2, 3, 4, 5)

    private fun sha(input: ByteArray): String = MessageDigest.getInstance("SHA-256")
        .digest(input).joinToString("") { "%02x".format(it) }

    private fun le32(bytes: ByteArray, offset: Int): Int =
        (bytes[offset].toInt() and 255) or
            ((bytes[offset + 1].toInt() and 255) shl 8) or
            ((bytes[offset + 2].toInt() and 255) shl 16) or
            ((bytes[offset + 3].toInt() and 255) shl 24)

    private fun be32(bytes: ByteArray, offset: Int): Int =
        ((bytes[offset].toInt() and 255) shl 24) or
            ((bytes[offset + 1].toInt() and 255) shl 16) or
            ((bytes[offset + 2].toInt() and 255) shl 8) or
            (bytes[offset + 3].toInt() and 255)

    private fun putLE32(bytes: ByteArray, offset: Int, value: Int) {
        for (i in 0..3) bytes[offset + i] = (value ushr (8 * i)).toByte()
    }

    private fun putBE64(bytes: ByteArray, offset: Int, value: Long) {
        for (i in 0..7) bytes[offset + i] = (value ushr (8 * (7 - i))).toByte()
    }

    private class UnityTextAsset(input: ByteArray, expectedName: String, expectedSha: String) {
        private val original = input
        private val textStart: Int
        val text: String

        init {
            require(sha(input) == expectedSha) {
                "Unexpected XP Hero 27.0.0 " + expectedName + " asset hash"
            }
            require(input.size > 170 && be32(input, 8) == 22 && be32(input, 36) == 144) {
                "Unexpected Unity TextAsset header (" + expectedName + ")"
            }
            val length = (0..7).fold(0L) { acc, i ->
                (acc shl 8) or (input[24 + i].toLong() and 255L)
            }
            require(length == input.size.toLong() && le32(input, 112) == input.size - 144) {
                "Invalid Unity TextAsset length"
            }
            val nameLength = le32(input, 144)
            require(nameLength == expectedName.length &&
                String(input, 148, nameLength, Charsets.ISO_8859_1) == expectedName) {
                "Unexpected Unity TextAsset name"
            }
            val textSizePos = 148 + ((nameLength + 3) and -4)
            val textSize = le32(input, textSizePos)
            textStart = textSizePos + 4
            require(textSize > 0 && textStart + textSize <= input.size &&
                input.copyOfRange(textStart + textSize, input.size).all { it == 0.toByte() }) {
                "Invalid Unity TextAsset payload"
            }
            text = String(input, textStart, textSize, Charsets.ISO_8859_1)
        }

        fun encode(replacement: String): ByteArray {
            val bytes = replacement.toByteArray(Charsets.ISO_8859_1)
            val newFileSize = (textStart + bytes.size + 3) and -4
            val result = ByteArray(newFileSize)
            original.copyInto(result, 0, 0, textStart)
            bytes.copyInto(result, textStart)
            putLE32(result, textStart - 4, bytes.size)
            putLE32(result, 112, newFileSize - 144)
            putBE64(result, 24, newFileSize.toLong())
            return result
        }
    }

    private val rollRow = Regex(
        """\{"group":"2","id":"(101|102|103)","option_group_id":"([678])","option_group_rarity":"([678])","rate":"(\d+)","synergy_group_id":"2"\}"""
    )
    private val optionRow = Regex(
        """\{"id":"(\d+)","option_group_id":"([1-8])","option_rarity":"([1-8])","option_type":"(\d+)","rate":"(\d+)","rate_amount":"(\d+)"\}"""
    )
    private val synergyRow = Regex(
        """\{"group":"2","id":"(200[1-5])","rate":"(\d+)","synergy_type":"([1-5])"\}"""
    )

    fun forceTicketRarity(input: ByteArray, rarity: Int): ByteArray {
        require(rarity in validRarities)
        val asset = UnityTextAsset(input, "TraitRollData_6", ROLLS_SHA)
        val matches = rollRow.findAll(asset.text).toList()
        check(matches.size == 3 &&
            matches.map { it.groupValues[2].toInt() }.toSet() == validRarities) {
            "Unexpected XP Hero special-ticket rarity rows"
        }
        check(matches.sumOf { it.groupValues[4].toInt() } == 100000) {
            "Unexpected S-ticket rarity probability total"
        }
        val rewritten = rollRow.replace(asset.text) { m ->
            val oldRate = m.groupValues[4]
            val value = if (m.groupValues[2].toInt() == rarity) "100000" else "0"
            m.value.replace("\"rate\":\"$oldRate\"", "\"rate\":\"$value\"")
        }
        return asset.encode(rewritten)
    }

    fun forceTicketStat(input: ByteArray, rarity: Int, statType: Int): ByteArray {
        require(rarity in validRarities && statType in validStats)
        val asset = UnityTextAsset(input, "TraitOptionData_14", OPTIONS_SHA)
        val matches = optionRow.findAll(asset.text).toList()
        check(matches.size == 67) { "Unexpected number of trait option rows" }
        val targetGroup = matches.filter { it.groupValues[2].toInt() == rarity }
        check(targetGroup.size == 9 &&
            targetGroup.map { it.groupValues[4].toInt() }.toSet() == validStats &&
            targetGroup.all { it.groupValues[3].toInt() == rarity && it.groupValues[5] == "100" }) {
            "Unexpected XP Hero S/SS/SSS trait options"
        }
        val rewritten = optionRow.replace(asset.text) { m ->
            if (m.groupValues[2].toInt() != rarity) m.value else {
                val rate = if (m.groupValues[4].toInt() == statType) "900" else "000"
                m.value.replace("\"rate\":\"100\"", "\"rate\":\"$rate\"")
            }
        }
        return asset.encode(rewritten)
    }

    fun forceTicketSynergy(input: ByteArray, synergyType: Int): ByteArray {
        require(synergyType in validSynergies)
        val asset = UnityTextAsset(input, "TraitSynergyGroupData_4", SYNERGIES_SHA)
        val matches = synergyRow.findAll(asset.text).toList()
        check(matches.size == 5 &&
            matches.map { it.groupValues[3].toInt() }.toSet() == validSynergies &&
            matches.all { it.groupValues[2] == "20" }) {
            "Unexpected XP Hero special-ticket synergy rows"
        }
        val rewritten = synergyRow.replace(asset.text) { m ->
            val newRate = if (m.groupValues[3].toInt() == synergyType) "100" else "0"
            m.value.replace("\"rate\":\"20\"", "\"rate\":\"$newRate\"")
        }
        return asset.encode(rewritten)
    }
}
