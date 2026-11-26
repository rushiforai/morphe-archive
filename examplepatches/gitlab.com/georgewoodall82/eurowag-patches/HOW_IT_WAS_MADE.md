# How it was made

Target: **Eurowag Navi / Eurowag Navigation – Truck GPS 4.18.1-7eb59b0f**
(`com.roadlords.android`, versionCode 41801), XAPK from APKPure.

## 1. Unpacking the XAPK

The XAPK is a split bundle:

| File | Contents |
| --- | --- |
| `com.roadlords.android.apk` | base APK, 4 dex files, `resources.arsc`, assets |
| `config.arm64_v8a.apk` | `lib/arm64-v8a/*.so`, including a 76 MB `libsygic.so` |
| `config.mdpi.apk` | density resources |

The base APK has no native libraries. Patching the base APK alone produces an
APK that cannot install (`INSTALL_FAILED_MISSING_SPLIT`) or cannot load
`libsygic.so`. Morphe Manager merges the XAPK first; the compatibility type in
`Constants.kt` is therefore `ApkFileType.XAPK`.

## 2. The app is a Sygic white-label

`libsygic.so` exports the usual Sygic SDK license classes:

```
CSDKLicense::FeatureEnabled(License::LicensedFeatures)
CSDKLicense::HasMapProviderLicense(...)
License::JwtLicenseSignage
```

The SDK license JWT is embedded in the dex (`eyJjbGllbnRJZCI6IjhscG1yMmZtb3ouc2dj…`)
and already includes map, routing, traffic, offline map/search and speed
profiles. That license is **not** the Eurowag premium subscription, so no native
patch is needed or wanted.

All premium logic is Java/Kotlin.

## 3. The premium pipeline

The important classes are obfuscated and live in the default package:

```
GET /v3/features
      │  signed feature JWT
      ▼
FeaturesHeaderProbe ──► fra.resolve(String)
                          ├─ v1: gra.resolve
                          ├─ v2: hra.resolve
                          └─ v3: ira.resolve
                                │
                                ▼
                              fd7  (feature set)
                                │ .u = ehc (monetization)
                                ▼
                              ue7  (le7 data source)
                                │
                                ▼
                              khc  (ysa repository, maps with am9)
                                │
                                ▼
                              bhc  (subscription status)
                                ├─ zgc = Premium
                                ├─ ahc = Trial
                                ├─ ygc = Paywall
                                ├─ wgc = Freemium
                                └─ xgc = None
```

`bhc` is the value consumed by:

- the subscription screen (`tvj`, `ivj`, `bvj`),
- the profile header (`z4b`: `bhc instanceof zgc`),
- the is-premium flows (`ps7`, `wa3`),
- the subscription-entry visibility (`cy1`, `yxa`, `agh`).

`am9` is a synthetic class with one private transform per feature. The
monetization transform is `am9.i(Object)` (case 22 in `am9.invoke`). It maps
`ehc` to `bhc`.

## 4. Feature models and locks

`fd7` is a data class with one field per capability:

| Field | Type | Meaning |
| --- | --- | --- |
| `a` | `wkb` | maps (online/offline + lock) |
| `b` | `ajh` | routing types |
| `c` | `yzh` | search types |
| `d` | `oqk` | traffic tier + lock |
| `e` | `boolean` | incidents |
| `f` | `vcd` | speed cameras |
| `g` | `xdm` | voice instructions |
| `h`,`i`,`j` | `vcd` | lane guidance, driving restrictions, other notifications |
| `k` | `r87` | favourites limits |
| `l` | `r3m` | vehicle profiles |
| `m` | `s93` | company vehicles |
| `n` | `op8` | help center |
| `o`,`p` | `boolean` | in-app auth, app rating |
| `q` | `wn6` | Eurowag Pay |
| `r`,`s` | `boolean` | cards, visa cards |
| `t` | `izk` | transports/dispatcher |
| `u` | `ehc` | monetization |
| `v` | `y8c` | messaging |

Locked capabilities use different classes, not a flag:

```
vcd:  ucd = Enabled          tcd = Disabled(lockType)
xdm:  wdm = Enabled          vdm = Disabled(lockType)
izk:  hzk = Enabled(interval) gzk = Disabled(lockType)
r87:  q87 = Enabled(limits)  p87 = Disabled
r3m:  q3m = UserVehicles      p3m = SinglePredefinedVehicle
s93:  r93 = Enabled           q93 = Disabled
```

`lockType` (`uva`) is one of `qva` Login, `sva` Premium, `pva`
AssignToProVehicle, `tva` PremiumNoCTA, `rva` None. The lock is produced by
`wm5.P(dd7)` from the backend's `EnabledWithUpgradeConfig.upgrade` field.

## 5. Why patch fixtures instead of the config classes

The backend sends one config class per capability (`MapsSettingInternalV3`,
`TrafficSettingInternalV3`, `VehicleProfilesSettingInternalV3`, …), each with a
base and an active variant. Rewriting all of them would mean twenty
constructor patches across v1/v2/v3 and would still miss the `enabled=false`
cases.

Instead the app already contains complete local feature sets:

```
xhn.x()  ->  minimal "not signed in" set
arn.v()  ->  "signed in but no premium features" fallback
```

`dra.d()` returns `tc7(xhn.x())` when there is no user, and `dra.c()` returns
`uc7(arn.v())` for the non-premium fallback. A licensed user goes through
`fra.resolve`.

So the patch:

1. Redirects `fra.resolve` to `arn.v()`.
2. Redirects `xhn.x` to `arn.v()`.
3. Upgrades the constants in `arn.v()`:

   - `wkb(false-lock)` → `wkb(online=true, offline=true, rva)` (no map lock)
   - traffic `eqk` (Limited) + `hqk` (AssignToProVehicle) →
     `dqk` (Full) + `kqk` (None)
   - `vdm` (voice disabled) → `wdm` (enabled)
   - two `tcd` (lane/driving disabled) → `ucd` (enabled)
   - `tsl` (DimensionalOnly) → `rsl` (All vehicle parameters)
   - favourites are already `q87(750, 500, 500)`
   - vehicles are already `q3m(..., 2, ...)`

4. Forces `am9.i` to return `zgc` (Premium), keeping the real product id when
   the monetization object is a `chc`.

This is four class edits in total, works for every JWT version and every
signed-in/signed-out/fallback path, and avoids touching the SDK license.

## 6. Verification

- `./gradlew :patches:test` applies the patch to the real base APK and asserts
  the resolver redirects, the fixture constants and the Premium status.
- The Morphe desktop CLI was run against the real XAPK. It merged the splits,
  applied the patch, and produced a 106 MB APK with `libsygic.so`,
  `resources.arsc` and the patched `classes5.dex`.
- `verify.py` checks the published bundle and, when a patched APK is present,
  reads the patched dex and asserts the exact instructions.

## 7. Caveats

The patch changes what the app believes locally. It cannot make Eurowag/Sygic
servers return data for an account without a real entitlement. Live traffic and
speed-camera data feeds, map downloads/updates, Eurowag Pay and fleet data can
still be refused server-side. The navigation SDK license embedded in the app is
separate and remains untouched.
