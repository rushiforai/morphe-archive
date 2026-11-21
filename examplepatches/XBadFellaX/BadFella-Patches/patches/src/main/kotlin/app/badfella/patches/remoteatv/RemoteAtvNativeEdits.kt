package app.badfella.patches.remoteatv

import java.security.MessageDigest

internal fun applyRemoteAtvNativeEdits(bytes: ByteArray, resource: String, label: String): ByteArray {
    val stream = checkNotNull(object {}.javaClass.getResourceAsStream(resource)) {
        "Unreviewed Remote ATV $label architecture: $resource"
    }
    val lines = stream.bufferedReader().use { it.readLines() }
        .filter { it.isNotBlank() && !it.startsWith('#') }
    val hashes = lines.first().split('\t')
    fun digest() = MessageDigest.getInstance("SHA-256").digest(bytes)
        .joinToString("") { "%02x".format(it) }
    check(digest() == hashes[0]) { "Unreviewed Remote ATV $label snapshot" }
    lines.drop(1).forEach { line ->
        val (position, expected, replacement) = line.split('\t')
        val offset = position.toInt(16)
        fun decode(hex: String) = hex.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
        val before = decode(expected)
        val after = decode(replacement)
        check(offset >= 0 && before.size == after.size && offset <= bytes.size - before.size &&
            bytes.copyOfRange(offset, offset + before.size).contentEquals(before)) {
            "Remote ATV $label instructions changed: $position"
        }
        after.copyInto(bytes, offset)
    }
    check(digest() == hashes[1]) { "Remote ATV $label output checksum failed" }
    return bytes
}
