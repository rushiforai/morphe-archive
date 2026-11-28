package app.soccerstar.patches.ad

import app.morphe.patcher.patch.rawResourcePatch
import app.soccerstar.patches.shared.Constants.COMPATIBILITY_SOCCERSTAR

private val FORCE_TRUE = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52,
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val WATCH_VIDEO_STUB = byteArrayOf(
    0xC1.toByte(), 0x00, 0x00, 0xB4.toByte(),
    0xFD.toByte(), 0x7B, 0xBF.toByte(), 0xA9.toByte(),
    0xE0.toByte(), 0x03, 0x01, 0xAA.toByte(),
    0xE1.toByte(), 0x03, 0x1F, 0xAA.toByte(),
    0x7C, 0xBF.toByte(), 0x24, 0x94.toByte(),
    0xFD.toByte(), 0x7B, 0xC1.toByte(), 0xA8.toByte(),
    0x20, 0x00, 0x80.toByte(), 0x52,
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private class RewardSite(
    val label: String,
    val offset: Int,
    val original: ByteArray,
    val replacement: ByteArray,
)

private val SITES = listOf(
    RewardSite(
        "AdsManager.IsRewardAdLoaded",
        0xBE59F0,
        byteArrayOf(0xF4.toByte(), 0x4F, 0xBE.toByte(), 0xA9.toByte()),
        FORCE_TRUE,
    ),
    RewardSite(
        "AdsManager.WatchVideo",
        0xBE5364,
        byteArrayOf(0xFA.toByte(), 0x67, 0xBB.toByte(), 0xA9.toByte()),
        WATCH_VIDEO_STUB,
    ),
)

private fun ByteArray.requireRewardRegion(site: RewardSite) {
    require(site.offset >= 0 && site.offset + site.original.size <= size) {
        "${site.label} offset out of range"
    }
    for (i in site.original.indices) {
        require(this[site.offset + i] == site.original[i]) {
            "${site.label} does not match target binary"
        }
    }
}

@Suppress("unused")
val soccerStarInstantRewarded = rawResourcePatch(
    name = "Soccer Star Instant Rewarded",
    description = "Rewarded ads always count as loaded and WatchVideo grants the success callback immediately without playing an ad, including offline.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SOCCERSTAR)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        for (site in SITES) {
            bytes.requireRewardRegion(site)
            site.replacement.copyInto(bytes, site.offset)
        }

        soFile.writeBytes(bytes)
    }
}
