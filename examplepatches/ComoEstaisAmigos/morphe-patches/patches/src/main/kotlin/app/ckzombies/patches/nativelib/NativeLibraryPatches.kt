package app.ckzombies.patches.nativelib

import app.ckzombies.patches.compat.obbMessagePatch
import app.ckzombies.patches.shared.Constants.COMPATIBILITY_CK_ZOMBIES
import app.ckzombies.patches.shared.Constants.ORIGINAL_APK
import app.adebisi.patches.shared.hexToBytes
import app.adebisi.patches.shared.requireStockNative
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile

internal val ABIS = listOf("armeabi", "armeabi-v7a")

private fun libraryPath(abi: String) = "lib/$abi/${NativeEdits.LIBRARY}"

/**
 * Maps the first-segment padding both the currency cave and the civilian stubs sit in.
 * Safe to run twice: `armeabi` splices its extra page only when the file still has Glu's
 * original LOAD1 size, and growing to the page boundary is a no-op once it is already there.
 */
internal fun Elf32.mapExecutablePadding(abi: String) {
    val plan = NativeEdits.PADDING.getValue(abi)
    if (plan.spliceAtOffset != null && firstLoadFileSize() == plan.spliceAtOffset) {
        splice(plan.spliceAtOffset, plan.spliceSize)
    }
    growFirstLoadToAtLeast(plan.load1End)
}

/**
 * Refuses every build but Glu's own libraries. Every native patch depends on this, so it runs
 * before any of them touches a library: a repack or an already patched APK stops here, not
 * halfway. The Glu Mobile cert is a separate check on [app.ckzombies.patches.compat.obbMessagePatch];
 * a re-sign of stock libs would still pass this hash.
 */
internal val nativeLibraryCheckPatch = patch {
    execute {
        for (abi in ABIS) {
            requireStockNative(
                libraryPath(abi),
                NativeEdits.STOCK_SHA256.getValue(abi),
                "Glu",
                ORIGINAL_APK,
            )
        }
    }
}

/** Applies [edits] to the library of every ABI, all words or none. */
internal fun editLibraries(edits: Map<String, List<WordEdit>>) {
    for (abi in ABIS) {
        val file = resourceFile(libraryPath(abi))
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
internal val textRelocationPatch = patch {
    dependsOn(nativeLibraryCheckPatch)

    execute {
        editLibraries(NativeEdits.TEXT_RELOCATION)
    }
}

/** Bytes claimed past the end of .bss for the cave's one-shot flag. */
private const val FLAG_BYTES = 8

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
val unlimitedCurrencyPatch = patch(
    name = "Unlimited currency",
    description = "A fresh install starts with 999,999,999 Glu credits and 999,999,999 Cash. " +
        "If you install the patched app as an update, your current balance stays as it is.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    dependsOn(nativeLibraryCheckPatch, obbMessagePatch)

    execute {
        for (abi in ABIS) {
            val plan = NativeEdits.CURRENCY.getValue(abi)
            val file = resourceFile(libraryPath(abi))
            val elf = Elf32(file.readBytes())
            try {
                elf.mapExecutablePadding(abi)
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
 * Stops civilians from taking damage or reacting when the player shoots them or when a
 * blast or grenade fragment hits them. Zombies can still kill them.
 *
 * `CUnit::ReceivedDamageFromPlayer()` already returns when the unit is a civilian, the
 * healing gun is not in hand, and `SetVulnerability(false)` has been called. Units spawn
 * vulnerable, so the shot still lands. The `bne` that takes that path becomes a no-op, so
 * a civilian always hits the healing-gun check and otherwise returns: no HP change, no
 * wound animation, no mission-failed kill. Type 2, the healing gun, still heals them.
 *
 * Blasts and fragments have no such check. Their first `ldrb` of the neutralized flag is
 * replaced with a `bl` to a stub in the first-segment padding that returns if
 * `CUnit::IsCivilian()` is set and otherwise does that `ldrb` and comes back. Two stubs
 * per ABI because the two functions pushed different frames.
 *
 * `ReceivedDamageFromUnit()` is not touched.
 */
@Suppress("unused")
val protectCiviliansPatch = patch(
    name = "Disable friendly fire",
    description = "Makes civilians immune to the player's shots and explosions.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    dependsOn(nativeLibraryCheckPatch, obbMessagePatch)

    execute {
        for (abi in ABIS) {
            val plan = NativeEdits.CIVILIAN_IMMUNITY.getValue(abi)
            val file = resourceFile(libraryPath(abi))
            val elf = Elf32(file.readBytes())
            try {
                elf.mapExecutablePadding(abi)
                elf.writeIntoZeros(plan.blastCave, plan.blastCaveBytes.hexToBytes())
                elf.writeIntoZeros(plan.fragCave, plan.fragCaveBytes.hexToBytes())
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
 * Stops the camera shaking on any `CSwerveGame::Blast`.
 *
 * `DGCamera::SetShake` is the only place the camera starts a shake. Five sites call it: the
 * two `CSwerveGame::Blast` clones, `CDH_Weapon::MakeShot`, `CSwerveGame::OnShooterAttacked`,
 * and the Lua `ShakeCamera` helper. Each blast clone's `bl` becomes `mov r0, r0`, so an
 * explosion never starts a shake. The other three sites still call `SetShake`, so firing and
 * taking a hit still kick the camera.
 */
@Suppress("unused")
val disableExplosionShakePatch = patch(
    name = "Disable explosion shake",
    description = "Stops the player fov shaking when something explodes.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    dependsOn(nativeLibraryCheckPatch, obbMessagePatch)

    execute {
        editLibraries(NativeEdits.EXPLOSION_SHAKE)
    }
}

/**
 * Shows the two weapons Glu shipped hidden: AA-2012 (id 24) and Dual MP-643 (id 32).
 *
 * The shop consults `CItem::isHidden()`, which returns the item's hidden byte, and skips any
 * item it reports. Replacing that byte load with `mov r0, #0` makes the function always
 * return false. Every other item in the shipped config is already visible, so exactly those
 * two weapons appear and nothing else changes.
 */
@Suppress("unused")
val hiddenWeaponsPatch = patch(
    name = "Show hidden weapons",
    description = "Shows the two hidden weapons, AA-2012 and Dual MP-643, in the store.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    dependsOn(nativeLibraryCheckPatch, obbMessagePatch)

    execute {
        editLibraries(NativeEdits.HIDDEN_WEAPONS)
    }
}

/**
 * Keeps the Daily Deal popup from opening on the map.
 *
 * `COffersManager::Tick()` runs on every map update. Once the delay since the popup was last
 * closed has passed (20 minutes in the game's offers config), it looks up the day's item and,
 * when there is one, builds a `CDailyDealDialogWindow` and queues it on the map. The `beq` that
 * skips the window when the item is missing becomes a plain `b`, so `Tick()` always takes that
 * path: it still stores the time of the check and checks again after the same delay.
 *
 * The deal itself is untouched. `COffersManager::UpdateOffers()` puts the day's item on sale,
 * and the store shows it with its sale marker and timer. `CheckAndShowDD()` builds the same
 * window but has no caller.
 */
@Suppress("unused")
val hideDailyDealPatch = patch(
    name = "Hide Daily Deal popup",
    description = "Hides the annoying Daily Deal popup that shows at every launch. The deal is still in the store.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    dependsOn(nativeLibraryCheckPatch, obbMessagePatch)

    execute {
        editLibraries(NativeEdits.DAILY_DEAL)
    }
}

/**
 * Removes the wait on the loading screen that only happens with a live connection.
 *
 * `AppInitGameDataGS::Load()` reports "not finished" while the game says the network is
 * available and the login flow is running. Online it starts one login step: a version check
 * against Glu's gServe, switched off years ago, so the flow only ends on its own timeout.
 * Offline the availability check is false and the step falls straight through to
 * `CSaveManager::PauseByGServe(false)` and `App::InitGameData()`, which is the launch everyone
 * without a connection already gets.
 *
 * `CNetworkAvailability::IsAvailable()` is the only place the native code asks. It has two
 * callers, both in that loading step, and its two-word body becomes `return false`, so the step
 * finishes on its first frame and `App::StartGServerLight()` is never called. A bare `bx lr`
 * would not do: r0 holds the CNetworkAvailability pointer the caller passed, which every caller
 * reads as true, so the stub sets r0 first.
 */
internal val networkAvailabilityPatch = patch {
    dependsOn(nativeLibraryCheckPatch)

    execute {
        editLibraries(NativeEdits.NETWORK_AVAILABILITY)
    }
}

/**
 * Shows the low-ammo HUD, and `0/capacity`, for as long as the weapon reloads.
 *
 * `CAmmoWin::Update()` reads the clip, prints it as `clip/capacity`, and calls the weapon low
 * when it is under 34% of the capacity; `CGameplayWeaponInfoWindow::Update()` shows the red ammo
 * icon and the `IDS_HUD_RELOAD` label from that flag. With unlimited ammo the clip is always
 * full, so none of it ever appears.
 *
 * A 36-byte leaf cave replaces the single clip load: it returns 0 while `CDH_Weapon` reports
 * reloading (the `+0x90` and `+0x88 == 3` fields `IsReloading()` reads) and the real clip
 * otherwise. The HUD therefore prints `0/capacity` and its own 34% test turns the red icon and
 * RELOAD label on for the length of the animation, then everything returns to full. The weapon's
 * clip is never changed.
 */
internal val reloadHudPatch = patch {
    dependsOn(nativeLibraryCheckPatch)

    execute {
        for (abi in ABIS) {
            val plan = NativeEdits.HUD_RELOAD.getValue(abi)
            val file = resourceFile(libraryPath(abi))
            val elf = Elf32(file.readBytes())
            try {
                elf.mapExecutablePadding(abi)
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
 * Keeps the clip full. Every shot writes back the round count it read.
 *
 * `CDH_Weapon::MakeShot()` is the only function that lowers the clip at `+0x19c`: one
 * `sub r3, r3, #1` on the common path, and a second one on the path for weapon types 8 and 9.
 * Both become `mov r0, r0`, so the `str r3, [r4, #0x19c]` after each writes the loaded value
 * back. The rest of the function, sound, animation and tracer included, still runs.
 *
 * Reloading is the tap on the ammo display: `CGameplayHUD::PointerPressed()` calls
 * `CheckForReload(true)` only while the clip is below its capacity, and that `bge` becomes a
 * no-op. The forced reload plays its animation and its last step sets the clip to the capacity,
 * the value it already has, so the player can reload whenever they want. [reloadHudPatch] makes
 * the HUD print `0/capacity` during that animation and keeps the red ammo icon and the RELOAD
 * label on screen, the state the game otherwise only shows when the clip runs low.
 *
 * Grenades are counted by `CGrenadeManager`, not by a weapon's clip, and are left alone.
 */
@Suppress("unused")
val unlimitedAmmoPatch = patch(
    name = "Unlimited ammo",
    description = "Ammo never decreases, and reloading still works.",
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    dependsOn(nativeLibraryCheckPatch, obbMessagePatch, reloadHudPatch)

    execute {
        editLibraries(NativeEdits.UNLIMITED_AMMO)
    }
}

/**
 * Stops the two native requests to Glu's `gserve` S3 bucket, which no longer exists (a free
 * bucket name can be claimed by anyone, who would then be serving this game over plain HTTP),
 * takes out the two menu buttons that lead to dead services, drops the offline message the dead
 * time server causes, and leaves out the one time offer that Google's dead billing service was
 * to sell.
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
 * - `CBH_GPSMap::HandleBonuses()` runs on every map update. `CBH_Player::TryMakeFiveDaysBonus()`
 *   pays the daily bonus only against Glu's network time, which never arrives now, so on a new
 *   local day it sets a flag, pays nothing, and the map shows "OFFLINE - NO DAILY BONUS". The
 *   `bne` on that flag becomes a no-op and the function returns as on any other update. The
 *   bonus logic and its saved fields are untouched; the day the message was last shown is kept
 *   only in memory and read nowhere else.
 * - `CGPSMapGame::Init()` shows a one time offer of Glu credits once the tutorial is over
 *   (`COffersManager::ShouldBeShown()`). Its Buy Now goes to Google's in-app billing, which is
 *   gone, and the Java side refuses inside the call: the "Please wait..." window opened that
 *   same frame, so it never gets the failure command, and the game waits forever. The `bne`
 *   into the offer becomes a no-op. `ShouldBeShown()` still runs and counts the showing.
 */
internal val deadServersNativePatch = patch {
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
internal val jniGuardsPatch = patch {
    dependsOn(nativeLibraryCheckPatch)

    execute {
        editLibraries(NativeEdits.JNI_GUARDS)
    }
}

/**
 * Passes the argument `CFileMgr_Android::resDLEvent()` leaves out when it asks the Java side for
 * a string. `ResDLNativeCallback.resdlStringEvent(int, int, byte[])` gets only two of its three
 * arguments, so the byte array lands in the int slot and the `byte[]` slot is stale stack. ART
 * decodes that word as a reference before Java runs; on Android 16 it was 1, which decodes to a
 * null entry, and the game died while loading. Java reads neither the int nor the array, so each
 * copy of the function only needs the array moved to the `byte[]` slot: `str rX, [sp]` becomes
 * `str rX, [sp, #4]`, and the int slot keeps a stale word that nothing reads. The compiler kept
 * two copies of the function, so there are two words per ABI.
 */
internal val jniArgumentsPatch = patch {
    dependsOn(nativeLibraryCheckPatch)

    execute {
        editLibraries(NativeEdits.JNI_ARGUMENTS)
    }
}

/**
 * Gives the sound cache files a file mode. `CSoundEvent_Android::CreateCacheFile()` creates each
 * file with `open(path, O_WRONLY | O_CREAT)` and no third argument, so the mode is whatever the
 * call before left in `r2`: the address of the end of the path on the stack. It changes with the
 * length of the sound's name and with the device's stack layout. Where the storage keeps the
 * mode it is asked for, some files come out without read permission, the Java side cannot open
 * them, and those sounds are silent while the others play.
 *
 * `mov r2, #0660` goes in front of the call. There is no spare word, so the three instructions
 * after it, `cmn r0, #1; mov sl, r0; beq`, become `movs sl, r0; bmi`, which is the same test for
 * a call that returns a descriptor or -1. Four words per ABI. Files made before this stay as
 * they are; the extension's `ExternalStorage` deletes the unreadable ones and the engine writes
 * them again.
 */
internal val soundCacheModePatch = patch {
    dependsOn(nativeLibraryCheckPatch)

    execute {
        editLibraries(NativeEdits.SOUND_CACHE_MODE)
    }
}
