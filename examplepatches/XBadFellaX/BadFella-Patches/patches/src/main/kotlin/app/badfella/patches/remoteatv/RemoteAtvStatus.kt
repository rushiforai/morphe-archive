package app.badfella.patches.remoteatv

import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

private val statusHashes = mapOf(
    "arm64-v8a" to ("fe43c9e6d1ac7e6794697f97cfcaa93fbb3bfcd4b6317d11dee696bc395c11bd" to
        "27a54169f0134529b675b5aa0f097a1debb83394f92c1d9cad8db8b3431687c1"),
    "armeabi-v7a" to ("7a27158a9c846f723b8d59d5061d0479b4500f90a672f65a1d5956a1eecaeefa" to
        "c5c71d38e6b0e725ec6104f71c25793f3f978d11eab087e0d44bca23d4d480b5"),
    "x86_64" to ("6f1f7b661bc7cc855ea3b7c90c147657767e5342ee161cab4ac67c70c7523dae" to
        "cb36a443217cd5bce6246364ff38a7c0a68c050338d9fb5cf0557cc3dd1d95fb"),
)

// Dart 3.9.2 StringHasher, for cached Smi hashes in ARMv7 read-only strings.
private fun dartStringHash(text: String): Int {
    var hash = 0
    text.forEach { char ->
        hash += char.code
        hash += hash shl 10
        hash = hash xor (hash ushr 6)
    }
    hash += hash shl 3
    hash = hash xor (hash ushr 11)
    hash += hash shl 15
    return (hash and 0x3fffffff).let { if (it == 0) 1 else it }
}

/** Changes two English display values only; no Dart instructions, routes or purchase records. */
internal fun patchRemoteAtvStatusLabels(abi: String, file: File) {
    fun digest(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes)
        .joinToString("") { "%02x".format(it) }
    val (before, after) = statusHashes.getValue(abi)
    val bytes = file.readBytes()
    check(digest(bytes) == before) { "Unreviewed Remote ATV Dart snapshot: $abi" }
    val original = bytes.toString(Charsets.ISO_8859_1)
    mapOf("Activate premium" to "Ad-free active",
        "Upgrade to premium for an Ad-Free Experience" to "")
        .forEach { (old, label) ->
            val offset = original.indexOf(old)
            check(offset >= 0 && original.indexOf(old, offset + 1) < 0 && label.length <= old.length)
            val replacement = label.padEnd(old.length)
            if (abi == "armeabi-v7a") {
                val buffer = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
                check(buffer.getInt(offset - 8) == dartStringHash(old) shl 1) { "Dart label hash changed" }
                buffer.putInt(offset - 8, dartStringHash(replacement) shl 1)
            }
            replacement.toByteArray(Charsets.US_ASCII).copyInto(bytes, offset)
        }
    check(digest(bytes) == after) { "Remote ATV status-label checksum failed: $abi" }
    file.writeBytes(bytes)
}
