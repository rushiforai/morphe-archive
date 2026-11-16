package app.badfella.patches.boldvoice

import java.io.DataInputStream
import java.io.File
import java.security.MessageDigest
import java.util.zip.GZIPInputStream

private val EXPECTED_BEFORE_HASHES = mapOf(
    "libreactnative" to "1a7c61701196ee4f116c35645fe7baf0ae937f7f2832fcc706cb322eb860d831",
    "libonnxruntime" to "124a3a26373d32ff2c76557ec88962330ea1893927bc19333c8ba113cff91a8f",
    "libavformat" to "a07b51aa0e70422cf011fa1f03cd75abdd569f84386703019f62714e39620761",
)

private val EXPECTED_AFTER_HASHES = mapOf(
    "libreactnative" to "0a108cd36ab33974758ff4a1391cb278ceb8e1ed3710abb0a873271120fff52b",
    "libonnxruntime" to "4d2318b3849abb8862133d3068fc7e807ed8b2671cc6d83657fff2fcb9e1caad",
    "libavformat" to "205043c0bf7e70ab05ba562aea6d0f813a79c624fea37b2e119c94f667d49429",
)

private fun nativeHash(bytes: ByteArray) = MessageDigest.getInstance("SHA-256")
    .digest(bytes).joinToString("") { "%02x".format(it) }

internal fun restoreBoldVoiceNative(arm64Dir: File) {
    for (lib in listOf("libreactnative", "libonnxruntime", "libavformat")) {
        val file = arm64Dir.resolve("$lib.so")
        if (!file.exists()) continue
        val original = file.readBytes()
        val expectedBefore = EXPECTED_BEFORE_HASHES[lib]
        check(nativeHash(original) == expectedBefore) { "Unreviewed BoldVoice $lib library in arm64-v8a" }
        val resource = checkNotNull(object {}.javaClass.getResourceAsStream("/boldvoice/$lib-arm64-v8a.bfp.gz")) {
            "Missing /boldvoice/$lib-arm64-v8a.bfp.gz resource"
        }
        val restored = DataInputStream(GZIPInputStream(resource)).use { input ->
            check(input.readInt() == 0x42465031) { "Invalid native restoration format" }
            val size = input.readInt()
            val count = input.readInt()
            check(size > 0 && count in 1..10000) { "Invalid BFP parameters: size=$size count=$count" }
            original.copyOf(size).also { bytes ->
                var previousEnd = 0
                repeat(count) {
                    val offset = input.readInt()
                    val length = input.readInt()
                    check(offset >= previousEnd && length > 0 && offset.toLong() + length <= bytes.size)
                    input.readFully(bytes, offset, length)
                    previousEnd = offset + length
                }
                check(input.read() == -1)
            }
        }
        val expectedAfter = EXPECTED_AFTER_HASHES[lib]
        check(nativeHash(restored) == expectedAfter) { "Restored BoldVoice $lib checksum mismatch" }
        file.writeBytes(restored)
    }
}
