package app.templerun2.patches.billing

import app.morphe.patcher.patch.rawResourcePatch
import app.templerun2.patches.shared.Constants.COMPATIBILITY_TEMPLERUN2

private class PatchSite(val label: String, val from: ByteArray, val to: ByteArray)

private class Stub(val label: String, val offset: Int, val bytes: ByteArray)

private val RET = byteArrayOf(0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())

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

private val SITES = listOf(
    PatchSite(
        label = "TRUnityStoreManager.Purchase entry cut -> free grant cave",
        from = byteArrayOf(
            0xFE.toByte(), 0x0F, 0x1D, 0xF8.toByte(), 0xF6.toByte(), 0x57,
            0x01, 0xA9.toByte(), 0xF4.toByte(), 0x4F, 0x02, 0xA9.toByte(),
            0xF6.toByte(), 0xE3.toByte(), 0x00, 0x90.toByte(),
        ),
        to = byteArrayOf(
            0x27, 0xB5.toByte(), 0x18, 0x14, 0xF6.toByte(), 0x57,
            0x01, 0xA9.toByte(), 0xF4.toByte(), 0x4F, 0x02, 0xA9.toByte(),
            0xF6.toByte(), 0xE3.toByte(), 0x00, 0x90.toByte(),
        ),
    ),
    PatchSite(
        label = "failed-init state=3 forced onto normal flow",
        from = byteArrayOf(
            0xE1.toByte(), 0x04, 0x00, 0x54, 0x08, 0xD2.toByte(),
            0x00, 0x90.toByte(),
        ),
        to = byteArrayOf(
            0x27, 0x00, 0x00, 0x14, 0x08, 0xD2.toByte(),
            0x00, 0x90.toByte(),
        ),
    ),
    PatchSite(
        label = "UGUIStoreItemBase.OnPurchaseButtonClicked",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xDF.toByte(), 0x9D.toByte(),
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "PurchaseProduct.networkGate",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xC5.toByte(), 0x22,
            0x0F, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "PurchaseNoAdsPopup.OnPurchaseButtonPressed",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xD1.toByte(), 0xF0.toByte(),
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "UGUICharacterScreen.TryRealMoneyPurchase",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xE8.toByte(), 0x05,
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "CurrencyScreen.InitializeStoreItems",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xFA.toByte(), 0xD7.toByte(),
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "DealsScreen.InitializeStoreItems",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xA7.toByte(), 0xD2.toByte(),
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "PerksScreen.InitializeStoreItems",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xFA.toByte(), 0xB1.toByte(),
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "UGUIStoreScreen.OnActive",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xF3.toByte(), 0xC9.toByte(),
            0x07, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "PotionsConstruct.BuyPotion",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x66, 0x5C,
            0x0A, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "PostGame.CanShowPostGameNoAdsPopup",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x33, 0x17,
            0x08, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "TitleScreen.CheckPerksRewardAlert",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xB0.toByte(), 0xA2.toByte(),
            0x07, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
)

private val CAVE_OFFSET = 0x01B332E4

private val STUBS = listOf(
    Stub(
        label = "FreeIapGrantCave",
        offset = CAVE_OFFSET,
        bytes = byteArrayOf(
            0xFE.toByte(), 0x4F, 0xBE.toByte(), 0xA9.toByte(), 0xF3.toByte(), 0x03,
            0x00, 0xAA.toByte(), 0x02, 0x28, 0x00, 0xF9.toByte(),
            0xFF.toByte(), 0x43, 0x00, 0xD1.toByte(), 0xFF.toByte(), 0x03,
            0x00, 0xB9.toByte(), 0xE2.toByte(), 0x03, 0x00, 0x91.toByte(),
            0xE3.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x93.toByte(), 0x4B,
            0xE7.toByte(), 0x97.toByte(), 0xE0.toByte(), 0x03, 0x13, 0xAA.toByte(),
            0x25, 0x4F, 0xE7.toByte(), 0x97.toByte(), 0xFF.toByte(), 0x43,
            0x00, 0x91.toByte(), 0xFE.toByte(), 0x4F, 0xC2.toByte(), 0xA8.toByte(),
            0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
)


@Suppress("unused")
val templeRun2FreeIapPatch = rawResourcePatch(
    name = "Temple Run 2 Free IAP",
    description = "All store purchases (coins, gems, no-ads, characters, deals, potions and perks) are granted instantly and free without Google Play billing, online or offline.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TEMPLERUN2)

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
            site.to.copyInto(bytes, indexOfUnique(bytes, site.from, site.label))
        }

        soFile.writeBytes(bytes)
    }
}
