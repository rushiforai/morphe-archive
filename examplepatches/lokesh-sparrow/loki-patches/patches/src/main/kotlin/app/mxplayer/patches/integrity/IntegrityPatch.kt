/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.mxplayer.patches.integrity

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

/**
 * MX Player Pro reads its own APK signature from `libmx-bh.so` at start and aborts the process when it does not
 * match MX's certificate, which is always the case for a patched copy: logcat shows
 * `Abort message: 'terminating'` and the app dies before the first screen. The routine that does it has one entry
 * in each architecture's library, so returning from it immediately leaves the rest of the library - the whitebox
 * key setup that playback needs - untouched.
 *
 * Each library is identified by its SHA-256 before anything is written: a different MX build gets a clear message
 * instead of a half-patched app.
 */
private const val LIBRARY = "libmx-bh.so"

private class Target(
    /** The stock library of MX Player Pro 1.93.4, as the app ships it. */
    val stockSha256: String,
    /** The same library once this patch has run, so patching twice is a no-op. */
    val patchedSha256: String,
    /** First bytes of the routine, unique in the library. */
    val pattern: String,
    /** Instruction that makes the routine return at once: `ret` on arm64, `bx lr` on armv7. */
    val replacement: String,
)

private val TARGETS = mapOf(
    "arm64-v8a" to Target(
        stockSha256 = "9ac4c0ffc83236b21edc16a4a37265b1d8ae28673701173cabd338eaa6d960a8",
        patchedSha256 = "f76fb6ef20230830860b91e5f8abf5b33c36fa6721367f10cf43049dffbfa5b0",
        pattern = "fd 7b ba a9 fc 6f 01 a9 fa 67 02 a9 f8 5f 03 a9 f6 57 04 a9 f4 4f 05 a9 " +
            "fd 03 00 91 ff c3 06 d1 f3 03 00 aa dd f8 ff 97 e0 0f 00 f9 dc 01 00 f0",
        replacement = "c0 03 5f d6",
    ),
    "armeabi-v7a" to Target(
        stockSha256 = "4e7927fbf883a9cafd57379e2f504435ca2d25b7b71df3c1ef857cc27b2d98ff",
        patchedSha256 = "c1f4d84f77e900843894da3f3ccd74607258e6b9da05713dd73baef33a344b60",
        pattern = "f0 4f 2d e9 1c b0 8d e2 04 d0 4d e2 04 8b 2d ed 01 dc 4d e2 1c 00 8d e5 " +
            "b7 f8 ff eb 14 00 8d e5",
        replacement = "1e ff 2f e1",
    ),
)

private fun String.hexToBytes(): ByteArray {
    val clean = filterNot { it.isWhitespace() }
    return ByteArray(clean.length / 2) { clean.substring(it * 2, it * 2 + 2).toInt(16).toByte() }
}

private fun ByteArray.sha256(): String =
    MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it.toInt() and 0xff) }

/** Index of [needle] in this array, or -1. */
private fun ByteArray.indexOf(needle: ByteArray): Int {
    if (needle.isEmpty() || size < needle.size) return -1
    val last = size - needle.size
    outer@ for (i in 0..last) {
        for (j in needle.indices) {
            if (this[i + j] != needle[j]) continue@outer
        }
        return i
    }
    return -1
}

/**
 * Lets a patched copy start at all. Internal: without it every other patch on MX Player Pro produces an app that
 * closes itself on launch, so it is not something a user can leave out.
 */
internal val integrityPatch = rawResourcePatch {
    execute {
        val entries = listApkEntries("lib/").toSet()
        val abis = entries.mapNotNull { entry ->
            val parts = entry.split('/')
            if (parts.size == 3 && parts[0] == "lib" && parts[2] == LIBRARY) parts[1] else null
        }
        if (abis.isEmpty()) throw PatchException("This APK has no $LIBRARY to examine.")

        for (abi in abis.sorted()) {
            val target = TARGETS[abi]
                ?: throw PatchException("MX Player Pro's $LIBRARY for $abi is not a build this patch knows.")
            val file = get("lib/$abi/$LIBRARY", copy = false)
            val bytes = file.readBytes()
            val hash = bytes.sha256()
            if (hash == target.patchedSha256) {
                println("Loki Patches: $LIBRARY for $abi is already patched")
                continue
            }
            if (hash != target.stockSha256) {
                throw PatchException(
                    "This is not the MX Player Pro build these patches were written for: lib/$abi/$LIBRARY has " +
                        "SHA-256 $hash. Patch MX Player Pro 1.93.4 (2001002584).",
                )
            }
            val pattern = target.pattern.hexToBytes()
            val at = bytes.indexOf(pattern)
            if (at < 0) throw PatchException("The start of the check in lib/$abi/$LIBRARY was not found.")
            val replacement = target.replacement.hexToBytes()
            replacement.copyInto(bytes, at)
            file.writeBytes(bytes)
            println("Loki Patches: $LIBRARY for $abi no longer refuses a patched install")
        }
    }
}
