# Music apps on third-party Android Auto hosts

> **Current Spotify target (2026-11-08):** support was rebased to **9.1.94.1929 / 147600575**
> (universal APK, minSdk 24) and the 9.2.0.26 target was dropped. The 9.2.0.26 investigation
> below is retained as history; the live mappings are in `patches/spotify/`. On 9.1.94 the gates
> live in `j4a1.d`, `di60.b`, `y34.b`, `r8p0.n`, `k34.a` and the Home wrapper `bjn0`. The widget
> permission check and the plan-logo renderer do not exist there, so those two controls are not
> offered.

Investigation date: 2026-11-07. Inputs from the original publisher APKs in `~/Desktop/music`. The
Spotify row shows the current target; the 9.2.0.26 analysis further down is historical and that
target is no longer supported:

| App | Version / build | Input | minSdk | Signer SHA-256 |
| --- | --- | --- | --- | --- |
| Spotify | 9.1.94.1929 / 147600575 | APK | 24 | `6505b181…5e28ffd` |
| Apple Music | 7.0.0 / 1614 | APKM | 30 | `771d8674d3d9837c9edf11b11873443998f19105abcecab425ed9b8e6fefff9b` (33+) and `88ba590ec2e1ea33c4458daf59489faee2cef297a9b4071e18cf82ef531100aa` (24–32) |
| TIDAL | 2.216.0 / 10020 | APKM | 32 | `2e74cf21cde153a6e6abdb2c9a3fb5f26fc5c4c6bcdb635152b967459487ea96` (33+) and `2e8a4794a95418367e36c84303feb43774919d6a351129d23d0fcf1b0b729454` (24–32) |
| Deezer | 9.0.26.3 / 9002603 | APKM | 32 | `51a891a6c5d17b4e36a6f46bab675c1cae786a5af06f51d0105dab7ec6a94516` |
| Qobuz | 10.1.3.0 / 26102008 | APK | 23 | `20c8212f9713a62ac5baee54f5c9c716cd01912fab47cde217a929b00bd6b6a9` |

DriveDeck (`app.johninnl.drivedeck`, package suffix `.dev` for debug builds) reads the app's exported
`MediaBrowserService` and `automotive_app_desc`; it does not rely on Google's approval list. It binds
as an ordinary media client, so the app's `onGetRoot` receives DriveDeck's package and UID, not
`com.google.projection.gearhead`.

## Finding

All five apps declare `automotive_desc` with `<uses name="media"/>` and export a media-browser
service. The blocker is each app's caller policy, not the descriptor:

| App | Gate | Effect |
| --- | --- | --- |
| TIDAL | `z72.a(package, uid, client)` | callers are compared with TIDAL's known-car signature list; unknown hosts get a null `BrowserRoot` |
| Deezer | `IIlIIIIlllIlIlI.lllIlIIIlllIIII(...)` | same package/signature list; the root is replaced by null |
| Apple Music | `com.apple.android.music.player.c0.l(...)` | media3 library-root callback returns `RESULT_ERROR_NOT_SUPPORTED`; `__AUTO_ROOT__` is built only for `gearhead` |
| Spotify | `p.n64.b`, `p.jo31.o`, `p.z54.a`, `p.ux60.b` | Android Auto root and Browse/Recently played/Your Library roots are offered only to `gearhead` and `com.spotify.auto.mediatest`; the CAL validator checks package + certificate |
| Qobuz | none | media3 `MediaLibraryService` default root; no signature/UID/`gearhead` test |

Qobuz 10.1.3.0 has no caller allowlist: its `MusicService`/`ka9` callback has no package, signature or
`gearhead` branch, and the media3 legacy adapter accepts an ordinary `MediaBrowser`. No Qobuz patch is
therefore shipped; a missing Qobuz entry on a host points at the host's media catalogue.

## Patches

- TIDAL: skip the verdict branch in `z72.a` (`if-eqz` → `nop`). `onGetRoot` still constructs the
  `MediaBrowserClient.AUTO` root.
- Deezer: skip the equivalent verdict branch in `IIlIIIIlllIlIlI.lllIlIIIlllIIII` (`if-eqz` → `nop`)
  before the null store.
- Apple Music: force the caller verdict true before `if-nez` in `c0.l`; replace the `String.equals`
  result for `com.google.android.projection.gearhead` with `const/1` so the car root is used.
- Spotify:
  - `p.ux60.b(tw60)` returns `true` (`HostValidator.ALLOW_ALL_HOSTS` semantics).
  - `p.n64.b(String)` returns `true`, so the Android Auto root provider `p.n64` accepts any host.
  - `p.jo31.o(String)` returns `true`, covering the shared car-host checks in root and playback paths.
  - `p.z54.a(r9c)` has its three `equals("com.google.android.projection.gearhead")` results replaced with `1`, so the
    three partially-gated roots stay visible.
- All four patches add `android.permission.QUERY_ALL_PACKAGES` because Android 11+ hides an arbitrary
  host package from `PackageManager.getPackageInfo`, which the gate itself needs.

## Spotify patch port

The 11 patches that were ported for 9.2.0.26 are ported from `../spotify-patches` with these changes:

- Package `app.pablobaro.*` → `patches.spotify`/`nl.johninnl.spotify`.
- The `app.morphe.util` helpers that the source repository used are replaced with local
  `patches.spotify.shared` implementations so the bundle builds against this repository's patcher.
- Compatibility was pinned to 9.2.0.26 / 148373686 and the original signer (superseded by
  the 9.1.94.1929 / 147600575 pin above).
- `Hide ad views`, `Hide context menu upsells` and `Diagnose Spotify client` are not ported: their
  exact target classes (`GetViewModel`, the ad view types, `FailedToLoadHomeStructure`) are absent
  from 9.2.0.26 and the patches fail with a fingerprint error. Shipping them would make the default
  patch run fail.

## Existing experimental ad fix

`DisableAdBreaksPatch` sends `spotify.ads.esperanto.proto.Settings/updateSlotEnabled` for the audio
slots `stream` and `preroll` with `enabled = false`. The proto layout is confirmed:

- `UpdateSlotEnabledRequest`: field 1 = `slot_id` (string), field 2 = `enabled` (bool).
- Spotify's `p.jx0` constant list names the real slots (`stream`, `preroll`, `podcast-midroll-1`, …).

The community extension looked up `access$createRequest` on the Cosmos transport. In 9.2.0.26 R8
exposes the factory as public `createRequest(String, String, byte[], String)`; `access$createRequest`
no longer exists. The old extension therefore caught `NoSuchMethodException` and logged it while the
patch reported success: a silent no-op. The port resolves `access$createRequest` (older builds) or
the public `createRequest` (9.2), keeps the router lookup and repeats the request every minute.

## Ad skip and the zero-second stream

`AdMedia` (field 3 `duration`, plus media-file fields) is display data; `p.t2p1` maps an `Ad` to a
`spotify:ad:<id>` player track and the native ConnectState player resolves the audio file. A
Java-side rewrite of the ad media would need to control that native content resolution. The app
exposes a `GetAds` esperanto response whose empty `AdPackage`/`AdQueue` would deliver no ad, but the
ad client also consumes server-pushed slot events (`SubSlotResponse`), and returning null from
`GetAds` is not proven to mean "no ad" to the native queue. Shipping that without an account-backed
playback test would risk retry loops or interrupted playback.

The shipped fallback is **Skip audio ads**: `MuteAudioAdsPatch` now listens to the media session's
metadata. On an ad it calls `MediaSession.getController().getTransportControls().skipToNext()`, the
same route as a head unit's next button (`xxh0.p` → `hyh0.p` → ConnectState `SKIP_TO_NEXT`). Ad
skippability is carried by `ContextTrack` metadata (`ad.is_skippable`, `ad.skippable_ad_delay`) and
native restrictions. If the player refuses the skip, the patch seeks to the ad's end and then mutes
only as a last resort, so the remaining playback is zero where seeking is allowed. This is a
media-position substitute, not a replacement of the native media file itself.

## Verification

- `./gradlew :patches:buildAndroid :patches:test :patches:generatePatchesList testDebugUnitTest`
  passed.
- Morphe CLI applied the TIDAL, Deezer, Apple Music and Spotify car patches to the exact original
  archives. All reported `Applied`, and the rebuilt resources/dex were decompiled again:
  - TIDAL `z72.smali`: the verdict branch is `nop`; `QUERY_ALL_PACKAGES` is present.
  - Deezer `IIlIIIIlllIlIlI.smali`: the verdict branch is `nop`; the permission is present.
  - Apple Music `c0.smali`: `const/4 v10, 1` precedes the verdict; the gearhead `move-result` is
    `const/4 v1, 1`.
  - Spotify `ux60.b`, `n64.b`, `jo31.o` return `1`; all three `p.z54` gearhead results are
    `const/4 v2, 1`; the permission is present.
- Morphe applied the 11-patch Spotify set (including Disable ad breaks and Change package name) on
  the original 9.2.0.26 archive with no failed patch.
- `LinkSanitizerTest` covers the ported link-sanitizing helper.
- Not verified: signed-in playback, Premium/free ad delivery, actual car rendering, and physical
  head units. Those require the user's accounts and hardware and are not claimed by this note.


## 9.1.94.1929 verification

Target: `com.spotify.music` 9.1.94.1929, versionCode 147600575, universal APK
(signer `6505b181…5e28ffd`), minSdk 24, `apkFileType = APK`.

- The patch bundle built with `./gradlew :patches:buildAndroid`, `:patches:test` and
  `:patches:generatePatchesList`.
- Morphe CLI applied every default patch to the original APK with no failure: Android Auto
  support, Block popup ads, Hide Premium tab, Hide ad sections, Hide download buttons, Hide
  playlist ads, Hide premium context-menu rows, Hide premium settings sections, Hide shuffle
  controls, Hide video ads, Hide video shelves (safe), Remove shuffle restriction, Sanitize
  sharing links, Show Premium in the account row and Skip audio ads.
- The opt-in patches applied in a second run: Android Auto Up next, Disable ad breaks and Force
  play order. Change package name applied in a third run.
- Re-decompiled output confirmed the intended changes: `j4a1.d`, `y34.b` and `r8p0.n` return
  true; `di60.b` returns true; three `k34.a` gearhead verdicts are `const/4 1`; both `bjn0`
  fallback branches are nop'ed; Home switch keys 10/18/21/24 target the skip branch; both
  `oq10.m` peek gates are nop'ed; `mf71.a` sends shuffle=false; the context-menu and settings
  section filters are injected; the account/plan labels use `R.string.premium`; the shuffle
  restriction returns an empty `yn70`.
- A Debug-signed build with Change package name (`com.spotify.music.morphe`) installed on the
  acceptance phone and launched to Spotify's LoginActivity with no crash, `VerifyError`,
  `NoClassDefFoundError` or ANR. `QUERY_ALL_PACKAGES` is present in the rebuilt manifest.
- Not verified: signed-in playback, Premium/free ad delivery, actual car rendering and physical
  head units. Those require the user's accounts and hardware.

## Runtime acceptance on the user's phone

Device: OnePlus CPH2747, Android 16, USB serial `3B164A01H1Z00000`. Spotify Free account,
package `com.spotify.music`, no prior installation. Candidate signed with a local test key.

The first candidate crashed immediately:

```
java.lang.NoClassDefFoundError: Failed resolution of:
Lnl/johninnl/spotify/spotify/DisableAdBreaksPatch;
  at com.spotify.esperanto.esperanto.CoroutineClientBase.<init>
```

Cause: the ported patches build their extension descriptors as
`EXTENSION_PACKAGE + "/spotify/Class"`, while `EXTENSION_PACKAGE` had already been set to
`Lnl/johninnl/spotify`. The descriptor therefore resolved to `.../spotify/spotify/...`. Fixed by
setting `EXTENSION_PACKAGE = "Lnl/johninnl"`; the rebuilt candidate starts and renders Home with no
crash and the extension runs:

```
I/SpotifyPatches: Requested disabled audio ad slots for CosmosCoroutineTransport: stream, preroll
```

`adb shell cmd media_session dispatch next` changed the playing track five times on the same
candidate, confirming the media-session next route used by `Skip audio ads` is live. A bounded
free-tier playback monitor is watching for the first ad break.
