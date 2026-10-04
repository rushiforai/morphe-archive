# Thread Ripper patches (YouTube Android, Morphe)

Use Traditional Chinese with the maintainer. Reference device: the maintainer's phone (vivo V2417A, China ROM OriginOS, Android 16) running YouTube 21.16.256 patched by Morphe Manager with official Morphe Patches v1.45.0, "Spoof video streams" = visionOS. The stutter only happens on the phone; desktop web YouTube is fine.

## Why this exists

- Desktop web YouTube is SABR-only (POST + UMP) and fast; there is nothing byte-range based to parallelize. The old userscript in `archive/web-userscript/` never triggered on real YouTube and is frozen. Keep it only as history.
- Spoofed non-SABR clients (visionOS, Android VR Downgraded) make the app download `/videoplayback` byte ranges. googlevideo limits each request; concurrent requests for different parts add up. This is the same situation Bilibili-thread-ripper (BTR) solves, so the patch follows BTR's idea: split a range into chunks, download concurrently, deliver strictly in order.

## Layout

- `patches/`: Kotlin bytecode patches `Multi-connection video download` and `Video buffer preload` (Morphe patcher). Fingerprints match media3 structure and strings, not obfuscated names.
- `extensions/youtube/`: Java runtime (`ThreadRipper` injection points, `Session` scheduler, `MediaRequest` DataSpec reader, `Config`). `extensions/youtube/stub/` holds compile-only Cronet API stubs.
- `archive/web-userscript/`: frozen v0.2.0 userscript with its own MIT license and BTR attribution.

## Hook (YouTube 21.16.256)

The UMP media data source (`alai` in 21.16.256; found by strings `/videoplayback`, `ump`, `range`) wraps media3 `CronetDataSource`. Its open/read/close get a call into `ThreadRipper`; `-2` means "not handled, run the app's code". When handled, the hook still calls BaseDataSource transferInitializing/transferStarted/bytesTransferred so the app's bandwidth meter and ABR see the real transfer. Chunk requests use the app's own `CronetEngine` (HTTP/3), GET with `&range=`; the app's own requests are POST without body.

Not handled (left native): ranges below `min_split_kib`, unknown length, SABR (`sabr=1`, request bodies), live (`sq`, `live=1`), non-googlevideo hosts. If the first response is not 2xx (e.g. 403), the range goes back to the app so its own error handling runs.

## Preload (LoadControl)

`Video buffer preload` hooks the end of the app's LoadControl.shouldContinueLoading (`alkg.f(cus)` in 21.16.256; fingerprint string `scl.`), just before `this.o = decision; return decision`. `Preload.shouldContinueLoading` gets the app's decision, allocator bytes, the byte limit, bufferedDurationUs and speed; it turns "stop" into "continue" while buffered < `preload_s` and allocator < `preload_mib`.

- Measured (DEFAULT buffer, 4K, 3x): the app is byte-limited, not time-limited. Limit `l = (389+38) × 50 KiB ≈ 20.8 MiB` (server-overridable); the buffer cycles 10–25 s of media (3–8 s real time at 3x). The 60 s / 120 s time limits never apply.
- Official Morphe "Playback buffer size" (`PlaybackBufferPatch`, same method) divides buffered duration by 1/2/4/8 and multiplies the byte limit, capped at max(limit, 128 MiB). Our hook runs after it and logs the scaled limit, so `limit=` in the log shows the user's setting.
- With preload 90 s / 250 MiB: buffer reaches 90 s within about 6 s of playback and stays at 68–102 s; allocator up to about 190 MiB, Java heap up to about 300 of 512 MiB.
- Startup: with equal-priority chunks a slow first segment (13 Mbps) delayed playback to 11 s vs 4.5 s native (one cold start each). `Session` now lowers Cronet priority with distance from the read position; the next cold start played at 4.2 s (first segment 40 Mbps, so not a clean comparison).
- Ceilings measured on the emulator (paused, so only the LoadControl decision limits the buffer; `.local/results/bufexp-1003`): 1080p Default 117 s (the app's time target starts near 20 s and grows about 10 s every 30–40 s for 5 min, then the 20.8 MiB limit), official Maximum 657 s (starts at 174 s, grows about 10 s every 4 s, stops at 128 MiB), preload 300 s/250 MiB 309 s. 4K: Default 10 s, Maximum 63 s (128 MiB). Because the official Maximum out-buffered the 300 s target at 1080p, the preload default became 900 s (2026-10-03); our hook never turns "continue" into "stop", so Maximum + preload gives the larger of the two.
- Emulator caveats: its network latency drifted from ~20 ms to 150–500 ms while the host stayed at 16 ms, and throttling (`emu network speed`) has no effect; use it for LoadControl logic, not for download speed or startup time. Phone cold start (Maximum, 1080p, 3x, `debug.tr.log` Startup lines): about 3 s from `am start` to PLAYING, of which about 1.3 s is app start before the first media request; MediaSession PLAYING matched the first moving frame within 0.5 s. On the phone logcat's monotonic clock and /proc/uptime differ (sleep), align with the TRSYNC line.
- Defaults until 2026-10-03: 300 s / 250 MiB: whichever limit comes first (4K hits memory first). Measured at 4K 3x with 300 MiB (about 150 s of media): allocator 312 MiB, Java heap peak 417 of 512 MiB in the first minute and 464 MiB later (318 MiB allocator), no crash; the default is therefore 250 MiB (about 120 s of 4K). Startup is not network-bound any more: first byte 145 ms, first 1 MiB chunk 0.65 s after open, playback 5 s after app launch. Stalls in the first 30 s still happen when total throughput drops (12–14 Mbps over 8 connections for about 28 s) before the buffer has built up; 4K at 3x consumes about 50 Mbps.

## Develop and verify

- Build: `GITHUB_ACTOR=... GITHUB_TOKEN=$(gh auth token) ./gradlew buildAndroid` (token needs `read:packages`) → `patches/build/libs/patches-*.mpp`.
- `scripts/device/install.sh`: build, patch the original APK with official `patches-1.45.0.mpp` plus ours, sign with the user's exported `Morphe.keystore` (Morphe Manager default credentials), `adb install -r`. Inputs live in ignored `.local/` (original APK, keystore, official bundle, morphe-desktop CLI, jadx, decompiled 21.16.256 sources in `.local/yt-src-21.16.256/`, past results). Never commit anything from `.local/`.
- The vivo phone shows an install confirmation screen for adb installs: tell the user before installing.
- The phone runs with `log.tag=I`; debug logs are dropped, so the extension logs at info level when `log=true`.
- Runtime switch without repatching: system properties `debug.tr.enabled`, `debug.tr.threads`, `debug.tr.chunk_kib`, `debug.tr.min_split_kib`, `debug.tr.log`, `debug.tr.preload_s` (default 900, 0 = off), `debug.tr.preload_mib` (default 250), `debug.tr.rebuffer_ms` (off) (`adb shell setprop debug.tr.threads 1`), read on every media request. `threads=1, chunk_kib=65536` reproduces the app's one-request-per-segment behaviour for A/B; classify results by the logged actual `threads`, not by intended mode.
- Stopping a background task in this Windows/Git Bash setup does not kill child scripts; an orphaned A/B loop kept writing settings and mislabeled rounds. Check `ps -ef` and kill leftovers before a new run.
- Stall ground truth: `scripts/device/freeze-ab.sh` (cold start per period at a fresh position, screen recording) + `freeze-report.sh` (ffmpeg freezedetect, counted after first PLAYING). MediaSession BUFFERING disagreed with what the user saw and is not used as the stall metric. Keep start positions inside the video length.
- Network diagnosis: `scripts/device/net-monitor.sh OUTDIR CACHE_NODE_IP` samples Wi-Fi, gateway/1.1.1.1/cache-node ping, thermal state and per-range throughput every ~2 s while the phone is used normally. DNS was ruled out for the slow window seen on 2026-10-03 (same node and answers from every resolver; the China ROM itself appends 114.114.114.114 to DHCP DNS).
- Verify on the phone with uncached videos (a replayed video plays from disk cache and makes no requests). Compare modes interleaved, because network capacity varies minute to minute; a single before/after pair is not evidence.

## Release

Published as a Morphe patch source: Morphe Manager reads `patches-bundle.json` from `main`, which points at the `.mpp` attached to a GitHub release.

The repo is public but for the maintainer's own use: do not list it (awesome-morphe and similar), open issues/PRs upstream, or announce it anywhere unless the maintainer asks.

1. Bump `version` in `gradle.properties`, build (`./gradlew buildAndroid`), and check the patch on the device.
2. Update `patches-bundle.json` (`version`, `created_at`, `description`, `download_url` = `https://github.com/bennytsai1234/youtube-thread-ripper/releases/download/v<version>/patches-<version>.mpp`).
3. Commit, tag `v<version>`, push, then `gh release create v<version> patches/build/libs/patches-<version>.mpp`.

## Settings and stall recovery

- Settings screen: an internal resource patch (`settings/SettingsResourcePatch.kt`, dependency of every patch) appends a "Thread Ripper" PreferenceScreen to `res/xml/morphe_prefs*.xml` in finalize. The official settings patch copies those files in execute and appends its own preferences in finalize; morphe-patcher runs all executes before any finalize, so the order of the two finalize blocks does not matter. The official fragment skips keys without a Morphe Setting, and Android stores the values in `morphe_prefs` (`tr_*` keys), which `Config` reads via `ActivityThread.currentApplication()`. Precedence: `debug.tr.*` property, then the settings screen, then the default.
- `Stall recovery` hooks LoadControl.shouldStartPlayback (`alkg.g(cus)`, fingerprint string `ssp.`). The app starts the first playback at 1.6 s buffered and resumes after a stall at 5 s (server defaults `ahpq.o()`/`q()`, 1600/5000 ms); playback speed is not used. The parameter register is reused as a local inside the method (reading p1 at the returns failed verification), so the parameters are read at the method start into a ThreadLocal and the returns only pass the decision.
- Startup on the phone is about 3 s; the start threshold (1.6 s of video, about 0.3 MB at 1080p) is not what it waits for, so the first start is left unchanged.

Not done yet: CI release automation and checks on YouTube versions other than 21.16.256.
