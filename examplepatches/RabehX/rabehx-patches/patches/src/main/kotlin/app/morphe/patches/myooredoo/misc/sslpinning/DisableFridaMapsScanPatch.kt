/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.sslpinning

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patches.myooredoo.shared.CHECK_FRIDA_BY_PORT
import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patches.myooredoo.shared.neutraliseNativeProbes
import app.morphe.patches.myooredoo.shared.presentOoredooArchitectures
import app.morphe.patches.shared.bytecode.indexOf
import app.morphe.patches.shared.bytecode.indexOfAll

private val FRIDA = "frida".toByteArray(Charsets.US_ASCII)

/**
 * Dart string-pool literals that `FridaDetector::isFridaPresent` passes to
 * `String::contains` over the contents of `/proc/self/maps`.
 */
private val DART_LITERALS = listOf(
    "gum-js-loop" to "ZZZZZZZZZZZ",
    "gum_" to "ZZZZ",
)

/**
 * `libvdomain.so` keeps its own markers as NUL-terminated C strings, separate
 * from the Dart pool.
 */
private val NATIVE_LITERAL = "\u0000frida\u0000".toByteArray(Charsets.US_ASCII)
private val NATIVE_PATCHED = "\u0000ZZZZZ\u0000".toByteArray(Charsets.US_ASCII)

/** Disables environment detection checks. */
@Suppress("unused")
val disableFridaDetectionPatch = patch(
    name = "Disable Frida Detection",
    description = "Improves compatibility with debugging tools. Covers the Dart maps scan, " +
            "the VdoCipher native marker and the rjsniffer port scanner.",
    default = true,
) {
    category("Security")
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)

    execute {
        val problems = mutableListOf<String>()
        val presentAbis = presentOoredooArchitectures()

        fun patchLibrary(arch: String, path: String, transform: (ByteArray) -> Result<ByteArray>) {
            val file = resourceFile("lib/$arch/$path")
            if (!file.isFile) {
                problems += "$arch/$path: library missing"
                return
            }

            transform(file.readBytes()).fold(
                onSuccess = { file.writeBytes(it) },
                onFailure = { problems += "$arch/$path: ${it.message}" },
            )
        }

        presentAbis.forEach { arch ->
            patchLibrary(arch, "libapp.so", ::neutraliseDartLayer)
            patchLibrary(arch, "libvdomain.so", ::neutraliseNativeLayer)
        }

        problems += neutraliseNativeProbes(
            probes = CHECK_FRIDA_BY_PORT,
            label = "checkFridaByPort",
        )

        if (presentAbis.isEmpty() && problems.isEmpty()) {
            problems += "No supported ABI found under lib/"
        }

        check(problems.isEmpty()) {
            "Disable Frida detection: expected needles not found; the app version " +
                    "likely changed the Dart AOT layout. Nothing was silently skipped.\n" +
                    problems.joinToString("\n") { "  - $it" }
        }
    }
}

/** Neutralises the three literals the Dart detector compares `/proc/self/maps` against. */
private fun neutraliseDartLayer(data: ByteArray): Result<ByteArray> = runCatching {
    val edits = mutableListOf<Pair<Int, ByteArray>>()

    val frida = data.standaloneFridaOffsets()
    if (frida.isNotEmpty()) {
        require(frida.size == 1) {
            "expected 1 standalone \"frida\" literal, found ${frida.size}"
        }
        edits += frida.single() to zed(FRIDA.size)
    } else {
        // Only treat as already patched if an exact 5-byte ZZZZZ entry exists (not a longer Z run).
        val alreadyPatched = data.standaloneZedOffsets(FRIDA.size).isNotEmpty()
        require(alreadyPatched) {
            "expected 1 standalone \"frida\" literal, found 0"
        }
    }

    for ((needle, replacement) in DART_LITERALS) {
        val offsets = data.indexOfAll(needle.toByteArray(Charsets.US_ASCII))
        if (offsets.isEmpty()) {
            val alreadyPatched = data.indexOf(replacement.toByteArray(Charsets.US_ASCII)) != null
            if (alreadyPatched) continue
        }
        require(offsets.size == 1) {
            "expected 1 \"$needle\" literal, found ${offsets.size}"
        }
        edits += offsets.single() to replacement.toByteArray(Charsets.US_ASCII)
    }

    if (edits.isEmpty()) return@runCatching data

    val patched = data.copyOf()
    edits.forEach { (offset, replacement) -> replacement.copyInto(patched, offset) }
    patched
}

/** Neutralises the `frida` marker in the native detection library. */
private fun neutraliseNativeLayer(data: ByteArray): Result<ByteArray> = runCatching {
    val offsets = data.indexOfAll(NATIVE_LITERAL)
    if (offsets.isEmpty()) {
        if (data.indexOf(NATIVE_PATCHED) != null) return@runCatching data
    }
    require(offsets.size == 1) {
        "expected 1 NUL-delimited \"frida\" string, found ${offsets.size}"
    }

    val patched = data.copyOf()
    zed(FRIDA.size).copyInto(patched, offsets.single() + 1)
    patched
}

private fun ByteArray.standaloneFridaOffsets(): List<Int> {
    val underscore = '_'.code.toByte()
    val lowercaseY = 'y'.code.toByte()

    return indexOfAll(FRIDA).filter { offset ->
        getOrNull(offset - 1) != underscore &&
                getOrNull(offset + FRIDA.size) != lowercaseY &&
                getOrNull(offset + FRIDA.size) != underscore
    }
}

private fun ByteArray.standaloneZedOffsets(length: Int): List<Int> {
    val z = 'Z'.code.toByte()
    return indexOfAll(zed(length)).filter { offset ->
        getOrNull(offset - 1) != z && getOrNull(offset + length) != z
    }
}

/** Build a same-length filler so in-place rewrites never shift the binary. */
private fun zed(length: Int): ByteArray = ByteArray(length) { 'Z'.code.toByte() }
