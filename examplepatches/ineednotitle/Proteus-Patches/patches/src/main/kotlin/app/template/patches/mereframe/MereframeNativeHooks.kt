package app.template.patches.mereframe

import app.morphe.patcher.patch.PatchException
import app.template.patches.shared.byteArrayOf
import java.io.File
import java.io.RandomAccessFile

internal data class NativeArm64Gate(
    val name: String,
    val pattern96: ByteArray,
)

/**
 * BTI + PAC safe ARM64 return-true stub (`bti jc; mov w0, #1; ret`).
 *
 * `libunnamed_raw.so` emits `.note.gnu.property` with `GNU_PROPERTY_AARCH64_FEATURE_1_AND = 0x3`
 * (BTI | PAC). Starting with bare `mov w0, #1` triggers SIGILL on BTI-enforced hardware
 * (Pixel 9 Pro / Tensor G4) when called via `blr`/`br`; starting with `paciasp` without a
 * matching `autiasp` corrupts `x30`. `bti jc` (`0xd50324df`) lands cleanly on both BTI and
 * non-BTI CPUs while leaving `x30` untouched for `ret`.
 */
internal val ARM64_BTI_RETURN_TRUE_STUB = byteArrayOf("df 24 03 d5 20 00 80 52 c0 03 5f d6")

internal fun arm64Gate(name: String, hex96: String) = NativeArm64Gate(name, byteArrayOf(hex96))

internal fun findExactMatches(haystack: ByteArray, needle: ByteArray): List<Int> {
    if (needle.isEmpty() || haystack.size < needle.size) return emptyList()
    val matches = mutableListOf<Int>()
    val first = needle[0]
    val limit = haystack.size - needle.size
    var i = 0
    while (i <= limit) {
        if (haystack[i] == first) {
            var matched = true
            for (j in 1 until needle.size) {
                if (haystack[i + j] != needle[j]) {
                    matched = false
                    break
                }
            }
            if (matched) matches += i
        }
        i++
    }
    return matches
}

/**
 * Phase 1 validates every 96-byte prologue occurs uniquely (`count == 1`) before opening the
 * shared library for writing; Phase 2 installs `bti jc; mov w0, #1; ret` at each offset.
 */
internal fun patchArm64Gates(
    soFile: File,
    gates: List<NativeArm64Gate>,
    logTag: String,
): Int {
    val bytes = soFile.readBytes()
    val offsets = gates.map { gate ->
        val matches = findExactMatches(bytes, gate.pattern96)
        if (matches.size != 1) {
            throw PatchException(
                "$logTag: expected unique 96-byte prologue for ${gate.name} in ${soFile.name}, " +
                    "found ${matches.size} match(es)",
            )
        }
        gate to matches[0]
    }

    RandomAccessFile(soFile, "rw").use { raf ->
        for ((_, offset) in offsets) {
            raf.seek(offset.toLong())
            raf.write(ARM64_BTI_RETURN_TRUE_STUB)
        }
    }
    return offsets.size
}
