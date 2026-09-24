/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.sslpinning

import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patcher.patch.resourcePatch

/** Disables certificate validation checks. */
@Suppress("unused")
val disableSslPinningPatch = resourcePatch(
    name = "Disable SSL Pinning",
    description = "Improves compatibility with custom certificates.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)

    execute {
        // 24-byte prologue of PublicKeyPinningClient::_validateSpki, unique in
        // the v1.5.15 arm64 libapp.so (Dart 3.11.4 AOT).
        val anchor = byteArrayOf(
            0xFD.toByte(), 0x79.toByte(), 0xBF.toByte(), 0xA9.toByte(),
            0xFD.toByte(), 0x03.toByte(), 0x0F.toByte(), 0xAA.toByte(),
            0xEF.toByte(), 0x01.toByte(), 0x04.toByte(), 0xD1.toByte(),
            0xE0.toByte(), 0x03.toByte(), 0x01.toByte(), 0xAA.toByte(),
            0xA1.toByte(), 0x03.toByte(), 0x16.toByte(), 0xF8.toByte(),
            0xA2.toByte(), 0x83.toByte(), 0x15.toByte(), 0xF8.toByte(),
        )
        // add x0, x22, #0x20 (Dart `true`); ret
        val patch = byteArrayOf(
            0xC0.toByte(), 0x82.toByte(), 0x00.toByte(), 0x91.toByte(),
            0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte(),
        )

        var patchedFiles = 0
        listOf("arm64-v8a", "armeabi-v7a", "x86_64").forEach { arch ->
            val lib = get("lib/$arch/libapp.so")
            if (!lib.isFile) return@forEach

            val data = lib.readBytes()
            val offset = indexOf(data, anchor)
            if (offset < 0) return@forEach

            patch.copyInto(data, offset)
            lib.writeBytes(data)
            patchedFiles++
        }

        check(patchedFiles > 0) {
            "Disable SSL pinning: _validateSpki anchor not found in any libapp.so; " +
                    "the app version likely changed the Dart AOT layout."
        }
    }
}

private fun indexOf(data: ByteArray, pattern: ByteArray): Int {
    outer@ for (i in 0..data.size - pattern.size) {
        for (j in pattern.indices) {
            if (data[i + j] != pattern[j]) continue@outer
        }
        return i
    }
    return -1
}
