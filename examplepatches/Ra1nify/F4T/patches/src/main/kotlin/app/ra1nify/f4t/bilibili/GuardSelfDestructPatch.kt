package app.ra1nify.f4t.bilibili

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.ra1nify.f4t.shared.BILIBILI
import java.io.File
import java.security.MessageDigest

private const val LIB_ENTRY = "lib/arm64-v8a/libbiliroamingx.so"

// `mov w0, #0x5e` + `mov w1, wzr`: syscall number 94 (exit_group) with status 0.
private val EXIT_SETUP = hex("c00b8052e1031f2a")

// `nop`.
private val NOP = hex("1f2003d5")

@Suppress("unused")
val guardSelfDestructPatch = rawResourcePatch(
    name = "Bypass",
    default = false,
) {
    compatibleWith(BILIBILI)

    dependsOn(bilibiliAntiResalePatch)

    execute {
        val lib: File = get(LIB_ENTRY)
        if (!lib.isFile) {
            throw PatchException("$LIB_ENTRY is missing from the APK")
        }

        val data = lib.readBytes()
        val sites = findExitSites(data)
        for (at in sites) {
            NOP.copyInto(data, at)
            println("[bi1i] exit_group call nop'd at file offset 0x${at.toString(16)}")
        }
        lib.writeBytes(data)
    }
}

// Offsets of the `blr` instructions that follow each exit_group setup.
private fun findExitSites(data: ByteArray): List<Int> {
    val sites = mutableListOf<Int>()
    var i = 0
    outer@ while (i <= data.size - EXIT_SETUP.size - 4) {
        for (j in EXIT_SETUP.indices) {
            if (data[i + j] != EXIT_SETUP[j]) {
                i++
                continue@outer
            }
        }
        val blrAt = i + EXIT_SETUP.size
        val word = readWord(data, blrAt)
        if ((word and BLR_MASK) != BLR_OPCODE) {
            throw PatchException(
                "exit setup at 0x${i.toString(16)} is not followed by a blr " +
                    "(found 0x${word.toUInt().toString(16)}). " +
                    "Unsupported guard build: $LIB_ENTRY is ${data.size} bytes, " +
                    "sha256=${sha256(data)}. Nothing was patched."
            )
        }
        sites += blrAt
        i += EXIT_SETUP.size + 4
    }

    if (sites.isEmpty()) {
        throw PatchException(
            "no exit_group site found. Unsupported guard build: $LIB_ENTRY is " +
                "${data.size} bytes, sha256=${sha256(data)}. Nothing was patched."
        )
    }
    return sites
}

// BLR Xn.
private const val BLR_OPCODE = 0xD63F0000.toInt()
private const val BLR_MASK = 0xFFFFFC1F.toInt()

private fun readWord(data: ByteArray, at: Int): Int =
    (data[at].toInt() and 0xFF) or
        ((data[at + 1].toInt() and 0xFF) shl 8) or
        ((data[at + 2].toInt() and 0xFF) shl 16) or
        ((data[at + 3].toInt() and 0xFF) shl 24)

private fun sha256(data: ByteArray): String =
    MessageDigest.getInstance("SHA-256").digest(data).joinToString("") { "%02x".format(it) }

private fun hex(value: String): ByteArray {
    require(value.length % 2 == 0) { "hex string must have an even length" }
    return ByteArray(value.length / 2) { index ->
        value.substring(index * 2, index * 2 + 2).toInt(16).toByte()
    }
}
