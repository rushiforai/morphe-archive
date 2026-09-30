/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.protonmail.shared

import app.morphe.patcher.patch.PatchException
import java.io.File
import java.io.RandomAccessFile

internal const val MAIL_UNIFFI_LIBRARY = "libmail_uniffi.so"
internal const val ARM64 = "arm64-v8a"
internal const val ARM32 = "armeabi-v7a"
internal const val X86_64 = "x86_64"

internal fun File.replaceTrailingMasked(pattern: ByteArray, mask: ByteArray, replacement: ByteArray) =
    replaceMasked(pattern, mask, mapOf(pattern.size - replacement.size to replacement))

internal fun File.replaceMasked(
    pattern: ByteArray,
    mask: ByteArray,
    replacementsByOffset: Map<Int, ByteArray>,
): Boolean {
    require(pattern.size == mask.size) { "Mask must be the same length as the pattern" }
    require(replacementsByOffset.all { (offset, bytes) -> offset >= 0 && offset + bytes.size <= pattern.size }) {
        "Replacements must fall inside the pattern"
    }

    RandomAccessFile(this, "rw").use { file ->
        val bytes = ByteArray(file.length().toInt())
        file.readFully(bytes)

        val index = bytes.indexOfMasked(pattern, mask)
        if (index < 0) return false

        if (bytes.indexOfMasked(pattern, mask, index + 1) >= 0) {
            throw PatchException("Pattern matches $name more than once")
        }

        for ((offset, replacement) in replacementsByOffset) {
            file.seek((index + offset).toLong())
            file.write(replacement)
        }
    }

    return true
}

private fun ByteArray.indexOfMasked(pattern: ByteArray, mask: ByteArray, startIndex: Int = 0): Int {
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
