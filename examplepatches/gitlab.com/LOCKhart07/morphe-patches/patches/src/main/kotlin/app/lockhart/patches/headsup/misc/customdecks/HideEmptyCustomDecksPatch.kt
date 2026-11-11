/*
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * "Build Your Own Deck" is sold as 50 slots (com.wb.Ellen.HeadsUp.Deck.BuildYourOwn01..50,
 * multiplePurchaseCounter 1..50), and the store only offers the next one. Unlock all decks
 * owns all of them, which puts 50 empty tiles in My Decks.
 *
 * OwnedDecksManager::InitDecksList sorts each deck into OwnedDecks (My Decks) or HiddenDecks
 * by reading isDeckBought. That read is redirected to a routine that keeps paid slots with
 * cards and only the first empty one, so one empty slot is left to build a new deck in. The
 * routine lives in the body of GetIsBought, which Unlock all decks has turned into a
 * two-instruction stub. My Decks is built once per launch, so the next empty slot appears
 * after a restart.
 *
 * The hook is the masked ownership check inside the name-resolved InitDecksList, and the
 * instructions that put &OwnedDecks where the routine reads it are checked too. The routine
 * reads DeckData fields whose offsets changed in 4.15.14, so each known field layout is tried
 * and the one whose ownership check is found picks the offsets.
 *
 * Verified on com.wb.headsup 4.15.11 (versionCode 4151100), 4.15.13 (versionCode 4151300)
 * and 4.15.14 (versionCode 4151400), arm64-v8a and armeabi-v7a.
 */
package app.lockhart.patches.headsup.misc.customdecks

import app.lockhart.patches.headsup.misc.premium.GET_IS_BOUGHT
import app.lockhart.patches.headsup.misc.premium.IL2CPP
import app.lockhart.patches.headsup.misc.premium.METADATA
import app.lockhart.patches.headsup.misc.premium.RETURN_TRUE_BY_ABI
import app.lockhart.patches.headsup.misc.premium.unlockAllDecksPatch
import app.lockhart.patches.shared.Constants.COMPATIBILITY_HEADS_UP
import app.lockhart.patches.shared.il2cpp.Il2CppLibrary
import app.lockhart.patches.shared.il2cpp.Il2CppMetadata
import app.lockhart.patches.shared.il2cpp.Il2CppMethod
import app.lockhart.patches.shared.il2cpp.MISSING_IL2CPP_MESSAGE
import app.lockhart.patches.shared.il2cpp.MaskedWord
import app.lockhart.patches.shared.il2cpp.arm64Call
import app.lockhart.patches.shared.il2cpp.armCall
import app.lockhart.patches.shared.il2cpp.findWords
import app.lockhart.patches.shared.il2cpp.resolve
import app.lockhart.patches.shared.il2cpp.words
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.io.RandomAccessFile

private val INIT_DECKS_LIST = Il2CppMethod("HeadsUp.Scripts.Utils.OwnedDecksManager", "InitDecksList", parameterCount = 0)

// Field offsets in DeckData and CustomDeckData. They move when DeckData gains fields.
private class DeckFields(
    val isDeckBought: Int,
    val isCustomDeck: Int,
    val customDeckSerializedData: Int,
    val multiplePurchaseCounter: Int,
)

private class NativeCode(
    // One per known layout; the one whose ownedCheck is found in InitDecksList is used.
    val layouts: List<DeckFields>,
    // The isDeckBought read in InitDecksList that picks OwnedDecks or HiddenDecks; its first word is replaced.
    val ownedCheck: (DeckFields) -> List<MaskedWord>,
    // Puts &OwnedDecks where oneEmptySlot reads it.
    val ownedDecksSetup: List<MaskedWord>,
    val oneEmptySlot: (DeckFields) -> ByteArray,
    val call: (from: Long, to: Long) -> Long,
)

// Unsigned-offset loads: arm64 scales the offset by the access size, ARM mode takes it as is.
private fun arm64Ldrb(t: Int, n: Int, offset: Int) = 0x39400000L or (offset.toLong() shl 10) or (n shl 5).toLong() or t.toLong()
private fun arm64LdrW(t: Int, n: Int, offset: Int) = 0xB9400000L or (offset / 4L shl 10) or (n shl 5).toLong() or t.toLong()
private fun arm64LdrX(t: Int, n: Int, offset: Int) = 0xF9400000L or (offset / 8L shl 10) or (n shl 5).toLong() or t.toLong()
private fun armLdrb(t: Int, n: Int, offset: Int) = 0xE5D00000L or (n shl 16).toLong() or (t shl 12).toLong() or offset.toLong()
private fun armLdr(t: Int, n: Int, offset: Int) = 0xE5900000L or (n shl 16).toLong() or (t shl 12).toLong() or offset.toLong()

private const val R3 = 3
private const val R6 = 6
private const val IP = 12

// Keyed by the ABI directory under lib/.
private val NATIVE_CODE_BY_ABI = mapOf(
    "arm64-v8a" to NativeCode(
        layouts = listOf(
            // 4.15.11, 4.15.13
            DeckFields(isDeckBought = 0x190, isCustomDeck = 0x1A0, customDeckSerializedData = 0x1F0, multiplePurchaseCounter = 0x1FC),
            // 4.15.14
            DeckFields(isDeckBought = 0x1A0, isCustomDeck = 0x1B0, customDeckSerializedData = 0x200, multiplePurchaseCounter = 0x20C),
        ),
        // ldrb w8, [x26, #isDeckBought] ; cbz w8, <HiddenDecks>
        ownedCheck = { f -> listOf(MaskedWord(arm64Ldrb(8, 26, f.isDeckBought).toInt()), MaskedWord(0x34000008, 0xFF00001F.toInt())) },
        // mov x21, x20 ; str xN, [x21, #0x10]!
        ownedDecksSetup = listOf(MaskedWord(0xAA1403F5.toInt()), MaskedWord(0xF8010EA0.toInt(), 0xFFFFFFE0.toInt())),
        // in: x26 = DeckData, x21 = &OwnedDecks ; out: w8 = keep in My Decks.
        // Passes everything but paid slots (isCustomDeck, multiplePurchaseCounter > 0) without
        // cards, and passes one of those while OwnedDecks holds no other.
        oneEmptySlot = { f ->
            words(
                arm64Ldrb(8, 26, f.isDeckBought),
                0x34000408, // cbz w8, ret
                arm64Ldrb(9, 26, f.isCustomDeck),
                0x340003C9, // cbz w9, ret
                arm64LdrW(9, 26, f.multiplePurchaseCounter),
                0x34000389, // cbz w9, ret
                arm64LdrX(9, 26, f.customDeckSerializedData),
                0xB40000A9, // cbz x9, scan
                0xF9401929, // ldr x9, [x9, #0x30]         cards
                0xB4000069, // cbz x9, scan
                0xB9401929, // ldr w9, [x9, #0x18]         cards.Count
                0x350002C9, // cbnz w9, ret
                0xF94002AA, // scan: ldr x10, [x21]        OwnedDecks
                0xB400028A, // cbz x10, ret
                0xB940194B, // ldr w11, [x10, #0x18]       Count
                0xF940094A, // ldr x10, [x10, #0x10]       _items
                0xB400022A, // cbz x10, ret
                0x9100814A, // add x10, x10, #0x20
                0x340001EB, // next: cbz w11, ret
                0xF840854C, // ldr x12, [x10], #8
                0x5100056B, // sub w11, w11, #1
                0xB4FFFFAC, // cbz x12, next
                arm64Ldrb(13, 12, f.isCustomDeck),
                0x34FFFF6D, // cbz w13, next
                arm64LdrW(13, 12, f.multiplePurchaseCounter),
                0x34FFFF2D, // cbz w13, next
                arm64LdrX(13, 12, f.customDeckSerializedData),
                0xB40000AD, // cbz x13, hide
                0xF94019AD, // ldr x13, [x13, #0x30]
                0xB400006D, // cbz x13, hide
                0xB94019AD, // ldr w13, [x13, #0x18]
                0x35FFFE6D, // cbnz w13, next
                0x52800008, // hide: mov w8, #0
                0xD65F03C0, // ret
            )
        },
        call = ::arm64Call,
    ),
    "armeabi-v7a" to NativeCode(
        layouts = listOf(
            // 4.15.11, 4.15.13
            DeckFields(isDeckBought = 0xEC, isCustomDeck = 0xF4, customDeckSerializedData = 0x120, multiplePurchaseCounter = 0x128),
            // 4.15.14
            DeckFields(isDeckBought = 0xFC, isCustomDeck = 0x104, customDeckSerializedData = 0x130, multiplePurchaseCounter = 0x138),
        ),
        // ldrb r0, [r6, #isDeckBought] ; cmp r0, #0 ; beq <HiddenDecks>
        ownedCheck = { f ->
            listOf(MaskedWord(armLdrb(0, R6, f.isDeckBought).toInt()), MaskedWord(0xE3500000.toInt()), MaskedWord(0x0A000000, 0xFF000000.toInt()))
        },
        // str rN, [r0, #8]! ; str r0, [sp, #0x10]
        ownedDecksSetup = listOf(MaskedWord(0xE5A00008.toInt(), 0xFFFF0FFF.toInt()), MaskedWord(0xE58D0010.toInt())),
        // in: r6 = DeckData, [sp, #0x10] = &OwnedDecks ; out: r0, same rule as arm64.
        oneEmptySlot = { f ->
            words(
                armLdrb(0, R6, f.isDeckBought),
                0xE3500000, // cmp r0, #0
                0x012FFF1E, // bxeq lr
                armLdrb(1, R6, f.isCustomDeck),
                0xE3510000, // cmp r1, #0
                0x012FFF1E, // bxeq lr
                armLdr(1, R6, f.multiplePurchaseCounter),
                0xE3510000, // cmp r1, #0
                0x012FFF1E, // bxeq lr
                armLdr(1, R6, f.customDeckSerializedData),
                0xE3510000, // cmp r1, #0
                0x15911018, // ldrne r1, [r1, #0x18]       cards
                0x13510000, // cmpne r1, #0
                0x1591100C, // ldrne r1, [r1, #0xc]        cards.Count
                0x13510000, // cmpne r1, #0
                0x112FFF1E, // bxne lr
                0xE59D1010, // ldr r1, [sp, #0x10]
                0xE5911000, // ldr r1, [r1]                OwnedDecks
                0xE3510000, // cmp r1, #0
                0x012FFF1E, // bxeq lr
                0xE591200C, // ldr r2, [r1, #0xc]          Count
                0xE5911008, // ldr r1, [r1, #8]            _items
                0xE3510000, // cmp r1, #0
                0x012FFF1E, // bxeq lr
                0xE2811010, // add r1, r1, #0x10
                0xE2522001, // next: subs r2, r2, #1
                0x412FFF1E, // bxmi lr
                0xE4913004, // ldr r3, [r1], #4
                0xE3530000, // cmp r3, #0
                0x0AFFFFFA, // beq next
                armLdrb(IP, R3, f.isCustomDeck),
                0xE35C0000, // cmp ip, #0
                0x0AFFFFF7, // beq next
                armLdr(IP, R3, f.multiplePurchaseCounter),
                0xE35C0000, // cmp ip, #0
                0x0AFFFFF4, // beq next
                armLdr(IP, R3, f.customDeckSerializedData),
                0xE35C0000, // cmp ip, #0
                0x159CC018, // ldrne ip, [ip, #0x18]
                0x135C0000, // cmpne ip, #0
                0x159CC00C, // ldrne ip, [ip, #0xc]
                0x135C0000, // cmpne ip, #0
                0x1AFFFFED, // bne next
                0xE3A00000, // mov r0, #0
                0xE12FFF1E, // bx lr
            )
        },
        call = ::armCall,
    ),
)

@Suppress("unused")
val hideEmptyCustomDecksPatch = resourcePatch(
    name = "Hide empty custom decks",
    description = "Shows one empty custom deck in My Decks instead of all of them. " +
        "A new one appears after you restart the app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HEADS_UP)
    dependsOn(unlockAllDecksPatch)

    execute {
        val metadataFile = get(METADATA)
        if (!metadataFile.isFile) throw PatchException("Could not find $METADATA")
        val metadata = Il2CppMetadata(metadataFile.readBytes())

        val libraries = get("lib").walk().filter { it.name == IL2CPP && it.isFile }.toList()
        if (libraries.isEmpty()) throw PatchException(MISSING_IL2CPP_MESSAGE)

        for (library in libraries) {
            val abi = library.parentFile.name
            val code = NATIVE_CODE_BY_ABI[abi] ?: throw PatchException("Unsupported ABI $abi for $IL2CPP")
            val returnTrue = RETURN_TRUE_BY_ABI.getValue(abi)

            val bytes = library.readBytes()
            val il2cpp = Il2CppLibrary(bytes)
            val offsets = il2cpp.resolve(metadata, listOf(GET_IS_BOUGHT, INIT_DECKS_LIST))

            val initDecksList = offsets.getValue(INIT_DECKS_LIST).toInt()
            val initDecksListEnd = il2cpp.functionEnd(initDecksList.toLong()).toInt()

            val hooks = code.layouts.flatMap { fields ->
                bytes.findWords(initDecksList, initDecksListEnd, code.ownedCheck(fields)).map { it to fields }
            }
            val (hook, fields) = hooks.singleOrNull()
                ?: throw PatchException("Expected one My Decks ownership check in $abi, found ${hooks.size}")
            if (bytes.findWords(initDecksList, hook, code.ownedDecksSetup).size != 1) {
                throw PatchException("My Decks list setup has an unexpected shape in $abi")
            }

            // The routine overwrites GetIsBought's body, which is only dead once Unlock all decks stubbed it.
            val getIsBought = offsets.getValue(GET_IS_BOUGHT)
            val stub = bytes.copyOfRange(getIsBought.toInt(), getIsBought.toInt() + returnTrue.size)
            if (!stub.contentEquals(returnTrue)) throw PatchException("GetIsBought is not stubbed in $abi")

            val oneEmptySlot = code.oneEmptySlot(fields)
            val cave = getIsBought + returnTrue.size
            if (cave + oneEmptySlot.size > il2cpp.functionEnd(getIsBought)) {
                throw PatchException("GetIsBought is too small for the custom deck routine in $abi")
            }

            RandomAccessFile(library, "rw").use { file ->
                file.seek(cave)
                file.write(oneEmptySlot)
                file.seek(hook.toLong())
                file.write(words(code.call(hook.toLong(), cave)))
            }
        }
    }
}
