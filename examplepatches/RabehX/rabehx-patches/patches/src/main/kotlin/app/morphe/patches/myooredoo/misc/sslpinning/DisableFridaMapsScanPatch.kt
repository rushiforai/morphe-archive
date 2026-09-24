/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.sslpinning

import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patcher.patch.resourcePatch

/** Disables environment detection checks. */
@Suppress("unused")
val disableFridaDetectionPatch = resourcePatch(
    name = "Disable Frida Detection",
    description = "Improves compatibility with debugging tools.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)

    execute {
        val needles = mapOf(
            0x27c134 to ("frida" to "ZZZZZ"),
            2330052 to ("gum-js-loop" to "ZZZZZZZZZZZ"),
            2331023 to ("gum_" to "ZZZZ"),
        )

        var patchedFiles = 0
        listOf("arm64-v8a", "armeabi-v7a", "x86_64").forEach { arch ->
            val lib = get("lib/$arch/libapp.so")
            if (!lib.isFile) return@forEach

            val data = lib.readBytes()
            var touched = false
            needles.forEach { (offset, pair) ->
                val (old, new) = pair
                val oldBytes = old.toByteArray(Charsets.US_ASCII)
                require(new.length == old.length) { "needle replacement must keep length" }
                if (data.copyOfRange(offset, offset + oldBytes.size).contentEquals(oldBytes)) {
                    new.toByteArray(Charsets.US_ASCII).copyInto(data, offset)
                    touched = true
                }
            }
            if (touched) {
                lib.writeBytes(data)
                patchedFiles++
            }
        }

        check(patchedFiles > 0) {
            "Disable Frida maps scan: needles not found in any libapp.so; " +
                    "the app version likely changed the Dart AOT layout."
        }
    }
}
