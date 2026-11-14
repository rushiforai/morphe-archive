# Opera Beta 104 custom build v4 (universal APK) — install & test guide

File: `OperaBeta-104.0.5262.91143-custom-v4-universal.apk` — a SINGLE, merged
(universal) APK. No split installer needed.

## Why v4 — v2/v3 (.apkm) failed to install

Both .apkm bundles used a base APK rebuilt by apktool (decode → patch →
rebuild). That pipeline was already convicted earlier in this project (see the
repo's `docs/v1.3.1/BINARY-BUILD.md`): apktool-rebuilt bases pass every
host-side check (aapt2, apksigner, zipalign) but are rejected by the device
package installer with "There was a problem parsing the package" — the
recompiled `resources.arsc` / re-serialized manifest lineage is the poison.
The 16 KB alignment fix in v3 was real but not the cause.

v4 uses the device-proven pipeline instead:
- Substrate: stock Opera base + 27 splits (pangle excluded) merged into one
  APK with APKEditor 1.4.9 — the exact "B0b" recipe that booted on your
  devices before. No resource is ever decoded or recompiled.
- Patch: `classes3.dex` only — decoded standalone, 4 surgical smali edits,
  rebuilt, spliced back byte-preserving. Entry-diff vs stock substrate:
  exactly `classes3.dex` (plus signatures).
- Signed with the same Morphe keystore as the W/X-rung builds (cert
  SHA-256 `28f79a44...`), v1+v2+v3 schemes, 16 KB-page aligned.

## Install

1. Recommended: uninstall the currently installed Opera Beta first (clean
   first-run state). A straight upgrade over the X1/X2 builds also works —
   same signing key — but a fresh install is the cleaner test.
2. Install the APK with ANY installer: SAI, file manager, or
   `adb install OperaBeta-104.0.5262.91143-custom-v4-universal.apk`.
   No split handling is involved — it is one normal APK.
3. Pangle (ByteDance) ad SDK is not included; install should be Play
   Protect quiet.

## What's patched (v4 patch set, all in classes3.dex)

| # | Patch | Effect |
|---|-------|--------|
| P1 | `OperaApplication.a()Z` → early `true` | the onboarding master gate: WelcomeActivity never launches, first run goes straight to the browser |
| P2 | `cfn` personalization observable → `false` | the in-browser "Set up your browser" sheet (wallpaper/interests + "start browsing") never appears |
| P3 | `ssi` splash spinner reveal dropped | no loading bar on the splash surface |
| 02f | `m9k` startup-dependency waiter never arms | first run behaves like every later launch — the freeze mechanism from the W2 post-mortem is disarmed |

## What to expect on first launch

- Cold start: plain theme-colored splash surface (no Opera logo screen, no
  loading bar), then a blank surface for roughly 1-4 s (device dependent)
  while Chromium initializes — genuine init time, not branding.
- No "Set up your browser" dialog, no wallpaper/interests picker, no
  "start browsing" button — straight into the browser start page.
- Known cosmetic residual: on Android 12+ the OS itself draws the app icon
  (Opera logo) in the system splash for about a second at cold start. This
  is drawn by the launcher, not the app; blanking it needs a resource-table
  patch that the byte-safe pipeline deliberately avoids. If it bothers you,
  say so and a v5 will address it separately.

## Test matrix

Check on each device (s3, w1, w2, x1, x2):

| # | Check | Expected |
|---|-------|----------|
| 1 | Install | completes, no Play Protect warning |
| 2 | First cold start | no Opera logo screen, no loading bar, no onboarding dialogs |
| 3 | After first launch | browser start page visible and responsive (no freeze) |
| 4 | Recents / memory | phone stays smooth, app closes normally from recents |
| 5 | Second launch | fast, straight to browser, no black screen |
| 6 | Browsing | open a page, open settings — nothing crashes |

## If install still fails

Send me:
- the exact device model + Android version,
- `adb shell getconf PAGESIZE` (4096 vs 16384),
- a logcat captured during the failed install:
  `adb logcat -c && adb logcat > install-fail.log` (reproduce, then Ctrl-C).

## If anything misbehaves after install

    adb logcat -c
    adb logcat > freeze.log     # then reproduce, then Ctrl-C
    adb bugreport bugreport.zip
