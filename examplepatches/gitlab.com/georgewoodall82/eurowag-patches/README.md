# Eurowag Navi Premium Patches

Morphe patches for **Eurowag Navi / Eurowag Navigation – Truck GPS**
(`com.roadlords.android`), a Sygic-based truck navigator.

The patches are pinned to **4.18.1-7eb59b0f (versionCode 41801)**, the XAPK
shipped by APKPure:

```
Eurowag+Navigation+-+Truck+GPS_4.18.1-7eb59b0f_APKPure.xapk
```

## Install the patch source

Open this link on the device:

```
https://morphe.software/add-source?gitlab=georgewoodall82/eurowag-patches
```

Then pick **Eurowag Navi 4.18.1**, select the XAPK, and apply **Unlock Premium**.

Morphe Manager merges the XAPK's base APK and its `arm64-v8a`/`mdpi` splits
before patching. The output is one merged APK. Uninstall the original app
before installing the patched build: the patch is signed with a different key,
and the old app's cached subscription state must be removed too.

## What the patch does

Eurowag is a Sygic white-label. The navigation SDK has its own embedded
license; the commercial **Premium** subscription is a separate layer from
Eurowag's backend:

1. `GET /v3/features` returns a signed **feature JWT**.
2. `fra.resolve` decodes v1/v2/v3 and builds a `fd7` feature set.
3. `fd7.u` is the monetization object, mapped by `am9.i` to the subscription
   status used by every paywall/premium check.
4. Each capability (traffic, speed cameras, voice, lane guidance, favourites,
   vehicle profiles, …) is a different model class. Locked capabilities are
   `Disabled(lockType=…)`, not a boolean.

The patch:

- Returns a complete feature set from `fra.resolve` and from the two local
  fixtures (`arn.v`, `xhn.x`), so it works signed in, signed out, and when the
  backend JWT says free/trial/expired.
- Upgrades the fixture in place:
  - **Traffic**: Full tier, no lock.
  - **Vehicle profiles**: 2 vehicles, **all** parameters editable — dimensions,
    weight, axles, ADR, etc.
  - **Favourites**: 750 places / 500 routes / 500 recent places.
  - **Incidents** and **driving notifications**: enabled.
  - **Speed cameras**, **lane guidance**, **driving restrictions** and
    **voice instructions**: enabled.
  - **Maps**: no premium lock; online and offline maps enabled.
- Forces the subscription status to **Premium**, so the trial countdown, trial
  card and paywall never render. The profile header and settings treat the
  account as a paying subscriber.

No native library is patched. `libsygic.so` is untouched.

## What is still server-side

Eurowag/Sygic validates some data on their servers. A local patch cannot make
those services answer for an account without a real entitlement:

- live traffic and speed-camera **data feeds**
- map downloads and map updates
- Eurowag Pay / fuel cards
- fleet/dispatcher data and company vehicles
- account sync, sign-in and restore-purchase

Offline navigation, offline maps, routing, the truck profile and the local premium UI work.

## Build

```bash
export ANDROID_HOME=~/Android/Sdk
export GITHUB_ACTOR=x GITHUB_TOKEN=y

# Optional: run the patch harness against the base APK.
./gradlew :patches:test

# Generate patches-list.json from the bundle metadata.
./gradlew :patches:generatePatchesList

# MUST be the last build step. Rebuilds the Android bundle and verifies dex.
./gradlew :patches:packageBundle
# result: patches/build/libs/patches-1.0.0.mpp
```

`jar` writes a `.mpp` with the same name as `buildAndroid`, and `build`/`test`
run `jar`. If any of them run **after** `packageBundle`, the `.mpp` loses
`classes.dex` and Morphe Manager shows **0 patches**. `packageBundle` exists to
prevent that: it rebuilds the Android bundle and fails if `classes.dex` is
missing.

## Verify

```bash
python3 verify.py
```

`verify.py` checks the source, the XAPK layout and — if a patched APK is
available — the injected instructions in the patched dex.

## How it was made

See `HOW_IT_WAS_MADE.md` for the reverse-engineering notes: class map, the
feature-JWT pipeline, and why the fixture/status hooks were chosen over
patching each of the twenty feature config classes.

## License

GPLv3. This repository contains only patch code. It does not distribute the
Eurowag APK.
