package dev.solvo37.vkvideopatches

import app.morphe.patcher.patch.resourcePatch
import dev.solvo37.vkvideopatches.Constants.VK_VIDEO

private val vkCoreOriginalPattern = byteArrayOf(
    0x1f, 0x1c, 0x00, 0x72,
    0xe8.toByte(), 0x07, 0x00, 0xf9.toByte(),
    0x00, 0x05, 0x00, 0x54,
)

private val vkCorePatchedPattern = byteArrayOf(
    0x1f, 0x1c, 0x00, 0x72,
    0xe8.toByte(), 0x07, 0x00, 0xf9.toByte(),
    0x00, 0x04, 0x00, 0x54,
)

private fun ByteArray.indexesOf(pattern: ByteArray): List<Int> {
    if (pattern.isEmpty() || size < pattern.size) return emptyList()

    val matches = mutableListOf<Int>()
    for (offset in 0..size - pattern.size) {
        var matchesPattern = true
        for (index in pattern.indices) {
            if (this[offset + index] != pattern[index]) {
                matchesPattern = false
                break
            }
        }
        if (matchesPattern) matches += offset
    }
    return matches
}

@Suppress("unused")
val bypassNativeSignatureCheckPatch = resourcePatch(
    name = "Bypass native signature check",
    description = "Prevents libvkcore.so from terminating re-signed VK Video builds at startup.",
    default = true,
) {
    compatibleWith(VK_VIDEO)

    execute {
        val path = "lib/arm64-v8a/libvkcore.so"
        val file = get(path)
        val bytes = file.readBytes()

        val alreadyPatched = bytes.indexesOf(vkCorePatchedPattern)
        val original = bytes.indexesOf(vkCoreOriginalPattern)

        when {
            alreadyPatched.size == 1 && original.isEmpty() -> return@execute
            original.size != 1 -> error(
                "Expected exactly one VK core signature-check pattern, found ${original.size}. " +
                    "The native fingerprint needs updating."
            )
            else -> {
                val offset = original.single()
                for (index in vkCorePatchedPattern.indices) {
                    bytes[offset + index] = vkCorePatchedPattern[index]
                }
                file.writeBytes(bytes)
            }
        }
    }
}
