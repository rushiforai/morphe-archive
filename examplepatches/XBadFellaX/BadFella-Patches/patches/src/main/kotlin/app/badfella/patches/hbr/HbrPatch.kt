package app.badfella.patches.hbr

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

@Suppress("unused")
val hbrArticleMeterPatch = resourcePatch(
    name = "HBR extended free reading",
    description = "Raises the free-article meter to 1500 per 30-day window for signed-out and signed-in readers, effectively unlimited within a month, and hides the recurring free-views banner so reading stays clean. Does not grant a subscription, unlock subscriber-only content or change server-run entitlements.",
) {
    compatibleWith(Compatibility(
        name = "HBR", packageName = "com.maz.combo1126", apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "39.4.0", versionCode = 101001302, isExperimental = true)),
    ))
    execute {
        fun digest(algorithm: String, bytes: ByteArray) = MessageDigest.getInstance(algorithm).digest(bytes)
        fun sha256(bytes: ByteArray) = digest("SHA-256", bytes).joinToString("") { "%02x".format(it) }
        val bundle = get("assets/index.android.bundle")
        val bytes = bundle.readBytes()
        check(sha256(bytes) == "8a4cfeb1dd1d219b840acc815ffb79bf6c7f8f6708cdba3b4c6773b5b97612ce") {
            "Unreviewed HBR bundle; use 39.4.0 build 101001302. HBC signatures must be re-derived for other versions."
        }
        check(ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN).getInt(8) == 98) {
            "HBR Hermes bytecode version changed"
        }
        val footer = bytes.size - 20
        check(digest("SHA-1", bytes.copyOf(footer)).contentEquals(bytes.copyOfRange(footer, bytes.size))) {
            "HBR bytecode footer is invalid"
        }
        // HBC98 LoadConstUInt8 is 8b reg8 value8. Change only the two meter value bytes;
        // the untouched neighbours (TOTAL_BOTTOM_TAB 5, feature-callout tab 3) prove alignment.
        val edits = mapOf(
            0x3a62a7 to Triple(byteArrayOf(0x8b.toByte(), 0x02, 0x02), byteArrayOf(0x8b.toByte(), 0x02, 0xc8.toByte()), "MAX_GUEST_ARTICLES"),
            0x3a62b0 to Triple(byteArrayOf(0x8b.toByte(), 0x00, 0x04), byteArrayOf(0x8b.toByte(), 0x00, 0xc8.toByte()), "MAX_SIGNED_ARTICLES"),
            0x586fb1 to Triple(byteArrayOf(0x34.toByte(), 0x09, 0x00, 0x41.toByte(), 0x13, 0x02), byteArrayOf(0x93.toByte(), 0x00, 0x76.toByte(), 0x00, 0x00, 0x00), "ArticleCounter banner"),
            0x579fe0 to Triple(byteArrayOf(0x34.toByte(), 0x01, 0x00, 0x3b.toByte(), 0x02, 0x01, 0x00, 0x3b.toByte(), 0x01, 0x01, 0x01, 0x5e.toByte(), 0x01, 0x01, 0x0c, 0x93.toByte()),
                byteArrayOf(0x8c.toByte(), 0x00, 0xdc.toByte(), 0x05, 0x00, 0x00, 0x76.toByte(), 0x00) + ByteArray(36), "getMaxArticleCount"),
        )
        val neighbours = mapOf(
            0x3a62b9 to Pair(byteArrayOf(0x8b.toByte(), 0x00, 0x05), "TOTAL_BOTTOM_TAB"),
            0x3a62c2 to Pair(byteArrayOf(0x8b.toByte(), 0x00, 0x03), "TAB_NUMBER_FOR_FEATURE_CALLOUT_MODAL"),
        )
        edits.forEach { (offset, edit) ->
            val (stock, patched, name) = edit
            check(bytes.copyOfRange(offset, offset + stock.size).contentEquals(stock)) { "HBR meter anchor changed: $name" }
            patched.copyInto(bytes, offset)
        }
        neighbours.forEach { (offset, neighbour) ->
            val (stock, name) = neighbour
            check(bytes.copyOfRange(offset, offset + 3).contentEquals(stock)) { "HBR alignment anchor changed: $name" }
        }
        digest("SHA-1", bytes.copyOf(footer)).copyInto(bytes, footer)
        check(sha256(bytes) == "c1dabf690ee70489c63c6999b58dc21c2b0677277f25b037bef5563231f37edb") { "HBR output checksum failed" }
        bundle.writeBytes(bytes)
    }
}
