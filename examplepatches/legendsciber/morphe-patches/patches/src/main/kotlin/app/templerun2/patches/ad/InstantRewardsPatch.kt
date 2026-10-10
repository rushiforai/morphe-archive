package app.templerun2.patches.ad

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
        label = "WatchVideoIfAvailable entry cut -> instant reward cave",
        from = byteArrayOf(
            0xFE.toByte(), 0x57, 0xBE.toByte(), 0xA9.toByte(), 0xF4.toByte(), 0x4F,
            0x01, 0xA9.toByte(), 0xB5.toByte(), 0xBF.toByte(), 0x00, 0xB0.toByte(),
            0xA8.toByte(), 0x16, 0x49, 0x39,
        ),
        to = byteArrayOf(
            0x82.toByte(), 0x8D.toByte(), 0x06, 0x14, 0xF4.toByte(), 0x4F,
            0x01, 0xA9.toByte(), 0xB5.toByte(), 0xBF.toByte(), 0x00, 0xB0.toByte(),
            0xA8.toByte(), 0x16, 0x49, 0x39,
        ),
    ),
    PatchSite(
        label = "IsVideoAvailable forced true",
        from = byteArrayOf(
            0xFE.toByte(), 0x57, 0xBE.toByte(), 0xA9.toByte(), 0xF4.toByte(), 0x4F,
            0x01, 0xA9.toByte(), 0xB5.toByte(), 0xBF.toByte(), 0x00, 0xB0.toByte(),
            0x94.toByte(), 0xAD.toByte(), 0x00, 0xD0.toByte(),
        ),
        to = byteArrayOf(
            0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03,
            0x5F, 0xD6.toByte(), 0xB5.toByte(), 0xBF.toByte(), 0x00, 0xB0.toByte(),
            0x94.toByte(), 0xAD.toByte(), 0x00, 0xD0.toByte(),
        ),
    ),
    PatchSite(
        label = "BattlePassTierObject.ShowAdForRewards",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xAA.toByte(), 0x2E,
            0x0C, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "PotionsWatchAd.WatchAdForPotion",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x34, 0x47,
            0x0A, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "TitleDailyRVAdsButton.UpdateButton#1",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xB1.toByte(), 0x85.toByte(),
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "TitleDailyRVAdsButton.UpdateButton#2",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x74, 0x85.toByte(),
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "AdventCalender.OnActive",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xCA.toByte(), 0x5F,
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "AdventCalender.SetupUI",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x45, 0x5F,
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "AdventCalender.WatchAd",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x26, 0x5A,
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "BattlePassScreen.OnWatchAdClicked",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x60, 0x38,
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "CharacterScreen.OnWatchAdForRVCharacter",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x46, 0x07,
            0x09, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "DailyLogin.WatchAd",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xC2.toByte(), 0xEE.toByte(),
            0x08, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "DailyRVAds.OnActive",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x55, 0xE8.toByte(),
            0x08, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "DailyRVAds.SetupUI",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xB1.toByte(), 0xE7.toByte(),
            0x08, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "DailyRVAds.WatchAd",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xBE.toByte(), 0xE3.toByte(),
            0x08, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "MiniGame.OnStartWatchAd",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x94.toByte(), 0x59,
            0x08, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "PowerupScreen.OnUpdatePowerupUsingAdButtonClicked",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xE3.toByte(), 0xEF.toByte(),
            0x07, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "WeeklyRewards.OnRightButtonClicked",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x78, 0x66,
            0x07, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "UIWatchAds.OnRightButtonClicked",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x96.toByte(),
            0x05, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "RewardedAdManager.ShouldHideRewardedMapUI",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x16, 0x77,
            0x08, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
    PatchSite(
        label = "DailyRVAdsManager.IsPlayingOffline",
        from = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0xD8.toByte(), 0xF4.toByte(),
            0x00, 0x94.toByte(),
        ),
        to = byteArrayOf(
            0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x20, 0x00,
            0x80.toByte(), 0x52,
        ),
    ),
)

private val CAVE_OFFSET = 0x01B33320

private val STUBS = listOf(
    Stub(
        label = "InstantRewardCave",
        offset = CAVE_OFFSET,
        bytes = byteArrayOf(
            0x01, 0x24, 0x00, 0xF9.toByte(), 0xFE.toByte(), 0x4F,
            0xBF.toByte(), 0xA9.toByte(), 0xF3.toByte(), 0x03, 0x00, 0xAA.toByte(),
            0x28, 0x00, 0x80.toByte(), 0x52, 0x68, 0x12,
            0x05, 0x78, 0x68, 0x1A, 0x40, 0xF9.toByte(),
            0xA8.toByte(), 0x00, 0x00, 0xB4.toByte(), 0x09, 0x0D,
            0x40, 0xF9.toByte(), 0x00, 0x21, 0x40, 0xF9.toByte(),
            0x01, 0x15, 0x40, 0xF9.toByte(), 0x20, 0x01,
            0x3F, 0xD6.toByte(), 0xE0.toByte(), 0x03, 0x13, 0xAA.toByte(),
            0xD8.toByte(), 0x74, 0xF9.toByte(), 0x97.toByte(), 0xFE.toByte(), 0x4F,
            0xC1.toByte(), 0xA8.toByte(), 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(),
        ),
    ),
)


@Suppress("unused")
val templeRun2InstantRewardsPatch = rawResourcePatch(
    name = "Temple Run 2 Instant Rewards",
    description = "Every ad-gated reward works without watching an ad and without a network connection: rewarded-map unlocks, potions, power-ups, dailies, battle pass, advent calendar, weekly rewards and rewarded boosts are granted instantly.",
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
