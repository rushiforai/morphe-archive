# Compatibility

Rows are only filled in from a real run. Anything not actually observed is left
as `—`, never guessed.

Regenerate the fingerprint column for any build with:

```bash
python tools/verify_fingerprints.py <base.apk>
```

## Legend

| Column | Meaning |
|---|---|
| Fingerprints | `PASS` = both fingerprints resolve to exactly one method and all register preconditions hold |
| Patch | did Morphe apply the patch without error |
| Install | did the patched, renamed build install on an unrooted device |
| Photo / Video | did tapping the thumbnail open the item in a third-party gallery |

## Verified builds

| Pixel Camera | versionCode | Android | Device | APK source | Fingerprints | Patch | Install | Photo | Video |
|---|---|---|---|---|---|---|---|---|---|
| 10.4.117.936816638.14 | 69481630 | 17 (SDK 37), `CP2A.260705.006` | Pixel 10 Pro XL (`mustang`) | pulled from device via `adb` | **PASS** | **PASS** | **PASS** | **PASS** | **PASS** |

Installed as `com.google.android.GoogleCamera.morphe` alongside the untouched
stock app, on a **stock, unrooted** Pixel 10 Pro XL.

### Notes on 10.4.117.936816638.14

* Signing certificate SHA-256
  `f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83` (v2 + v3;
  no v1 signature, so `keytool -printcert -jarfile` prints nothing — use
  `tools/apksigcert.py`).
* App bundle: `base.apk` + 20 `split_*` modules, ~1.2 GB. No ABI or density
  config splits; the device is `arm64-v8a` only.
* All 3 DEX files are in `base.apk`. No split contains code.
* Resolved targets (obfuscated names, informational only):
  * launcher — `Liho;->e(Landroid/content/Intent;Landroid/view/View;Landroid/graphics/Bitmap;)Z`
  * gate — `Liho;->b(Lj$/util/Optional;)V`
* Register preconditions: PackageInfo probe 1 register, enabled probe 2,
  suspended probe 2 — all as expected.
### Build and patch run (verified)

`./gradlew build` — **BUILD SUCCESSFUL**, all 8 unit tests passed, producing
`patches/build/libs/patches-1.0.0.mpp` (20 KB) and the embedded extension
`extensions/pixelcamera.mpe`.

Morphe Desktop 1.12.0 applied it to the pulled `base.apk`:

```
INFO: Filtering patches for com.google.android.GoogleCamera v10.4.117.936816638.14...
INFO: Skipping disabled: Use third-party gallery on lock screen (default)
INFO: Applying 1 patches...
INFO: Applied: Use third-party gallery
INFO: Compiling patched dex files (mode: STRIP_FAST)
INFO: Signing APK
```

The patched output was then re-analysed with `tools/dexscan.py` to confirm the
four mutations actually landed, rather than trusting the patcher's own report:

| Mutation | Site in patched APK |
|---|---|
| launcher injection | `Liho;->e(...)Z` @ `0000: invoke-static {v6, v7}, …GalleryRedirect;->prepareGalleryIntent(Landroid/content/Intent;Landroid/view/View;)V` |
| PackageInfo probe | `Liho;->b(...)V` @ `0010: invoke-static {v2}, …->galleryPackageInfo(Ljava/lang/Object;)Landroid/content/pm/PackageInfo;` |
| enabled probe | `Liho;->b(...)V` @ `005f: invoke-static {v2, v0}, …->applicationEnabledSetting(…)I` |
| suspended probe | `Liho;->b(...)V` @ `0070: invoke-static {v2, v0}, …->isPackageSuspended(…)Z` |

The injected call sits at instruction 0, immediately before the app's own
`getPackageManager()` / `resolveActivity` sequence at `0003`, as designed. All
register operands match the calls they replaced.

### Runtime run (verified on device)

Install: `adb install -r` of the 1.18 GB merged, renamed, re-signed APK —
`Performing Streamed Install / Success` in 53 s. The result installs as an
ordinary user app, with the privileged flags gone exactly as predicted:

```
pkgFlags=[ HAS_CODE ALLOW_CLEAR_USER_DATA ALLOW_BACKUP KILL_AFTER_RESTORE RESTORE_ANY_VERSION LARGE_HEAP ]
```

(stock, for comparison: `SYSTEM … UPDATED_SYSTEM_APP` + `PRIVILEGED PRODUCT`).
The stock Pixel Camera remained installed and unmodified throughout.

**Camera works under the renamed package.** Cold launch 325 ms to
`CameraActivity`, live viewfinder, and the zoom ladder offered
`.5 / 1x / 2 / 5 / 10` — the ultrawide and telephoto are both reachable, which
settles the "does a non-privileged rename lose lenses" question for this device.
Photo and video capture both succeeded:

| Capture | Result |
|---|---|
| Photo | `PXL_20260726_165838389.jpg`, `image/jpeg` |
| Video | `PXL_20260726_165953311.mp4`, `video/mp4` |

**Thumbnail redirect, Google Photos disabled (`enabled=3`), no prompt shown:**

```
MorpheGalleryRedirect: Redirecting review to implicit VIEW, type=image/jpeg
ActivityTaskManager: START u0 {act=android.intent.action.VIEW dat=content://media/...
    typ=image/jpeg flg=0x1 cmp=android/com.android.internal.app.ResolverActivity}
    from uid 10456 (com.google.android.GoogleCamera.morphe)
```

```
MorpheGalleryRedirect: Redirecting review to implicit VIEW, type=video/mp4
ActivityTaskManager: START u0 {act=android.intent.action.VIEW dat=content://media/...
    typ=video/mp4 flg=0x1 cmp=android/com.android.internal.app.ResolverActivity}
```

Every requirement is visible in those two lines: action is `ACTION_VIEW`, a MIME
type is present, `flg=0x1` is `FLAG_GRANT_READ_URI_PERMISSION`, and there is no
`pkg=` restriction. The resolver listed ChatGPT, Files by Google, **Immich
("View in Immich")** and KOReader. Choosing Immich opened
`app.alextran.immich/.MainActivity` and displayed the just-captured photo. No
`ActivityNotFoundException`, no `SecurityException`, no crash.

### Add Me — crashed on a renamed build, fixed by patch (verified)

**Status: fixed and verified on device.** With
**"Run Add Me without the EdgeTPU"** applied, Add Me opens its onboarding
("Photographer 1 — Leave space for yourself"), enters the live viewfinder with
the mode pill selected and its own coaching hint shown, and the process stays
alive. `logcat` shows `ThermalTfliteInvoke` running and **no** `Fatal signal` or
`Abort message`. The gallery redirect was re-tested in the same build and still
produced `act=android.intent.action.VIEW … typ=image/jpeg flg=0x1`.

Cost: Add Me runs on CPU/GPU instead of the Tensor accelerator, so it is slower.

The rest of this section documents the original failure and how it was traced.

Without the patch, selecting **Add Me** kills the process, reproducibly. This is
caused by the rename, not by the gallery patch.

```
E vendor.google.edgetpu_app_service@1.0-service: com.google.android.GoogleCamera.morphe
    is not in the EdgeTPU allowed list or signature mismatched.
    Please add the app to the edgetpu allowlist.
W CriticalPath: avc: denied { read } for name="gxp" dev="tmpfs"
    scontext=u:r:untrusted_app:s0 tcontext=u:object_r:gxp_device:s0
    tclass=chr_file permissive=0 app=com.google.android.GoogleCamera.morphe
F libc: Fatal signal 6 (SIGABRT), code -6 (SI_TKILL) in tid 7559 (AllInCriticalPr)
F DEBUG: Abort message: 'statusor.cc:89] Attempting to fetch value instead of handling
    error INTERNAL: RET_CHECK failure
    (photos/vision/human_sensing/person_detector/person_detector_tflite_client.cc:50)
    client->InitializeTfliteRuntime(options) returned generic::internal: RET_CHECK failure
    (intelligence/mobile_acceleration/support_library/tflite_wrapper.cc:789)
    delegate_ Plugin did not create EdgeTpu delegate.'
#01 pc … base.apk!libgcastartup.so
```

Two independent gates, both **outside the APK**:

1. **EdgeTPU allowlist.** `vendor.google.edgetpu_app_service` is a separate
   vendor HAL process that checks the caller's package name and signature. The
   allowlist is compiled into the service, not a readable config.
2. **SELinux.** A non-privileged install runs in the `untrusted_app` domain,
   which the kernel denies read on `/dev/gxp` (the Tensor GXP/EdgeTPU device).
   The domain comes from `seapp_contexts`, keyed on package name, signature and
   privileged status.

Google's code then treats delegate failure as a fatal `RET_CHECK` rather than
falling back, so the process aborts.

Why no patch helps:

* Neither gate is reachable from bytecode — one lives in another process, the
  other in the kernel.
* The abort is in `libgcastartup.so`. **Morphe patches DEX, not native
  libraries**, so the "fall back instead of abort" fix is out of reach too.
* Non-TPU model twins *do* ship (`all_in_film_blender.tflite` next to
  `all_in_film_blender_..._custom_op_tpu_p25.tflite`), but the branch that would
  select them — `Lhtb;-><init>` guarded by `Lrbf;->f()Z` — switches the whole
  device-class profile to older silicon (`p22`, `janeiro`, `rio`) whose assets
  are not present in this build. Forcing it would break more than it fixes.

Passing those gates requires the package to be named
`com.google.android.GoogleCamera`, signed by Google, **and** installed as a
privileged system app — the three things an unrooted rename gives up.

### …but the EdgeTPU is avoidable

Further tracing found that the accelerator is not actually required. Add Me is
called **Cottage** internally (the mode enum constant behind the `"ADD_ME"`
intent value is literally `COTTAGE`, and its flags are `camera.cottage_*`), and
Pixel Camera ships **two complete model sets** for it:

| TPU model | plain twin |
|---|---|
| `all_in_film_blender_sharded_512_256-graph-custom_op_tpu_p25.tflite` | `all_in_film_blender.tflite` |
| `raid_person_segmenter_…-graph-custom_op_tpu_25.tflite` | `raid_person_segmenter_….tflite` |
| `mobile_raid_v21_640_qat_u8-graph-custom_op_tpu_25.tflite` | `mobile_raid_v21_640_qat_u8.tflite` |

One boolean picks between them, read from the flag `camera.cottage_use_tpu`
(`Lhpq;->P`) into `Lfpd;->e:Z`, and consumed in the asset loader:

```smali
0015: const-string v6, "AllInAssetManager#openModelAssets"
001a: iget-boolean v5, v1, Lfpd;->e:Z      # useTpu
001c: if-eqz v5, :011f                      #   false -> CPU branch
0023: sget-object v6, Lfpd;->a:Luar;        #   TPU model map
011f: sget-object v5, Lfpd;->b:Luar;        #   CPU model map
01e0: iget-boolean v4, v1, Lfpd;->e:Z      # also handed to the processor
01ea: invoke-direct {v5, v2, v4, v1, v3}, Lfpc;-><init>(Lvjh;ZLvjb;Lual;)V
```

Forcing that boolean false opens the plain models *and* stops the processor
requesting an EdgeTPU delegate, so the abort never happens. That is what the
**"Run Add Me without the EdgeTPU"** patch does — it rewrites every read of that
field in the asset loader to `false`. Add Me then runs on the CPU/GPU: slower,
but working. Nothing else reads the flag.

The alternative workaround, if you would rather keep the accelerator: the stock
Pixel Camera remains installed and untouched, so use it for Add Me and the
patched build for everyday capture.

Modes that survived selection unpatched: Photo, Video, Portrait, Night Sight,
Panorama, Long Exposure. Only Add Me was observed to crash, and it is now fixed.
Other features that depend on the EdgeTPU may behave the same way; they were not
all exercised. If another one aborts with `Plugin did not create EdgeTpu
delegate`, look for its own `camera.<codename>_use_tpu` flag — the same
technique should apply.

### Non-fatal warnings observed

GMS refuses to serve Phenotype flags and MobileDataDownload config to a
non-Google-signed package:

```
W CBVerifier: Fail to register phenotypeflags … java.lang.SecurityException:
  GoogleCertificatesRslt: not allowed: pkg=com.google.android.GoogleCamera.morphe
W CAM_rpm : MobileDataDownloadBuilder: Failed to commitToFlagSnapshot: …
```

These affect server-side feature-flag and model delivery, not capture. Camera,
lenses, photo and video all worked with them present. Features that depend on
downloaded models (for example Pro Zoom's AI imaging models) may not work; that
was not exercised.

### Split handling (verified)

Morphe Desktop accepts a `.apkm` (a plain zip of `base.apk` + `split_*.apk`) and
**merges the splits into one universal APK** before patching:

```
INFO: Writing apk ...
INFO: Saved to: work\mini-merged.apk
```

This matters because the splits declare the same `package` as the base, so
renaming only `base.apk` would break `adb install-multiple`. Merging sidesteps
the problem — the output is a single installable APK. A directory of APKs is
*not* accepted as input.

## Environment used for analysis

| | |
|---|---|
| Host | Windows 11 Pro 26200 |
| Python | 3.13.7 (analysis tools use the standard library only) |
| JDK | Temurin 25.0.3 (present); the build targets JDK 21 |
| adb | 36.0.1 |
| Gradle / Kotlin | not installed locally; build not executed |

## Third-party gallery observed on the device

`app.alextran.immich` declares, on `MainActivity`:

```
Action: android.intent.action.VIEW
Category: android.intent.category.DEFAULT
Scheme: content
StaticType: image
StaticType: video
```

Measured resolution against `content://media/external/images/media/<id>`:

| Intent type | Immich matches |
|---|---|
| `image/jpeg`, `image/png`, `image/avif`, `image/x-adobe-dng` | yes |
| `video/mp4` | yes |
| `image/*`, `video/*` | yes |
| *(no type)* | no |
| `*/*` | no |
| `file://` scheme with `image/jpeg` | no |

This is why the extension always sets a concrete or wildcard-subtype MIME type
and never `*/*`.
