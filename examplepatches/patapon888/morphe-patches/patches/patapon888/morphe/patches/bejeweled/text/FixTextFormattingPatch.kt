package patapon888.morphe.patches.bejeweled.text

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.bejeweled.BEJEWELED_3
import patapon888.morphe.patches.bejeweled.native.InstructionEdit
import patapon888.morphe.patches.bejeweled.native.arm64OnlyPatch
import patapon888.morphe.patches.bejeweled.native.patchGameLibrary

/**
 * xprintf::CVaList::Advance(size) steps one 8-byte argument slot for every 4 bytes of size, as on 32-bit.
 * A pointer argument (%s) then skips the next argument, so texts with several %s show the wrong
 * strings or "(null)", like the badge title "Badge Frénésie finale(null)" instead of its level.
 * It now steps (size + 4) / 8 slots.
 */
@Suppress("unused")
val fixTextFormattingPatch = resourcePatch(
    name = "Fix text formatting",
    description = "Fixes texts that skip a word or show \"(null)\", such as the title of a won badge. " +
        "Only the arm64-v8a library is kept."
) {
    compatibleWith(BEJEWELED_3)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                InstructionEdit(0x196f8b4, 0xb90017e1.toInt(), 0x11001029), // str w1, [sp, #20] -> add w9, w1, #4
                InstructionEdit(0x196f8b8, 0xf9400fe8.toInt(), 0xb90017e9.toInt()), // ldr x8, [sp, #24] -> str w9, [sp, #20]
                InstructionEdit(0x196f8bc, 0xf90007e8.toInt(), 0xf90007e0.toInt()), // str x8, [sp, #8] -> str x0, [sp, #8]
                InstructionEdit(0x196f8c0, 0x39408108, 0x39408008), // ldrb w8, [x8, #32] -> ldrb w8, [x0, #32]
                InstructionEdit(0x196f8dc, 0x6b890908, 0x6b890d08), // subs ..., w9, asr #2 -> asr #3
            )
        )
    }
}
