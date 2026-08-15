/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.webetu.misc.resto

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.shared.bytecode.hex
import app.morphe.patches.shared.bytecode.hexToBytes
import app.morphe.patches.shared.bytecode.requireByteAt
import app.morphe.patches.shared.bytecode.requireIndexOf
import app.morphe.patches.shared.bytecode.requireOccurrenceCount
import app.morphe.patches.shared.bytecode.replaceFirst
import app.morphe.patches.webetu.shared.WebetuConstants

/**
 * The Resto reservation screen only offers a short date range (3 days).
 * The limit lives in the Hermes bytecode inside `assets/index.android.bundle`
 * (Webetu bundles the JS as Hermes bytecode). Two needles are patched:
 *
 *  1. The date-list generator: `LoadConstUInt8 r1, 3` (the max-days limit)
 *     → `LoadConstUInt8 r1, 40` (30 days + slack).
 *  2. The chip-width formula: the divisor changes the chip width when more
 *     chips are present — keep the formula consistent with 30 days.
 */
@Suppress("unused")
val extendDateRangePatch = rawResourcePatch(
    name = "Enable 30-day Resto reservations",
    description = "Allows reserving Resto meals up to 30 days in advance.",
    default = true,
) {
    compatibleWith(WebetuConstants.COMPATIBILITY_WEBETU)

    execute {
        val bundle = get("assets/index.android.bundle")
        val data = bundle.readBytes()

        // 1) date-list generator needle — the limit byte is 0x03
        val generatorNeedle = """
            07 00 00 00              # NewArray r0, 0
            6e 05 01                 # LoadConstUInt8 r5, 1
            29 04 01                 # GetEnvironment r4, 1
            76 03                    # LoadConstUndefined r3
            73 02 c6 46              # LoadConstString r2, 0x46c6 ("days")
            6e 01 03                 # LoadConstUInt8 r1, 3  <-- limit byte
        """.hexToBytes()
        val generatorReplacement = """
            07 00 00 00              # NewArray r0, 0
            6e 05 01                 # LoadConstUInt8 r5, 1
            29 04 01                 # GetEnvironment r4, 1
            76 03                    # LoadConstUndefined r3
            73 02 c6 46              # LoadConstString r2, 0x46c6 ("days")
            6e 01 28                 # LoadConstUInt8 r1, 40
        """.hexToBytes()

        data.requireOccurrenceCount(generatorNeedle, 1, "Expected exactly one date-list generator needle in index.android.bundle")
        val generatorOffset = data.requireIndexOf(generatorNeedle, "Could not find date-list generator needle in index.android.bundle")
        // the limit byte sits at needle length - 1
        val limitByteOffset = generatorOffset + generatorNeedle.size - 1
        data.requireByteAt(limitByteOffset, 0x03, "Unexpected byte at date-limit offset")

        var patched = data.replaceFirst(generatorNeedle, generatorReplacement)

        // 2) chip-width formula needle — adjust divisor so chips fit 30 days
        val chipWidthNeedle = """
            6e 01 28              # LoadConstUInt8  r1, 40
            1d 03 02 01           # Sub             r3, r2, r1
            2e 01 0d 28           # LoadFromEnv     r1, r13, 40
            36 01 01 03 a6        # GetByIdShort    r1, r1, 3, "length"
            6e 0b 01              # LoadConstUInt8  r11, 1
            1d 01 01 0b           # Sub             r1, r1, r11
            2e 02 0d 28           # LoadFromEnv     r2, r13, 40
            36 02 02 03 a6        # GetByIdShort    r2, r2, 3, "length"
            6e 07 0a              # LoadConstUInt8  r7, 10
            19 01 01 07           # MulN            r1, r1, r7
            1e 01 03 01           # SubN            r1, r3, r1
            1a 08 01 02           # Div             r8, r1, r2
        """.hexToBytes()
        val chipWidthReplacement = """
            6e 01 28              # LoadConstUInt8  r1, 40
            1d 03 02 01           # Sub             r3, r2, r1
            6e 01 03              # LoadConstUInt8  r1, 3
            7a 09 7a 09 7a 09     # LoadConstZero r9 x 3 (padding)
            6e 0b 01              # LoadConstUInt8  r11, 1
            1d 01 01 0b           # Sub             r1, r1, r11
            6e 02 03              # LoadConstUInt8  r2, 3
            7a 09 7a 09 7a 09     # LoadConstZero r9 x 3 (padding)
            6e 07 0a              # LoadConstUInt8  r7, 10
            19 01 01 07           # MulN            r1, r1, r7
            1e 01 03 01           # SubN            r1, r3, r1
            1a 08 01 02           # Div             r8, r1, r2
        """.hexToBytes()

        patched.requireOccurrenceCount(chipWidthNeedle, 1, "Expected exactly one chip-width formula needle in index.android.bundle")
        patched = patched.replaceFirst(chipWidthNeedle, chipWidthReplacement)

        bundle.writeBytes(patched)
    }
}
