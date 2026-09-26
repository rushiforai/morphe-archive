# Verification

The changes were verified at three levels: the patch sources, the patched APK, and a device.

## Patch sources

Every Ather patch records the smali it produces, checked against the Ather 13.5.0 base APK, versionCode 321.
Every fingerprint pins the defining class, the method name, the access flags, the return type and the parameter list.
When a target changes, the patch fails with an error instead of writing a broken APK.
The Nothing X fingerprints were checked against Nothing X 3.8.0.

## CLI application

`bash scripts/build.sh` applies the bundle with the Morphe CLI 1.16.0.
The CLI reports an error when a fingerprint does not match, so a successful build means every patch applied.

## dexdump checks

The patched APK was disassembled with `dexdump`, and the injected code was found at the expected places:

| Patch                              | Check                                                                                                                             |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| Bypass security check              | `SecurityCheck.performSecurityCheck` starts with the `Secure` `sget-object` and `return-object`.                                  |
| Report Ather's signing certificate | `com.google.android.gms.common.util.c.e` starts with `const/16 v0, 20`, `new-array`, `fill-array-data` and the certificate bytes. |
| Bypass PairIP licence check        | `com.pairip.application.Application.attachBaseContext` is one `invoke-super` and one `return-void`.                               |
| Permission filter                  | `com.ather.designsystem.components.utils.d.f` calls `MapPref.dropLocationRequests`.                                               |
| Pairing wizard                     | `com.ather.btconnectivity.ui.permission.z0.<init>` builds a one-element `u0[]` holding `PermissionType.NEARBY_DEVICE`.            |
| Analytics toggle                   | All five entry points call `MapPref.analyticsEnabled`.                                                                            |
| Map provider                       | `com.ather.maps.usecase.b.a` calls `MapPref.apply`.                                                                               |
| Morphe settings row                | `createAccountSectionList` calls `MorpheAccount.inject`; `k1.m` calls `MorpheAccount.route`.                                      |
| Ride log                           | `a.invoke` calls `RideStats.adjustMonth` and `adjustChart`; `k` calls `withLocalRides` and `handleRideClick`.                     |
| Enable ride stats                  | `com.ather.domain.featureAccess.a.k` is `const/4 v2, #int 1` and `return v2`.                                                     |
| Charge log                         | The `ScooterShadow$Telemetry$Bike` constructors call `RideLog.onBikeFull`.                                                        |
| True Health capture                | The three response constructors call `HealthLog.onWear`, `onHealth` and `onComponent`.                                            |
| Local notifications                | The `ScooterShadow$Scooters` constructors call `RideLog.onScooters`.                                                              |
| Morphe screens                     | `aapt2 dump xmltree` shows the three activities, the service and the receiver with the expected attributes.                       |

The patched dex also holds the 12 Ather extension classes.
The Nothing X extension is not added to an Ather build, because no Nothing X patch matches that package.

## On-device checks

- The signed split set installs with `adb install-multiple`.
- The Ather ride log and True Health capture were exercised on a device: the history screen exported `ather-rides.csv` and `ather-health.csv`, and the ride table holds rides with their odometer readings.
- The Nothing X K1 dialog appears after the watch bind flow, and Gadgetbridge pairs the first-generation CMF Watch Pro with the captured token on a real device.
