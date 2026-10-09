package app.aidan.patches.blackjack.ads

import app.aidan.patches.blackjack.shared.COMPATIBILITY_BLACKJACK
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private val RETURN_VOID = byteArrayOf(0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())
private val RETURN_FALSE = byteArrayOf(0x00, 0x00, 0x80.toByte(), 0x52, 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())
private val RETURN_TRUE = byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52, 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())
private val RETURN_EMPTY_AD_RESULT = byteArrayOf(
    0xe0.toByte(), 0x03, 0x1f, 0xaa.toByte(), 0xe1.toByte(), 0x03, 0x1f, 0xaa.toByte(),
    0xe2.toByte(), 0x03, 0x1f, 0xaa.toByte(), 0xe3.toByte(), 0x03, 0x1f, 0xaa.toByte(),
    0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte()
)

@Suppress("unused")
val removeAdsPatch = rawResourcePatch(
    name = "Remove Ads",
    description = "Removes banner, interstitial, and rewarded advertising and removes ad-based chip offers.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_BLACKJACK)

    execute {
        val library = get("lib/arm64-v8a/libil2cpp.so")
        if (!library.exists()) throw PatchException("Missing arm64 IL2CPP library")
        val bytes = library.readBytes()
        /**
         * Writes [replacement] into the in-memory library at byte [offset] after checking
         * [expected], or does nothing if the replacement is already present. [target]
         * identifies the patch in errors; this helper does not write the file.
         *
         * @throws PatchException if the replacement extends past the library or expected bytes differ.
         * @throws IndexOutOfBoundsException if an unchecked negative offset or expected range is invalid.
         */
        fun patch(offset: Int, expected: ByteArray, replacement: ByteArray, target: String) {
            if (bytes.size < offset + replacement.size) throw PatchException("$target is outside libil2cpp.so")
            if (replacement.indices.all { bytes[offset + it] == replacement[it] }) return
            if (!expected.indices.all { bytes[offset + it] == expected[it] }) {
                throw PatchException("$target byte sequence mismatch at 0x${offset.toString(16)}")
            }
            System.arraycopy(replacement, 0, bytes, offset, replacement.size)
        }

        patch(0x1fb5210, byteArrayOf(0x00, 0xb0.toByte(), 0x40, 0x39, 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte()), RETURN_TRUE, "PlayerData.get_AdsDisabled")
        patch(0x2010568, byteArrayOf(0xff.toByte(), 0x03, 0x02, 0xd1.toByte(), 0xe9.toByte(), 0x23, 0x03, 0x6d), RETURN_FALSE, "BlackjackAds.TryShowInterstitial")
        patch(0x20109b4, byteArrayOf(0xff.toByte(), 0xc3.toByte(), 0x03, 0xd1.toByte(), 0xfe.toByte(), 0x5b, 0x00, 0xf9.toByte(), 0xf8.toByte(), 0x5f, 0x0c, 0xa9.toByte(), 0xf6.toByte(), 0x57, 0x0d, 0xa9.toByte(), 0xf4.toByte(), 0x4f, 0x0e, 0xa9.toByte()), RETURN_EMPTY_AD_RESULT, "BlackjackAds.ShowInterstitial")
        listOf(
            0x3bc9530 to byteArrayOf(0xff.toByte(), 0x83.toByte(), 0x01, 0xd1.toByte()),
            0x3bcc22c to byteArrayOf(0xff.toByte(), 0x83.toByte(), 0x01, 0xd1.toByte()),
            0x3bce2c4 to byteArrayOf(0xfe.toByte(), 0x0f, 0x1c, 0xf8.toByte()),
            0x3bce738 to byteArrayOf(0xfe.toByte(), 0x0f, 0x1e, 0xf8.toByte())
        ).forEach { (offset, expected) -> patch(offset, expected, RETURN_VOID, "AdManager ad entrypoint") }
        listOf(
            0x3bca7a8 to byteArrayOf(0xff.toByte(), 0x43, 0x01, 0xd1.toByte()),
            0x3bca83c to byteArrayOf(0xff.toByte(), 0xc3.toByte(), 0x00, 0xd1.toByte()),
            0x3bca868 to byteArrayOf(0xff.toByte(), 0x03, 0x02, 0xd1.toByte()),
            0x3bccd08 to byteArrayOf(0xff.toByte(), 0x43, 0x01, 0xd1.toByte()),
            0x3bccd9c to byteArrayOf(0xff.toByte(), 0xc3.toByte(), 0x00, 0xd1.toByte()),
            0x3bccdc8 to byteArrayOf(0xff.toByte(), 0x43, 0x02, 0xd1.toByte())
        ).forEach { (offset, expected) -> patch(offset, expected, RETURN_EMPTY_AD_RESULT, "AdManager show entrypoint") }
        patch(0x1ffd7dc, byteArrayOf(0x21, 0x00, 0x80.toByte(), 0x52), byteArrayOf(0xe1.toByte(), 0x03, 0x1f, 0x2a), "LevelUpRewardScreen.watchAnAdContainer")
        library.writeBytes(bytes)
    }
}
