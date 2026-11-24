/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.sslpinning

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patches.myooredoo.shared.presentOoredooArchitectures
import app.morphe.patches.shared.bytecode.indexOf

/**
 * A raw code window plus the same-length replacement written over it.
 */
private class SpkiAnchor(
    val anchor: ByteArray,
    /** Offset from the start of [anchor] at which [patch] is written. */
    val patchOffset: Int,
    val patch: ByteArray,
) {
    /** Expected byte sequence after [patch] has been applied, for idempotent re-patching. */
    val patchedAnchor: ByteArray
        get() = anchor.copyOf(maxOf(anchor.size, patchOffset + patch.size)).also {
            patch.copyInto(it, patchOffset)
        }
}

/**
 * `PublicKeyPinningClient._validateSpki` starts with a 0x100-byte frame, spills
 * its two arguments, then loads the fast-path return value and returns.
 * Overwriting the second spill with "return that fast-path value" makes the
 * entire SPKI comparison body unreachable.
 */
private val ANCHORS = mapOf(
    "arm64-v8a" to SpkiAnchor(
        // STP X29, X30, [X15, #-16]! / MOV X29, X15 / SUB X15, X15, #0x100 /
        // MOV X0, X1 / STUR X1, [X29, #-160] / STUR X2, [X29, #-168]
        anchor = byteArrayOf(
            0xFD.toByte(), 0x79.toByte(), 0xBF.toByte(), 0xA9.toByte(),
            0xFD.toByte(), 0x03.toByte(), 0x0F.toByte(), 0xAA.toByte(),
            0xEF.toByte(), 0x01.toByte(), 0x04.toByte(), 0xD1.toByte(),
            0xE0.toByte(), 0x03.toByte(), 0x01.toByte(), 0xAA.toByte(),
            0xA1.toByte(), 0x03.toByte(), 0x16.toByte(), 0xF8.toByte(),
            0xA2.toByte(), 0x83.toByte(), 0x15.toByte(), 0xF8.toByte(),
        ),
        patchOffset = 20,
        // add x0, x22, #0x20 ; ret
        patch = byteArrayOf(
            0xC0.toByte(), 0x82.toByte(), 0x00.toByte(), 0x91.toByte(),
            0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte(),
        ),
    ),
    "x86_64" to SpkiAnchor(
        // PUSH RBP / MOV RBP, RSP / SUB RSP, 0x100 / MOV RAX, RDI / MOV [RBP-0xA0], RDI
        anchor = byteArrayOf(
            0x55.toByte(),
            0x48.toByte(), 0x89.toByte(), 0xE5.toByte(),
            0x48.toByte(), 0x81.toByte(), 0xEC.toByte(),
            0x00.toByte(), 0x01.toByte(), 0x00.toByte(), 0x00.toByte(),
            0x48.toByte(), 0x89.toByte(), 0xF8.toByte(),
            0x48.toByte(), 0x89.toByte(), 0xBD.toByte(),
            0x60.toByte(), 0xFF.toByte(), 0xFF.toByte(), 0xFF.toByte(),
        ),
        patchOffset = 21,
        // mov rax, [r14 + 0x98] ; ret
        patch = byteArrayOf(
            0x4D.toByte(), 0x8B.toByte(), 0xB6.toByte(), 0x98.toByte(),
            0xC3.toByte(),
        ),
    ),
)

/** Disables certificate validation checks. */
@Suppress("unused")
val disableSslPinningPatch = patch(
    name = "Disable SSL Pinning",
    description = "Makes the Dart SPKI validator return its own success value, so the " +
            "app's public key pinning no longer rejects intercepted TLS connections. " +
            "Covers arm64-v8a and x86_64; armeabi-v7a keeps pinning.",
    default = true,
) {
    category("Security")
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)
    availability { _, arch ->
        when (arch) {
            ApkArchitecture.ARM64_V8A, ApkArchitecture.X86_64, ApkArchitecture.UNIVERSAL ->
                PatchAvailability.ENABLED
            else -> PatchAvailability.UNAVAILABLE
        }
    }

    execute {
        val patched = mutableListOf<String>()

        presentOoredooArchitectures().forEach { arch ->
            val spec = ANCHORS[arch] ?: return@forEach
            val lib = resourceFile("lib/$arch/libapp.so")
            if (!lib.isFile) return@forEach

            val data = lib.readBytes()
            val anchorAt = data.indexOf(spec.anchor)
            if (anchorAt != null) {
                val patchAt = anchorAt + spec.patchOffset
                require(patchAt + spec.patch.size <= data.size) {
                    "Disable SSL pinning: $arch anchor matched too close to the end of libapp.so"
                }
                spec.patch.copyInto(data, patchAt)
                lib.writeBytes(data)
                patched += arch
            } else if (data.indexOf(spec.patchedAnchor) != null) {
                patched += arch
            }
        }

        check(patched.isNotEmpty()) {
            "Disable SSL pinning: _validateSpki was not found in any supported ABI " +
                    "(${ANCHORS.keys.joinToString()}); the app version likely changed " +
                    "the Dart AOT layout."
        }
    }
}
