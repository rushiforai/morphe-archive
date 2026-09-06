# Prime Video Patch Watch List

Use this document before changing, building, patching, or installing the Prime Video Android TV patch.

## Confirmed Architecture

- Target package: `com.amazon.amazonvideo.livingroom`.
- Supported versions: `6.23.23+v15.5.0.70-armv7a` and `6.24.5+v16.0.0.231-allAbis`.
- Clone package: `com.amazon.amazonvideo.livingroom.mod`.
- The native hook builds for `armeabi-v7a` and `arm64-v8a`.
- Kotlin patches modify DEX bytecode and package the native library.
- Java extension code provides the bytecode-side ad hooks and native loader.
- C++ code builds `libpvhook.so` and hooks imports in `libignite.so`.
- `System.loadLibrary("pvhook")` causes Android to call `JNI_OnLoad`.
- `JNI_OnLoad` starts a custom worker thread. JNI does not provide the polling loop.
- The worker polls until `libignite.so` is loaded, then replaces its GOT entries for `memcpy`, `memmove`, `__memcpy_chk`, and `__memmove_chk`.
- Proxy functions call the original copy function first. For a strict resolved-ad response match, the hook empties both the destination copy and its authoritative source buffer.

## Ad-Removal Paths

### Path 1: `intraTitlePlaylist`

- The native hook scans copied buffers for `"intraTitlePlaylist":[`.
- A `Remote` item represents an external playback item used for an ad break.
- The verified baseline preserves `Remote` items that contain `getVideoAds`.
- The verified baseline removes other `Remote` items by blanking the complete JSON element without changing the buffer length.
- Removing a complete `Remote` item blocks direct ads, but can cause content-position problems at some ad breaks.

### Path 2: Resolved `getVideoAds` Response

- Path 2 detects a resolved response containing `"playlist":[`, `adDeliverySessionId`, and `"measurement"`.
- It excludes buffers that contain `intraTitlePlaylist` and requires a complete bracket-balanced playlist.
- It blanks the interior of the resolved `playlist` array in the destination and source buffers without changing their lengths.
- This keeps the original break object and lets the app process an empty ad response.
- Source mutation is schema-gated. It does not depend on a device address or code offset.
- The observed caller offset `libignite+0xaea9cf` is diagnostic only. Logs report `knownSite=yes/no`, but this value does not control behavior.

### Java/Bytecode Patch

- Patch name: `Skip ads`.
- The patch includes Media3, ExoPlayer 2, getVideoAds-result, and Volley hooks.
- Prior repository evidence says the Media3 and ExoPlayer hooks did not fire on this tested Prime Video build.
- The Prime Video DEX contains no Media3 `TimeBar` or `DefaultTimeBar` class, and
  no ad-marker setter. Playback and the scrub bar are driven by Ignite. A
  bytecode patch is therefore not the seam for marker suppression.
- Do not assume that the Java/bytecode patch can replace the native hook.
- Disabling `Skip ads` disables several hooks at once. It is not a clean test of only one hook.

Verified in the patched APK (2026-08-31): the Volley hook **is** present and
correctly injected. `enforceAdBlock` is the first instruction of
`com.android.volley.toolbox.BasicNetwork.performRequest(Request)`. It throws
`NoConnectionError` for any URL containing `/cdp/getVideoAds`.

Consequence: if `getVideoAds` were fetched through Volley, it would already be
blocked. The native hook exists because Ignite fetches it through libcurl, which
never touches Volley. Capture the `SkipAdsPatch` tag to confirm which transport a
given playback actually used.

## Confirmed Playback Problem

- Ads can be removed while the main content resumes from the beginning or from an earlier ad-break position.
- The visible content timer can still show the expected position while the displayed video comes from an earlier position.
- Ads use their own progress bar and timer. They do not advance the main content progress bar.
- Therefore, do not describe this as one combined content-and-ad timer.
- Cached player state can affect the first playback after changing patches. Re-test after seeking to the start or clearing the relevant playback state.

## Experiments and Results

### Preserve Every `Remote` Item

Result:

- Ads played.
- Ad markers appeared on the progress bar.

Conclusion:

- Path 2 is not a universal handler.
- Some direct `Remote` entries must be neutralized separately.

### Empty Only the `urls` Array

Result:

- Ads still played.
- Ad markers still appeared.

Conclusion:

- The tested `urls` field is not the only active ad-control field.
- Do not repeat this blind field mutation without inspecting a real object.

### Delete Complete Non-`getVideoAds` `Remote` Items

Result:

- Ads are removed.
- Some ad-break transitions can restart or rewind the main content.

Conclusion:

- This remains the working ad-removal baseline, but it is not a complete playback-safe solution.

### Empty Only the Destination Response

Result:

- Logs confirmed that the destination playlist became empty.
- Ads still played.

Conclusion:

- Prime Video retained or parsed the authoritative source response.
- Destination-only mutation is insufficient.

### Empty Source and Destination Responses

Result:

- The strict response matcher found one authoritative source response.
- Logs reported `PVSOURCEOBS attempted=1 emptied=1`.
- Ads did not appear during one verified playback test.
- No complete `Remote` schedule objects were removed.

Conclusion:

- Preserve the `Remote` schedule and its resume metadata.
- Keep the strict response schema as the behavior gate.

Open risk. `hooks.cpp` records an on-device A/B test from 2026-07-24. That test
found that writing to a copy **source** causes intermittent
`CURLE_BAD_CONTENT_ENCODING` (61) and a "Something went wrong" error. Source
mutation contradicts that finding. Result: one success is not sufficient
evidence. Repeat the test on more than one title before you trust it.

### Rename the Scrub-Bar Marker Key (rejected)

Change: `shouldShowOnScrubBar` renamed to `ignoreShowOnScrubBar`.

Result: markers still appeared.

### Set the Scrub-Bar Marker to False (rejected)

Change: `"shouldShowOnScrubBar":true,"caching"` replaced with
`"shouldShowOnScrubBar":false,"cachin"`. The `caching` key was shortened only to
keep the byte count equal.

Result:

- Markers still appeared.
- Ads returned, and `tvEmptied=0`.

Conclusion:

- `shouldShowOnScrubBar` does not control the visible markers. Markers most
  likely derive from the presence or position of `Remote` entries.
- Never damage an unrelated key to preserve byte length. Renaming `caching` to
  `cachin` removes the app's cache policy for that ad break. This edit
  correlates with the ad regression, and it was reverted.

## Rules Learned

1. Do not change a JSON field until evidence shows the app reads that field.
2. Do not damage an unrelated key to keep the buffer length equal.
3. Do not write to a copy source. See the 2026-07-24 finding in `hooks.cpp`.
4. Keep the size gate and the decompression-chunk skip before any scan.
5. Capture `SkipAdsPatch` together with `PVNativeHook`. A capture that omits the
   Java tag hides half of the system.
6. Replay a captured payload on the host before you build an APK.
7. Read `cpy`, `mov`, `cpy_chk`, and `mov_chk` in the heartbeat before you
   diagnose anything. A zero counter means that hook is not installed, and every
   payload travelling through it is invisible.

## Root Cause of the Intermittent Ads

Confirmed on 2026-08-31 from a three-tag capture.

The hook installer accepted a **partial** install and then stopped retrying:

```cpp
int ok = try_install_once();
if (ok > 0) { installed = true; break; }   // defect
```

`libignite.so` resolves its relocations while the worker polls. A poll that
lands in the middle of that work hooks some import slots and misses others. The
worker then declared success and never repaired the gap.

Evidence from two consecutive sessions of the same build:

| Session | `cpy` | `mov` | Ad responses seen | Result |
|---|---|---|---|---|
| 23:06 | 11,469,613 | 179,210 | 3 | 2 emptied, 1 truncated |
| 23:17 | **0** | 180,401 | **0** | every ad played |

In the second session `memcpy` was never hooked. The `getVideoAds` ad-decision
response travels through `memcpy`, so it was invisible and no filtering could
occur. This explains every previous "`tvEmptied=0` but ads played" report, and it
was misread earlier as a caching problem and as a transport problem.

Fix: require all four copy imports, keep retrying, and repair a partial install
from the heartbeat loop. `try_install_once` skips slots that are already hooked,
so retrying is idempotent. `PVHOOKS` now reports live hook state every 5 seconds.

Observed on the fixed build: two complete failures, then `4/4 copy imports hooked
after 3 attempt(s)`. The race is real and timing-dependent.

## Secondary Cause: Truncated Ad Responses

Also confirmed on 2026-08-31, and still open.

| Call site | Size | Playlist | Outcome |
|---|---|---|---|
| `libignite+0xaea9cf` | 22368 | complete | emptied, 2 ads |
| `libignite+0xaea9cf` | 18560 | complete | emptied, 2 ads |
| `libignite+0xaea9e7` | 39790 | did not close | skipped, ads played |

A response larger than one copy arrives with its `playlist` array cut. The filter
must not edit a truncated array, so those ads survive. `PVRESPONSE_SKIP` now
reports the reason, the cut offset, the number of complete entries before the
cut, and dumps the payload for host replay.

`remote_strip` already solves the same problem for the schedule with
`blank_truncated_complete`: neutralise entries that closed before the cut, never
touch the truncated tail. Validate that approach against a real captured payload
in the replay harness before shipping it.

## Cache Theory: Disproven

The `"caching":{"timeToLive":"PT24H"}` field led to a theory that ad decisions
were served from a 24-hour cache. The 23:06 capture disproves it. Three ad
responses were fetched during one playback and `tvEmptied` climbed 0, 4, 8. No
response was served from cache.

## Volley Transport: Confirmed

`enforceAdBlock` fires and blocks `threeplr-ab5w7agdemte.api.amazonvideo.com`.
It never sees `/cdp/getVideoAds`. With `DOWNLOADER: curl version is 8.9.1-DEV`,
this proves Ignite fetches ad decisions through libcurl and bypasses Volley
entirely. The native hook is required; the Java patch cannot replace it.

## Scrub-Bar Markers: Closed, Not Fixable Safely

Three attempts, all rejected. Do not try a fourth without new evidence.

1. Rename `shouldShowOnScrubBar` to an unknown key. Markers remained.
2. Set it to `false` while renaming `caching` to `cachin`. Markers remained, and
   the corrupted key correlated with an ad regression. Test was invalid.
3. Set it to `false` cleanly, borrowing the extra byte from
   `"timeoutInMs":1750` -> `"timeoutInMs":750`. Verified on-device with
   `PVSCRUB hidden=4/4` on two separate schedules. Markers still appeared.

Conclusion. `shouldShowOnScrubBar` governs the `nonLinearAds` nextUpAd card,
where Amazon ships `false` themselves. It does not govern ad-break markers.
Ad-break markers are drawn from the presence of a `Remote` entry in
`intraTitlePlaylist`.

The full schedule confirms there is no independent marker list. The `Main`
periods are contiguous and sum exactly to `fullTitleDurationMs`:

| Period | start | end |
|---|---|---|
| Main 1 | 0 | 1270916 |
| Main 2 | 1270916 | 3345416 |
| Main 3 | 3345416 | 6214250 |
| Main 4 | 6214250 | 7843000 |

Ad breaks therefore occupy zero content time. Deleting a `Remote` never created
a time gap. It shifted array indices, and the app tracks playback position by
index into that array. That is the true cause of the old restart regression,
not a timeline gap.

Removing a marker requires removing its `Remote` entry, which reintroduces the
restart. The markers are cosmetic and the ads no longer play on them. Keep them.

## Truncated Ad Responses: Fixed

A response larger than one copy is stream-parsed as it arrives, so a complete
buffer never reaches the hook. Verified on-device:

| Size | Playlist | Outcome |
|---|---|---|
| 32075 | complete | emptied, 3 ads |
| 42214 | cut at 32402, 4 complete entries | previously skipped, ads played |

`blank_truncated_ad_entries` now removes the entries that closed before the cut
and never touches the cut entry. The exact 42214-byte payload was extracted from
a device capture and used as a host fixture, reproducing `open=158`,
`complete-entries=4`, `cut=32402` before the fix and `entries removed=4` after.

Applied to the copy destination only. Editing a source mid-stream can corrupt
the gzip CRC; see the 2026-07-24 note in `hooks.cpp`.

## Host Replay Harness

Location: `experimental/primevideo-libignite-native/test/`

The harness runs the exact shipping filter logic against captured payloads on a
host computer, in about one second. Use it before every device test.

Run it:

```powershell
cd experimental\primevideo-libignite-native\test
pwsh -NoProfile -ExecutionPolicy Bypass -File .\run-replay.ps1
```

Turn a device capture into fixtures:

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -File .\extract-fixtures.ps1 `
  -LogFile "C:\repos\J\android\apk\prime-video-private.log"
pwsh -NoProfile -ExecutionPolicy Bypass -File .\run-replay.ps1 `
  -FixtureDir .\fixtures-capture
```

Captured fixtures hold signed URLs and session identifiers. Keep them private.
`fixtures-capture/` is excluded from version control.

Safety invariants enforced by the harness. A failure means the change is unsafe
for the device:

1. The buffer length never changes.
2. A truncated schedule is never modified.
3. A `getVideoAds` break is preserved, never deleted.
4. A decompression-sized buffer is never modified.
5. A truncated playlist is never modified.
6. A playlist reported as emptied contains no ad entries.
7. An unmatched payload is left byte-for-byte unchanged.

## Current Diagnostic Build

- Compile flags are set in `jni/CMakeLists.txt`.
- `PV_EMPTY_REGOLITH=1` enables Path 2.
- `PV_SKIP_GVA_REMOTES=1` preserves `getVideoAds` entries for Path 2.
- `PV_MUTATE_CONFIRMED_GVA_SOURCE=1` enables strict source-response mutation.
- `PV_REMOTE_DIAG=1` enables `Remote` diagnostics.
- `PV_RESPONSE_DIAG=1` enables full resolved-response and before/after diagnostics.
- `PVREMOTE` logs key names and delivery indicators.
- `PVREMOTE_FULL` logs the complete `Remote` object before mutation.
- Long objects are split into numbered chunks with `id`, `part`, and `index` fields.
- Full-object logs can contain signed URLs, session data, ad IDs, or device/account identifiers. Keep them private and delete them after analysis.

Capture logs. Include the Java tag:

```powershell
$adb = "C:\repos\J\android\android-sdk\platform-tools\adb.exe"
& $adb -s "<device>" shell am force-stop com.amazon.amazonvideo.livingroom.mod
& $adb -s "<device>" logcat -c
& $adb -s "<device>" logcat -v time -s PVNativeHook:V SkipAdsPatch:V DOWNLOADER:V `
  > prime-video-private.log
```

Reproduce the problem, then press `Ctrl+C`.

Useful log markers:

- `PVREMOTE_FULL`: Full pre-mutation `Remote` object.
- `PVREMOTE`: Key names and delivery classification.
- `PVKILL path=movie`: Path 1 removed direct `Remote` items.
- `PVKILL path=tv`: Path 2 emptied a resolved ad playlist.
- `PVRESPONSE`: Strict response match, caller offset, hash, bounds, and ad count.
- `PVRESPONSE_FULL`: Complete pre-mutation response in numbered chunks.
- `PVRESPONSE_AFTER`: Post-mutation playlist context and empty-state confirmation.
- `PVSOURCE`: An authoritative source response was emptied.
- `PVSOURCEOBS`: Aggregate source match and mutation counts.
- `PVSKIP`: An entry was preserved.
- `PVOBS`: Aggregate movie and TV removal counts.

## Build Checklist

The Gradle build does not compile the C++ source. Always rebuild and replace the bundled `.so` after native source changes.

Native build requirements:

- Android NDK. Default local path: `%USERPROFILE%\3D Objects\Tools\android-ndk-r27c`.
- CMake.
- Ninja.
- ABIs: `armeabi-v7a` and `arm64-v8a`.
- Android platform: API 23.

Expected native outputs:

`experimental/primevideo-libignite-native/jni/build-v7a/libpvhook.so`

`experimental/primevideo-libignite-native/jni/build-arm64/libpvhook.so`

Copy it to:

`patches/src/main/resources/native/armeabi-v7a/libpvhook.so`

`patches/src/main/resources/native/arm64-v8a/libpvhook.so`

Build and copy both ABIs with the persistent NDK:

```powershell
.\experimental\primevideo-libignite-native\build-native.ps1
```

Verify that both files have the same SHA-256 hash before building the MPP.

Build the MPP:

```powershell
.\gradlew.bat buildAndroid "-Pgpr.user=morphe" "-Pgpr.key=morphe"
```

Current output:

`patches/build/libs/patches-1.0.0.mpp`

## APKM Rule

**Never patch only `base.apk` from this Prime Video APKM.**

The ARM split contains required original libraries:

- `libc++_shared.so`
- `libignite-android-support.so`
- `libignite-unwind.so`
- `libignite.so`
- `libignite_allocator.so`
- `libprime-video-device-layer.so`

Patching only `base.apk` produces an APK that installs but crashes with:

```text
java.lang.UnsatisfiedLinkError: dlopen failed:
library "libprime-video-device-layer.so" not found
```

Pass the complete `.apkm` file to Morphe CLI. Morphe CLI merges all splits before patching.

## Clone and Signing Checklist

- Enable `Clone Prime Video` when the original system app cannot be replaced.
- Confirm the output package is `com.amazon.amazonvideo.livingroom.mod`.
- Android requires updates to use the same signing certificate as the installed clone.
- The installed clone on the tested TV uses:
  - Certificate subject: `CN=Morphe`
  - SHA-256: `21b77fc708db3a330463496f632bef7e9722c732c3551f3d6479c78f924c30a7`
- `Morphe.keystore` matches that certificate.
- Alias: `Morphe`.
- Key-entry password: `Morphe`.
- `Manager.keystore` is a different ReVanced certificate and cannot update the installed Morphe-signed clone.

Patch command pattern:

```powershell
java -jar C:\repos\J\android\bin\morphe-cli-1.9.1-all.jar patch `
  <input.apkm> `
  --patches=<patches-1.0.0.mpp> `
  --enable="Clone Prime Video" `
  --keystore=<Morphe.keystore> `
  --keystore-entry-alias="Morphe" `
  --keystore-entry-password="Morphe" `
  --out=<patched.apk>
```

Verify before installation:

```powershell
aapt dump badging <patched.apk>
apksigner verify --verbose --print-certs <patched.apk>
```

Install:

```powershell
adb install -r <patched.apk>
```

## Launch Verification

After installation:

```powershell
adb logcat -c
adb shell am force-stop com.amazon.amazonvideo.livingroom.mod
adb shell monkey -p com.amazon.amazonvideo.livingroom.mod -c android.intent.category.LEANBACK_LAUNCHER 1
adb shell pidof com.amazon.amazonvideo.livingroom.mod
adb logcat -d -v brief AndroidRuntime:E DEBUG:E libc:F PVNativeHook:V "*:S"
```

Expected startup behavior:

- The package process remains alive.
- `JNI_OnLoad` reports that `libpvhook.so` loaded.
- The worker reports four of four copy imports hooked after `libignite.so` appears.
- No `AndroidRuntime` fatal exception appears.

## Regression Watch List

- Verify pre-roll and mid-roll ads on more than one title.
- Verify seeking across every former ad marker.
- Verify subtitles remain synchronized after each former ad break.
- Verify no restart, rewind, black screen, buffer lock, or playback error occurs.
- Verify `PVSOURCEOBS emptied` increases when a non-empty ad response is received.
- Verify `knownSite=no` matches still behave correctly on future app versions.
- If Amazon changes the response schema, fail closed: preserve the response instead of mutating an incomplete or ambiguous buffer.
