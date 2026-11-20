# Scene (com.omarea.vtools)

omarea's device toolbox. The "Scene N1" license is enforced client-side with a
root daemon and an activation server. Supported versions: N1 2026.10 Alpha13,
N1 2026.11 PreRelease 1, N1 2026.11 PreRelease 2.
APK downloads: [download.omarea.com](https://download.omarea.com/#/platform)
and the [omarea mirror](https://omarea.lanzout.com/b0he4yszi).

## Unlock Scene N1

Forces the license state parser and the activation request to a perpetual success
with a configurable expiry date (option `expiry-date`, default 2077-01-01, shown by
the app as the date only). The activation code type is reported as `perpetual`, and
the APK signature MD5 the app reports to omarea's activation binding is spoofed to
the original signing key, so re-signed builds still match. The expiry timestamp and
the signature constant are baked at patch time with a random time-of-day and random
string fragments, so no two patched builds share a constant.

## Random device ID

Off by default. Replaces the device SN (serial_id / serial_no / cpu_id / gid read
by the root scene-daemon) with a random 16-char hex value everywhere the app itself
uses it: the user page display and the SN-keyed cloud sync and API calls to omarea.
The SN is baked per patch run. The daemon's own server report during a real code
activation is native code and is not affected.

## Unlock optional features

On by default. The tuner's Optional features dialog hides three entries behind
checks that have nothing to do with whether the feature works on the device:

- Refresh rate: shown only when the display API reports a discrete 60Hz
  mode next to a >60Hz mode. Samsung OneUI panels report their modes through
  vendor interfaces instead, so the probe fails even though rate control
  through the root daemon works. The patch makes the support check return
  true.
- FAS in games: frame-aware scheduling, the in-game FPS control. Gated on
  a cloud `lp` profile branch with an online config source. The patch makes
  the availability check return true; the per-game config is local.
- CPU limiters: gated on the config source being Scene Online. The patch
  removes that visibility branch in the dialog builder.

`Bypass power supply` stays hidden on devices without a supported
charging-control sysfs node (the toggle would do nothing). All three unlocked
features were verified on SM-A256E (OneUI, 120Hz panel, fas-rs installed);
the refresh-rate control is applied by the root daemon.

The patch locates the dialog builder by fingerprint (its `View` onClick shape
plus the `SOURCE_SCENE_ONLINE` / `CLOUD_PROFILE_BRANCH` literals), derives the
refresh-rate check from the invoke right before the online-source anchor, and
neutralizes the limiter gate by tracking the comparison result register to its
branch. No obfuscated names are hardcoded, so app updates keep working as
long as the dialog keeps this shape.

## Daemon gate bypass

On by default. The root scene-daemon serves the app's live stats (dashboard
cards, system/mini/FPS overlays) through `adb-monitor-*` ops, but on rooted
devices a local validator flips a RESTRICT flag ~40s after the app connects and
those ops start answering empty: the known "stats freeze" of modded Scene
installs. This patch makes the daemon's launcher script (raw resource `up`,
extracted as `up.sh` and run as root on every daemon start) hold the daemon's
internal MASTER override byte set (and RESTRICT cleared), which short-circuits
every gate tier, without touching app bytecode.

The launcher-side poker is version-tolerant: instead of hardcoding offsets per
daemon build, it locates the daemon's AES IV string (`scene.omarea.com`) in the
running process's data segment and derives the two gate bytes relative to it.
Every write is validated (plausible byte values, read-back verify, restore on
mismatch), so a daemon update that moves the globals fails safe back to stock
behavior. A background loop re-asserts the bytes for 300s after each daemon
launch to cover the daemon's one-shot 63s license revalidation; after that the
gate provably stays open. Unknown or non-root setups are untouched.

Logs one line per daemon instance to `files/gp.log` next to the daemon.

## Technical reference: what the unlock replicates

The known "Scene N1" mod for `N1 2026.10 Alpha13` edits exactly three methods in
`classes.dex` (verified by dex-diffing the mod against the original; no methods
added or removed):

| Purpose | How it is located | Name history (2026.10 -> 2026.11 PR1 -> PR2) |
|---|---|---|
| License state parser | fingerprint: `(String)ActivatedStateModel` + strings `success@`, `yyyy-MM-dd` | `c3.b` in all builds |
| License type from activation response | direct target (not obfuscated) | `ActivationCodeResponse.getType()` in all builds |
| MD5 of APK signing cert (server-side activation binding) | fingerprint: `(Context, String)String` + string `MD5` | `at1.C` -> `rv1.B` -> `mw1.B` |
| Device ID getter | fingerprint: `()String` + string `random_id2` + declaring class has a static `LinkedHashMap` field | `at.a` -> `tt.a` -> `nu.a` |

Obfuscated classes are located by [fingerprints](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_1_fingerprinting.md)
(method signature + embedded strings + class shape), so R8 renames between builds do not
require patch changes - only the new `versionName` has to be pinned in `Constants.kt`.

Obfuscated-helper renames across builds:

- 2026.10 Alpha13: `oi1`, `sj1`, `at1`, `at`
- 2026.11 PreRelease 1: `bl1`, `em1`, `rv1`, `tt`
- 2026.11 PreRelease 2: `wl1`, `zm1`, `mw1`, `nu`

`La/c3;`, `ActivationCodeResponse` and `ActivatedStateModel` keep their names in
all three builds.

## How it works

- `c3.b(input)` normally parses the stored license state string
  (`success@<expiry-millis>`, `expired`, `empty`, `invalid`, `not-you`) and builds
  an `ActivatedStateModel` (`activated`, `permanent`, `type`, `typeName`, `text`).
  The first three instructions load that state (`this.b.toString()`); the patch
  replaces them with `const-string v0, "success@<millis>"` so every caller gets
  `activated = true`. `c3.c()` (the v2 flow reading `activate_v2_type` from prefs)
  delegates to `b()`, so it is covered too.
- The `expiry-date` patch option (yyyy-MM-dd, default 2077-01-01) is converted to
  epoch milliseconds at patch time and baked into that constant.
- The standalone "Random device ID" patch (off by default) rewrites the device-ID
  collector (fingerprint: `()String` + strings `device-id`, `serial_id`, `serial_no`,
  `cpu_id`, `gid`; class renamed per build: `mh1` -> `r81` -> `l91`) to return a
  random 16-char hex SN, baked per patch run from random fragments.
- `ActivationCodeResponse.getType()` is forced to `"perpetual"` so any activation
  attempt stores the perpetual license type.
- The signature-MD5 getter is forced to `"34ea0e93b18c7df94decd663857bb3bf"`
  (MD5 of the original signing certificate). omarea binds activation codes to
  this hash, so a re-signed APK (Morphe/MT) must keep reporting the original.

## Updating to a new Scene build

1. Add the new `versionName` to `COMPATIBILITY_SCENE` in `shared/Constants.kt`.
2. If the release fails to patch: verify the license state parser still starts
   with the three-instruction state load (`this.b.toString()`), and that the
   fingerprinted strings (`success@`, `yyyy-MM-dd`, `MD5`, `random_id2`) still
   appear in the expected methods.

## APK downloads

- Official: https://download.omarea.com/#/platform
- Mirror: https://omarea.lanzout.com/b0he4yszi

## Device identity architecture (source-verified, 2026.11 PR2)

- The hardware SN = first non-empty of `serial_id` / `serial_no` / `cpu_id` / `gid`,
  read by the ROOT scene-daemon and served to the app over an AES-encrypted local
  socket on 127.0.0.1 (class `a40`: socket client, `j()` = AES, `v()` = connect).
- `random_id2` pref stores the entered ACTIVATION CODE, not a device id.
- Activation: app -> `activate|<code>` -> local daemon -> omarea server. The daemon
  is the network endpoint and stamps the real hardware id; the server binds codes
  to it (the "not-you" response state).
- App-side surfaces that DO flow through the collector (`l91.f()`-equivalent):
  the user-page SN display, cloud sync (`/sync-download`, `/sync-upload` on
  `omarea.com` / `vtools.online` / `scene7.omarea.com:8080`, keyed by SN), and
  misc API calls. The "Random device ID" patch spoofs all of these.
- The daemon's own server report (real activation attempts) is native and can only
  be changed by patching the scene-daemon binary.
- The spoofed constants (signature MD5, success@<millis>, SN) are built at runtime
  from StringBuilder fragments with patch-time-random split points; the expiry
  millis additionally gets random time-of-day jitter so no two patched builds
  share a constant.
