# 4XVR launch hang — missing Meta platform decoupling stubs (2026-10-12)

Device: Galaxy XR `R3GYB09JA5E` (AFZ3). Target: `cn.vr4p.oculus4xvrplayerov` 2.0.22/20022.
Builds involved:

| Build | SHA-256 | Size (B) | Behaviour |
|---|---|---|---|
| stock pristine (`cn.vr4p.oculus4xvrplayerov_2.0.22_original.apk`) | `24b83ab584675e02570e5318a35c7fa9b8da7eabb1f0763711c74c1bad3a84a8` | 390,601,516 | not installable over a Morphe build (signature) |
| 10-11 patched (`cn.vr4p.oculus4xvrplayerov_2.0.22_patched-20261011-1844.apk`) | `c596a54643f8af09633b93db7b83488414ca2c1704a2c2550846a805dbf75b7f` | 396,682,935 | **launches, UI loads** |
| installed 2026-10-12 15:54 (`installed-4xvr-patched.apk`) | `8d75cedd67c9b65ad9d85adaf5fc88b66000ec46b81e37bae7cf6c57192fe661` | 396,654,263 | **hangs on splash forever** |

> **2026-10-24 cleanup:** the two generated patched APKs above were deleted under
> the owner's build-residue policy. The hashes and sizes remain in this table; the
> canonical stock APK is retained. Rebuild the comparison from the recorded source
> revision. Receipt:
> `../builds/steamlink-patches/_cleanup/steamlink-residue-20261024-185648.json`.

## Symptom and evidence

- Launch leaves the process alive with the splash on screen indefinitely; first user run raised
  `ANR in cn.vr4p.oculus4xvrplayerov / Reason: executing service cn.vr4p.oculus4xvrplayerov/.V4DLNACastService`
  (2026-10-12 15:56, and again 16:38:12 on a scripted relaunch).
- 16 MB `bugreport` thread dump (pid 12227, at the ANR) shows the Java main thread blocked in
  `NativeActivity.onStartNative` -> `/data/app/.../lib/arm64/libvr4p-oculus.so` -> `pthread_cond_wait`
  (futex). Every run, hanging or working, does log `xrCreateSession called` and
  `SessionStateChanged to 1` (pids 12227 @16:37:50.401, 12455 @16:38:49.345, 16108 @16:44:44.360,
  17069 @16:50:38.083); the hanging runs then never proceed to a first presented frame — the UI
  stays on the splash and no further render/asset log line follows.
  In the second process (pid 12455) the main thread later sits idle in the Looper while the splash
  is still shown, i.e. startup stalls before the first frame, not a spin/deadlock in Java code.
- Raw captures: `../builds/steamlink-patches/build/4xvr-hang-20261012/` (`launch1.log`, `launch2.log`,
  `ab-1011.log`, `final-verify.log`, `bugreport.zip`, `anr-threaddump-12227.txt`,
  `anr-threaddump-12455.txt`, `shot*.png`, pulled native libs). The pulled APK copies
  were retired on 2026-10-24; see the cleanup note above.

## A/B isolation (byte level)

- APK entry comparison (size + CRC32 + compression per entry): both patched builds share 2005 of
  2007 entries byte-identically. Differing entries: `lib/arm64-v8a/libovrplatformloader.so` and
  `classes8.dex` (same size, different checksum).
- `libovrplatformloader.so`: stock = `a1c5b1ec5bfc2ed17d52d9a2c2a2e4a9d5c127b53ef185baebcbb40da41bff45`
  with 0/11 stub sites; 10-11 build = `70a550728505591f0766f47a11f2e5eeae17ee3c3cc54ef4932540038ad1605b`
  with 11/11 stub sites (`00 00 80 d2 c0 03 5f d6` at `0x56948, 0x85ce0, 0x85d50, 0x85e14, 0x85e6c,
  0x85f88, 0x85fe0, 0x8a0c0, 0x8de78, 0x8dfd8, 0x8facc`). Today's installed build is the **stock**
  loader — the `Meta platform decoupling (4XVR)` patch was not applied.
- `classes8.dex`: all 42 extension classes are present in both builds and all *non-hook* method code
  matches. The two builds differ inside one code item, `Vr4pMediaPlayer$MyVideoRunnable.run()`
  (~36 bytes): the 10-11 build carries the **pre-`01c1d3e`** hook (routed surface parked in `v10`,
  `routeOutputSurface {v0, v2, v7, v9}`), today's build carries the repaired placement
  (`routeOutputSurface {v9, v10, v7, v2}` immediately after the `color-transfer` const-string,
  result parked in `v9`). An earlier code-range checker missed this because it walked only direct
  methods; `run()` is virtual. The A/B therefore has two functional deltas — the platform stubs and
  the hook variant — but the video path (`MyVideoRunnable`) is not entered before the UI is up, so
  only the stubs can explain the launch outcome.
- `libvr4p-oculus.so` in today's build carries the refresh-profile edits
  (`52` @ `0x30355`, `49 52` @ `0x3038c`), sha256 `c6b78cfe46e5add3791f64d303d9b7cc57e4c1c809b57ebe2a81539e2cdf3eb4`.

## On-device A/B and fix

- `adb install -r -d` of the 10-11 patched APK (the app slot had been uninstalled from the headset
  UI at 16:43:30 — `com.google.android.packageinstaller/UninstallerActivity` in the system log — so
  the install landed fresh and the process uid changed, `u0a270` -> `u0a271`): app launches, renders
  its WebView UI (video browser, sidebar, release-notes dialog), no ANR in the 16:50 and 16:54 runs
  (`ab-1011.log`, `final-verify.log`; the earlier per-run ANRs at 15:56 and 16:38:12 belong to the
  stub-less build). Storage access is then granted with
  `appops set cn.vr4p.oculus4xvrplayerov MANAGE_EXTERNAL_STORAGE allow` (re-granted for the new uid),
  which removes the in-app permission prompt; verified by screenshot.
- Root cause: the Meta platform path blocks engine start on this non-Meta runtime unless the 11
  platform functions are stubbed, exactly as the reference build does. The stub patch had been
  `default = false` and was dropped from the recommended selection after the set-wrapper deletion
  (`f1175ad`), so any default patch run reproduced the hang.
- Source change in this commit: `fourXvrPlatformDecouplingPatch` is now `default = true` and renamed
  `Meta platform decoupling (4XVR)` (experimental marker dropped); `FourXvrBundleTest` expects the
  10-member default set; catalogs regenerated.

## Checks performed / remaining gaps

- Verified: exact-entry APK diff, 11 stub sites and refresh-profile bytes on device, the single
  differing hook code item, device launch/UI with the stubbed build, no ANR over the observed
  stubbed-build windows (16:50, 16:54).
- Remaining: playback re-test of the HDR hook on the headset (clicking a video) is still owed; VIP
  flows degrade by design (0-returning stubs) and are not re-verified; the app emits a continuous
  `Found no buffer for compositor to acquire in BufferArraySwapchain` error stream while idle — not
  the launch hang, tracked here for the next playback session.
