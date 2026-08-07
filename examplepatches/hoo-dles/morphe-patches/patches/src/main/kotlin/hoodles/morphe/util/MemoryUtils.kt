package hoodles.morphe.util

import kotlin.math.max

fun asCString(str: String, padTo: Int? = null): ByteArray {
    return str.toByteArray(Charsets.US_ASCII) + byteArrayOf(0)
}

// In-memory Boyer-Moore search algorithm
fun ByteArray.find(pattern: ByteArray): Int {
    val right = IntArray(256) { -1 }

    for ((i, element) in pattern.withIndex())
        right[element.toInt().and(0xFF)] = i

    var skip: Int
    for (i in 0..this.size - pattern.size) {
        skip = 0

        for (j in pattern.size - 1 downTo 0) {
            if (pattern[j] != this[i + j]) {
                skip = max(1, j - right[this[i + j].toInt().and(0xFF)])

                break
            }
        }

        if (skip == 0) return i
    }
    return -1
}

object Arm64Constants {
    const val RETURN_NULL = "00 00 80 D2 C0 03 5F D6"
}