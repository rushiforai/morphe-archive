package app.subwaysurf.patches.ad

import app.morphe.patcher.patch.rawResourcePatch
import app.subwaysurf.patches.shared.Constants.COMPATIBILITY_SUBWAYSURF

private class PatchSite(
    val label: String,
    val anchor: ByteArray,
    val targetOffset: Int,
    val replacement: ByteArray,
)

private val SITES = listOf(
    PatchSite(
        label = "AdsHandler.WatchAd",
        anchor = byteArrayOf(
            0xA1.toByte(), 0x02, 0x40, 0xF9.toByte(),
            0xF4.toByte(), 0x03, 0x00, 0xAA.toByte(),
            0x65, 0xEE.toByte(), 0x29, 0x94.toByte(),
            0x60, 0x3E, 0x40, 0xF9.toByte(),
            0x74, 0x12, 0x00, 0xF9.toByte(),
        ),
        targetOffset = 20,
        replacement = byteArrayOf(
            0xE0.toByte(), 0x03, 0x13, 0xAA.toByte(),
            0x61, 0x00, 0x80.toByte(), 0x52,
            0x09, 0x02, 0x00, 0x94.toByte(),
            0x41, 0x00, 0x00, 0x14,
        ),
    ),
    PatchSite(
        label = "AdsButtonWidget.RequestOrPlay",
        anchor = byteArrayOf(
            0xFE.toByte(), 0x57, 0xBE.toByte(), 0xA9.toByte(),
            0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
            0x74, 0x5B, 0x01, 0x90.toByte(),
            0x88.toByte(), 0x86.toByte(), 0x46, 0x39,
        ),
        targetOffset = 0,
        replacement = byteArrayOf(
            0x61, 0x00, 0x80.toByte(), 0x52,
            0xF8.toByte(), 0x01, 0x00, 0x14,
        ),
    ),
    PatchSite(
        label = "AdsButtonWidget.HasToSkipAdDueToTickets",
        anchor = byteArrayOf(
            0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(),
            0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
            0x54, 0x5B, 0x01, 0xF0.toByte(),
            0x88.toByte(), 0xAA.toByte(), 0x46, 0x39,
        ),
        targetOffset = 0,
        replacement = byteArrayOf(
            0x00, 0x00, 0x80.toByte(), 0x52,
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
    PatchSite(
        label = "AdsButtonWidget.SkipAdWithTicket",
        anchor = byteArrayOf(
            0xFF.toByte(), 0x43, 0x02, 0xD1.toByte(),
            0xFE.toByte(), 0x57, 0x07, 0xA9.toByte(),
            0xF4.toByte(), 0x4F, 0x08, 0xA9.toByte(),
            0x55, 0x5B, 0x01, 0xF0.toByte(),
        ),
        targetOffset = 0,
        replacement = byteArrayOf(
            0x61, 0x00, 0x80.toByte(), 0x52,
            0x89.toByte(), 0xFE.toByte(), 0xFF.toByte(), 0x17,
        ),
    ),
    PatchSite(
        label = "AdPlacementsManager.CanSkipAdWithTickets(string)",
        anchor = byteArrayOf(
            0xFE.toByte(), 0x0F, 0x1D, 0xF8.toByte(),
            0xF6.toByte(), 0x57, 0x01, 0xA9.toByte(),
            0xF4.toByte(), 0x4F, 0x02, 0xA9.toByte(),
            0x15, 0x52, 0x01, 0xB0.toByte(),
            0x36, 0x34, 0x01, 0xB0.toByte(),
        ),
        targetOffset = 0,
        replacement = byteArrayOf(
            0x00, 0x00, 0x80.toByte(), 0x52,
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
    PatchSite(
        label = "AdPlacementsManager.CanSkipAdWithTickets(id)",
        anchor = byteArrayOf(
            0xFE.toByte(), 0x57, 0xBE.toByte(), 0xA9.toByte(),
            0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
            0x15, 0x52, 0x01, 0xB0.toByte(),
            0xA8.toByte(), 0x4A, 0x7F, 0x39,
        ),
        targetOffset = 0,
        replacement = byteArrayOf(
            0x00, 0x00, 0x80.toByte(), 0x52,
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
    PatchSite(
        label = "AdManager.IsInitializedFor",
        anchor = byteArrayOf(
            0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(),
            0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
            0x3F, 0x08, 0x00, 0x71,
            0x83.toByte(), 0x00, 0x00, 0x54,
        ),
        targetOffset = 0,
        replacement = byteArrayOf(
            0x20, 0x00, 0x80.toByte(), 0x52,
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
    PatchSite(
        label = "AdManager.HasAdAvailable",
        anchor = byteArrayOf(
            0xFE.toByte(), 0x0F, 0x1F, 0xF8.toByte(),
            0x08, 0xE0.toByte(), 0x40, 0x39,
            0xE8.toByte(), 0x00, 0x00, 0x34,
            0x3F, 0x08, 0x00, 0x71,
        ),
        targetOffset = 0,
        replacement = byteArrayOf(
            0x20, 0x00, 0x80.toByte(), 0x52,
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
    PatchSite(
        label = "AdPlacementsManager.GetRVNativeStatus",
        anchor = byteArrayOf(
            0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(),
            0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
            0x14, 0x52, 0x01, 0xB0.toByte(),
            0x33, 0x34, 0x01, 0x90.toByte(),
            0x88.toByte(), 0x5A, 0x7F, 0x39,
        ),
        targetOffset = 0,
        replacement = byteArrayOf(
            0x20, 0x00, 0x80.toByte(), 0x52,
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
    PatchSite(
        label = "AdPlacementsManager.AreAdsCompletelyOffline",
        anchor = byteArrayOf(
            0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(),
            0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
            0x14, 0x52, 0x01, 0xB0.toByte(),
            0x88.toByte(), 0x56, 0x7F, 0x39,
        ),
        targetOffset = 0,
        replacement = byteArrayOf(
            0x00, 0x00, 0x80.toByte(), 0x52,
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
)

@Suppress("unused")
val subwaySurfersInstantRewardedAds = rawResourcePatch(
    name = "Subway Surfers Instant Rewarded Ads",
    description = "Rewarded ad buttons grant their reward immediately without playing a video, and ad availability is forced ready so shop ad offers work without the ad SDK. Interstitial and banner ads are untouched.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SUBWAYSURF)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        for (site in SITES) {
            var count = 0
            var at = -1
            var i = 0
            while (i <= bytes.size - site.anchor.size) {
                var match = true
                var j = 0
                while (j < site.anchor.size) {
                    if (bytes[i + j] != site.anchor[j]) {
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
            require(count == 1) { "${site.label} site not unique: $count matches" }

            site.replacement.copyInto(bytes, at + site.targetOffset)
        }

        soFile.writeBytes(bytes)
    }
}
