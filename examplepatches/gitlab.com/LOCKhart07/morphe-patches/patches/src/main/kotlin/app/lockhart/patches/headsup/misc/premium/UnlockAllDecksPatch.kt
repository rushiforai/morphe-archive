/*
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Heads Up! is a Unity IL2CPP title, so deck ownership lives in native code
 * (lib/<abi>/libil2cpp.so) rather than in the dex. Three methods answer the
 * "does the player own this deck?" question and every buy gate funnels through
 * them:
 *
 *   HeadsUp.DeckData::IsBought()
 *       getter over the isDeckBought byte.
 *   HeadsUp.GameData::IsDeckBought(string)
 *       lower-cases the id, looks the DeckData up in the dictionary and reads
 *       the same byte.
 *   HeadsUp.Scripts.Data.HeadsUpLocalData::GetIsBought(string)
 *       reads the persisted "<deckId>_bought" entry from the IDataStore.
 *
 * DeckValidator.IsDeckValidToInstall() combines all three with date/version
 * validity checks, so once the three oracles report true the validator's
 * ownership branch passes while its genuine validity checks are left intact.
 *
 * The methods are found by name through global-metadata.dat (see
 * Il2CppMethodResolver), and each is rewritten to return true
 * (`mov w0, #1 ; ret` on arm64, `mov r0, #1 ; bx lr` on armv7, which is ARM
 * mode, not Thumb). The rest of GetIsBought's body is left unused; Hide empty
 * custom decks puts its routine there.
 *
 * Verified on com.wb.headsup 4.15.11 (versionCode 4151100), 4.15.13 (versionCode 4151300)
 * and 4.15.14 (versionCode 4151400), arm64-v8a and armeabi-v7a, against Il2CppDumper.
 */
package app.lockhart.patches.headsup.misc.premium

import app.lockhart.patches.shared.Constants.COMPATIBILITY_HEADS_UP
import app.lockhart.patches.shared.il2cpp.Il2CppLibrary
import app.lockhart.patches.shared.il2cpp.Il2CppMetadata
import app.lockhart.patches.shared.il2cpp.Il2CppMethod
import app.lockhart.patches.shared.il2cpp.MISSING_IL2CPP_MESSAGE
import app.lockhart.patches.shared.il2cpp.hex
import app.lockhart.patches.shared.il2cpp.resolve
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import java.io.RandomAccessFile

internal const val IL2CPP = "libil2cpp.so"
internal const val METADATA = "assets/bin/Data/Managed/Metadata/global-metadata.dat"

internal val GET_IS_BOUGHT = Il2CppMethod("HeadsUp.Scripts.Data.HeadsUpLocalData", "GetIsBought", parameterCount = 1)

private val OWNERSHIP_METHODS = listOf(
    Il2CppMethod("HeadsUp.DeckData", "IsBought", parameterCount = 0),
    Il2CppMethod("HeadsUp.GameData", "IsDeckBought", parameterCount = 1),
    GET_IS_BOUGHT,
)

// Keyed by the ABI directory under lib/.
internal val RETURN_TRUE_BY_ABI = mapOf(
    // mov w0, #1 ; ret
    "arm64-v8a" to hex("20008052 c0035fd6"),
    // mov r0, #1 ; bx lr
    "armeabi-v7a" to hex("0100a0e3 1eff2fe1"),
)

@Suppress("unused")
val unlockAllDecksPatch = resourcePatch(
    name = "Unlock all decks",
    description = "Unlocks every deck without a purchase.",
    default = true,
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
            val returnTrue = RETURN_TRUE_BY_ABI[abi]
                ?: throw PatchException("Unsupported ABI $abi for $IL2CPP")

            val offsets = Il2CppLibrary(library.readBytes()).resolve(metadata, OWNERSHIP_METHODS)

            RandomAccessFile(library, "rw").use { file ->
                for (offset in offsets.values) {
                    file.seek(offset)
                    file.write(returnTrue)
                }
            }
        }
    }
}
