package app.template.patches.shared

import app.morphe.patcher.patch.PatchException

/**
 * Convert a string of hexadecimal bytes (spaces optional) to a ByteArray.
 */
fun byteArrayOf(pattern: String): ByteArray {
    val stripped = pattern.replace(Regex("\\s"), "")
    check(stripped.length % 2 == 0) { "Must have an even length" }

    try {
        return stripped
            .chunked(2)
            .map { it.toInt(16).toByte() }
            .toByteArray()
    } catch (e: NumberFormatException) {
        throw PatchException(
            "Could not parse pattern: $pattern",
            e,
        )
    }
}
