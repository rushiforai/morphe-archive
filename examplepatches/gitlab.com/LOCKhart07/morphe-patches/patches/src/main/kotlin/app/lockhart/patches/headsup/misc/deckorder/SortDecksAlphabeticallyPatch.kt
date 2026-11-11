/*
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * My Decks is built by HeadsUp.Scripts.Utils.OwnedDecksManager::InitDecksList, which orders
 * every deck with OrderByDescending(<InitDecksList>b__N), a lambda returning
 * HeadsUpLocalData.GetLastActionTime(deckId): the later of purchase and last play. Decks never
 * bought or played all score 0 and keep the server catalog's order, so related decks end up
 * far apart.
 *
 * The lambda is rewritten in place to return a key made from the first eight characters after
 * "com.wb.Ellen.HeadsUp.Deck." in the deck id (all 323 ids share that prefix), lower-cased,
 * first character most significant and negated, so the descending sort comes out A to Z. A
 * double holds about seven of those characters; decks that tie keep the catalog order, which
 * still keeps a series such as ActItOut* together.
 *
 * arm64: the eight UTF-16 characters are narrowed to bytes, byte-reversed and converted with
 * ucvtf. armv7 (softfp, result in r0:r1) has no 64-bit integer conversion, so the double is
 * built directly: sign set, exponent 0x3FF and the packed characters as the mantissa, which
 * orders the same way.
 *
 * Verified on com.wb.headsup 4.15.13 (versionCode 4151300) and 4.15.14 (versionCode 4151400),
 * arm64-v8a and armeabi-v7a.
 */
package app.lockhart.patches.headsup.misc.deckorder

import app.lockhart.patches.shared.Constants.COMPATIBILITY_HEADS_UP
import app.lockhart.patches.shared.il2cpp.Il2CppLibrary
import app.lockhart.patches.shared.il2cpp.Il2CppMetadata
import app.lockhart.patches.shared.il2cpp.Il2CppMethod
import app.lockhart.patches.shared.il2cpp.MISSING_IL2CPP_MESSAGE
import app.lockhart.patches.shared.il2cpp.arm64BranchTarget
import app.lockhart.patches.shared.il2cpp.armBranchTarget
import app.lockhart.patches.shared.il2cpp.resolve
import app.lockhart.patches.shared.il2cpp.words
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.io.RandomAccessFile

private const val IL2CPP = "libil2cpp.so"
private const val METADATA = "assets/bin/Data/Managed/Metadata/global-metadata.dat"

// The lambda's number changes between builds, so match its name by prefix.
private val SORT_KEY = Il2CppMethod(
    "HeadsUp.Scripts.Utils.OwnedDecksManager",
    "<InitDecksList>b__",
    parameterCount = 1,
    namePrefix = true,
)
private val GET_LAST_ACTION_TIME =
    Il2CppMethod("HeadsUp.Scripts.Data.HeadsUpLocalData", "GetLastActionTime", parameterCount = 1)

private class SortKeyCode(val key: ByteArray, val branchTarget: ByteArray.(Int) -> Long?)

// Keyed by the ABI directory under lib/.
private val SORT_KEY_BY_ABI = mapOf(
    "arm64-v8a" to SortKeyCode(
        words(
            0xF9400C28, // ldr x8, [x1, #0x18]         DeckConfig.deckId
            0x3CC48100, // ldur q0, [x8, #0x48]        UTF-16 chars 26..33
            0x0E212800, // xtn v0.8b, v0.8h
            0x9E660009, // fmov x9, d0
            0xDAC00D29, // rev x9, x9                  first character most significant
            0xB203C129, // orr x9, x9, #0x2020202020202020   lower-case; the id's end becomes a space
            0x9E630120, // ucvtf d0, x9
            0x1E614000, // fneg d0, d0
            0xD65F03C0, // ret
        ),
        ByteArray::arm64BranchTarget,
    ),
    "armeabi-v7a" to SortKeyCode(
        words(
            0xE591100C, // ldr r1, [r1, #0xc]          DeckConfig.deckId
            0xE2811040, // add r1, r1, #0x40           UTF-16 chars 26..33
            0xF4210A4F, // vld1.16 {d0, d1}, [r1]
            0xF3B20200, // vmovn.i16 d0, q0
            0xF2821E10, // vmov.i8 d1, #0x20
            0xF2200111, // vorr d0, d0, d1             lower-case; the id's end becomes a space
            0xF3B00000, // vrev64.8 d0, d0             first character most significant
            0xEC510B10, // vmov r0, r1, d0
            0xE1A02620, // lsr r2, r0, #12
            0xE1820A01, // orr r0, r2, r1, lsl #20     low 32 mantissa bits
            0xE1A01621, // lsr r1, r1, #12             high 20 mantissa bits
            0xE38114BF, // orr r1, r1, #0xbf000000     sign set ...
            0xE381160F, // orr r1, r1, #0xf00000       ... and exponent 0x3ff
            0xE12FFF1E, // bx lr
        ),
        ByteArray::armBranchTarget,
    ),
)

@Suppress("unused")
val sortDecksAlphabeticallyPatch = resourcePatch(
    name = "Sort decks alphabetically",
    description = "Sorts My Decks alphabetically instead of by recent purchases and plays.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_HEADS_UP)

    execute {
        val metadataFile = get(METADATA)
        if (!metadataFile.isFile) throw PatchException("Could not find $METADATA")
        val metadata = Il2CppMetadata(metadataFile.readBytes())

        val libraries = get("lib").walk().filter { it.name == IL2CPP && it.isFile }.toList()
        if (libraries.isEmpty()) throw PatchException(MISSING_IL2CPP_MESSAGE)

        for (library in libraries) {
            val abi = library.parentFile.name
            val code = SORT_KEY_BY_ABI[abi] ?: throw PatchException("Unsupported ABI $abi for $IL2CPP")

            val bytes = library.readBytes()
            val il2cpp = Il2CppLibrary(bytes)
            val offsets = il2cpp.resolve(metadata, listOf(SORT_KEY, GET_LAST_ACTION_TIME))
            val sortKey = offsets.getValue(SORT_KEY)
            val sortKeyEnd = il2cpp.functionEnd(sortKey)

            // Only replace the lambda we expect: one that tail-calls GetLastActionTime.
            val callsGetLastActionTime = (sortKey until sortKeyEnd step 4).any {
                code.branchTarget(bytes, it.toInt()) == offsets.getValue(GET_LAST_ACTION_TIME)
            }
            if (!callsGetLastActionTime) throw PatchException("The My Decks sort key has an unexpected shape in $abi")
            if (sortKey + code.key.size > sortKeyEnd) throw PatchException("The My Decks sort key is too small in $abi")

            RandomAccessFile(library, "rw").use { file ->
                file.seek(sortKey)
                file.write(code.key)
            }
        }
    }
}
