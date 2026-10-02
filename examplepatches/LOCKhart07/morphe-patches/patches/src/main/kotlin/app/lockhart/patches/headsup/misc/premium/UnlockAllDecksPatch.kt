/*
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Heads Up! is a Unity IL2CPP title, so deck ownership lives in native code
 * (lib/<abi>/libil2cpp.so) rather than in the dex. Three methods answer the
 * "does the player own this deck?" question and every buy gate funnels through
 * them:
 *
 *                                                   arm64-v8a   armeabi-v7a
 *   HeadsUp.DeckData$$IsBought()                    0x191D030   0xEADDA8
 *       getter over the isDeckBought byte (DeckData + 0x190 / + 0xEC).
 *   HeadsUp.GameData$$IsDeckBought(string)          0x191DB24   0xEAEAC8
 *       lower-cases the id, looks the DeckData up in the dictionary and reads
 *       the same byte.
 *   HeadsUp.Scripts.Data.HeadsUpLocalData$$GetIsBought(string)
 *                                                   0x17EFD60   0xD3EAE4
 *       reads the persisted "<deckId>_bought" entry from the IDataStore.
 *
 * DeckValidator.IsDeckValidToInstall() combines all three with date/version
 * validity checks, so once the three oracles report true the validator's
 * ownership branch passes while its genuine validity checks are left intact.
 *
 * Each stub is rewritten to return true (`mov w0, #1 ; ret` on arm64,
 * `mov r0, #1 ; bx lr` on armv7, which is ARM mode, not Thumb).
 *
 * Verified on com.wb.headsup 4.15.11 (versionCode 4151100). arm64-v8a: exactly
 * 20 bytes change in libil2cpp.so and the app boots and runs. armeabi-v7a:
 * targets derived from a separate Il2CppDumper run on the armv7 split.
 */
package app.lockhart.patches.headsup.misc.premium

import app.lockhart.patches.shared.Constants.COMPATIBILITY_HEADS_UP
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.io.File
import java.io.RandomAccessFile

private const val IL2CPP = "libil2cpp.so"

private fun hex(value: String): ByteArray {
    val digits = value.filterNot(Char::isWhitespace)
    require(digits.length % 2 == 0) { "Hex string needs an even number of digits" }

    return ByteArray(digits.length / 2) { digits.substring(it * 2, it * 2 + 2).toInt(16).toByte() }
}

// mov w0, #1 ; ret
private val ARM64_RETURN_TRUE = hex("20008052 c0035fd6")

// mov r0, #1 ; bx lr
private val ARMV7_RETURN_TRUE = hex("0100a0e3 1eff2fe1")

private class OwnershipStub(val name: String, locator: String, val replacement: ByteArray) {
    val locator = hex(locator)

    init {
        require(replacement.size <= this.locator.size) { "$name: replacement is longer than its locator" }
    }
}

private val ARM64_OWNERSHIP_STUBS = listOf(
    // ldrb w0, [x0, #0x190] ; ret  (trailing `mov w8, #1` from SetAsFree pins the match).
    // Only the ldrb is overwritten; the original ret is kept.
    OwnershipStub(
        name = "DeckData.IsBought",
        locator = "00404639 c0035fd6 28008052",
        replacement = hex("20008052"),
    ),
    // stp x30, x21, [sp, #-0x20]! ; stp x20, x19, [sp, #0x10] ; adrp x21, .. ; ldrb w8, [x21, ..]
    OwnershipStub(
        name = "GameData.IsDeckBought",
        locator = "fe57bea9 f44f01a9 d5f80090 a8724c39",
        replacement = ARM64_RETURN_TRUE,
    ),
    // str x30, [sp, #-0x30]! ; stp x22, x21, [sp, #0x10] ; stp x20, x19, [sp, #0x20] ; adrp x22, ..
    OwnershipStub(
        name = "HeadsUpLocalData.GetIsBought",
        locator = "fe0f1df8 f65701a9 f44f02a9 360201b0",
        replacement = ARM64_RETURN_TRUE,
    ),
)

private val ARMV7_OWNERSHIP_STUBS = listOf(
    // ldrb r0, [r0, #0xec] ; bx lr  (trailing `mov r1, #1` from SetAsFree pins the match).
    // Only the ldrb is overwritten; the original bx lr is kept.
    OwnershipStub(
        name = "DeckData.IsBought",
        locator = "ec00d0e5 1eff2fe1 0110a0e3",
        replacement = hex("0100a0e3"),
    ),
    // push {r4, r5, r6, lr} ; ldr r5, [pc, #0x78] ; mov r4, r0 ; mov r6, r1
    OwnershipStub(
        name = "GameData.IsDeckBought",
        locator = "70402de9 78509fe5 0040a0e1 0160a0e1",
        replacement = ARMV7_RETURN_TRUE,
    ),
    // push {r4, r5, r6, lr} ; ldr r6, [pc, #0xd4] ; mov r4, r0 ; mov r5, r1 ; add r6, pc, r6 ;
    // ldrb r0, [r6] ; cmp r0, #0 ; bne .. ; ldr r0, [pc, #0xbc] ; ldr r0, [pc, r0] ; bl ..
    // The prologue is shared with many methods, so it takes 11 words to be unique.
    OwnershipStub(
        name = "HeadsUpLocalData.GetIsBought",
        locator = "70402de9 d4609fe5 0040a0e1 0150a0e1 06608fe0 0000d6e5 000050e3 0700001a " +
            "bc009fe5 00009fe7 eb81f8eb",
        replacement = ARMV7_RETURN_TRUE,
    ),
)

// Keyed by the ABI directory under lib/.
private val OWNERSHIP_STUBS_BY_ABI = mapOf(
    "arm64-v8a" to ARM64_OWNERSHIP_STUBS,
    "armeabi-v7a" to ARMV7_OWNERSHIP_STUBS,
)

private fun ByteArray.indexOfSequence(sequence: ByteArray, startIndex: Int): Int {
    candidate@ for (start in startIndex..size - sequence.size) {
        for (offset in sequence.indices) {
            if (this[start + offset] != sequence[offset]) continue@candidate
        }

        return start
    }

    return -1
}

private fun File.stubOwnershipChecks(stubs: List<OwnershipStub>) {
    RandomAccessFile(this, "rw").use { library ->
        val bytes = ByteArray(library.length().toInt())
        library.readFully(bytes)

        for (stub in stubs) {
            val index = bytes.indexOfSequence(stub.locator, 0)
            if (index < 0) {
                throw PatchException("Could not find the ${stub.name} ownership check in $name")
            }

            if (bytes.indexOfSequence(stub.locator, index + stub.locator.size) >= 0) {
                throw PatchException("The ${stub.name} pattern matched $name more than once")
            }

            library.seek(index.toLong())
            library.write(stub.replacement)
        }
    }
}

@Suppress("unused")
val unlockAllDecksPatch = resourcePatch(
    name = "Unlock all decks",
    description = "Unlocks every deck without a purchase by forcing the native ownership checks in " +
        "$IL2CPP to report each deck as bought.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HEADS_UP)

    execute {
        val libraries = get("lib").walk().filter { it.name == IL2CPP && it.isFile }.toList()
        if (libraries.isEmpty()) {
            throw PatchException("Could not find $IL2CPP")
        }

        for (library in libraries) {
            val abi = library.parentFile.name
            val stubs = OWNERSHIP_STUBS_BY_ABI[abi]
                ?: throw PatchException("Unsupported ABI $abi for $IL2CPP")

            library.stubOwnershipChecks(stubs)
        }
    }
}
