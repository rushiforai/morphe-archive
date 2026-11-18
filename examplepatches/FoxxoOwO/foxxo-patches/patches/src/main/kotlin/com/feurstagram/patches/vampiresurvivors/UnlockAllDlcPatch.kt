package com.feurstagram.patches.vampiresurvivors

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_VAMPIRESURVIVORS
import java.io.RandomAccessFile

/*
 * Vampire Survivors is an IL2CPP build, so the DLC licensing lives in native code and there is
 * no smali to rewrite. `PurchasingController.GetOwnedDlcTypes()` is the only place the game asks
 * the store which DLC the player owns, and `LicenseManager` copies its result into `OwnedDlc`,
 * which every content gate reads.
 *
 * The method is replaced by a tail branch into `DlcSorting.get_SortedDlcTypes()`, the list the
 * game itself uses to enumerate every DLC, so no store object, Play Billing session or cached
 * receipt is needed. Patching only the first instruction is enough: the rest of the original body
 * stays in place, complete but unreachable.
 *
 * The offsets are absolute file offsets inside the 1.16.111 arm64 `libil2cpp.so`, not RVAs
 * (`file offset = VA - 0x4000`). Any new app version shifts them.
 */

/** `PurchasingController.GetOwnedDlcTypes()`, starts with `sub sp, sp, #0xa0`. */
private val GET_OWNED_DLC_TYPES = "FF8302D1".toBytes()

/** `b DlcSorting.get_SortedDlcTypes` from `0x9EFA418`: `0x17FECF4B`. */
private val SORTED_DLC_TYPES_BRANCH = "4BCFFE17".toBytes()

private const val GET_OWNED_DLC_TYPES_OFFSET = 0x9EF6418L

private const val ARM64_LIBRARY = "lib/arm64-v8a/libil2cpp.so"

/** Marks every DLC as owned by redirecting the purchase lookup to the game's full DLC list. */
val unlockAllDlcPatch = resourcePatch(
    name = "Unlock all DLC",
    description = "Unlocks every expansion. The purchase lookup returns the game's own list of " +
        "all DLC, so no store session or receipt is involved. Only the arm64 build is patched.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_VAMPIRESURVIVORS)

    execute {
        forceOwnedDlc()
    }
}

private fun ResourcePatchContext.forceOwnedDlc() {
    if (!listApkEntries("").contains(ARM64_LIBRARY)) {
        throw PatchException("The bundle has no $ARM64_LIBRARY to patch")
    }

    val library = get(ARM64_LIBRARY, true)
    if (!library.exists()) {
        throw PatchException("Could not extract $ARM64_LIBRARY")
    }

    RandomAccessFile(library, "rw").use { file ->
        file.seek(GET_OWNED_DLC_TYPES_OFFSET)
        val original = ByteArray(GET_OWNED_DLC_TYPES.size)
        file.readFully(original)
        if (!original.contentEquals(GET_OWNED_DLC_TYPES)) {
            throw PatchException(
                "Unexpected PurchasingController.GetOwnedDlcTypes prologue ${original.toHex()}; " +
                    "the patch targets version 1.16.111 only",
            )
        }

        file.seek(GET_OWNED_DLC_TYPES_OFFSET)
        file.write(SORTED_DLC_TYPES_BRANCH)
    }
}

private fun ByteArray.toHex() = joinToString("") { "%02x".format(it) }

private fun String.toBytes() = chunked(2).map { it.toInt(16).toByte() }.toByteArray()
