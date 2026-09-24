# Third-party gallery for Pixel Camera

Tap the photo thumbnail in Pixel Camera and it opens **your** gallery instead of
demanding Google Photos.

It names no particular app. The thumbnail just fires a normal Android "view this
image" request, so whichever gallery you've installed picks it up — the same way
opening a photo from your file manager does. Tested with Immich; anything that
registers as an image or video viewer should work.

If you have Google Photos disabled, stock Pixel Camera refuses to open the
thumbnail at all and nags you to re-enable it. This fixes that.

Verified end to end on a stock, unrooted **Pixel 10 Pro XL** (Android 17,
Pixel Camera 10.4.117.936816638.14).

---

## Read this first

**This does not replace your Pixel Camera. It installs a second copy alongside
it.**

Pixel Camera is baked into the system partition and signed by Google. A modified
copy can't be installed over it on an unrooted phone — Android rejects the
signature and there's no way around that without root. So the patched build
installs under its own name (`com.google.android.GoogleCamera.morphe`) and shows
up as a second camera icon. Your original stays exactly where it is, untouched.

That has consequences worth knowing before you start:

- **The lock-screen and power-button-double-press shortcuts still open the
  stock camera.** Those are wired to the system camera app, which this isn't.
  You launch the patched one from its icon.
- **It won't update itself.** Google Play only updates the real package. When
  Pixel Camera updates, you redo this (about four minutes — see
  [Keeping it up to date](#keeping-it-up-to-date)).
- **Add Me runs slower.** It can't use the Tensor accelerator in a renamed
  build, so a second patch makes it fall back to CPU models. That patch is on
  by default; you don't have to do anything. Details below.
- **Everything else works**, including all lenses, Night Sight, Portrait, video
  and RAW.

---

## Install with Morphe Manager

Phone only, no computer needed.

### 1. Install Morphe Manager

Grab the APK from
[MorpheApp/morphe-manager releases](https://github.com/MorpheApp/morphe-manager/releases)
and install it. You'll have to allow install from unknown sources.

### 2. Add two patch sources

In Morphe Manager, add both of these as patch sources:

```
https://github.com/Gamer92000/pixelcamera-patches
https://github.com/MorpheApp/morphe-patches
```

You need the second one too — the official collection — because it has the
"Change package name" patch, and without that the patched app cannot be
installed at all.

### 3. Pick Pixel Camera, then select exactly these patches

**From `pixelcamera-patches`:**

| Patch | |
|---|---|
| **Use third-party gallery** | on by default — this is the feature |
| **Run Add Me without the EdgeTPU** | on by default — leave it on, or the app crashes the moment you tap Add Me |
| Use third-party gallery on lock screen | off by default — read the warning below before enabling |

The first two are already selected for you. You only need to touch this screen
if you want the lock-screen patch.

**From `morphe-patches`:**

| Patch | |
|---|---|
| **Change package name** | required — without it the patched app cannot be installed |

> ### ⚠️ You must also open its settings
>
> Tap the **gear icon** next to "Change package name" and turn **both** switches
> on. They are **off by default**:
>
> * **Update permissions** → on
> * **Update providers** → on
>
> Skip this and patching succeeds, then the install fails at the very end with:
>
> ```
> INSTALL_FAILED_DUPLICATE_PERMISSION: Package com.google.android.GoogleCamera.morphe
> attempting to redeclare permission
> com.google.android.GoogleCamera.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION
> already owned by com.google.android.GoogleCamera
> ```
>
> That is 1.2 GB of patching wasted, so set them before you start. Pixel Camera
> declares a custom permission and content providers that collide with the copy
> already on your phone; these two options rename them.

Leave everything else off.

### 4. Patch and install

Let it run, then install the result. Pixel Camera is a 1.2 GB app, so this takes
a while and needs a few GB free.

You'll end up with two camera icons. The patched one is the new one.

---

## Using it

Take a photo, tap the thumbnail. If you have more than one gallery installed,
Android shows its usual "Open with" chooser — pick yours and hit **Always** to
make it the default from then on.

That's it. There are no settings and nothing to configure.

If you later re-enable Google Photos it becomes just another option in that
chooser rather than the forced one.

---

## About the patches

### Add Me

Add Me normally runs on the Tensor chip's AI accelerator, which is locked to
Google-signed apps. A renamed copy gets refused, and the app aborts rather than
coping — so tapping Add Me kills it.

Pixel Camera happens to ship a second, non-accelerated set of Add Me models. The
patch makes it load those instead. Add Me then works normally, just slower.

### Lock screen — read before enabling

When you shoot from the lock screen, Pixel Camera normally hands the photo to a
viewer under a rule that says *show only what was just taken, nothing else*.

Third-party galleries don't implement that rule. Turn this patch on and your
gallery may display **your entire photo library above the lock screen, without
unlocking**. It's off by default for that reason. Only enable it if that's
genuinely fine with you.

---

## If something goes wrong

| What you see | What it means |
|---|---|
| The app closes when you tap Add Me | **Run Add Me without the EdgeTPU** got turned off. It is on by default; re-patch with it enabled. |
| `INSTALL_FAILED_UPDATE_INCOMPATIBLE` | You skipped **Change package name**. Re-patch with it enabled. |
| `INSTALL_FAILED_DUPLICATE_PERMISSION` | `updatePermissions` was off. Turn it on and re-patch. |
| `INSTALL_FAILED_CONFLICTING_PROVIDER` | `updateProviders` was off. Turn it on and re-patch. |
| Thumbnail opens the wrong app | Android remembered a default. Long-press that app → App info → **Open by default** → clear, then tap the thumbnail again and pick properly. |
| Thumbnail does nothing, photo bounces back | Nothing installed can open that file type. Normal for RAW/DNG with no DNG viewer. The camera keeps working. |
| Patching fails partway | Usually free space. Pixel Camera is 1.2 GB and needs a few GB headroom to unpack, patch and re-sign. |

---

## Keeping it up to date

Google Play updates your stock Pixel Camera but not the patched copy, so it
gradually falls behind. To catch up, patch again in Morphe Manager with the same
selections.

The patches are pinned to the Pixel Camera version they were verified against,
so if Manager says the app version isn't compatible, that's the patches needing
an update rather than anything being broken. Open an issue.

If you're checking a new version yourself:

```bash
python tools/verify_fingerprints.py base.apk
```

`RESULT: PASS` means go ahead. Anything else means Google moved the code and the
patches need updating — see [BUILDING.md](BUILDING.md).

---

## Known limitations

- Lock-screen and power-button camera shortcuts open the stock app, not this one.
- No automatic updates.
- Add Me is slower than stock.
- Some Google-server-backed extras may not work, because Google's services only
  serve configuration to apps signed by Google. Photo and video capture,
  all lenses, Night Sight, Portrait, Panorama, Long Exposure and RAW were all
  verified working.
- Only tested on a Pixel 10 Pro XL. Other Pixels will probably work; nobody has
  checked.

---

## Uninstalling

Long-press the patched camera icon and uninstall it, like any app. Your original
Pixel Camera is unaffected — it was never modified.

---

## Doing it from a PC instead

If Morphe Manager can't finish on-device — it has to merge, patch, re-sign and
install a 1.2 GB app — do the same thing on a computer. You need `adb`, Java 21+
and a few GB free.

```bash
# tools
curl -fL -o morphe-desktop-all.jar \
  https://github.com/MorpheApp/morphe-desktop/releases/download/v1.12.0/morphe-desktop-1.12.0-all.jar
curl -fL -o patches-1.37.0.mpp \
  https://github.com/MorpheApp/morphe-patches/releases/download/v1.37.0/patches-1.37.0.mpp
# plus patches-1.0.0.mpp from this repo's releases
```

Copy Pixel Camera off your own phone rather than downloading it from anywhere:

```powershell
.\tools\Pull-PixelCamera.ps1 -OutputDirectory .\work\stock
```

Zip the parts into one `.apkm`, since Pixel Camera ships as a base app plus
feature modules:

```bash
python - <<'EOF'
import os, zipfile
src, out = 'work/stock', 'work/PixelCamera.apkm'
with zipfile.ZipFile(out, 'w', zipfile.ZIP_STORED, allowZip64=True) as z:
    for p in sorted(f for f in os.listdir(src) if f.endswith('.apk')):
        z.write(os.path.join(src, p), p)
EOF
```

Patch and install:

```bash
java -jar morphe-desktop-all.jar patch \
    --patches=./patches-1.0.0.mpp \
      -e "Use third-party gallery" \
      -e "Run Add Me without the EdgeTPU" \
    --patches=./patches-1.37.0.mpp \
      -O updatePermissions=true -O updateProviders=true \
      -e "Change package name" \
    --exclusive \
    --out=./work/PixelCamera-patched.apk \
    ./work/PixelCamera.apkm

adb install -r work/PixelCamera-patched.apk
```

This is the route that's actually been verified end to end.

---

## More detail

| | |
|---|---|
| [BUILDING.md](BUILDING.md) | Building the patch bundle from source |
| [FINDINGS.md](FINDINGS.md) | How the app was reverse-engineered, with the evidence |
| [COMPATIBILITY.md](COMPATIBILITY.md) | Which versions are verified, and the test results |
| [TESTING.md](TESTING.md) | The test procedure |

---

## Licence

GPL-3.0-or-later. See [LICENSE](LICENSE).

This project contains no Google code and no part of Pixel Camera. It's a
description of changes, applied by you, on your own machine, to a copy of an app
already on your own phone.
