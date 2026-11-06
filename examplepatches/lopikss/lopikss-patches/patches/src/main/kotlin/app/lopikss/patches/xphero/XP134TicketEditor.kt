package app.lopikss.patches.xphero

import java.security.MessageDigest

/** Version-pinned, stackable XP Hero 26.2.0 Unity TextAsset ticket editor. */
internal object XP134TicketEditor {
    const val REMOTE = "assets/bin/Data/22fc19c3e5dc14f5ca465a3e6cd62dc3"
    const val REMOTE_27 = "assets/bin/Data/3d215194f0ca245868497014573f6f96"
    const val PVP = "assets/bin/Data/8f4cc030fdc024de3acdae95bb99e004"
    const val PVP_27 = "assets/bin/Data/57560bddb8aca4a848ee41d220acd630"
    private const val REMOTE_SHA = "c2f1df06c02d8723b569c532457eced4baee00f1c0bbb6a139bdcb3be801bfb1"
    private const val REMOTE_SHA_27 = "c18c4df4e626c554359e74a4073e01538d104465cbbe43220d304de08536c080"
    private const val PVP_SHA = "a06150f47dfb4d441a10570466b0e43892c45c0136517f4fdf31880eb4d2d9ee"
    // Exact original XP Hero 27.0.0 ConfigData_47 SHA-256 (PvP).
    private const val PVP_SHA_27 = "2f150741c35cb7b1d40a15890c87f9f5351c1396994ec412a4a40e13caa0e0ff"

    private val originals = linkedMapOf(
        "TRAIT_SUPERROLL_COST_AMOUNT" to "1",
        "PVP_TICKET_CHARGE_COST" to "10,20,30,50,100,100,100,100,100,100",
        "BR_TICKET_CHARGE_COST" to "100,200,300",
        "HEROTOMB_TICKET_CHARGE_COST" to "300",
        "BR_TICKET_MAX_BUY_LIMIT" to "3",
        "HEROTOMB_TICKET_MAX_BUY_LIMIT" to "3",
        "PVP_TICKET_RV_COUNT_LIMIT" to "10",
        "CHALLENGE_TOWER_DAY_RV_COUNT" to "5",
        "RV_TICKET_MAX_COUNT" to "5",
        "RV_SKIP_ONLY_TICKET_MAX_COUNT" to "10",
        "CHALLENGE_TOWER_RV_MAXCOUNT" to "5",
        "BOSS_RAID_TICKET_PACK_DAILY_PURCHASE_LIMIT" to "1",
        "HERO_TOMB_TICKET_PACK_DAILY_PURCHASE_LIMIT" to "5",
        // Return Portal: advertised pass amount and initial free-use allowance.
        "RETURN_TICKET_COUNT" to "10",
        "RETURN_FIRST_FREE_CNT" to "3",
    )

    private fun sha(data: ByteArray): String = MessageDigest.getInstance("SHA-256")
        .digest(data).joinToString("") { "%02x".format(it) }

    private fun le32(data: ByteArray, pos: Int): Int =
        (data[pos].toInt() and 255) or ((data[pos + 1].toInt() and 255) shl 8) or
            ((data[pos + 2].toInt() and 255) shl 16) or ((data[pos + 3].toInt() and 255) shl 24)
    private fun be32(data: ByteArray, pos: Int): Int =
        ((data[pos].toInt() and 255) shl 24) or ((data[pos + 1].toInt() and 255) shl 16) or
            ((data[pos + 2].toInt() and 255) shl 8) or (data[pos + 3].toInt() and 255)
    private fun putLE32(out: ByteArray, pos: Int, value: Int) {
        for (n in 0..3) out[pos + n] = (value ushr (n * 8)).toByte()
    }
    private fun putBE64(out: ByteArray, pos: Int, value: Long) {
        for (n in 0..7) out[pos + n] = (value ushr ((7 - n) * 8)).toByte()
    }

    private data class TextAsset(val original: ByteArray, val textStart: Int, val text: String) {
        fun encode(newText: String): ByteArray {
            val data = newText.toByteArray(Charsets.ISO_8859_1)
            val requiredLength = textStart + data.size
            val alignedLength = (requiredLength + 3) and -4
            val bytes = ByteArray(alignedLength)
            original.copyInto(bytes, 0, 0, textStart)
            data.copyInto(bytes, textStart)
            putLE32(bytes, textStart - 4, data.size)
            putLE32(bytes, 112, alignedLength - 144)
            putBE64(bytes, 24, alignedLength.toLong())
            return bytes
        }
    }
    private fun parse(bytes: ByteArray, name: String): TextAsset {
        require(bytes.size > 168 && be32(bytes, 8) == 22 && be32(bytes, 36) == 144) {
            "Unsupported Unity TextAsset format"
        }
        val headerFileSize = (0..7).fold(0L) { acc, n ->
            (acc shl 8) or (bytes[24 + n].toLong() and 255L)
        }
        check(headerFileSize == bytes.size.toLong() && le32(bytes, 112) == bytes.size - 144) {
            "Unexpected Unity file/object length"
        }
        val nameLength = le32(bytes, 144)
        check(nameLength in 1..100)
        val nameStart = 148
        val actualName = String(bytes, nameStart, nameLength, Charsets.ISO_8859_1)
        check(actualName == name) { "Unexpected Unity TextAsset name" }
        val textLengthPos = nameStart + ((nameLength + 3) and -4)
        val textSize = le32(bytes, textLengthPos)
        val textStart = textLengthPos + 4
        check(textSize > 0 && textStart + textSize <= bytes.size &&
            bytes.copyOfRange(textStart + textSize, bytes.size).all { it == 0.toByte() }) {
            "Malformed Unity string payload or padding"
        }
        return TextAsset(bytes, textStart,
            String(bytes, textStart, textSize, Charsets.ISO_8859_1))
    }

    private fun pricePattern(key: String): Regex = Regex(
        "\\\"key\\\":\\\"" + Regex.escape(key) + "\\\",\\\"value\\\":\\\"([^\\\"]*)\\\""
    )
    private fun value(text: String, key: String): String {
        val matches = pricePattern(key).findAll(text).toList()
        check(matches.size == 1) { "Unexpected key count for $key" }
        return matches.single().groupValues[1]
    }
    private fun put(text: String, key: String, newValue: String): String {
        value(text, key)
        return pricePattern(key).replace(text) {
            "\"key\":\"$key\",\"value\":\"$newValue\""
        }
    }
    private fun supported(key: String, current: String, original: String): Boolean {
        if (current == original) return true
        if (key == "TRAIT_SUPERROLL_COST_AMOUNT") return current == "0"
        if (key == "HEROTOMB_TICKET_CHARGE_COST") return current == "0"
        if (key == "PVP_TICKET_CHARGE_COST" || key == "BR_TICKET_CHARGE_COST") {
            val prices = current.split(",")
            return prices.size in 1..5000 && prices.all { it == "0" }
        }
        return current.toIntOrNull()?.let { it in 1..5000 } == true
    }

    private fun remote(
        input: ByteArray, sTicket: Boolean,
        dailyLimit: Int = 400, returnDaily: Int = 5000, freeReturns: Int = 5000,
    ): ByteArray {
        val name27 = "RemoteConfig_341"
        val is27 = input.size > 168 && le32(input, 144) == name27.length &&
            String(input, 148, name27.length, Charsets.ISO_8859_1) == name27
        val asset = parse(input, if (is27) name27 else "RemoteConfig_329")
        var normalized = asset.text
        for ((key, original) in originals) {
            val current = value(asset.text, key)
            require(supported(key, current, original)) { "Unexpected current $key" }
            normalized = put(normalized, key, original)
        }
        require(sha(asset.encode(normalized)) == (if (is27) REMOTE_SHA_27 else REMOTE_SHA)) {
            "Unsupported XP Hero RemoteConfig asset"
        }
        var modified = asset.text
        if (sTicket) {
            modified = put(modified, "TRAIT_SUPERROLL_COST_AMOUNT", "0")
        } else {
            val freePrices = List(dailyLimit) { "0" }.joinToString(",")
            for (key in listOf("PVP_TICKET_CHARGE_COST", "BR_TICKET_CHARGE_COST")) {
                modified = put(modified, key, freePrices)
            }
            modified = put(modified, "HEROTOMB_TICKET_CHARGE_COST", "0")
            val excluded = setOf(
                "TRAIT_SUPERROLL_COST_AMOUNT", "PVP_TICKET_CHARGE_COST",
                "BR_TICKET_CHARGE_COST", "HEROTOMB_TICKET_CHARGE_COST",
                "RETURN_TICKET_COUNT", "RETURN_FIRST_FREE_CNT",
            )
            for (key in originals.keys) {
                if (key !in excluded) modified = put(modified, key, dailyLimit.toString())
            }
            // Preserve RETURN_TICKET_COUNT=10 so the paid 30-day offer's
            // displayed quantity stays exactly as provided by the game.
            // returnDaily is applied to the FREE ticket item by the separate
            // daily reset native edit, not this purchase configuration.
            // Separate onboarding allowance, potentially server-capped.
            modified = put(modified, "RETURN_FIRST_FREE_CNT", freeReturns.toString())
        }
        return asset.encode(modified)
    }

    /** Existing free S-ticket setting; compatible with changed ticket limits. */
    fun sTicket(input: ByteArray): ByteArray = remote(input, true)

    /** Configurable refills and first-time free returns; paid offer unchanged. */
    fun freeTicketRecharge(
        remoteBytes: ByteArray, pvpBytes: ByteArray,
        dailyLimit: Int, returnDaily: Int, freeReturns: Int,
    ): Pair<ByteArray, ByteArray> {
        require(dailyLimit in 1..5000) { "Daily refill limit must be between 1 and 5000" }
        require(returnDaily in 10..5000) { "Return daily ticket count must be between 10 and 5000" }
        require(freeReturns in 3..5000) { "Free return allowance must be between 3 and 5000" }
        val changedRemote = remote(remoteBytes, false, dailyLimit, returnDaily, freeReturns)
        val v27Name = "ConfigData_47"
        val is27 = pvpBytes.size > 168 && le32(pvpBytes, 144) == v27Name.length &&
            String(pvpBytes, 148, v27Name.length, Charsets.ISO_8859_1) == v27Name
        val pvp = parse(pvpBytes, if (is27) v27Name else "ConfigData_45")
        val current = value(pvp.text, "PVP_TICKET_RV_COUNT_LIMIT")
        check(current.toIntOrNull()?.let { it in 1..5000 } == true) {
            "Unexpected PvP refill configuration"
        }
        val originalText = put(pvp.text, "PVP_TICKET_RV_COUNT_LIMIT", "5")
        require(sha(pvp.encode(originalText)) == (if (is27) PVP_SHA_27 else PVP_SHA)) {
            "Unexpected PvP ticket asset"
        }
        val changedPvp = pvp.encode(put(pvp.text, "PVP_TICKET_RV_COUNT_LIMIT", dailyLimit.toString()))
        return changedRemote to changedPvp
    }
}
