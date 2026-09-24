# Reverse-engineering findings

All evidence below was produced from the Pixel Camera actually installed on the
target device, pulled with `adb`. Nothing here is inferred from other Pixel
Camera versions or from third-party write-ups.

| | |
|---|---|
| Device | Pixel 10 Pro XL (`mustang`) |
| OS | Android 17, SDK 37, build `google/mustang/mustang:17/CP2A.260705.006/15641320:user/release-keys` |
| Package | `com.google.android.GoogleCamera` |
| versionName | `10.4.117.936816638.14` |
| versionCode | `69481630` |
| minSdk / targetSdk | 37 / 37 |
| Signing cert SHA-256 | `f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83` (v2 + v3) |
| Distribution | app bundle: `base.apk` + 20 `split_*` feature/asset modules |
| DEX | 3 files, **all in `base.apk`**; 19 040 classes, 82 293 strings |

Reproduce with:

```bash
python tools/dexscan.py info            base.apk
python tools/apksigcert.py              base.apk
python tools/verify_fingerprints.py     base.apk
```

Obfuscated names below (`Liho;`, `Le;`, `Lpak;`, `Lihm;`) are R8 output and
**change on every release**. They are quoted as evidence only; no fingerprint
depends on them.

---

## 1. Where the Google Photos dependency lives

Three separate mechanisms, all in `base.apk`:

### 1a. Intent construction — `Le;->D(ZZZ[J)Landroid/content/Intent;`

A static factory that builds the review intent. Four action variants converge on
a common tail that pins the target package:

```smali
.method public static D(ZZZ[J)Landroid/content/Intent;
    .registers 7  .ins 4  .outs 3
    # p0 = isSecure, p1 = useGooglePhotosMarsApi, p2 = isVoiceInteractionRoot, p3 = secureIds
    0000: const-string v0, "com.google.android.apps.photos.api.secure_mode_ids"
    0002: const-string v1, "com.google.android.apps.photos.api.secure_mode"
    0004: const/4 v2, 0x1
    0005: if-eqz v4, :0022                      # p1 == false -> AOSP actions
    0007: if-eqz v3, :0014
    0009: new-instance v3, Landroid/content/Intent;
    000b: const-string v4, "com.google.android.apps.photos.mars.api.ACTION_REVIEW_SECURE"
    ...
    0016: const-string v4, "com.google.android.apps.photos.mars.api.ACTION_REVIEW"
    ...
    0026: const-string v4, "android.provider.action.REVIEW_SECURE"
    ...
    0037: const-string v4, "android.provider.action.REVIEW"
    0039: invoke-direct {v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    003c: if-eqz v5, :0043
    003e: const/high16 v4, 0x10000000            # FLAG_ACTIVITY_NEW_TASK
    0040: invoke-virtual {v3, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
    0043: const-string v4, "com.google.android.apps.photos"
    0045: invoke-virtual {v3, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
    0048: invoke-virtual {v3, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;   # v2 == 1
    004b: return-object v3
.end method
```

Two things matter here:

* `addFlags(v2)` at `0x48` with `v2 = 1` means **Pixel Camera already adds
  `Intent.FLAG_GRANT_READ_URI_PERMISSION`**. The patch does not need to add it,
  only preserve it.
* `setPackage` at `0x43`–`0x45` is on the path shared by all four variants.

Only three methods call this factory, and all three are thumbnail paths:
`Liho;->d()Z`, `Liho;->h()Luyx;`, `Lihm;->b()V`.

### 1b. Availability gate — `Liho;->b(Lj$/util/Optional;)V`

Reached from the thumbnail click listener `Limh;->onClick(Landroid/view/View;)V`.
This is the code that produces the "enable Google Photos" prompt:

```smali
0000: const-string v0, "com.google.android.apps.photos"
0010: invoke-virtual {v2}, Lpak;->a()Landroid/content/pm/PackageInfo;
001a: if-nez v3, :0059              # null -> "Cannot find Photos package info. Canceling." + dialog
005f: invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->getApplicationEnabledSetting(Ljava/lang/String;)I
0064: if-eqz v2, :0068
0066: if-ne v2, v3, :01d7           # not DEFAULT/ENABLED -> "Photos is disabled. Canceling." + dialog
0070: invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->isPackageSuspended(Ljava/lang/String;)Z
0074: if-eqz v0, :00aa             # suspended -> bounce to the Photos launcher intent
00aa: ...                           # proceed: transition + eventually Lihm;->b()
```

`Lpak;->a()` is a thin wrapper around
`getPackageInfo("com.google.android.apps.photos", 0)` that catches
`NameNotFoundException` and returns null. Because a user-disabled package is
filtered out of `getPackageInfo` unless `MATCH_DISABLED_COMPONENTS` is passed,
**Photos being disabled makes this return null and the launch is cancelled
before any intent is built.**

### 1c. Launch — `Liho;->e(Landroid/content/Intent;Landroid/view/View;Landroid/graphics/Bitmap;)Z`

The single funnel. Called by `Liho;->d()`, `Liho;->h()` and `Lihm;->b()`:

```smali
.method public final e(Landroid/content/Intent;Landroid/view/View;Landroid/graphics/Bitmap;)Z
    0000: iget-object v0, v5, Liho;->o:Landroid/content/Context;
    0002: invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()...
    0006: invoke-virtual {v6, v0}, Landroid/content/Intent;->resolveActivity(...)Landroid/content/ComponentName;
    000b: if-eqz v0, :00ab                     # <- no handler
    0020: const-string v2, "photos_review_launch_timestamp"
    0029: const-string v0, "shared_element_return_transition"
    ...
    0088: invoke-virtual {v5, v6, v1, v7}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    008b: goto :00aa
    008c: move-exception v5                    # <- catch around the launch
    0093: const-string v7, "Error starting activity. Aborting."
    009a: return v1                            # false
    00a1: invoke-virtual {v5, v6, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    00aa: return v2                            # true
    00ab: ...                                  # reset UI, restore thumbnail
    00bb: const-string v6, "Photos is disabled."
    00c0: throw v5                             # CancellationException
.end method
```

This method already implements everything the requirements ask for on the
failure side:

* `resolveActivity(...) == null` → "no compatible activity installed"
* `try`/`catch` around `startActivityForResult` → "target activity threw during launch"

They are currently reached only because `setPackage` pins a disabled package.
Remove the pinning and the same code becomes correct third-party-gallery
error handling.

---

## 2. Why removing `setPackage` alone is not enough

Measured on the target device with `cmd package query-activities`:

| Intent | Resolves to |
|---|---|
| `android.provider.action.REVIEW` | **nothing** |
| `com.google.android.apps.photos.mars.api.ACTION_REVIEW` | **nothing** |
| `VIEW` + `content://…` + `image/jpeg` | Files, Immich, ChatGPT, KOReader |
| `VIEW` + `content://…` + no MIME type | Messages, Google app — **no gallery** |
| `VIEW` + `content://…` + `*/*` | **no gallery** |
| `VIEW` + `content://…` + `image/*` | Files, Immich, ChatGPT |

Three consequences drive the patch design:

1. **The action must be rewritten to `android.intent.action.VIEW`.** Merely
   stripping `setPackage` leaves either a Photos-proprietary action or
   `android.provider.action.REVIEW`, and nothing on the device handles either.
2. **A MIME type must be set explicitly.** Pixel Camera's common path calls
   `setData(uri)` with no type (`Liho;->h()` at `0x1ab`, `Lihm;->b()` at
   `0x0ae`). Gallery filters are declared as
   `scheme="content"` + `mimeType="image/*"`, which an untyped intent does not
   match.
3. **`*/*` is not a usable fallback.** Android does not treat a fully wildcarded
   intent type as matching an `image/*` filter. The extension falls back to
   `image/*` or `video/*` instead, chosen from the URI path.

This is why the patch hooks the launcher (`1c`), where the URI is already set,
rather than the intent factory (`1a`), where it is not.

---

## 3. What is *not* a constraint

Checked and ruled out, so the patch does not touch them:

* **No runtime package-name self-check.** The only literal
  `"com.google.android.GoogleCamera"` compared anywhere is inside
  `Lsgv;->a()Z`, a Google Primes (telemetry) first-party allowlist that also
  contains YouTube, Gmail and Docs. It gates crash/latency reporting, not camera
  behaviour.
* **No signature check.** No `checkSignatures`, `GET_SIGNATURES` or
  `getSigningInfo` call sites relate to the camera pipeline.
* **`android.permission.SYSTEM_CAMERA` is not requested.** Pixel Camera uses
  only publicly enumerable camera IDs, so no lens is gated behind system-app
  status.
* **Camera extension libraries are not package-restricted.** The device
  declares them as plain shared libraries:

  ```xml
  <library name="com.google.android.camera.experimental2025"
           file="/vendor/framework/com.google.android.camera.experimental2025.jar" />
  <library name="com.google.pixel.camera.services.cameraidremapper"
           file="/system_ext/framework/com.google.pixel.camera.services.cameraidremapper.jar" />
  ```

  There is no `<allowed-package>` restriction on any of them, and Pixel Camera
  declares them all `android:required="false"`.
* **Camera extensions are provided by a separate package**, not by Pixel Camera:
  `ro.vendor.camera.extensions.package = com.google.android.apps.camera.services`.
  Pixel Camera is a client of that service like any other app.

---

## 4. What a rename *does* cost

`dumpsys package com.google.android.GoogleCamera`:

```
pkgFlags=[ SYSTEM HAS_CODE ... UPDATED_SYSTEM_APP ... ]
privatePkgFlags=[ ... PRIVILEGED PRODUCT ... ]
codePath=/product/priv-app/GoogleCamera        (system image copy)
codePath=/data/app/~~9Khv.../com.google.android.GoogleCamera-...  (Play update)
```

`/product/etc/permissions/privapp-permissions-google-p.xml` grants it, **keyed
by package name**:

```xml
<privapp-permissions package="com.google.android.GoogleCamera">
    <permission name="android.permission.ACCESS_BLOBS_ACROSS_USERS"/>
    <permission name="android.permission.ALLOCATE_AGGRESSIVE"/>
    <permission name="android.permission.INTERACT_ACROSS_USERS"/>
    <permission name="android.permission.INSTALL_PACKAGE_UPDATES"/>
    <permission name="android.permission.BIND_WALLPAPER"/>
    <permission name="android.permission.REBOOT"/>
    <permission name="android.permission.MANAGE_WIFI_NETWORK_SELECTION"/>
    <permission name="android.permission.LOCAL_MAC_ADDRESS"/>
    <permission name="android.permission.POST_NOTIFICATIONS"/>
    <permission name="android.permission.CONTROL_DEVICE_LIGHTS"/>
</privapp-permissions>
```

and `/vendor/etc/sysconfig/vendor-apex-allowlist-lyric.xml`:

```xml
<allowed-vendor-apex package="com.google.pixel.camera.hal"
                     installerPackage="com.google.android.GoogleCamera" />
```

A renamed build loses exactly this list plus the vendor-HAL installer role.
**None of these ten permissions is used to open the camera, select a lens, or
run the computational pipeline** — capture needs `android.permission.CAMERA`,
which is a normal runtime permission any app can hold.

Losing a signature/privileged permission does **not** block installation;
Android simply never grants it and logs the fact.

Collision risks that the rename must also handle (from `dexscan.py info`):

```
<permission> com.google.android.GoogleCamera.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION
<provider>   com.google.android.GoogleCamera.DebugContentProvider
<provider>   com.google.android.GoogleCamera.DbDebugDumper
<provider>   com.google.android.GoogleCamera.MetricsProvider
<provider>   com.google.android.GoogleCamera.fileprovider
<provider>   com.google.android.GoogleCamera                       (search indexables)
<provider>   com.google.android.apps.camera.specialtypes.SpecialTypesProvider   <-- NOT package-prefixed
```

The last one is the dangerous case: its authority does not contain the package
name, so renaming the application does not rename the authority, and it will
collide with the stock install.

---

## 5. Selected patch points

| # | Target | Mutation | Why this point |
|---|---|---|---|
| 1 | `Liho;->e(Intent, View, Bitmap)Z` | insert one `invoke-static` at instruction 0 | Single funnel for all three launch paths; URI and thumbnail are already set; the method's own `resolveActivity` guard and `try`/`catch` are reused as the failure handling |
| 2 | `Liho;->b(Optional)V` — PackageInfo probe | replace call with extension static | Removes the "install Photos" dialog |
| 3 | `Liho;->b(Optional)V` — `getApplicationEnabledSetting` | replace call with extension static | Removes the "Photos is disabled" dialog |
| 4 | `Liho;->b(Optional)V` — `isPackageSuspended` | replace call with extension static | Removes the suspended-Photos bounce |

Mutations 2–4 replace an `invoke-virtual` with an `invoke-static` taking the
same registers and returning the same type, so register allocation, `.registers`
and verifier state are all unchanged. The patch asserts the register count of
each replaced call and refuses to patch on a mismatch.

All four belong to **Use third-party gallery**.

The opt-in **Use third-party gallery on lock screen** patch adds no fifth
mutation to Pixel Camera. Mutation 1 is emitted identically either way; the
helper decides at runtime by calling
`GalleryRedirect.redirectSecureReview()`, and the lock-screen patch prepends
`const/4 v0, 0x1 / return v0` to **that extension method**, which this project
owns. Consequences:

* the two patches never depend on each other's instruction offsets;
* enabling or disabling the lock-screen patch cannot change what happens on the
  normal path;
* Pixel Camera bytecode is byte-identical between the two configurations apart
  from nothing at all — only the merged extension differs.

Secure launches are excluded by default because
`android.provider.action.REVIEW_SECURE` carries a contract (show only this
locked session's captures) that no third-party gallery implements.

Nothing in the capture pipeline, camera settings, processing, saving, or
thumbnail generation is touched.

---

## 6. Add Me / "Cottage" and the EdgeTPU

Unrelated to the gallery redirect, but discovered while validating a renamed
build: selecting **Add Me** kills the process.

Add Me is internally **Cottage**. The mode enum maps the `"ADD_ME"` intent value
to a constant literally named `COTTAGE` (`Loxq;->r`), and its feature flags are
all `camera.cottage_*`. The crashing thread is `AllInCriticalProc`, and the JNI
bridge is the unobfuscated
`com.google.googlex.gcam.creativecamera.allin.jni.AllInNativeImpl`.

The abort:

```
Abort message: 'RET_CHECK failure (…/person_detector_tflite_client.cc:50)
  client->InitializeTfliteRuntime(options) returned generic::internal:
  RET_CHECK failure (…/tflite_wrapper.cc:789) delegate_
  Plugin did not create EdgeTpu delegate.'
#01 pc … base.apk!libgcastartup.so
```

caused by two independent gates that a renamed, re-signed build cannot pass:

```
E vendor.google.edgetpu_app_service: <pkg> is not in the EdgeTPU allowed list
    or signature mismatched. Please add the app to the edgetpu allowlist.
W CriticalPath: avc: denied { read } for name="gxp"
    scontext=u:r:untrusted_app:s0 tcontext=u:object_r:gxp_device:s0 permissive=0
```

### The accelerator turns out to be optional

Pixel Camera ships two complete Add Me model sets — TPU-compiled ones with
`custom_op_tpu` in the name, and plain twins. Both are present in
`split_all_in_feature_module_p25.apk`, for example `all_in_film_blender.tflite`
(10 MB) alongside
`all_in_film_blender_sharded_512_256-graph-custom_op_tpu_p25.tflite` (26 MB).

Selection is one boolean, read from `camera.cottage_use_tpu` (`Lhpq;->P`) into
`Lfpd;->e:Z` by `Lfpd;-><init>`, and consumed twice in the asset loader
`Lfom;->run()V`:

```smali
0015: const-string v6, "AllInAssetManager#openModelAssets"
001a: iget-boolean v5, v1, Lfpd;->e:Z      # useTpu
001c: if-eqz v5, :011f                      #   false -> CPU branch
0023: sget-object v6, Lfpd;->a:Luar;        #   TPU model map
011f: sget-object v5, Lfpd;->b:Luar;        #   CPU model map
01e0: iget-boolean v4, v1, Lfpd;->e:Z      # also passed to the processor
01ea: invoke-direct {v5, v2, v4, v1, v3}, Lfpc;-><init>(Lvjh;ZLvjb;Lual;)V
```

Forcing both reads to `false` opens the plain models and stops the processor
asking for an EdgeTPU delegate, so the abort never occurs. That is the whole of
the "Run Add Me without the EdgeTPU" patch — two `iget-boolean` instructions
replaced with `const/16 vX, 0x0`. Nothing else reads the flag.

Dead ends ruled out along the way:

* **Forcing the device-class branch.** `Lhtb;-><init>`, guarded by
  `Lrbf;->f()Z`, does choose between model registries — but the alternatives
  target older silicon (`p22`, `janeiro`, `rio`, `l10`) whose assets are absent
  from this build.
* **Launching the stock app in a specific mode.** Pixel Camera reads
  `com.google.assistant.extra.CAMERA_MODE` and maps `"ADD_ME"` via
  `Lfiu;-><clinit>`, with no caller check in `Lfit;`. In practice the extra did
  not switch modes from `am start` through `CameraImageActivity`,
  `CameraLauncher` or the `launch-camera://` deep link — all three landed on
  Photo.

---

## 7. Ambiguity and confidence

* **High confidence** on all four patch points: each fingerprint resolves to
  exactly one method in this build (`tools/verify_fingerprints.py` → `PASS`).
* **The gate fingerprint's last filter is an English log string**
  (`"Photos is disabled. Canceling."`). If Google changes that message the
  fingerprint fails loudly rather than silently mis-patching, but it will need
  updating. The other four filters are structural.
* **Not verified**: whether `Liho;->b` has a second caller reachable only in
  configurations not present on this device. Two callers were found
  (`Lihk;->b()` and `Limh;->onClick`), both thumbnail paths.
* **Not verified by static analysis**: that Immich renders the specific asset
  rather than merely opening. Its intent filter matches
  (`VIEW` + `scheme=content` + `image/*` / `video/*`); the in-app behaviour is a
  runtime test, listed in `TESTING.md`.
