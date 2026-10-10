# Thread Ripper patches (YouTube Android, Morphe)

Reference device: the maintainer's phone (vivo V2417A, China ROM OriginOS, Android 16) running YouTube 21.16.256 patched by Morphe Manager with official Morphe Patches v1.45.0, "Spoof video streams" = visionOS. The stutter only happens on the phone; desktop web YouTube is fine (`docs/adr/0001-android-patch-instead-of-web-userscript.md`).

## Agent skills

### Issue tracker

GitHub Issues on this repo, via the `gh` CLI. See `docs/agents/issue-tracker.md`.

### Triage labels

The five default roles (`needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`). See `docs/agents/triage-labels.md`.

### Domain docs

Single-context: `GLOSSARY.md` and `docs/adr/` at the root. See `docs/agents/domain.md`.

## Docs

- `docs/download.md`: the download hook, what is left native, request priority. Read before changing `ThreadRipper`, `Session` or `MediaRequest`.
- `docs/preload.md`: the LoadControl hooks for preload and stall recovery. Read before changing `Preload` or `StallRecovery`.
- `docs/settings.md`: the settings screen and setting precedence. Read before adding a setting.
- `docs/warp.md`: the VPN service, WireGuard client, device registration and lifecycle hook.
- `docs/measurements.md`: dated buffer, memory and startup measurements. Check before measuring again or quoting a number.
- `CODING_STANDARDS.md`: how fingerprints match. Read before writing or changing a fingerprint.

## Develop and verify

- Build: `GITHUB_ACTOR=... GITHUB_TOKEN=$(gh auth token) ./gradlew buildAndroid` (token needs `read:packages`) → `patches/build/libs/patches-*.mpp`.
- `scripts/device/install.sh`: build, patch the original APK with official `patches-1.45.0.mpp` plus ours, sign with the user's exported `Morphe.keystore` (Morphe Manager default credentials), `adb install -r`. Inputs live in ignored `.local/` (original APK, keystore, official bundle, morphe-desktop CLI, jadx, decompiled 21.16.256 sources in `.local/yt-src-21.16.256/`, past results). Never commit anything from `.local/`.
- The vivo phone shows an install confirmation screen for adb installs: tell the user before installing.
- The phone runs with `log.tag=I`; debug logs are dropped, so the extension logs at info level when `log=true`.
- Runtime switch without repatching: system properties `debug.tr.<name>` (names and defaults in `Config`; for example `adb shell setprop debug.tr.threads 1`), read on every media request. `threads=1, chunk_kib=65536` reproduces the app's one-request-per-segment behaviour for A/B; classify results by the logged actual `threads`, not by intended mode.
- Stall ground truth: `scripts/device/freeze-ab.sh` (cold start per period at a fresh position, screen recording) + `freeze-report.sh` (`docs/adr/0005-stalls-measured-from-screen-recordings.md`). Keep start positions inside the video length.
- Network diagnosis: `scripts/device/net-monitor.sh OUTDIR CACHE_NODE_IP` samples Wi-Fi, gateway/1.1.1.1/cache-node ping, thermal state and per-range throughput every ~2 s while the phone is used normally.
- Verify on the phone with uncached videos (a replayed video plays from disk cache and makes no requests). Compare modes interleaved, because network capacity varies minute to minute; a single before/after pair is not evidence.

## Gotchas

- Stopping a background task in this Windows/Git Bash setup does not kill child scripts; an orphaned A/B loop kept writing settings and mislabeled rounds. Check `ps -ef` and kill leftovers before a new run.
- The emulator's network latency drifted from ~20 ms to 150–500 ms while the host stayed at 16 ms, and throttling (`emu network speed`) has no effect: use it for LoadControl logic, not for download speed or startup time.
- On the phone logcat's monotonic clock and /proc/uptime differ (sleep); align them with the TRSYNC line.

## Release

Published as a Morphe patch source: Morphe Manager reads `patches-bundle.json` from `main`, which points at the `.mpp` attached to a GitHub release.

The repo is public but for the maintainer's own use: do not list it (awesome-morphe and similar), open issues/PRs upstream, or announce it anywhere unless the maintainer asks.

1. Bump `version` in `gradle.properties`, build (`./gradlew buildAndroid`), and check the patch on the device.
2. Update `patches-bundle.json` (`version`, `created_at`, `description`, `download_url` = `https://github.com/bennytsai1234/youtube-thread-ripper/releases/download/v<version>/patches-<version>.mpp`).
3. Commit, tag `v<version>`, push, then `gh release create v<version> patches/build/libs/patches-<version>.mpp`.

Not done yet: CI release automation and checks on YouTube versions other than 21.16.256.
