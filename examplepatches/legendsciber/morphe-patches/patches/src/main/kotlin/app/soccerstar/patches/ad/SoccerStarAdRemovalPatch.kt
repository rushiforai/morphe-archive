package app.soccerstar.patches.ad

import app.morphe.patcher.patch.rawResourcePatch
import app.soccerstar.patches.shared.Constants.COMPATIBILITY_SOCCERSTAR

private val ENABLE_FALSE = byteArrayOf(
    0xE0.toByte(), 0x03, 0x1F, 0x2A,
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val RET = byteArrayOf(
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private class AdSite(
    val label: String,
    val offset: Int,
    val original: ByteArray,
    val replacement: ByteArray,
)

private val SITES = listOf(
    AdSite(
        "AdsManager.EnableAD",
        0xBE4E98,
        byteArrayOf(0xF3.toByte(), 0x0F, 0x1E, 0xF8.toByte()),
        ENABLE_FALSE,
    ),
    AdSite(
        "AdsManager.ShowInterstitialAd",
        0xBE653C,
        byteArrayOf(0xFF.toByte(), 0x03, 0x02, 0xD1.toByte()),
        ENABLE_FALSE,
    ),
    AdSite(
        "AdsManager.IsInterstitialLoaded",
        0xBE61C0,
        byteArrayOf(0xF3.toByte(), 0x0F, 0x1E, 0xF8.toByte()),
        ENABLE_FALSE,
    ),
    AdSite(
        "AdsManager.ShowBanner",
        0xBE5B30,
        byteArrayOf(0xF7.toByte(), 0x0F, 0x1C, 0xF8.toByte()),
        RET,
    ),
    AdSite(
        "AdsManager.HideBanner",
        0xBE5EA8,
        byteArrayOf(0xF5.toByte(), 0x0F, 0x1D, 0xF8.toByte()),
        RET,
    ),
    AdSite(
        "Adjust.VerifyAndTrackAppStorePurchase",
        0x13D9634,
        byteArrayOf(0xF3.toByte(), 0x0F, 0x1E, 0xF8.toByte()),
        RET,
    ),
    AdSite(
        "Adjust.VerifyAndTrackPlayStorePurchase",
        0x13D96D4,
        byteArrayOf(0xF5.toByte(), 0x0F, 0x1D, 0xF8.toByte()),
        RET,
    ),
    AdSite(
        "AdjustAndroid.VerifyAndTrackPlayStorePurchase",
        0x13D9770,
        byteArrayOf(0xFF.toByte(), 0x43, 0x02, 0xD1.toByte()),
        RET,
    ),
)

private fun ByteArray.requireAdRegion(site: AdSite) {
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
val soccerStarAdRemoval = rawResourcePatch(
    name = "Soccer Star Ad Removal",
    description = "Disables ads completely: EnableAD always returns false, interstitials and banners are no-ops, Adjust purchase verification is skipped.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SOCCERSTAR)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        for (site in SITES) {
            bytes.requireAdRegion(site)
            site.replacement.copyInto(bytes, site.offset)
        }

        soFile.writeBytes(bytes)
    }
}
