# BYD Maps patches

Morphe patch bundle that puts your BYD's state of charge in Google Maps' navigation card.

This repository is a **fork of [nl-morphe-patches](https://gitlab.com/johninnld/nl-morphe-patches)**
(GPL-3.0) with one feature added. The upstream patch set is unchanged and still available from the
upstream source; this fork exists so the BYD patch can be released and versioned on its own.

## What it does

| Where | What you see |
|---|---|
| Android Auto | a chip above the ETA card: `33% → 29%` (charge now → charge at arrival) |
| Phone | the same pair appended to the time-remaining line |

The arrival figure is a linear estimate from the car's own consumption (`range ÷ charge`), clamped
at `0%` when the destination is beyond the remaining range.

Data comes from the **BYD Open Remote** companion app over a local, permission-guarded
`ContentProvider`. Nothing leaves the phone, and the companion is not required for Maps to work —
without it, the chip simply does not appear.

## Requirements

| Item | Requirement |
|---|---|
| Google Maps | **26.44.06.1006895251** (versionCode `1068856906`) — the patch is fingerprint-pinned |
| Companion | [BYD Open Remote](https://github.com/kennyric/byd-open-remote) **1.1.0** or newer |
| Root | not required |
| Google account | works with microG-RE as well as Play Services |

## Install

1. **Companion first.** Install `BYD-Open-Remote.apk` and sign in to your BYD account.
2. **Patch Maps.** In Morphe Manager, add this repository as a source (or import
   `patches-<version>.mpp` from Releases), select *BYD battery in the navigation card*, and patch
   your own copy of Maps 26.44.06. Keep the default *Change package name* option **on** — the
   integration targets `org.ungoogled.android.apps.maps`.
3. **Install the patched APK.** For Android Auto to list it, the installer should be recorded as
   the Play Store: `adb install -i com.android.vending -r maps-byd.apk`, or KingInstaller →
   *Install as king*. Most devices also accept a normal install.
4. **Re-read AA's app list** if the app is missing from *Customize launcher*: force-stop
   `com.google.android.projection.gearhead`, or unplug and replug.

The refresh interval is under **Maps → Settings → Customization → BYD battery refresh**
(Off / 10 / 15 / 30 / 60 minutes). Maps only asks the companion for fresher data while navigating,
and the companion enforces a five-minute floor, so the cloud is not polled in the background.

## What this repository does not contain

Google Maps. The patch applies to a copy of Maps **you already have**; no Google binary is
distributed here, and none should be.

## Licence

GPL-3.0, inherited from upstream. Sources for this fork are in this repository; upstream's are at
[nl-morphe-patches](https://gitlab.com/johninnld/nl-morphe-patches).
