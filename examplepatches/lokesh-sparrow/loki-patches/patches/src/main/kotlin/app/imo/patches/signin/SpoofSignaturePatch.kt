/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.imo.patches.signin

import app.imo.patches.menu.imoMenuRowPatch
import app.imo.patches.shared.Constants.COMPATIBILITY_IMO
import app.loki.patches.universal.menuFlagPatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import java.security.MessageDigest

/**
 * A patched IMO is signed by us, not by imo.im, and `libanti.so` computes an MD5 of its own signing certificate
 * to notice. When the digest does not match, the app keeps running but stops asking the server to send the phone
 * verification code, so an SMS never arrives and sign-in is impossible.
 *
 * The routine that builds that digest was located in 2026.10.1048 at file offset 0x77980: 156 bytes, taking the
 * destination string in x8 and the certificate context in x0. The replacement keeps the calling convention and
 * the libc++ short-string layout - the first byte carries `size << 1` (0x20 = 16 characters), the 16 bytes of
 * the stock MD5 follow at +1, and a zero byte closes the string at +0x11 - then returns. Nothing else in the
 * library is touched, so the rest of IMO's protection work carries on as before.
 *
 * The library is identified by SHA-256 before anything is written: a different IMO build gets a clear message
 * instead of a half-patched app.
 */
private const val LIBRARY = "libanti.so"
private const val ABI = "arm64-v8a"

/** The stock `libanti.so` of IMO HD 2026.10.1048, arm64-v8a. */
private const val STOCK_SHA256 = "ed9a1ced44c707fc7d6215eacd1f31a7c25ac092949ae844071865927485b8a7"

/** The same library once this patch has run, so patching twice is a no-op. */
private const val PATCHED_SHA256 = "480ccd9a5e240c0eb0db5c3b65bc41563ce45313a04456e8b9a738f4d00d4e66"

/**
 * The first 32 bytes of the digest routine: `sub sp, sp, #0x50` through the move of the two arguments. Unique in
 * the library - the shorter 24 byte prefix appears three times, so the full 32 bytes are required.
 */
private const val PATTERN =
    "ff 43 01 d1 fd 7b 02 a9 f5 1b 00 f9 f4 4f 04 a9 " +
        "fd 83 00 91 55 d0 3b d5 f3 03 08 aa f4 03 00 aa"

/**
 * `adr x9, <digest>` · `mov w10, #0x20` · `strb w10, [x8]` · `ldp x10, x11, [x9]` · `stur x10, [x8, #1]` ·
 * `stur x11, [x8, #9]` · `strb wzr, [x8, #0x11]` · `ret`, followed by the stock certificate MD5
 * (`86 6b 41 99 f7 db 77 4e 43 06 8f 64 c0 fc 37 89`) as the literal the `adr` points at.
 */
private const val REPLACEMENT =
    "09 01 00 10 0a 04 80 52 0a 01 00 39 2a 2d 40 a9 " +
        "0a 11 00 f8 0b 91 00 f8 1f 45 00 39 c0 03 5f d6 " +
        "86 6b 41 99 f7 db 77 4e 43 06 8f 64 c0 fc 37 89"

/**
 * The byte patch itself. Internal and unnamed: every other IMO patch depends on it, because a patched copy that cannot
 * be signed in is of no use whichever patch was ticked.
 */
internal val imoSignaturePatch = rawResourcePatch {
    execute {
        val entries = listApkEntries("lib/").toSet()
        if (entries.none { it.startsWith("lib/$ABI/") }) {
            throw PatchException(
                "This IMO install has no $ABI libraries, and only that architecture is covered so far.",
            )
        }

        val file = get("lib/$ABI/$LIBRARY", copy = false)
        val bytes = file.readBytes()

        when (val hash = bytes.sha256()) {
            PATCHED_SHA256 -> {
                println("Loki Patches: $LIBRARY is already spoofed for $ABI")
                return@execute
            }

            STOCK_SHA256 -> Unit

            else -> throw PatchException(
                "This is not the IMO HD build this patch was written for: lib/$ABI/$LIBRARY has SHA-256 " +
                    "$hash. Patch IMO HD 2026.10.1048.",
            )
        }

        val at = bytes.indexOf(PATTERN.hexToBytes())
        if (at < 0) throw PatchException("The certificate digest routine in lib/$ABI/$LIBRARY was not found.")

        REPLACEMENT.hexToBytes().copyInto(bytes, at)
        file.writeBytes(bytes)
        println("Loki Patches: $LIBRARY now reports the original signer, so phone verification works")
    }
}

/** The patch Manager lists. The work is in [imoSignaturePatch]; this one carries the name and the status flag. */
@Suppress("unused")
val spoofSignaturePatch = bytecodePatch(
    name = "Spoof signature (IMO)",
    description = "Makes IMO believe it is still the original app after patching, so the phone " +
        "verification code is sent again and push notifications keep working. Without it the app runs but " +
        "never receives an SMS.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IMO)
    dependsOn(imoSignaturePatch)
    dependsOn(menuFlagPatch("app.loki.menu.sigspoof"))
    dependsOn(imoMenuRowPatch)
}

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
