package app.aidan.patches.shared

/**
 * Returns true when [length] bytes starting at [offset] are fully inside this array.
 *
 * Uses subtraction rather than `offset + length` so large offsets cannot overflow.
 * A zero-length range exactly at the end of the array is valid.
 */
fun ByteArray.hasRange(offset: Int, length: Int): Boolean = offset >= 0 && length >= 0 && length <= size - offset

/**
 * Returns true when [expected] appears exactly at [offset].
 *
 * An exact end-of-array match is valid; out-of-range or negative offsets return false.
 */
fun ByteArray.matchesAt(offset: Int, expected: ByteArray): Boolean = hasRange(offset, expected.size) &&
    expected.indices.all { this[offset + it] == expected[it] }
