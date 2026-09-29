package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import java.security.MessageDigest

// Independently disassembled exact bases. Normalize only owned instruction slots
// before hashing complete functions; each mutation validates its own slot bytes.
// This permits composition/reapplication while rejecting same-size unknown code.
private data class FunctionIdentity(val offset: Int, val size: Int, val hash: String)
private data class OwnedInstruction(val offset: Int, val original: String)
private data class AddedLegacyIdentity(
    val version: String, val code: String, val size: Int,
    val functions: List<FunctionIdentity>, val owned: List<OwnedInstruction>,
)
private val addedLegacyIdentities = listOf(
    AddedLegacyIdentity("2.0.20", "5001812", 2220872, listOf(
        FunctionIdentity(0x142c84, 564, "93592ad7f095133b79ca623d634eae95b8d981a953110feb1bc881785b0bd828"),
        FunctionIdentity(0xf6270, 960, "132d3ece74a26a783937e6976c92bf952351e2c856059612cf845108d7d18805"),
        FunctionIdentity(0x10daa8, 844, "e35d88838d3f9292f9de361cbb0f8c1dfae9169f2d8260e89dd39c60d9e299c0"),
        FunctionIdentity(0xff7fc, 1704, "366517e189518f5c984ecb531787c027d2a240f6ce4cb73b35f7541706a3f3f1"),
        FunctionIdentity(0x1015e4, 476, "1d892be048946b14ceeb97190a3170b0705548974c7a376885057719fdfb3e5c"),
        FunctionIdentity(0x116478, 5792, "3c70a3cf1c10402d4736daa65f8b26f0693341f2e74631d4f69e352366eb0cbd"),
        FunctionIdentity(0xf4184, 1152, "d2ab70cbf4279488f18fde22bb334d8da2a05ba89f4f42a9055c6b7a6d52211d"),
    ), listOf(
        OwnedInstruction(0xf4484, "e1008052"),
        OwnedInstruction(0xf6314, "e1230091"),
        OwnedInstruction(0xf6324, "a2008052"),
        OwnedInstruction(0xf636c, "4b008052"),
        OwnedInstruction(0xf6380, "6c008052"),
        OwnedInstruction(0xf638c, "e93f00b9"),
        OwnedInstruction(0xf63a8, "ed2f00b9"),
        OwnedInstruction(0xf6414, "e1230091"),
        OwnedInstruction(0xf6424, "a2008052"),
        OwnedInstruction(0xf646c, "4b008052"),
        OwnedInstruction(0xf6480, "6c008052"),
        OwnedInstruction(0xf648c, "e93f00b9"),
        OwnedInstruction(0xf64a8, "ed2f00b9"),
        OwnedInstruction(0xf64dc, "e1230091"),
        OwnedInstruction(0xf64ec, "a2008052"),
        OwnedInstruction(0xf6534, "4b008052"),
        OwnedInstruction(0xf6544, "6c008052"),
        OwnedInstruction(0xf6570, "ed2f00b9"),
        OwnedInstruction(0xf6578, "ea3f00b9"),
        OwnedInstruction(0xffc5c, "e0000036"),
        OwnedInstruction(0xffc64, "a8000034"),
        OwnedInstruction(0x101648, "e20740f9"),
        OwnedInstruction(0x101674, "63c201fc"),
        OwnedInstruction(0x101690, "642600bd"),
        OwnedInstruction(0x101770, "622a00bd"),
        OwnedInstruction(0x101774, "612e00bd"),
        OwnedInstruction(0x101780, "633200bd"),
        OwnedInstruction(0x10dc70, "14040036"),
        OwnedInstruction(0x1166c4, "68000035"),
        OwnedInstruction(0x1166cc, "68050034"),
        OwnedInstruction(0x116780, "a8050034"),
        OwnedInstruction(0x142c84, "ff8301d1fd7b01a9"),
    )),
    AddedLegacyIdentity("2.0.21", "5001968", 2234048, listOf(
        FunctionIdentity(0x13ec7c, 564, "13a8def84fe48d6e23aaaf107e1f40f50f997729327d5b9f1c4d73463787668f"),
        FunctionIdentity(0xf20c4, 976, "fe31b90a32de4bdd3533b0ac071a7c2d1e0456329b84669b3f1752482a28d8cd"),
        FunctionIdentity(0x109a28, 844, "c0f98d6352e7cf1a08028ca301ad26c9472b7abbc6f79c9e55c674fbdcd6f86b"),
        FunctionIdentity(0xfb7a4, 1704, "a2d76e6943b5b02787069b6aafc0e60aef94e66c33cf4f6db915d66e3d6e2ae1"),
        FunctionIdentity(0xfd58c, 412, "f2aeda0f2320d6d7b040fc165bd7b637874da16eb6362c90994debfe13104451"),
        FunctionIdentity(0x1123f8, 5792, "c18b6a3e0186f14cf4391c9228b6c12b4273bbe484c1b5017a99ceca05f5675c"),
        FunctionIdentity(0xefab4, 1152, "391f77fa75266a67ba539dd85b1f6dab23e21046294c25aa807ceb2ef7969f48"),
    ), listOf(
        OwnedInstruction(0xefdb4, "e1008052"),
        OwnedInstruction(0xf2170, "e1230091"),
        OwnedInstruction(0xf2180, "a2008052"),
        OwnedInstruction(0xf21c8, "4b008052"),
        OwnedInstruction(0xf21dc, "6c008052"),
        OwnedInstruction(0xf21e8, "e93f00b9"),
        OwnedInstruction(0xf2204, "ed2f00b9"),
        OwnedInstruction(0xf2274, "e1230091"),
        OwnedInstruction(0xf2284, "a2008052"),
        OwnedInstruction(0xf22cc, "4b008052"),
        OwnedInstruction(0xf22e0, "6c008052"),
        OwnedInstruction(0xf22ec, "e93f00b9"),
        OwnedInstruction(0xf2308, "ed2f00b9"),
        OwnedInstruction(0xf233c, "e1230091"),
        OwnedInstruction(0xf234c, "a2008052"),
        OwnedInstruction(0xf2394, "4b008052"),
        OwnedInstruction(0xf23a4, "6c008052"),
        OwnedInstruction(0xf23d0, "ed2f00b9"),
        OwnedInstruction(0xf23d8, "ea3f00b9"),
        OwnedInstruction(0xfbc04, "e0000036"),
        OwnedInstruction(0xfbc0c, "a8000034"),
        OwnedInstruction(0xfd5f0, "e20740f9"),
        OwnedInstruction(0xfd658, "742600bd"),
        OwnedInstruction(0xfd6ac, "67c201fc"),
        OwnedInstruction(0xfd6e0, "632a00bd"),
        OwnedInstruction(0xfd6e4, "612e00bd"),
        OwnedInstruction(0xfd6e8, "643200bd"),
        OwnedInstruction(0x109bf0, "14040036"),
        OwnedInstruction(0x112644, "68000035"),
        OwnedInstruction(0x11264c, "68050034"),
        OwnedInstruction(0x112700, "a8050034"),
        OwnedInstruction(0x13ec7c, "ff8301d1fd7b01a9"),
    )),
 )

internal fun verifyAddedLegacyNativeCode(bytes: ByteArray, version: String?, code: String?) {
    val layout = addedLegacyIdentities.singleOrNull { it.version == version && it.code == code } ?: return
    if (bytes.size != layout.size) throw PatchException("Unexpected native size for $version/$code")
    for (function in layout.functions) {
        val normalized = bytes.copyOfRange(function.offset, function.offset + function.size)
        for (site in layout.owned) {
            if (site.offset !in function.offset until function.offset + function.size) continue
            val original = site.original.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
            original.copyInto(normalized, site.offset - function.offset)
        }
        val hash = MessageDigest.getInstance("SHA-256").digest(normalized).joinToString("") { "%02x".format(it) }
        if (hash != function.hash) throw PatchException("Native function identity mismatch for $version/$code at 0x${function.offset.toString(16)}")
    }
}
