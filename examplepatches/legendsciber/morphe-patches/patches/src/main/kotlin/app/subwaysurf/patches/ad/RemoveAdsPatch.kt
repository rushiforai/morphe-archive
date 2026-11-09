package app.subwaysurf.patches.ad

import app.morphe.patcher.patch.rawResourcePatch
import app.subwaysurf.patches.shared.Constants.COMPATIBILITY_SUBWAYSURF

private class RemoveAdSite(val label: String, val anchor: ByteArray, val replacement: ByteArray)

private val INTERSTITIAL_HELPER = byteArrayOf(
    0xFF.toByte(), 0x43, 0x01, 0xD1.toByte(),
    0xFE.toByte(), 0x5F, 0x02, 0xA9.toByte(),
    0xF6.toByte(), 0x57, 0x03, 0xA9.toByte(),
    0xF4.toByte(), 0x4F, 0x04, 0xA9.toByte(),
    0x56, 0x6E, 0x01, 0x90.toByte(),
)

private val SHOULD_SHOW_INTERSTITIAL = byteArrayOf(
    0xFF.toByte(), 0x43, 0x01, 0xD1.toByte(),
    0xE8.toByte(), 0x0B, 0x00, 0xFD.toByte(),
    0xFE.toByte(), 0x0F, 0x00, 0xF9.toByte(),
    0xF8.toByte(), 0x5F, 0x02, 0xA9.toByte(),
    0xF6.toByte(), 0x57, 0x03, 0xA9.toByte(),
    0xF4.toByte(), 0x4F, 0x04, 0xA9.toByte(),
    0x14, 0x52, 0x01, 0xD0.toByte(),
)

private val BANNER_CONTROLLER_SHOW = byteArrayOf(
    0xFE.toByte(), 0x57, 0xBE.toByte(), 0xA9.toByte(),
    0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
    0x35, 0x52, 0x01, 0xD0.toByte(),
    0x54, 0x34, 0x01, 0xB0.toByte(),
    0xA8.toByte(), 0x22, 0x7E, 0x39,
)

private val AD_MANAGER_SHOW_BANNER = byteArrayOf(
    0xFF.toByte(), 0x03, 0x01, 0xD1.toByte(),
    0xFE.toByte(), 0x57, 0x02, 0xA9.toByte(),
    0xF4.toByte(), 0x4F, 0x03, 0xA9.toByte(),
    0x34, 0x8C.toByte(), 0x00, 0xF0.toByte(),
    0x88.toByte(), 0x8A.toByte(), 0x75, 0x39,
)

private val RETURN_FALSE = byteArrayOf(
    0x00, 0x00, 0x80.toByte(), 0x52,
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val RETURN = byteArrayOf(
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val SITES = listOf(
    RemoveAdSite("InterstitialsHelper.TryShowInterstitial", INTERSTITIAL_HELPER, RETURN_FALSE),
    RemoveAdSite("AdPlacementsManager.ShouldShowInterstitial", SHOULD_SHOW_INTERSTITIAL, RETURN_FALSE),
    RemoveAdSite("AdPlacementsBannersController.Show", BANNER_CONTROLLER_SHOW, RETURN),
    RemoveAdSite("AdManager.ShowBanner", AD_MANAGER_SHOW_BANNER, RETURN),
)

@Suppress("unused")
val subwaySurfersRemoveAds = rawResourcePatch(
    name = "Subway Surfers Remove Ads",
    description = "Removes interstitial and banner ads. Depends on Instant Rewarded Ads, so rewarded videos are skipped while their rewards are still granted.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SUBWAYSURF)
    dependsOn(subwaySurfersInstantRewardedAds)

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

            site.replacement.copyInto(bytes, at)
        }

        soFile.writeBytes(bytes)
    }
}
