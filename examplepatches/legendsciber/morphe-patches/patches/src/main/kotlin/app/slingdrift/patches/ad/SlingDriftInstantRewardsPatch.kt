package app.slingdrift.patches.ad

import app.morphe.patcher.patch.rawResourcePatch
import app.slingdrift.patches.shared.Constants.COMPATIBILITY_SLINGDRIFT

private class RewardSite(
    val label: String,
    val anchor: ByteArray,
    val replacement: ByteArray,
)

private class Stub(
    val label: String,
    val offset: Int,
    val bytes: ByteArray,
)

private val FORCE_TRUE = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)
private val RET = byteArrayOf(0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())
private val NOP = byteArrayOf(0x1F, 0x20, 0x03, 0xD5.toByte())

private const val CAVE_OFFSET = 0x01BA8D68

private val STUBS = listOf(
    Stub(
        label = "RubyBonus",
        offset = CAVE_OFFSET + 20,
        bytes = byteArrayOf(
            0xE0.toByte(), 0x03, 0x13, 0xAA.toByte(), 0xE6.toByte(), 0x8C.toByte(),
            0xEF.toByte(), 0x97.toByte(), 0xE8.toByte(), 0x8C.toByte(), 0xEF.toByte(),
            0x97.toByte(), 0xF8.toByte(), 0x89.toByte(), 0xEF.toByte(), 0x17,
        ),
    ),
    Stub(
        label = "ContinueAds",
        offset = CAVE_OFFSET + 36,
        bytes = byteArrayOf(
            0xE0.toByte(), 0x03, 0x13, 0xAA.toByte(), 0xA8.toByte(), 0xCF.toByte(),
            0xEE.toByte(), 0x97.toByte(), 0xAA.toByte(), 0xCF.toByte(), 0xEE.toByte(),
            0x97.toByte(), 0x91.toByte(), 0xCC.toByte(), 0xEE.toByte(), 0x17,
        ),
    ),
    Stub(
        label = "ContinueButton",
        offset = CAVE_OFFSET + 52,
        bytes = byteArrayOf(
            0xE0.toByte(), 0x03, 0x13, 0xAA.toByte(), 0xA4.toByte(), 0xCF.toByte(),
            0xEE.toByte(), 0x97.toByte(), 0xA6.toByte(), 0xCF.toByte(), 0xEE.toByte(),
            0x97.toByte(), 0x08, 0xD0.toByte(), 0xEE.toByte(), 0x17,
        ),
    ),
    Stub(
        label = "Upgrade",
        offset = CAVE_OFFSET + 68,
        bytes = byteArrayOf(
            0xE0.toByte(), 0x03, 0x13, 0xAA.toByte(), 0xF0.toByte(), 0x03, 0xF0.toByte(),
            0x97.toByte(), 0xF2.toByte(), 0x03, 0xF0.toByte(), 0x97.toByte(), 0xF0.toByte(),
            0x00, 0xF0.toByte(), 0x17,
        ),
    ),
    Stub(
        label = "EndGameMultiplier",
        offset = CAVE_OFFSET + 84,
        bytes = byteArrayOf(
            0xE0.toByte(), 0x03, 0x13, 0xAA.toByte(), 0x0B, 0x12, 0xF0.toByte(), 0x97.toByte(),
            0x0D, 0x12, 0xF0.toByte(), 0x97.toByte(), 0x6E, 0x10, 0xF0.toByte(), 0x17,
        ),
    ),
    Stub(
        label = "QuestsReroll",
        offset = CAVE_OFFSET + 100,
        bytes = byteArrayOf(
            0xE0.toByte(), 0x03, 0x13, 0xAA.toByte(), 0x46, 0x3B, 0xF0.toByte(), 0x97.toByte(),
            0x48, 0x3B, 0xF0.toByte(), 0x97.toByte(), 0x3B, 0x3A, 0xF0.toByte(), 0x17,
        ),
    ),
    Stub(
        label = "MarketCarItem",
        offset = CAVE_OFFSET + 116,
        bytes = byteArrayOf(
            0xE0.toByte(), 0x03, 0x13, 0xAA.toByte(), 0xC3.toByte(), 0x14, 0xEF.toByte(),
            0x97.toByte(), 0x45, 0x15, 0xEF.toByte(), 0x97.toByte(), 0xEF.toByte(), 0x13,
            0xEF.toByte(), 0x17,
        ),
    ),
    Stub(
        label = "RaceOverDoubleTap",
        offset = CAVE_OFFSET + 132,
        bytes = byteArrayOf(
            0xE0.toByte(), 0x03, 0x13, 0xAA.toByte(), 0xB1.toByte(), 0x6A, 0xEF.toByte(),
            0x97.toByte(), 0x8E.toByte(), 0x6B, 0xEF.toByte(), 0x97.toByte(), 0xC0.toByte(),
            0x69, 0xEF.toByte(), 0x17,
        ),
    ),
)

private val SITES = listOf(
    RewardSite(
        label = "RubyBonus.ShowRewarded",
        anchor = byteArrayOf(
            0x25, 0x66, 0x2D, 0x94.toByte(), 0xC0.toByte(), 0x04, 0x00, 0xB4.toByte(),
            0xE1.toByte(), 0x03, 0x14, 0xAA.toByte(), 0xE2.toByte(), 0x03, 0x1F, 0xAA.toByte(),
        ),
        replacement = byteArrayOf(
            0x06, 0x76, 0x10, 0x14,
        ),
    ),
    RewardSite(
        label = "ContinueAds.ShowRewarded",
        anchor = byteArrayOf(
            0x88.toByte(), 0x23, 0x2E, 0x94.toByte(), 0x40, 0x0A, 0x00, 0xB4.toByte(),
            0x81.toByte(), 0x02, 0x40, 0xF9.toByte(), 0xE2.toByte(), 0x03, 0x1F, 0xAA.toByte(),
        ),
        replacement = byteArrayOf(
            0x6D, 0x33, 0x11, 0x14,
        ),
    ),
    RewardSite(
        label = "ContinueButton.ShowRewarded",
        anchor = byteArrayOf(
            0x0D, 0x20, 0x2E, 0x94.toByte(), 0x40, 0x0A, 0x00, 0xB4.toByte(), 0x81.toByte(),
            0x02, 0x40, 0xF9.toByte(), 0xE2.toByte(), 0x03, 0x1F, 0xAA.toByte(),
        ),
        replacement = byteArrayOf(
            0xF6.toByte(), 0x2F, 0x11, 0x14,
        ),
    ),
    RewardSite(
        label = "Upgrade.ShowRewarded",
        anchor = byteArrayOf(
            0xB5.toByte(), 0x0A, 0x47, 0xF9.toByte(), 0xA1.toByte(), 0x02, 0x40, 0xF9.toByte(),
        ),
        replacement = byteArrayOf(
            0x0E, 0xFF.toByte(), 0x0F, 0x14,
        ),
    ),
    RewardSite(
        label = "EndGameMultiplier.ShowRewarded",
        anchor = byteArrayOf(
            0x9F.toByte(), 0xDF.toByte(), 0x2C, 0x94.toByte(), 0xA0.toByte(), 0x06, 0x00,
            0xB4.toByte(), 0x81.toByte(), 0x02, 0x40, 0xF9.toByte(), 0xE2.toByte(), 0x03, 0x1F,
            0xAA.toByte(),
        ),
        replacement = byteArrayOf(
            0x90.toByte(), 0xEF.toByte(), 0x0F, 0x14,
        ),
    ),
    RewardSite(
        label = "QuestsReroll.ShowRewarded",
        anchor = byteArrayOf(
            0x73, 0x0A, 0x47, 0xF9.toByte(), 0x61, 0x02, 0x40, 0xF9.toByte(),
        ),
        replacement = byteArrayOf(
            0xC3.toByte(), 0xC5.toByte(), 0x0F, 0x14,
        ),
    ),
    RewardSite(
        label = "MarketCarItem.ShowRewarded",
        anchor = byteArrayOf(
            0x16, 0xDC.toByte(), 0x2D, 0x94.toByte(), 0xA0.toByte(), 0x06, 0x00, 0xB4.toByte(),
            0x81.toByte(), 0x02, 0x40, 0xF9.toByte(), 0xE2.toByte(), 0x03, 0x1F, 0xAA.toByte(),
        ),
        replacement = byteArrayOf(
            0x0F, 0xEC.toByte(), 0x10, 0x14,
        ),
    ),
    RewardSite(
        label = "RaceOverDoubleTap.ShowRewarded",
        anchor = byteArrayOf(
            0x41, 0x86.toByte(), 0x2D, 0x94.toByte(), 0xA0.toByte(), 0x06, 0x00, 0xB4.toByte(),
            0x81.toByte(), 0x02, 0x40, 0xF9.toByte(), 0xE2.toByte(), 0x03, 0x1F, 0xAA.toByte(),
        ),
        replacement = byteArrayOf(
            0x3E, 0x96.toByte(), 0x10, 0x14,
        ),
    ),
    RewardSite(
        label = "RubyBonus.ReachabilityCheck",
        anchor = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xDA.toByte(), 0x89.toByte(), 0x5D,
            0x94.toByte(),
        ),
        replacement = NOP,
    ),
    RewardSite(
        label = "ContinueAds.ReachabilityCheck",
        anchor = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x2D, 0x47, 0x5E, 0x94.toByte(),
        ),
        replacement = NOP,
    ),
    RewardSite(
        label = "ContinueButton.ReachabilityCheck",
        anchor = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xB2.toByte(), 0x43, 0x5E, 0x94.toByte(),
        ),
        replacement = NOP,
    ),
    RewardSite(
        label = "Upgrade.ReachabilityCheck",
        anchor = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x0D, 0x13, 0x5D, 0x94.toByte(),
        ),
        replacement = NOP,
    ),
    RewardSite(
        label = "EndGameMultiplier.ReachabilityCheck",
        anchor = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x3D, 0x03, 0x5D, 0x94.toByte(),
        ),
        replacement = NOP,
    ),
    RewardSite(
        label = "QuestsReroll.ReachabilityCheck",
        anchor = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x6E, 0xD9.toByte(), 0x5C, 0x94.toByte(),
        ),
        replacement = NOP,
    ),
    RewardSite(
        label = "MarketCarItem.ReachabilityCheck",
        anchor = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xB4.toByte(), 0xFF.toByte(), 0x5D,
            0x94.toByte(),
        ),
        replacement = NOP,
    ),
    RewardSite(
        label = "RaceOverDoubleTap.ReachabilityCheck",
        anchor = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xDF.toByte(), 0xA9.toByte(), 0x5D,
            0x94.toByte(),
        ),
        replacement = NOP,
    ),
    RewardSite(
        label = "AdsManager.CanShowRewarded",
        anchor = byteArrayOf(
            0xFE.toByte(), 0x57, 0xC2.toByte(), 0xA8.toByte(), 0x6B, 0x35, 0x40, 0x14,
        ),
        replacement = FORCE_TRUE,
    ),
)

private fun indexOfUnique(bytes: ByteArray, anchor: ByteArray, label: String): Int {
    var count = 0
    var at = -1
    var i = 0
    while (i <= bytes.size - anchor.size) {
        var match = true
        var j = 0
        while (j < anchor.size) {
            if (bytes[i + j] != anchor[j]) {
                match = false
                break
            }
            j++
        }
        if (match) {
            count++
            at = i
            if (count > 1) break
        }
        i++
    }
    require(count == 1) { "$label site not unique: $count matches" }
    return at
}

@Suppress("unused")
val slingDriftInstantRewardsPatch = rawResourcePatch(
    name = "Sling Drift Instant Rewards",
    description = "Every ad-gated reward works without watching an ad and without a network connection: continuing after a crash, free car unlocks, free upgrades, the end-of-race multiplier, bonus rubies and daily quest rerolls are granted instantly.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SLINGDRIFT)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        for (stub in STUBS) {
            for (k in stub.bytes.indices) {
                require(bytes[stub.offset + k] == RET[k % 4]) {
                    "code cave at ${stub.offset + k} is not padding (${stub.label})"
                }
            }
        }

        for (stub in STUBS) {
            stub.bytes.copyInto(bytes, stub.offset)
        }

        for (site in SITES) {
            site.replacement.copyInto(bytes, indexOfUnique(bytes, site.anchor, site.label) + site.anchor.size)
        }

        soFile.writeBytes(bytes)
    }
}
