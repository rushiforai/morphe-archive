/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.badfella.patches.ultimea.upstream.shared

internal fun ByteArray.readInt(offset: Int) =
    (this[offset].toInt() and 0xFF) or
        ((this[offset + 1].toInt() and 0xFF) shl 8) or
        ((this[offset + 2].toInt() and 0xFF) shl 16) or
        ((this[offset + 3].toInt() and 0xFF) shl 24)

internal fun ByteArray.writeInt(offset: Int, value: Int) {
    this[offset] = value.toByte()
    this[offset + 1] = (value ushr 8).toByte()
    this[offset + 2] = (value ushr 16).toByte()
    this[offset + 3] = (value ushr 24).toByte()
}

internal fun ByteArray.readShort(offset: Int) =
    (this[offset].toInt() and 0xFF) or ((this[offset + 1].toInt() and 0xFF) shl 8)

internal fun ByteArray.indexOfMasked(pattern: ByteArray, mask: ByteArray, startIndex: Int = 0): Int {
    candidate@ for (index in startIndex..size - pattern.size) {
        for (offset in pattern.indices) {
            val masked = mask[offset].toInt()
            val actual = this[index + offset].toInt() and masked
            val expected = pattern[offset].toInt() and masked

            if (actual != expected) continue@candidate
        }
        return index
    }
    return -1
}
