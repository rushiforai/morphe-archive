package app.hillclimb.patches.ad

import app.morphe.patcher.patch.rawResourcePatch
import app.hillclimb.patches.shared.Constants.COMPATIBILITY_HILLCLIMB

private val REWARD_REQUEST_ANCHOR = byteArrayOf(
    0xE0.toByte(), 0x03, 0x00, 0x91.toByte(), 0x09, 0x01, 0x00, 0x39,
)

private val REWARD_REQUEST_PATCH = byteArrayOf(
    0x21, 0x00, 0x80.toByte(), 0x52, 0xDC.toByte(), 0xF5.toByte(), 0xFF.toByte(), 0x97.toByte(),
    0x0F, 0x00, 0x00, 0x14,
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
val hillClimbInstantRewardsPatch = rawResourcePatch(
    name = "Hill Climb Racing Instant Rewards",
    description = "Rewarded video rewards are granted instantly without playing an ad and without a network connection: the engine's own \"video completed\" path runs, so coins, the reward multipliers and every other ad-gated bonus are delivered immediately.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HILLCLIMB)

    execute {
        val soFile = get("lib/arm64-v8a/libgame.so", true)
        val bytes = soFile.readBytes()

        val at = indexOfUnique(bytes, REWARD_REQUEST_ANCHOR, "CoffeeAdManager::requestRewardedVideo") +
            REWARD_REQUEST_ANCHOR.size
        REWARD_REQUEST_PATCH.copyInto(bytes, at)

        soFile.writeBytes(bytes)
    }
}
