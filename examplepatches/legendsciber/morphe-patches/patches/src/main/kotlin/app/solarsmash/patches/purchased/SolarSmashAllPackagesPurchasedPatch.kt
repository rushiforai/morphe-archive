package app.solarsmash.patches.purchased

import app.morphe.patcher.patch.rawResourcePatch
import app.solarsmash.patches.shared.Constants.COMPATIBILITY_SOLARSMASH

private val FORCE_TRUE = byteArrayOf(
    0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
)

private val SITES = listOf(
    "Purchasable.IsPurchaseApplied" to byteArrayOf(
        0xE0.toByte(), 0x03, 0x1F, 0x2A, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        0xE1.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x5D, 0x6F, 0x71, 0x14,
    ),
    "ObjectPurchase.IsPurchaseApplied" to byteArrayOf(
        0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
        0x14, 0x1F, 0x01, 0xB0.toByte(),
    ),
    "RemoveAdverts.IsPurchaseApplied" to byteArrayOf(
        0xFE.toByte(), 0x4F, 0xBF.toByte(), 0xA9.toByte(), 0x13, 0x1F, 0x01, 0x90.toByte(),
    ),
    "UnlockLevelAndAchievementItems.IsPurchaseApplied" to byteArrayOf(
        0x4C, 0xFF.toByte(), 0xFF.toByte(), 0x17, 0xFE.toByte(), 0x57, 0xBE.toByte(),
        0xA9.toByte(),
    ),
    "CompletePackPurchase.get_HasAllWeaponsAccess" to byteArrayOf(
        0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
        0x13, 0x1F, 0x01, 0xF0.toByte(), 0xF4.toByte(), 0x0B, 0x01, 0x90.toByte(), 0x68, 0x4A,
        0x48, 0x39,
    ),
    "CompletePackPurchase.get_HasAllPlanetsAccess" to byteArrayOf(
        0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte(),
        0x13, 0x1F, 0x01, 0xF0.toByte(), 0xF4.toByte(), 0x0B, 0x01, 0x90.toByte(), 0x68, 0x4E,
        0x48, 0x39,
    ),
    "UISecretPlanet.get_IsRewardedUnlocked" to byteArrayOf(
        0xFE.toByte(), 0x0F, 0x1F, 0xF8.toByte(), 0xDD.toByte(), 0xFF.toByte(), 0xFF.toByte(),
        0x97.toByte(),
    ),
    "UISecretPlanet.get_IsIAPUnlocked" to byteArrayOf(
        0xFE.toByte(), 0x0F, 0x1D, 0xF8.toByte(), 0xF6.toByte(), 0x57, 0x01, 0xA9.toByte(),
        0xF4.toByte(), 0x4F, 0x02, 0xA9.toByte(), 0x94.toByte(), 0x21, 0x01, 0x90.toByte(),
    ),
    "UISecretPlanet.get_IsPlanetGroupUnlocked" to byteArrayOf(
        0xFE.toByte(), 0x57, 0xBE.toByte(), 0xA9.toByte(), 0xF4.toByte(), 0x4F, 0x01,
        0xA9.toByte(), 0x94.toByte(), 0x21, 0x01, 0x90.toByte(), 0x15, 0x0E, 0x01,
        0xF0.toByte(), 0xF3.toByte(), 0x03, 0x00, 0xAA.toByte(), 0x88.toByte(), 0x6E, 0x7E,
        0x39,
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
val solarSmashAllPackagesPurchasedPatch = rawResourcePatch(
    name = "Solar Smash All Packages Purchased",
    description = "Every in-app purchase package reports as purchased: the all weapons pack, all planets pack, remove ads and unlock levels and achievements stay permanently owned and unlocked, without contacting Google Play.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SOLARSMASH)

    execute {
        val soFile = get("lib/arm64-v8a/libil2cpp.so", true)
        val bytes = soFile.readBytes()

        for ((label, anchor) in SITES) {
            FORCE_TRUE.copyInto(bytes, indexOfUnique(bytes, anchor, label))
        }

        soFile.writeBytes(bytes)
    }
}
