# Belote.com patches: technical notes

Target: **Belote.com 2.12.9 (versionCode 2216), arm64-v8a**, package `com.gameduell.mobile.belote`.
Input is the Play Store split set (`base.apk` + `split_config.arm64_v8a.apk`) as an `.apkm`.

| Item | Value |
|---|---|
| Signer certificate SHA-256 | `bf4878918606c0d31601400aea006f25ec223ca0eacf219ad5ac67d510d51e93` |
| Signer certificate SHA-1 (MicroG spoofing) | `8be911a94d207f9ae65d4e25ecc872748eec3dd5` |
| `lib/arm64-v8a/libil2cpp.so` SHA-256 | `47d5c37ff848231a98e6a0a2400f5f3d28f54d6525fbed8c03ac36554c1240b1` |
| Engine | Unity 2022.3.62f2, IL2CPP, metadata v31 (not encrypted) |

There is no PairIP and no Play Integrity check. `libsigner.so` belongs to the Adjust SDK and does
not check the APK.

## Patches

| Patch | Source | How | Tested |
|---|---|---|---|
| Claim daily bonus automatically | `dailybonus/ClaimDailyBonusPatch.kt` | Hooks after `MenuUIViewController.Show(bool)` and `RefreshDailyBonus`. Once per launch they call `ActivityBonusManager.Claim(4, slot, "WHEEL", null, onError)` (the wheel's own request, the server picks the reward slot), then `InventoryManager.FetchServerData` so the chip counter updates. `onError` is a real `System.Action` built through the exported IL2CPP API, because the game calls it without a null check. | Emulator: claim granted, counter 2000 → 2100, wheel never opened. Phone: installed. |
| Auto-collect daily wheel | `dailybonus/AutoCollectDailyWheelPatch.kt` | Hooks after `FortuneWheelUIViewController.Show` (→ `OnFreeClicked`), `OnFreeSpinCompleted` (→ `OnCollectFreeClicked`) and `<CollectFree>b__55_0` (→ `OnCloseClicked`). | Emulator: spin granted, chips collected, wheel closed. |
| Auto-open packs | `collections/AutoOpenPacksPatch.kt` | `CollectionManager.IsDebugAutoPackOpeningActive` returns true, and the debug delay goes from 3.0 s to 0.25 s. The same flag makes `AlbumCompleteAnimation`/`CollectionCompleteAnimation` continue on their own. | Phone: 9 packs opened in a row. |
| Fast pack opening | `collections/FastPackOpeningPatch.kt` | Zeroes the `WaitForSeconds` of `<ShowPackOpening>d__19`, `<ShowGrantedItems>d__19` (0.35 s per card), `<ContAnim>d__22` and the album hand-over `<DistributePackRewards>d__32` (including the 1 s before the next pack). Card flights go from 0.5 s to 0.125 s. The pack's own Animator clip still plays. | Phone: first version. Hand-over waits added afterwards. |
| Remove ads | `ad/RemoveAdsPatch.kt` | The only interstitial placement is before Solo (training) games. `InterstitialAdTask.Load` returns immediately, and `MenuUIViewController.OnTableTileTraining` always takes its "no ad loaded" branch. Rewarded videos (opt-in) are unchanged. | Emulator: Solo game started directly, no ad activity. |
| Fast startup on VPN | `misc/network/FastStartupPatch.kt` | `assets/aa/settings.json`: `m_CatalogRequestsTimeout` 0 (none) → 10 s, `m_maxConcurrentWebRequests` 500 → 8. Startup waits in `Belote.AssetManager.Initialize` for the album catalogs on the CDN, which could stall for minutes behind a VPN. | Phone behind VPN: catalog step 2 s (was a hang). Emulator without VPN: ~1 s. |
| MicroG-RE support | `misc/gms/MicroGSupportPatch.kt` | Same string transform as the official GmsCore patch for the `com.google` account type, the GMS package, `*.START` service actions, sign-in intents and authorities. Adds MicroG-RE spoofing metadata with the original signer. `isGooglePlayServicesAvailable` returns 0 and `ensurePlayServicesAvailable` returns early. c2dm/FCM push is left alone. | Phone: Google login works. |

### Hidden dependency: re-signing fix

`shared/ResignFixPatch.kt` is applied with every patch. Login with Amazon checks its API key
against the signing certificate, so in a re-signed APK `LoginWithAmazon.logout` throws
"Invalid API Key" when "Play as guest" is pressed, and the startup flow restarts forever. The fix
reports a successful sign-out instead (nobody can be signed in to Amazon with the new signature).

## Native code

`shared/NativeLibrary.kt` checks the library hash once (`verifyNativeLibraryPatch`), then every
edit checks the original instruction before writing (`applyNativeEdits`).
File offset = virtual address − `0x4000` in the executable LOAD segment.

[`native/belote`](../native/belote) holds the hook code:

- `hooks.c`: the hooks, freestanding C.
- `hooks.S`: trampolines. Each hooked method starts with a PC-independent stack store; the
  trampoline replays it and jumps to the second instruction.
- `link.ld`: absolute addresses of the game methods, exported IL2CPP API functions and the cave.
- `build.py`: compiles and links at the cave and regenerates `shared/NativeData.kt` (payload,
  hook branches and all instruction edits with their expected originals). Needs `clang-18` and
  `ld.lld`.

The cave is `StartupManagerFsmWeb::DefineFsm` (`0x1cf6d54`, 39 844 bytes), the startup flow of
the WebGL build that never runs on Android. Its lazy-init flag byte (`0x402980b`, `.bss`) stores
the claim state. IL2CPP calls are `(this, args..., MethodInfo*)` and the hooks pass `null` for
`MethodInfo*`.

## Finding the addresses

Method addresses come from the IL2CPP metadata (method token → `Assembly-CSharp.dll`
CodeGenModule method pointers) and field offsets from the metadata registration. Metadata usage
slots are pointers to `TypeInfo` variables (two dereferences to reach the class). String literal
usages are encoded as `(5 << 29) | (index << 1) | 1` before first use.

All addresses are valid for this exact build only. A game update needs them derived again.

## Installing

The patched APK has a different signature, so the original must be uninstalled first. Link the
game account to Google or Facebook before doing that. Later builds signed with the same key
install over the patched one and keep the data.
