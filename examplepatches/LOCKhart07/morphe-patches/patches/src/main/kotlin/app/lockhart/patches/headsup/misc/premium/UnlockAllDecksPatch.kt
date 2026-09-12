/*
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Heads Up! is a Unity IL2CPP title, so deck ownership lives in native code
 * (arm64-v8a/libil2cpp.so) rather than in the dex. Three methods answer the
 * "does the player own this deck?" question and every buy gate funnels through
 * them:
 *
 *   HeadsUp.DeckData$$IsBought()                    RVA 0x191D030
 *       getter over the isDeckBought byte at DeckData + 0x190.
 *   HeadsUp.GameData$$IsDeckBought(string)          RVA 0x191DB24
 *       lower-cases the id, looks the DeckData up in the dictionary and reads
 *       the same +0x190 byte.
 *   HeadsUp.Scripts.Data.HeadsUpLocalData$$GetIsBought(string)  RVA 0x17EFD60
 *       reads the persisted "<deckId>_bought" entry from the IDataStore.
 *
 * DeckValidator.IsDeckValidToInstall() combines all three with date/version
 * validity checks, so once the three oracles report true the validator's
 * ownership branch passes while its genuine validity checks are left intact.
 *
 * Each stub is rewritten to `mov w0, #1 ; ret`.
 *
 * Verified on com.wb.headsup 4.15.11 (versionCode 4151100), arm64-v8a:
 * exactly 20 bytes change in libil2cpp.so and the app boots and runs.
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
private val RETURN_TRUE = hex("20008052 c0035fd6")

private class OwnershipStub(val name: String, locator: String, val replacement: ByteArray) {
    val locator = hex(locator)

    init {
        require(replacement.size <= this.locator.size) { "$name: replacement is longer than its locator" }
    }
}

private val OWNERSHIP_STUBS = listOf(
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
        replacement = RETURN_TRUE,
    ),
    // str x30, [sp, #-0x30]! ; stp x22, x21, [sp, #0x10] ; stp x20, x19, [sp, #0x20] ; adrp x22, ..
    OwnershipStub(
        name = "HeadsUpLocalData.GetIsBought",
        locator = "fe0f1df8 f65701a9 f44f02a9 360201b0",
        replacement = RETURN_TRUE,
    ),
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
            library.stubOwnershipChecks(OWNERSHIP_STUBS)
        }
    }
}
