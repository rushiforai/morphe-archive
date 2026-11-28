package app.soccerstar.patches.premium

import app.morphe.patcher.patch.rawResourcePatch
import app.soccerstar.patches.shared.Constants.COMPATIBILITY_SOCCERSTAR

private val FORCE_TRUE = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52,
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val RET = byteArrayOf(
    0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private class VipSite(
    val label: String,
    val offset: Int,
    val original: ByteArray,
    val replacement: ByteArray,
)

private val SITES = listOf(
    VipSite(
        "VIP.EnableVIP",
        0xBC2D70,
        byteArrayOf(0xF3.toByte(), 0x0F, 0x1E, 0xF8.toByte()),
        FORCE_TRUE,
    ),
    VipSite(
        "Win_Subscription.OnUnsubscription",
        0xD7A398,
        byteArrayOf(0xFF.toByte(), 0xC3.toByte(), 0x01, 0xD1.toByte()),
        RET,
    ),
    VipSite(
        "Win_Subscription.CheckSubscription",
        0xC22F44,
        byteArrayOf(0xF3.toByte(), 0x0F, 0x1E, 0xF8.toByte()),
        RET,
    ),
)

private fun ByteArray.requireVipRegion(site: VipSite) {
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
val soccerStarVipUnlock = rawResourcePatch(
    name = "Soccer Star VIP Unlock",
    description = "Unlocks VIP permanently: EnableVIP always reports true, unsubscribe and subscription refresh can no longer clear the flag.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SOCCERSTAR)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        for (site in SITES) {
            bytes.requireVipRegion(site)
            site.replacement.copyInto(bytes, site.offset)
        }

        soFile.writeBytes(bytes)
    }
}
