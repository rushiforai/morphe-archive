package app.badfella.patches.remoteatv

import java.io.DataInputStream
import java.io.File
import java.security.MessageDigest
import java.util.zip.GZIPInputStream

// Restores the matching Flutter 3.35.6 engine, including functions virtualized by PairIP.
private val nativeHashes = mapOf(
    "arm64-v8a" to ("61838891a9d405d954df6a64ec5217b16ed0d6fdaafce44fe1fb0170d79b7849" to
        "74df8163897c74ee439085f18b31e69145c56999ef12926f9e24b1232cb78552"),
    "armeabi-v7a" to ("70b22fe11201250d2c907dc3f8671e78bedb636fa973cc1d99a027da42a15bdb" to
        "5b3e03551904793eea5cef98c3a14b380d3f00e1bff66bf9c3273075b6b79691"),
    "x86_64" to ("892307c143b4913b1fec63fdade3172441925ff7229edcd27e977959aa1617ed" to
        "5cfd55baf59893c11a2a32ec441cd05b9e7d45085493a595ea2baf2900a2c413"),
)

private fun nativeHash(bytes: ByteArray) = MessageDigest.getInstance("SHA-256")
    .digest(bytes).joinToString("") { "%02x".format(it) }

internal fun restoreRemoteAtvFlutter(abi: String, file: File) {
    val (before, after) = nativeHashes.getValue(abi)
    val original = file.readBytes()
    check(nativeHash(original) == before) { "Unreviewed Remote ATV Flutter library: $abi" }
    val resource = checkNotNull(object {}.javaClass.getResourceAsStream("/remoteatv/flutter-6.1.0-$abi.bfp.gz"))
    val restored = DataInputStream(GZIPInputStream(resource)).use { input ->
        check(input.readInt() == 0x42465031) { "Invalid native restoration format" }
        val size = input.readInt()
        val count = input.readInt()
        check(size in 1..original.size && count in 1..10000)
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
    check(nativeHash(restored) == after) { "Remote ATV native restoration checksum failed: $abi" }
    file.writeBytes(restored)
}
