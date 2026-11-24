/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.shared

import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.resourceFile
import app.morphe.patches.shared.bytecode.indexOf

/**
 * Per-ABI entry points for the two JNI probes in `librjsniffer-lib.so`.
 *
 * The library is tiny (4-7 KB) and exports its JNI symbols, so each probe has
 * exactly one entry point per ABI and the opening instruction bytes are unique
 * within the file. Overwriting the entry makes the function return `false`
 * before any of its logic runs.
 *
 * Patching here rather than in the dex is deliberate: both methods are
 * declared `static native`, so they have no dex implementation at all.
 */
internal class NativeProbe(
    val anchor: ByteArray,
    /** Instructions that set the return value to 0 and return. */
    val returnFalse: ByteArray,
)

/** `mov w0, wzr` + `ret` */
private val ARM64_RETURN_FALSE = byteArrayOf(
    0x00.toByte(), 0x00.toByte(), 0x80.toByte(), 0x52.toByte(),
    0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte(),
)

/** `movs r0, #0` + `bx lr` */
private val THUMB_RETURN_FALSE = byteArrayOf(
    0x00.toByte(), 0x20.toByte(), 0x70.toByte(), 0x47.toByte(),
)

/** `xorl %eax, %eax` + `retq` */
private val X86_RETURN_FALSE = byteArrayOf(
    0x31.toByte(), 0xC0.toByte(), 0xC3.toByte(),
)

/** `Native.AntiFridaNativeLoader_checkFridaByPort` */
internal val CHECK_FRIDA_BY_PORT = mapOf(
    "arm64-v8a" to NativeProbe(
        anchor = byteArrayOf(
            0xFF.toByte(), 0x03.toByte(), 0x01.toByte(), 0xD1.toByte(),
            0xFD.toByte(), 0x7B.toByte(), 0x02.toByte(), 0xA9.toByte(),
            0xF4.toByte(), 0x4F.toByte(), 0x03.toByte(), 0xA9.toByte(),
        ),
        returnFalse = ARM64_RETURN_FALSE,
    ),
    "armeabi-v7a" to NativeProbe(
        anchor = byteArrayOf(
            0xF0.toByte(), 0xB5.toByte(), 0x03.toByte(), 0xAF.toByte(),
            0x4D.toByte(), 0xF8.toByte(), 0x04.toByte(), 0xBD.toByte(),
            0x86.toByte(), 0xB0.toByte(), 0x16.toByte(), 0x48.toByte(),
        ),
        returnFalse = THUMB_RETURN_FALSE,
    ),
    "x86_64" to NativeProbe(
        anchor = byteArrayOf(
            0x55.toByte(), 0x48.toByte(), 0x89.toByte(), 0xE5.toByte(),
            0x41.toByte(), 0x56.toByte(), 0x53.toByte(), 0x48.toByte(),
            0x83.toByte(), 0xEC.toByte(), 0x20.toByte(), 0x64.toByte(),
        ),
        returnFalse = X86_RETURN_FALSE,
    ),
)

/** `Native.isMagiskPresentNative` */
internal val IS_MAGISK_PRESENT_NATIVE = mapOf(
    "arm64-v8a" to NativeProbe(
        anchor = byteArrayOf(
            0xFD.toByte(), 0x7B.toByte(), 0xBD.toByte(), 0xA9.toByte(),
            0xF5.toByte(), 0x0B.toByte(), 0x00.toByte(), 0xF9.toByte(),
            0xF4.toByte(), 0x4F.toByte(), 0x02.toByte(), 0xA9.toByte(),
        ),
        returnFalse = ARM64_RETURN_FALSE,
    ),
    "armeabi-v7a" to NativeProbe(
        anchor = byteArrayOf(
            0xF0.toByte(), 0xB5.toByte(), 0x03.toByte(), 0xAF.toByte(),
            0x4D.toByte(), 0xF8.toByte(), 0x04.toByte(), 0xBD.toByte(),
            0x2E.toByte(), 0x4E.toByte(), 0x00.toByte(), 0x25.toByte(),
        ),
        returnFalse = THUMB_RETURN_FALSE,
    ),
    "x86_64" to NativeProbe(
        anchor = byteArrayOf(
            0x55.toByte(), 0x48.toByte(), 0x89.toByte(), 0xE5.toByte(),
            0x41.toByte(), 0x57.toByte(), 0x41.toByte(), 0x56.toByte(),
            0x41.toByte(), 0x54.toByte(), 0x53.toByte(), 0x45.toByte(),
        ),
        returnFalse = X86_RETURN_FALSE,
    ),
)

/** Architectures My Ooredoo ships. */
internal val OOREDOO_ARCHITECTURES = listOf("arm64-v8a", "armeabi-v7a", "x86_64")

/**
 * Returns the subset of [OOREDOO_ARCHITECTURES] actually present in the target APK.
 *
 * Uses [listApkEntries] because Morphe 2.x decodes/extracts native libraries lazily on
 * request, so checking `resourceFile("lib/$arch").exists()` would always return `false`.
 */
internal fun presentOoredooArchitectures(): List<String> =
    OOREDOO_ARCHITECTURES.filter { arch -> listApkEntries("lib/$arch/").isNotEmpty() }

/**
 * Makes [probes] return `false` for every ABI present in the APK, or reports
 * the ones it could not rewrite.
 *
 * @return human readable problems, empty when every present ABI was rewritten.
 */
internal fun neutraliseNativeProbes(
    probes: Map<String, NativeProbe>,
    label: String,
    library: String = "librjsniffer-lib.so",
): List<String> {
    val presentAbis = presentOoredooArchitectures()
    if (presentAbis.isEmpty()) {
        return listOf("$label: no supported ABI found in APK")
    }

    val problems = mutableListOf<String>()

    presentAbis.forEach { arch ->
        val probe = probes[arch] ?: return@forEach
        val file = resourceFile("lib/$arch/$library")
        if (!file.isFile) {
            problems += "$label $arch: $library missing"
            return@forEach
        }

        val data = file.readBytes()
        val offset = data.indexOf(probe.anchor)
        if (offset == null) {
            if (data.indexOf(probe.returnFalse) != null) return@forEach
            problems += "$label $arch: probe entry not found"
            return@forEach
        }
        if (countOccurrences(data, probe.anchor) != 1) {
            problems += "$label $arch: probe entry is ambiguous"
            return@forEach
        }

        probe.returnFalse.copyInto(data, offset)
        file.writeBytes(data)
    }

    return problems
}

/** Counts [needle] occurrences without the leading-byte filter. */
private fun countOccurrences(data: ByteArray, needle: ByteArray): Int {
    if (needle.isEmpty() || needle.size > data.size) return 0

    var count = 0
    var from = 0
    outer@ while (from <= data.size - needle.size) {
        for (j in needle.indices) {
            if (data[from + j] != needle[j]) {
                from++
                continue@outer
            }
        }
        count++
        from += needle.size
    }
    return count
}
