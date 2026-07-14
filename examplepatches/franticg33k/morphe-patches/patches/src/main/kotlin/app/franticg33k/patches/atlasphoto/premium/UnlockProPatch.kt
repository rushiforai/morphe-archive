package app.franticg33k.patches.atlasphoto.premium

import app.morphe.patcher.patch.rawResourcePatch
import app.franticg33k.patches.atlasphoto.shared.Constants.COMPATIBILITY_ATLASPHOTO

private fun ByteArray.indexOfBytes(needle: ByteArray, fromIndex: Int = 0): Int {
    if (needle.isEmpty() || fromIndex < 0) return -1
    var i = fromIndex
    while (i + needle.size <= size) {
        var match = true
        for (j in needle.indices) {
            if (this[i + j] != needle[j]) {
                match = false
                break
            }
        }
        if (match) return i
        i++
    }
    return -1
}

@Suppress("unused")
val unlockAtlasPhotoProPatch = rawResourcePatch(
    name = "Unlock Pro",
    description = "Forces Atlas Photo's Hermes (React Native) JS runtime to treat every " +
        "session as a Pro subscriber by patching the setIsProMember reducer so its isPro " +
        "field is always truthy. Unlocks all Pro features and removes the Pro paywall.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ATLASPHOTO)

    execute {
        val bundleFile = get("assets/index.android.bundle", false)
        val bytes = bundleFile.readBytes()

        // setIsProMember builds an object of shape { isPro: arg } and then loads the
        // argument with `LoadParam r3, 1` (89 03 01). We locate that instruction by the
        // unique 16-byte function prologue and override it with `LoadConstUInt8 r3, 1`
        // (8b 03 01) so isPro is always 1 regardless of the real entitlement.
        val needle = byteArrayOf(
            0x34.toByte(), 0x01.toByte(), 0x00.toByte(), 0x3b.toByte(),
            0x02.toByte(), 0x01.toByte(), 0x00.toByte(), 0x01.toByte(),
            0x01.toByte(), 0x93.toByte(), 0x18.toByte(), 0xf7.toByte(),
            0x19.toByte(), 0x89.toByte(), 0x03.toByte(), 0x01.toByte()
        )
        val index = bytes.indexOfBytes(needle)
        if (index < 0) {
            error("Atlas Photo Pro patch: setIsProMember signature not found in Hermes bundle")
        }

        // The last 3 bytes of the signature are the LoadParam r3, 1 we want to replace.
        val target = index + needle.size - 3
        val expected = byteArrayOf(0x89.toByte(), 0x03.toByte(), 0x01.toByte())
        val actual = bytes.copyOfRange(target, target + 3)
        if (!actual.contentEquals(expected)) {
            error("Atlas Photo Pro patch: unexpected bytes 0x${actual.joinToString("") { "%02x".format(it) }} at 0x${target.toString(16)}")
        }

        bytes[target] = 0x8b.toByte() // LoadConstUInt8 r3, 1
        bytes[target + 1] = 0x03.toByte()
        bytes[target + 2] = 0x01.toByte()

        bundleFile.writeBytes(bytes)
    }
}
