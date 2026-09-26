package app.ckzombies.patches.nativelib

import app.ckzombies.patches.shared.Constants.COMPATIBILITY_CK_ZOMBIES
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.rawResourcePatch

internal val ABIS = listOf("armeabi", "armeabi-v7a")

private fun libraryPath(abi: String) = "lib/$abi/${NativeEdits.LIBRARY}"

/**
 * Refuses every build but Glu's own. Every native patch depends on this, so it runs before any
 * of them touches a library: a repack or an already patched APK stops here, not halfway.
 */
internal val nativeLibraryCheckPatch = rawResourcePatch {
    execute {
        for (abi in ABIS) {
            val file = get(libraryPath(abi))
            if (!file.exists()) throw PatchException("${libraryPath(abi)} is missing from this APK")
            val hash = Elf32.sha256(file.readBytes())
            if (hash != NativeEdits.STOCK_SHA256.getValue(abi)) {
                throw PatchException(
                    "${libraryPath(abi)} is not Glu's original (sha256 ${hash.take(12)}). " +
                        "Patch the untouched v3.1.0 APK signed by Glu Mobile, not a repack or a patched build."
                )
            }
        }
    }
}

/** Applies [edits] to the library of every ABI, all words or none. */
internal fun ResourcePatchContext.editLibraries(edits: Map<String, List<WordEdit>>) {
    for (abi in ABIS) {
        val file = get(libraryPath(abi))
        val elf = Elf32(file.readBytes())
        try {
            elf.apply(edits.getValue(abi))
        } catch (e: IllegalStateException) {
            throw PatchException("${libraryPath(abi)}: ${e.message}", e)
        }
        file.writeBytes(elf.bytes())
    }
}

/**
 * Removes the library's only text relocation, which sits in the 2011 NDK's `__on_dlclose` stub
 * rather than in game code. From targetSdk 23 the linker refuses to load a library that has one.
 * Five words per ABI: the stub rewritten PC-relative, its literal, the `.rel.dyn` entry retyped
 * `R_ARM_NONE`, and `DT_TEXTREL` turned into `DT_DEBUG`.
 */
internal val textRelocationPatch = rawResourcePatch {
    dependsOn(nativeLibraryCheckPatch)

    execute {
        editLibraries(NativeEdits.TEXT_RELOCATION)
    }
}

/** Bytes claimed past the end of .bss for the cave's one-shot flag. */
private const val FLAG_BYTES = 8

private fun String.hexToBytes() = ByteArray(length / 2) { substring(it * 2, it * 2 + 2).toInt(16).toByte() }

/**
 * Gives a fresh install 999,999,999 credits and the same in cash.
 *
 * The save is encrypted and the totals are scrambled in memory too, so no number can be poked
 * in. Instead a code cave calls the game's own `CBH_Player::AddCredits()` and `AddMoney()` on
 * every fresh-player path, and the `Save()` that already follows writes the result. The cave
 * latches a flag in freshly claimed .bss so it grants once per process however many of those
 * paths run, two stubs clamp both counters so later earnings cannot overflow them, and
 * `GameGWallet::Exists()` is pinned to false, since Glu's wallet servers are gone and the
 * wallet path would otherwise swallow the credits.
 *
 * The cave needs mapped, executable space. `armeabi-v7a` has enough zero padding at the end of
 * its first segment; `armeabi` has none, so one page is spliced into the file, which moves
 * every file offset after it but no virtual address.
 *
 * The grant only fires when the game creates its save, so installing over an existing save
 * changes nothing.
 */
@Suppress("unused")
val unlimitedCurrencyPatch = rawResourcePatch(
    name = "Unlimited currency",
    description = "A fresh install starts with 999,999,999 Glu credits and 999,999,999 Cash. " +
        "If you install the patched app as an update, your current balance stays as it is.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    dependsOn(nativeLibraryCheckPatch)

    execute {
        for (abi in ABIS) {
            val plan = NativeEdits.CURRENCY.getValue(abi)
            val file = get(libraryPath(abi))
            val elf = Elf32(file.readBytes())
            try {
                plan.spliceAtOffset?.let { elf.splice(it, plan.spliceSize) }
                elf.growFirstLoadTo(plan.load1End)
                elf.extendLastLoadMemory(FLAG_BYTES)
                elf.writeIntoZeros(plan.cave, plan.caveBytes.hexToBytes())
                elf.apply(plan.edits)
            } catch (e: IllegalStateException) {
                throw PatchException("${libraryPath(abi)}: ${e.message}", e)
            } catch (e: IllegalArgumentException) {
                throw PatchException("${libraryPath(abi)}: ${e.message}", e)
            }
            file.writeBytes(elf.bytes())
        }
    }
}

/**
 * Removes the wait on the loading screen that only happens with a live connection.
 *
 * `AppInitGameDataGS::Load()` reports "not finished" for as long as the login flow runs, and
 * online it starts one login step: a version check against Glu's gServe, switched off years
 * ago, so the flow only ends on its own timeout. Returning from `App::StartGServerLight()`
 * without queueing anything leaves the flow not running, and the task completes on the next
 * frame, the same path an offline launch already takes. Nothing else calls the function.
 */
internal val serverCheckStallPatch = rawResourcePatch {
    dependsOn(nativeLibraryCheckPatch)

    execute {
        editLibraries(NativeEdits.GSERVE_STALL)
    }
}

/**
 * Stops the two native requests to Glu's `gserve` S3 bucket, which no longer exists (a free
 * bucket name can be claimed by anyone, who would then be serving this game over plain HTTP),
 * and takes out the two menu buttons that lead to dead services.
 *
 * - `CDynamicAd::SetImageUrl()` fetches Glu's own banner through `WebUtil::httpGet()` and never
 *   reads the call's result. With the call made a no-op the `WebUtil` stays idle, and
 *   `CDynamicAd::update()` leaves on every frame without a logo, as it does when the fetch fails.
 * - `CUpdateManager::checkUpdates()` queues the content update check, whose files
 *   `installUpdates()` would copy into the game's data folder. It already returns at once when
 *   its paths are unset; its first word becomes that return. Nothing waits for a check to finish.
 * - `CBH_NetworkWindow::CreateMenuBar()` builds the statistics screen's bar from a table of
 *   four entries: Store, Awards, Boards, Games. Games opens `m.glu.com/android/ghome` in the
 *   browser, a host that no longer resolves, and Boards opens OpenFeint's leaderboards, which
 *   never start. The loop's end moves from after the fourth entry to after the second, so the
 *   bar has two buttons. Nothing reads them by position, and only this bar sends the commands
 *   the two buttons carried.
 */
internal val deadServersNativePatch = rawResourcePatch {
    dependsOn(nativeLibraryCheckPatch)

    execute {
        editLibraries(NativeEdits.DEAD_SERVERS)
    }
}

/**
 * Keeps the engine from asking Android for the device ID or the account list. From targetSdk 23
 * `TelephonyManager.getDeviceId()` throws `SecurityException` unless READ_PHONE_STATE was granted
 * at runtime, which this game never asks for, and the native caller does not clear the
 * exception, so the process aborts. Each of the five call sites starts with the engine's own
 * "already resolved" check; forcing that flag makes it return its cached empty string without
 * entering JNI. One word per call site: `getDeviceIdentifier`, `GetPrimaryAccountName`,
 * `CFlurry::StartSession` and two in `GWalletCallbackJNI::initialise`.
 */
internal val jniGuardsPatch = rawResourcePatch {
    dependsOn(nativeLibraryCheckPatch)

    execute {
        editLibraries(NativeEdits.JNI_GUARDS)
    }
}
