# Test procedure

Record actual behaviour next to expected behaviour. Where actual is unknown,
write `not run` — do not assume a pass.

## Setup

```powershell
# Terminal 1 - filtered log
.\tools\Watch-GalleryLaunch.ps1 -Clear
```

The decisive line is `ActivityTaskManager`'s START record. A correct redirect:

```
ActivityTaskManager: START u0 {act=android.intent.action.VIEW
    dat=content://media/external/images/media/NNNN typ=image/jpeg flg=0x1
    cmp=app.alextran.immich/.MainActivity}
```

Three things to check every time:

* `act=android.intent.action.VIEW` — not `android.provider.action.REVIEW`
* **`typ=` present** — an untyped implicit VIEW does not match an `image/*`
  filter, and is the most likely cause of the wrong app opening
* no `pkg=` — a package restriction would mean the redirect did not run

Raw equivalent if you prefer plain adb:

```bash
adb logcat -v time | grep -iE "MorpheGalleryRedirect|ActivityTaskManager|GoogleCamera|ActivityNotFoundException|SecurityException|Permission Denial|ResolverActivity"
```

The extension logs under tag `MorpheGalleryRedirect`, e.g.
`Redirecting review to implicit VIEW, type=image/jpeg` or
`Secure review left untouched: android.provider.action.REVIEW_SECURE`.

Useful state commands:

```bash
# Google Photos enabled state: 0=default 1=enabled 2=disabled 3=disabled-by-user
adb shell dumpsys package com.google.android.apps.photos | grep -m1 "enabled="

adb shell pm disable-user --user 0 com.google.android.apps.photos
adb shell pm enable           com.google.android.apps.photos

# What would the intent resolve to right now?
adb shell cmd package query-activities -a android.intent.action.VIEW \
    -d content://media/external/images/media/1 -t image/jpeg --brief

# Clear a chosen default so the resolver appears again
adb shell pm clear-package-preferred-activities <gallery.package>
```

---

## A. Core cases

| # | Case | Expected | Actual |
|---|---|---|---|
| A1 | Google Photos **enabled** | Thumbnail opens the user's default VIEW handler. If none is set, the resolver appears with Photos among the candidates. No "enable Photos" dialog. | |
| A2 | Google Photos **disabled** (`enabled=3`) | Thumbnail opens the third-party gallery. **No dialog at all** — this is the bug being fixed. | |
| A3 | Immich installed **and set as default** | Immich opens directly, showing the captured item. No resolver. | |
| A4 | Immich installed, **no default set** | System resolver (`com.android.internal.app.ResolverActivity`) lists every handler, Immich included. | |
| A5 | **Multiple** gallery handlers | All appear in the resolver. Choosing "Always" makes A3 apply from then on. | |
| A6 | **No** gallery handler installed | `resolveActivity` returns null; thumbnail animates back, camera stays usable, log shows `Photos is disabled.` `CancellationException`. **No crash.** | |
| A7 | Latest item is a **JPEG** | Opens; `typ=image/jpeg` | |
| A8 | Latest item is an **Ultra HDR JPEG** | Opens as `image/jpeg`; gain map is a file-format detail the viewer may or may not render | |
| A9 | Latest item is **RAW/DNG** | `typ=image/x-adobe-dng`. Opens if something handles DNG, otherwise clean cancel per A6 | |
| A10 | Latest item is a **video** | Opens; `typ=video/mp4` | |
| A11 | Latest item **deleted externally** (delete from another app, then tap) | Viewer reports the item is missing, or the app cancels cleanly. Camera survives. | |
| A12 | Device **locked then unlocked**, then tap | Normal redirect as A2 | |
| A13 | Camera launched **from the lock screen**, base patch only | **Not redirected.** Action stays `…REVIEW_SECURE`; log shows `Secure review left untouched: …`. Stock Photos dialog behaviour applies. | |
| A13b | Camera launched **from the lock screen**, with "Use third-party gallery on lock screen" applied | Redirected: `act=android.intent.action.VIEW`. **Then check what the gallery actually shows without unlocking** — if it shows more than the just-captured item, that is your whole library above the lock screen. Decide whether to keep the patch. | |
| A14 | Camera via **hardware shortcut** (power double-press) | Note: this resolves to the *system* camera app, so it launches stock Pixel Camera, not the patched build. Launch the patched app from its launcher icon instead. | |
| A15 | Camera via another app's **capture intent** (`IMAGE_CAPTURE`) | Capture returns to the calling app as usual. The thumbnail is not the review path here. | |

To exercise A6 without uninstalling anything, disable every handler for the
duration of the test and re-enable afterwards.

---

## B. Regression cases

The patch touches only the thumbnail handoff, but the point is to prove that.

| # | Case | Expected | Actual |
|---|---|---|---|
| B1 | Image capture | Photo saved, thumbnail updates | |
| B2 | Video capture | Video recorded and saved | |
| B3 | Front camera | Works | |
| B4 | Rear camera | Works | |
| B5 | **Every physical rear lens** (ultrawide / wide / tele, full zoom range) | All selectable, all capture | |
| B6 | Night Sight | Available and completes | |
| B7 | Portrait mode | Available; depth effect applied | |
| B8 | Motion photo | Recorded and playable | |
| B9 | RAW capture enabled | `.dng` written alongside the JPEG | |
| B10 | Ultra HDR | Gain map present in output | |
| B11 | Video stabilisation modes | Selectable and applied | |
| B12 | Thumbnail refresh after capture | Shows the newest item | |
| B13 | Orientation change | No crash; thumbnail and UI rotate | |
| B14 | Process restart (`adb shell am force-stop <pkg>`, relaunch) | Cold start OK; thumbnail repopulates | |
| B15 | Switching camera modes | All modes reachable | |
| B16 | Camera settings screen | Opens; settings persist | |
| B17 | Returning from the gallery to Camera | Back returns to the viewfinder in a usable state | |
| B18 | Tap thumbnail **while the previous shot is still processing** | Either the in-progress item opens or the launch cancels cleanly. No crash, no stuck spinner. This is the `setDataAndType` + `processing_uri_intent_extra` path. | |
| B19 | Camera Coach / Pixel-specific features | Behave as before the patch | |
| B20 | **Add Me**, with "Run Add Me without the EdgeTPU" applied | Mode opens and stays open. Slower than stock, since it runs the CPU models. No `SIGABRT`. | |
| B21 | **Add Me**, patch NOT applied, renamed build | Process dies. This is the baseline the patch fixes — see below. | |

### Add Me specifics

The crash this patch fixes is native, so watch for the abort rather than a Java
stack trace:

```bash
adb logcat -d | grep -E "Fatal signal|Abort message|edgetpu|gxp"
```

Unpatched, a renamed build produces:

```
E vendor.google.edgetpu_app_service: <package> is not in the EdgeTPU allowed list
    or signature mismatched.
W CriticalPath: avc: denied { read } for name="gxp" scontext=u:r:untrusted_app:s0
F libc: Fatal signal 6 (SIGABRT) in tid NNNN (AllInCriticalPr)
F DEBUG: Abort message: '… Plugin did not create EdgeTpu delegate.'
```

Patched, none of those `Fatal signal` / `Abort message` lines should appear. The
`edgetpu_app_service` rejection line may still appear from other components —
that alone is harmless. What matters is that the process survives and Add Me
becomes usable.

Confirm the mode really is Add Me rather than the carousel having only scrolled:

```bash
adb shell uiautomator dump /sdcard/ui.xml && adb exec-out cat /sdcard/ui.xml \
  | grep -o 'selected="true"[^>]*' | head
```

For B5, confirm the lens set the app can see:

```bash
adb shell dumpsys media.camera | grep -iE "Camera [0-9]+ information|facing"
```

If a renamed build sees fewer camera IDs than the stock app, that is the
privileged-access question from README §1 answering itself — record it.

---

## C. Failure capture

When something fails, capture and attach:

```bash
adb logcat -d > failure.log
adb shell dumpsys package <your.package.name> > package.txt
adb shell dumpsys activity activities | grep -i resumed > activity.txt
```

and the single `ActivityTaskManager: START` line for the failing tap, which
usually identifies the cause on its own:

* wrong `act=` → the launcher injection did not run
* missing `typ=` → MIME resolution failed; check the `MorpheGalleryRedirect` log
* `pkg=com.google.android.apps.photos` still present → the patch did not apply
* no START line at all, plus a dialog → the availability gate was not patched
