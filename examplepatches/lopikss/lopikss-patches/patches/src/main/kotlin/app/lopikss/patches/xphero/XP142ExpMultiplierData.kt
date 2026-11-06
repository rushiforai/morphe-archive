package app.lopikss.patches.xphero

import java.security.MessageDigest

/**
 * XP Hero 27.0.0: genuine enemy-drop EXP and the corresponding per-kill cap.
 * Game resources are matched to the original game with exact SHA-256.
 * The optional experimental 2200-level mode extends progression and base stats;
 * the default 1500-level mode preserves original progression and other rewards.
 */
internal object XP142ExpMultiplierData {
    const val ENEMY_EXP = "assets/bin/Data/b88519e7b85074d4eb6b23781e4d9458"
    const val KILL_LIMIT = "assets/bin/Data/36457843a12d047c09afa0c1e2da08a3"
    const val PLAYER_LEVEL = "assets/bin/Data/d0428534c78444419bab3f10d45f650b"

    private const val ENEMY_SHA256 =
        "33eef481fce46f41ad31db596d4f600d1338b03d4724bcc8ec1a40abf4b9c0ea"
    private const val LIMIT_SHA256 =
        "f3fecdca205abe070b9b0d07ac72ab0fdd47a05d23d05ea1e8a2b6f6bd3a9820"
    private const val PLAYER_SHA256 =
        "b84ed865158457ede08c3f9b4275fc058680e42b70a17af2983e6523d040cd8c"

    private val enemyExp = Regex("\"DropAccountExpAmount\":\"([0-9]+)\"")
    private val singleKillLimit = Regex("\"SingleKillExp_Limit\":\"([0-9]+)\"")

    private fun sha(bytes: ByteArray): String = MessageDigest.getInstance("SHA-256")
        .digest(bytes).joinToString("") { "%02x".format(it) }

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

    private class UnityTextAsset(bytes: ByteArray, name: String, expectedSha: String) {
        private val header: ByteArray = bytes
        private val textStart: Int
        val text: String

        init {
            require(sha(bytes) == expectedSha) {
                "Unsupported XP Hero 27.0.0 " + name + " asset"
            }
            require(bytes.size > 172 && be32(bytes, 8) == 22 && be32(bytes, 36) == 144) {
                "Unexpected Unity TextAsset header: " + name
            }
            val length = (0..7).fold(0L) { acc, i ->
                (acc shl 8) or (bytes[24 + i].toLong() and 255L)
            }
            require(length == bytes.size.toLong() && le32(bytes, 112) == bytes.size - 144) {
                "Invalid Unity file length: " + name
            }
            val nameLen = le32(bytes, 144)
            require(nameLen == name.length &&
                String(bytes, 148, nameLen, Charsets.ISO_8859_1) == name) {
                "Unexpected Unity TextAsset name: " + name
            }
            val lengthOffset = 148 + ((nameLen + 3) and -4)
            val textSize = le32(bytes, lengthOffset)
            textStart = lengthOffset + 4
            require(textSize > 0 && textStart + textSize <= bytes.size &&
                bytes.copyOfRange(textStart + textSize, bytes.size)
                    .all { it == 0.toByte() }) {
                "Malformed Unity TextAsset payload: " + name
            }
            text = String(bytes, textStart, textSize, Charsets.ISO_8859_1)
        }

        fun encode(replacement: String): ByteArray {
            val payload = replacement.toByteArray(Charsets.ISO_8859_1)
            val size = (textStart + payload.size + 3) and -4
            val out = ByteArray(size)
            header.copyInto(out, 0, 0, textStart)
            payload.copyInto(out, textStart)
            putLE32(out, textStart - 4, payload.size)
            putLE32(out, 112, size - 144)
            putBE64(out, 24, size.toLong())
            return out
        }
    }

    // At 100000x some original values exceed signed 64-bit limits.
    // Cap each reward at half Long.MAX_VALUE to leave room for arithmetic
    // rather than writing overflowed/negative amounts into game data.
    // All 10000x outputs from the original 27.0.0 files fit below this cap.
    private const val MAX_EXP_VALUE = Long.MAX_VALUE / 2

    private fun scaled(original: String, factor: Int): String {
        val value = original.toLong()
        require(value >= 0L) { "Negative XP value" }
        return (if (value > MAX_EXP_VALUE / factor) MAX_EXP_VALUE
                else value * factor).toString()
    }

    fun multiplyEnemyExp(input: ByteArray, multiplier: Int): ByteArray {
        require(multiplier in 1..100_000) { "EXP multiplier must be 1–100000" }
        val asset = UnityTextAsset(input, "EnemyData_1084", ENEMY_SHA256)
        val rows = enemyExp.findAll(asset.text).toList()
        check(rows.size == 246 && rows.count { it.groupValues[1] != "0" } == 169) {
            "Unexpected enemy EXP reward table"
        }
        val text = enemyExp.replace(asset.text) { match ->
            val old = match.groupValues[1]
            match.value.replace(old, scaled(old, multiplier))
        }
        return asset.encode(text)
    }

    fun multiplyKillLimit(input: ByteArray, multiplier: Int, maxLevel: Int = 1500): ByteArray {
        require(maxLevel == 1500 || maxLevel == 2200) { "Max level must be 1500 or 2200" }
        require(multiplier in 1..100_000) { "EXP multiplier must be 1–100000" }
        val asset = UnityTextAsset(input, "LevelUpData_Exp_116", LIMIT_SHA256)
        val rows = singleKillLimit.findAll(asset.text).toList()
        check(rows.size == 1500 && rows.all { it.groupValues[1].toLong() > 0L }) {
            "Unexpected per-kill EXP limit table"
        }
        var text = singleKillLimit.replace(asset.text) { match ->
            val old = match.groupValues[1]
            match.value.replace(old, scaled(old, multiplier))
        }
        if (maxLevel == 2200) {
            // Keep original levels 1..1500 untouched. Extend requirements
            // with the final official level's Long-safe value. 27.0.0
            // server/runtime cap handling has NOT been confirmed.
            check(text.endsWith("]")) { "Malformed level progression JSON" }
            val baseExp = "7014376517338340000"
            val baseLimit = scaled("94652571618000", multiplier)
            val extra = (1501..2200).joinToString("") { level ->
                ",{" + "\"RequireExp\":\"" + baseExp +
                    "\",\"SingleKillExp_Limit\":\"" + baseLimit +
                    "\",\"id\":\"" + level + "\"}"
            }
            text = text.dropLast(1) + extra + "]"
        }
        return asset.encode(text)
    }

    /**
     * XP Hero 27.0.0 player base ATK/HP anchor rows stop at 1500.
     * Additional anchors every 100 levels double the base stats, consistent
     * with the original 1300->1500 fourfold change. These are extrapolations,
     * NOT developer-authored stats. Requires runtime testing.
     */
    fun extendPlayerLevel(input: ByteArray): ByteArray {
        val asset = UnityTextAsset(input, "PlayerLevelData_76", PLAYER_SHA256)
        val row = Regex("\"Attack\":\"([0-9]+)\",\"Hp\":\"([0-9]+)\",\"id\":\"([0-9]+)\"")
        val rows = row.findAll(asset.text).toList()
        check(rows.size == 61 && rows.last().groupValues[3] == "1500" &&
            rows.last().groupValues[1] == "2633844" &&
            rows.last().groupValues[2] == "27828689016") {
            "Unsupported XP Hero PlayerLevelData progression"
        }
        check(asset.text.endsWith("]")) { "Malformed player stats JSON" }
        val attack = 2633844L
        val hp = 27828689016L
        val extra = (1..7).joinToString("") { k ->
            val level = 1500 + k * 100
            val scale = 1L shl k
            ",{" + "\"Attack\":\"" + attack * scale +
                "\",\"Hp\":\"" + hp * scale +
                "\",\"id\":\"" + level + "\"}"
        }
        return asset.encode(asset.text.dropLast(1) + extra + "]")
    }
}
