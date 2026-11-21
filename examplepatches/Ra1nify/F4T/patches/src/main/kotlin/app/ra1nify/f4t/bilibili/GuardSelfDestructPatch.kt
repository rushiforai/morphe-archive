package app.ra1nify.f4t.bilibili

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.ra1nify.f4t.shared.BILIBILI
import java.io.File
import java.security.MessageDigest

private const val LIB_ENTRY = "lib/arm64-v8a/libbiliroamingx.so"

private val SITE_A = hex("08a12d9108fddfc8a9035af81f0109ebc8f185520869a67288c2881a")

private val SITE_B = hex("08b545f9a9035af81f0109eb884e8e52a82abc7208c19a1a")

private val REPLACEMENT_A = hex("e803142a")

private val REPLACEMENT_B = hex("e8031a2a")

@Suppress("unused")
val guardSelfDestructPatch = rawResourcePatch(
    name = "Bypass",
    default = false,
) {
    compatibleWith(BILIBILI)

    // The anti-resale notice is not optional, so every host patch pulls it in. A patch is executed
    // once per object, so selecting several host patches still installs a single notice call.
    dependsOn(bilibiliAntiResalePatch)

    execute {
        val lib: File = get(LIB_ENTRY)
        if (!lib.isFile) {
            throw PatchException("$LIB_ENTRY is missing from the APK")
        }

        val original = lib.readBytes()
        val patched = patchSite(original, SITE_A, REPLACEMENT_A, "countdown check A (0x32b68 read)")
        val done = patchSite(patched, SITE_B, REPLACEMENT_B, "countdown check B (0x32b68 ldr)")
        lib.writeBytes(done)

        println("[bi1i] guard self-destruct disabled (2 countdown checks neutralised)")
    }
}

private fun patchSite(
    data: ByteArray,
    context: ByteArray,
    replacement: ByteArray,
    label: String,
): ByteArray {
    require(replacement.size == 4) { "replacement must be one instruction" }

    val hits = mutableListOf<Int>()
    var i = 0
    outer@ while (i <= data.size - context.size) {
        for (j in context.indices) {
            if (data[i + j] != context[j]) {
                i++
                continue@outer
            }
        }
        hits += i
        i += context.size
    }

    if (hits.size != 1) {
        throw PatchException(
            "expected exactly 1 match for $label, found ${hits.size}. " +
                "Unsupported guard build: $LIB_ENTRY is ${data.size} bytes, " +
                "sha256=${sha256(data)}. Nothing was patched."
        )
    }

    val at = hits[0] + context.size - replacement.size
    println("[bi1i] $label matched at file offset 0x${at.toString(16)}")
    replacement.copyInto(data, at)
    return data
}

private fun sha256(data: ByteArray): String =
    MessageDigest.getInstance("SHA-256").digest(data).joinToString("") { "%02x".format(it) }

private fun hex(value: String): ByteArray {
    require(value.length % 2 == 0) { "hex string must have an even length" }
    return ByteArray(value.length / 2) { index ->
        value.substring(index * 2, index * 2 + 2).toInt(16).toByte()
    }
}
