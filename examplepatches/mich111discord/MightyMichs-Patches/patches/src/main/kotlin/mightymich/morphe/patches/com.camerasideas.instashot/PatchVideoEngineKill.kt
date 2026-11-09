package mightymich.morphe.patches.com.camerasideas.instashot

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

private fun bytesOf(vararg values: Int): ByteArray =
    ByteArray(values.size) { values[it].toByte() }

/**
 * One binary rewrite rule: find [pattern] (or any of [patterns]), then overwrite
 * [patchOffset] bytes from the match start with [patchBytes].
 */
private data class NativeKillSite(
    val abiFolder: String,
    val patterns: List<ByteArray>,
    val patchOffset: Int,
    val patchBytes: ByteArray,
    val description: String,
)

// arm64: mov w1, #9  => 21 01 80 52  (SIGKILL for kill/tgkill)
// Followed by bl / blr to libc kill — NOP that call (1f 20 03 d5).
private val arm64MovW1Imm9 = bytesOf(0x21, 0x01, 0x80, 0x52)

// Legacy 2.214.x fingerprint (full window ending at the kill bl).
private val arm64Legacy214 = bytesOf(
    0x54, 0x00, 0x00, 0x36,
    0x80, 0x00, 0x00, 0x37,
    0xb3, 0x27, 0x01, 0x94,
    0x21, 0x01, 0x80, 0x52,
    0xb5, 0x27, 0x01, 0x94,
)

// armeabi-v7a legacy 2.214.x
private val armv7Legacy214 = bytesOf(
    0x28, 0x46,
    0x21, 0x46,
    0x01, 0xf0, 0x21, 0xf9,
    0x00, 0x2e,
    0x18, 0xbf,
    0x00, 0x28,
    0x04, 0xd1,
    0x32, 0xf0, 0xfa, 0xeb,
    0x09, 0x21,
    0x32, 0xf0, 0xfe, 0xeb,
)

private val killSites = listOf(
    NativeKillSite(
        abiFolder = "arm64-v8a",
        patterns = listOf(arm64Legacy214, arm64MovW1Imm9),
        // For legacy window, NOP is at byte 16 (the final bl).
        // For bare mov-w1-#9, we NOP the following bl at +4 when it looks like bl.
        patchOffset = 16,
        patchBytes = bytesOf(0x1f, 0x20, 0x03, 0xd5),
        description = "arm64 kill/SIGKILL",
    ),
    NativeKillSite(
        abiFolder = "armeabi-v7a",
        patterns = listOf(armv7Legacy214),
        patchOffset = 14,
        patchBytes = bytesOf(0x04, 0xe0),
        description = "armv7 kill branch",
    ),
)

@Suppress("unused")
val patchVideoEngineKillPatch = rawResourcePatch(
    name = "Fix video engine on re-sign",
    description = "Stops libisvideoengine.so from terminating the process after the APK " +
        "is re-signed. Supports arm64-v8a / armeabi-v7a; patterns cover 2.214.x and " +
        "newer builds that still issue kill(pid, 9).",
    default = true,
) {
    compatibleWith(InShotCompatibility.INSHOT)

    execute {
        var changed = false
        var sawLibrary = false
        val notes = mutableListOf<String>()

        for (site in killSites) {
            val path = "lib/${site.abiFolder}/libisvideoengine.so"
            val file = get(path)
            if (!file.exists()) {
                notes += "$path: missing"
                continue
            }
            sawLibrary = true
            val data = file.readBytes()

            var applied = false

            // 1) Exact multi-byte windows (legacy)
            for (pattern in site.patterns) {
                if (pattern.contentEquals(arm64MovW1Imm9)) continue
                val at = data.indexOfAll(pattern)
                if (at.size == 1) {
                    site.patchBytes.copyInto(data, at[0] + site.patchOffset)
                    file.writeBytes(data)
                    changed = true
                    applied = true
                    notes += "$path: patched via legacy window"
                    break
                }
                if (at.size > 1) {
                    notes += "$path: legacy pattern matched ${at.size} times — skipped"
                }
            }
            if (applied) continue

            // 2) arm64 heuristic: every "mov w1, #9" followed within 12 bytes by a BL
            //    (top 6 bits 100101 => opcode byte & 0xfc == 0x94). NOP that BL.
            if (site.abiFolder == "arm64-v8a") {
                val hits = data.indexOfAll(arm64MovW1Imm9)
                var nops = 0
                for (at in hits) {
                    // scan next 3 instructions (12 bytes) for BL imm
                    var foundBl = -1
                    var off = at + 4
                    while (off <= at + 12 && off + 3 < data.size) {
                        val b0 = data[off].toInt() and 0xff
                        // BL: 100101xx xxxxxxxx ...
                        if ((b0 and 0xfc) == 0x94) {
                            foundBl = off
                            break
                        }
                        // BLR Xn: denser encoding — 0xd63f00xx family
                        val w = ((data[off].toInt() and 0xff)) or
                            ((data[off + 1].toInt() and 0xff) shl 8) or
                            ((data[off + 2].toInt() and 0xff) shl 16) or
                            ((data[off + 3].toInt() and 0xff) shl 24)
                        // blr: 1101011 0 0 01 11111 0000 0 Rn 00000 → 0xD63F0xxx
                        if ((w and 0xFFFFFC1F.toInt()) == 0xD63F0000.toInt()) {
                            foundBl = off
                            break
                        }
                        off += 4
                    }
                    if (foundBl >= 0) {
                        // NOP
                        data[foundBl] = 0x1f.toByte()
                        data[foundBl + 1] = 0x20.toByte()
                        data[foundBl + 2] = 0x03.toByte()
                        data[foundBl + 3] = 0xd5.toByte()
                        nops++
                    }
                }
                if (nops > 0) {
                    file.writeBytes(data)
                    changed = true
                    applied = true
                    notes += "$path: NOP'd $nops BL/BLR after mov w1,#9"
                } else {
                    notes += "$path: no mov-w1-#9 + BL site found"
                }
            }

            // 3) armv7 heuristic: movs/mov r1, #9 (01 22 or 09 21) near blx
            if (!applied && site.abiFolder == "armeabi-v7a") {
                // Prefer unique legacy; if absent, soft-skip rather than risky mass patch
                notes += "$path: no known armv7 window matched"
            }
        }

        if (!sawLibrary) {
            throw PatchException(
                "libisvideoengine.so is missing for every supported ABI. " +
                    "Use a multi-arch / universal InShot APK instead of a stripped split. " +
                    notes.joinToString("; "),
            )
        }

        if (!changed) {
            // Soft success: library present but no known kill window. Newer engines may
            // have dropped the abort-on-bad-signature path; Pro unlock still applies.
            return@execute
        }
    }
}

private fun ByteArray.indexOfAll(needle: ByteArray): List<Int> {
    if (needle.isEmpty() || size < needle.size) return emptyList()
    val out = mutableListOf<Int>()
    val limit = size - needle.size
    outer@ for (i in 0..limit) {
        for (j in needle.indices) {
            if (this[i + j] != needle[j]) continue@outer
        }
        out += i
    }
    return out
}
