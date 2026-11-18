# TomTom GO Premium Patches

Morphe patch bundle for **TomTom GO / GO Expert** (`com.tomtom.gplay.navapp`).
It unlocks the subscription locally, enables the full truck vehicle profile, and
adds named **My POIs** folders to the main menu.

## Install

1. Install [Morphe Manager](https://morphe.software).
2. Add this source:

   ```
   https://morphe.software/add-source?gitlab=georgewoodall82/tomtom-patches
   ```

3. Download the APK version listed below, patch it, and install.
4. **Uninstall the original app first.** A patched APK is signed with a different
   key, so Android will refuse to update over the Play Store build. Uninstalling
   also clears the old onboarding/subscription state.

## Supported version

| App | Package | Version | Version code |
| --- | --- | --- | --- |
| TomTom GO / GO Expert | `com.tomtom.gplay.navapp` | **3.6.326** | 1678737 |

Other versions can be tried (the bundle marks them experimental), but the app is
fully obfuscated. A new build changes the class names below, so the patches will
fail to find their targets instead of silently doing nothing.

## Patches

### Unlock Premium Subscription

TomTom has no native licence library. This build is pure Java/Kotlin and keeps
its subscription state in three places:

* `qb/a$b` folds the results of every subscription provider into one boolean,
  `hasActiveSubscriptions`.
* `N9/c` maps the subscription list to a state enum:
  `FULL_TRIAL`, `EXPIRING_TRIAL`, `NO_SUBSCRIPTION`, `STORE_SUBSCRIPTION`,
  `LCMS_SUBSCRIPTION`.
* `H9/G0` is the onboarding "SubscriptionHook" that shows the trial timeline or
  the Purchasely paywall.

The patch:

1. makes `hasActiveSubscriptions` always `true`;
2. makes the state mapper always report `STORE_SUBSCRIPTION`;
3. makes every trial check return `false`;
4. skips the onboarding trial/paywall step;
5. makes the subscription shop's trial lookup return `null`, removing the
   "Free Trial – ends on …" card.

### My POIs

Adds a **My POIs** entry to the main menu, directly under My Places: named
folders of saved places, kept completely separate from My Places.

* Create, rename and delete folders; places inside are sorted A-Z with a search box.
* Tap a place to plan a route to it; long-press to rename, copy, move or remove it.
* **Add from My Places** copies selected My Places into a folder. My Places is only
  read, never written. Open My Places once in the app first so a copy can be taken.
* **Add to My POIs** appears next to **Add to My Places** on map popups and search
  results.
* **Add by coordinates** accepts `lat, lon` or a pasted map link.

Data lives in the app's own `SharedPreferences` (`mypois`), not in TomTom's
location storage. The UI is shipped as a Morphe extension (`.mpe`) and merged
into the patched APK, so no extra files are needed on the device.

### Unlock Truck Profile

The full truck profile (dimensions, weight, axle load, ADR, etc.) is hidden
unless TomTom detects a truck subscription, and an observer silently flips a
truck profile back to CAR when the corresponding setting is false.

The patch forces `show_full_vehicle_profile` and `TRUCK_SUBSCRIPTION_PURCHASED`
on whenever the subscription list updates, disables the revert observer, and
forces the in-memory flag used by the vehicle-profile screen.

## What still needs TomTom's servers

The app still talks to TomTom for content that is authorised per account:

* live traffic and speed-camera feeds;
* map downloads/updates;
* TomTom account / MyDrive sync.

If those services reject the account, that is a server-side entitlement and
cannot be fixed in the APK. Offline navigation, routing, the truck profile and
the local UI unlock work without it.

## How it was found (short version)

1. Unpacked `TomTom+GO+Expert_+Truck+GPS_3.6.326_APKPure.apk` (no `lib/`, four dex files).
2. Decompiled with jadx and mapped the subscription stack:
   `Ua/o` = Google Play purchases, `sb/d` = LCMS server subscriptions,
   `pb/a` = subscription context, `qb/a` = combiner.
3. Followed the state enum (`N9/a`) into the onboarding hooks (`H9/*`).
4. Patched the smallest set of methods and verified by re-reading the patched
   dex and running Android's own dex parser (`./gradlew :patches:test`).

## Verify the target

```bash
pip install androguard
python3 verify.py --apk /path/to/TomTom+GO+Expert_+Truck+GPS_3.6.326_APKPure.apk
```

It checks the package/version, the absence of native libraries, every patched
method, its string markers, the Purchasely SDK presence and the My POIs menu /
hook targets.

## Build

```bash
export ANDROID_HOME=~/Android/Sdk

# Optional: run the patch harness first.
./gradlew :patches:test

# MUST be the last build step. This adds classes.dex and verifies the bundle.
./gradlew :patches:packageBundle
# result: patches/build/libs/patches-1.1.1.mpp
```

The Android build step is required. `jar` writes a `.mpp` with the same name as
`buildAndroid`, and `build`/`test` run `jar`; if any of them run **after**
`packageBundle`, the `.mpp` loses `classes.dex` and Morphe Manager shows
**0 patches**. `packageBundle` exists to prevent that: it rebuilds the Android
bundle and fails if `classes.dex` or the extension is missing.

## Retargeting a new TomTom version

1. Dump the new APK's strings/classes and find the equivalents of
   `qb/a$b`, `N9/c`, `tb/d`, `H9/G0`, `x9/x0`, `x9/r0`, `e9/K2`, `e9/v2`, plus
   the My POIs hooks `hc/G.u`, `gc/B1$c.onLocationsRetrieved`, `gc/b1.f1` and
   `gc/P0.f1`.
2. Update `patches/src/main/kotlin/app/tomtom/patches/premium/Fingerprints.kt`,
   `patches/src/main/kotlin/app/tomtom/patches/mypois/Fingerprints.kt`, and the
   pinned version in both `Constants.kt` files.
3. Update `verify.py`, run `./gradlew :patches:test`, then bump the version in
   `gradle.properties`, `patches-list.json` and `patches-bundle.json`.
