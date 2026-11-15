# Shuffle+ for Spotify (Morphe patch)

True random shuffle for Spotify on Android. Long-press Now Playing's shuffle button and the current
playlist, album or Liked Songs plays in Fisher-Yates order (`SecureRandom`), with Spotify's own shuffle off.

Based on Shuffle+ from [spicetify/morphe-patches](https://github.com/spicetify/morphe-patches), with the
9.1.94.1929 port from [Martinikaws/spotify-merged-patches](https://github.com/Martinikaws/spotify-merged-patches).
Everything else (themes, Marketplace, ads, home pins, local files, settings) is removed. GPLv3, see `LICENSE`,
`NOTICE` and `THIRD_PARTY_NOTICES.md`.

## What it does

| Gesture | Result |
|---|---|
| Long-press the shuffle button | Shuffle+ the playing playlist, album or Liked Songs |
| Tap (option `tapShuffles`) | Same, so Spotify's own shuffle never turns on from this button |
| Songs played in the last N hours (option `recentHours`, default 24, 0 = off) | Moved to the end of the shuffle |

Free accounts get a "Spotify refused" toast: Spotify only lets Premium choose the play order.

## Target

Spotify arm64 builds, as an APKM or XAPK bundle. Any other build is refused:

| Version | Version code |
|---|---|
| **9.2.0.2053** | 148387875 |
| 9.1.94.1929 | 147600575 |

## Morphe Manager

Add `github.com/farbener/shuffle-plus-spotify` under **Sources**, patch Spotify (supply the APKM or XAPK of a
supported version), and the Manager flags new releases and re-patches in place. For updates over an existing
install, import the keystore the earlier build was signed with (**Settings > Signing key**), or Android refuses
the install. `patches-bundle.json` is the release metadata the Manager reads; the release workflow updates it.

## Build and patch

```powershell
.\build-and-patch.ps1 -Apkm E:\ShufflePlus\apk\spotify-9.1.94.1929.apkm -TapShuffles -Install
```

Needs Android Studio (Java 21), the `morphe-desktop` jar, and `gh auth refresh -s read:packages` once, because
the Morphe Gradle plugin is served from GitHub Packages. The patched build has a different signature from
Spotify's, so the stock app must be uninstalled once; later builds install over it with `adb install -r`.

Log tag for `adb logcat`: `ShufflePlus`.

## How it works

- **Bridge** (`PlayerBridge`, `CosmosRouter`, `Esperanto`, `Wire`): talks to Spotify's native core over its
  own router, found at the end of `SharedCosmosRouterService.<init>`. It keeps the player-state stream open
  to know what plays.
- **Shuffle** (`ShufflePlus`): lists the context's songs, shuffles them, sends one explicit play order, then
  queues the first 100 songs of it and tops the queue up when 20 are left. The queue is what makes the order
  follow you to another Spotify Connect device (a play command's explicit order is dropped there).
- **Button hook** (`NowPlayingShuffle`): the button class is found by shape, not by its obfuscated name.
- **Protocol check**: the patch compares every protobuf field number the extension uses against the APK and
  refuses on any difference.

## Updating to a new Spotify version

1. Run the patch on the new APKM. It fails loudly if a hook or a protobuf field moved.
2. The shuffle-button match needs exactly one candidate; the router hook needs the `nativeRouter` store.
3. Fix whichever check failed, add the new version to `Compatibility.kt`, rebuild, test on a device.
