# Ather patches

Every patch on this page declares `compatibleWith("com.athermobileapp")` and was verified against Ather 13.5.1 (versionCode 324) and Ather 13.6.0 (versionCode 327).
Each patch records the smali it produces in its source file.
The 13.6.0 release renamed or moved several targets, so each section lists both sets where they differ.

## Ather 13.6.0 integrity changes

Ather 13.6.0 adds three layers on top of the 13.5.1 checks.

- **PairIP returns.** The manifest declares `com.pairip.application.Application`, and the app package reports `Google Play App License: Required`.
  The `Bypass PairIP licence check` patch removes the licence call from `attachBaseContext`.
- **Firebase App Check with the Play Integrity provider.** The new `com.ather.firebase.integrity` package acquires an App Check token and attaches it to API requests as `X-Firebase-AppCheck`.
  The token comes from Firebase App Check; the app does not call the Play Integrity API directly.
- **Continuous device monitor.** `com.athermobileapp.integrity.b` re-runs the local check every 30 to 120 seconds while the app is open.
  If the local check fails, it asks the server for a verdict and can switch the UI to `IntegrityRejected` in the middle of a session.

The local verdict is `com.athermobileapp.startupintegrity.c.a` for the cold start and `c.b` for the re-check.
Both return a `com.athermobileapp.startupintegrity.b` constant: `Passed`, `PassedUnverified`, `Retryable` or `Rejected`.
The patch returns `Passed` from both methods and makes the local check return `Secure`.
The startup gate is client-side, so the patch removes the dialog and the mid-session block.
The server-side App Check verdict cannot be forged: if the backend requires a valid token, a GrapheneOS device without certified Play services cannot satisfy it.

### Login and App Check

The login request goes to `https://cerberus.ather.io/api/v2/req/8h91`.
`com.atherenergy.ktorclient.b` adds `X-Firebase-AppCheck` only when it can acquire an App Check token.
If token acquisition fails, the Ktor plugin continues without the header and the server rejects the request.
The server returns the generic message `Unable to process your request. Please try again.`
The message is not in the APK resources or Java sources.

On a de-Googled user profile, Google Play services are absent and token acquisition fails.
Sandboxed Play services in a private space are a different Android user.
An app in the owner profile cannot bind to Play services in another user.
An app installed inside the private space can reach Play services, but Play Integrity still evaluates the device and the APK signature.
GrapheneOS is not Play-certified, so `MEETS_DEVICE_INTEGRITY` fails.
The patched APK is re-signed, so app integrity does not match the Play-distributed app.
A client patch cannot forge the server-side verdict.

Firebase App Check requires the `PLAY_RECOGNIZED` app recognition verdict by default.
The `allowUnrecognizedVersion` setting defaults to false.
A re-signed APK gets `UNRECOGNIZED_VERSION` or `UNEVALUATED`.
The server rejects it unless Ather enabled `allowUnrecognizedVersion`.
The APK does not reveal this server-side setting.
The `Report Ather's signing certificate` patch fixes the `X-Android-Cert` header for Google APIs.
It does not change the Play Integrity app recognition verdict.

On GrapheneOS with sandboxed Play services in a private space, logcat shows `ClassicPlayIntegrityServiceWrapper: integrity token request detected` and `showPlayIntegrityNotification: caller: com.athermobileapp`.
DroidGuard binder calls take 5 to 10 seconds, and the login request fails after the integrity refresh.
The original 13.6.0 in the same private space shows the startup rejection screen.
GrapheneOS `gmscompat` replaces the PairIP application class, but the Play Integrity check still fails.
This confirms that the app reaches the Play Integrity path and that the server rejects the result.

## Bypass security check

**What it does.** Stops the Developer Options warning and the root and Frida detection that otherwise block the app from starting.

**Target.** `com.ather.common.utils.coreUtils.w.b(boolean)` returns `com.ather.common.utils.coreUtils.v` on 13.5.x.
The names are obfuscated: `w` is the check factory, `v` its result base, `u` the `Secure` result, `s` the `Compromised` result and `t` the `DeveloperOptionsEnabled` result.
Ather 13.6.0 moved the factory to `com.ather.common.utils.coreUtils.i0.b(boolean)`, which returns `i0$a`.
`i0$a$a` is `Compromised`, `i0$a$b` is `DeveloperOptionsEnabled` and `i0$a$c` is `Secure`.
The fingerprint pins the defining class, the method name and the signature.

**Smali.** The patch inserts this at index 0.
The original body stays behind the return and is unreachable.

```smali
sget-object v0, Lcom/ather/common/utils/coreUtils/u;->a:Lcom/ather/common/utils/coreUtils/u;
return-object v0
```

On 13.6.0 the injected return is:

```smali
sget-object v0, Lcom/ather/common/utils/coreUtils/i0$a$c;->a:Lcom/ather/common/utils/coreUtils/i0$a$c;
return-object v0
```

**Verified.** `dexdump` of the patched 13.5.1 APK shows `w.b` starting with the `Secure` `sget-object` and `return-object`.
`dexdump` of the patched 13.6.0 APK shows `i0.b` starting with the `Secure` `sget-object` and `return-object`.

## Bypass signature guard

**What it does.** Stops the native signature check that closes the app when the APK is not signed by Ather.

**Target.** `com.ather.common.utils.coreUtils.SignatureGuard.a(callback)` returns `boolean`.
The callback type is `navigation.c` on 13.5.1 and `ui.main.x` on 13.6.0, so the fingerprint pins the single-parameter shape.
`MainActivity.onCreate` calls the guard before it does anything else and returns when the guard returns false.

**Smali.** The patch replaces the whole body with a `true` return.

```smali
const/4 p0, 0x1
return p0
```

**Verified.** `dexdump` of the patched APK shows `SignatureGuard.a` starting with `const/4 p0, #int 1` and `return p0`.

## Report Ather's signing certificate

**What it does.** Reports Ather's own signing-certificate hash to Google's APIs, so Firebase login and live vehicle data keep working after the app is re-signed.

**Target.** `com.google.android.gms.common.util.c.e(Context, String)` returns `byte[]` on 13.5.x.
Ather 13.6.0 moved the helper to `com.google.android.gms.common.util.a.a(Context, String)` and left `c` as an interface, so the patch matches either helper.
The method is the helper every Google SDK call funnels its `X-Android-Cert` header through.

**Smali.** The patch inserts this at index 0.
The 20 bytes are the SHA-1 of Ather's original certificate, which is public information carried by every Ather APK.

```smali
const/16 v0, 0x14
new-array v0, v0, [B
fill-array-data v0, :ather_cert_sha1
return-object v0
:ather_cert_sha1
.array-data 1
    0x38t 0x56t 0x07t 0xf0t 0x69t 0x26t 0xcet 0xd3t 0xc0t 0x63t
    0x09t 0x14t 0xbct 0x6bt 0x78t 0xact 0x2bt 0xa9t 0x92t 0x11t
.end array-data
```

**Verified.** `dexdump` of the patched APK shows `com.google.android.gms.common.util.c.e` starting with `const/16 v0, #int 20`, `new-array`, `fill-array-data` and the certificate bytes.

## Bypass PairIP licence check

**What it does.** Removes Google Play licence verification, so the re-signed app starts outside the Play Store.

**Target.** `com.pairip.application.Application.attachBaseContext(Context)`.
PairIP injects this class as the app's real `Application`, and its `attachBaseContext` is where the licence check starts.
The class name survives obfuscation because the manifest references it.
The 13.5.1 build dropped PairIP, so the patch matches nothing there and leaves the app untouched.
Ather 13.6.0 bundles PairIP again and declares `com.pairip.application.Application` in the manifest, so the patch applies.

**Smali.** The patch replaces the whole body with the super call and a return.

```smali
invoke-super {p0, p1}, Lcom/pairip/application/Application;->attachBaseContext(Landroid/content/Context;)V

return-void
```

**Verified.** `dexdump` of the patched 13.5.0 APK shows the method is four code units: one `invoke-super` and one `return-void`.

## Permission filter

**What it does.** Drops phone location, call log, contact and SMS permissions from the request list, so the app asks only for the permissions its features use.
Nothing is faked: the app never requests the permissions, and the features that need them stay switched off.

**Target.** Two methods:

- `com.ather.designsystem.components.utils.d.f(List, a, k, <composer>, int)` is the composable that renders the permission dialog on 13.5.x.
  Ather 13.6.0 moved it to `com.ather.designsystem.components.utils.f1.c(List, a, l, <composer>, int)`.
  It is the only place that shows a permission request, so filtering the list there covers every request the app makes.
- `com.ather.btcore.utils.e.a()` is the pairing capability probe on 13.5.x.
  It returns true only when contacts, Nearby device, call and SMS access are all granted.
  Ather 13.6.0 no longer ships the probe; the patch skips the probe when it is absent.

**Smali.** Inserted at index 0, before the composable opens any Compose group.
The guard writes the filtered list back to the parameter register and returns when nothing is left to ask for.

```smali
move-object/from16 v0, p0
invoke-static {v0}, Lapp/morphe/ather/MapPref;->dropLocationRequests(Ljava/util/List;)Ljava/util/List;
move-result-object v0
move-object/from16 p0, v0
invoke-interface {v0}, Ljava/util/List;->isEmpty()Z
move-result v1
if-nez v1, :morphe_permissions
return-void
```

The probe loses the `checkSelfPermission` guard for `READ_CONTACTS` and `SEND_SMS`.
Each guard is four instructions, and the patch removes the `const-string`, the `checkSelfPermission` call, the `move-result` and the `if-nez`.

**Verified.** `dexdump` of the patched 13.5.1 APK shows `MapPref.dropLocationRequests` called in `d.f`.
`dexdump` of the patched 13.6.0 APK shows it called in `f1.c`.
The extension drops the location permissions and the call, contact, SMS and call-log list from the request list.

## Pairing wizard

**What it does.** Makes the setup wizard ask only for Nearby device access, so scooter pairing completes without call log, contact or SMS permissions.

**Target.** `com.ather.btconnectivity.ui.permission.a1.<init>` on 13.5.1 and `com.ather.btconnectivity.ui.permission.a0.<init>` on 13.6.0.
The constructor builds a five-element array with `filled-new-array`: call logs, manage calls, contacts, SMS and Nearby device.

**Smali.** The patch replaces the five-element array with the Nearby device entry alone.
`v1` holds `PermissionType.NEARBY_DEVICE`.

```smali
filled-new-array {v1}, [Lcom/ather/btconnectivity/ui/permission/v0;
```

On 13.6.0 the array type is `[Lcom/ather/btconnectivity/ui/permission/a0$b;`; `v1` still holds the `PermissionType.NEARBY_DEVICE` entry.

**Verified.** `dexdump` of the patched 13.5.1 APK shows the one-element `v0[]` array.
`dexdump` of the patched 13.6.0 APK shows the one-element `a0$b[]` array.

## Analytics toggle

**What it does.** Blocks MoEngage, PostHog and Firebase events while the Morphe setting is off.
Crashlytics is untouched, so bugs stay reportable.
The setting defaults to on, so the patch changes nothing until you switch the block on.

**Target.** Five entry points:

- `com.aptener.bluconnect.app.peripheral.usecase.PeripheralAnalyticsLogger.logEvent(AnalyticsEvent)` returns `Unit`.
  The Unit type is `kotlin.z` on 13.5.x and `kotlin.b0` on 13.6.0.
- `com.ather.analytics.b.a(c, List)` is the MoEngage dispatcher on 13.5.x and holds the application context in field `a`.
  Ather 13.6.0 turned `b` into an interface; the implementation is `com.ather.analytics.c.a(d, List)`.
- `com.ather.firebase.analytics.AnalyticsKt.logAnalyticEvent(String, EventType, HashMap, Double, CommonCustomParam)` is unchanged.
- `com.ather.analytics.service.b.a(c)` on 13.5.x and `com.ather.analytics.service.b.a(d)` on 13.6.0.
- `com.ather.ci.navigation.destinations.g.invoke(Object)` is the PostHog initialiser on 13.5.x.
  Ather 13.6.0 no longer ships that initialiser, so the patch skips it.

**Smali.** Inserted at the start of each entry point.
The `Unit`-returning logger returns `sget-object v0, Lkotlin/z;->a:Lkotlin/z;` followed by `return-object v0` instead of `return-void` on 13.5.x.
On 13.6.0 it returns `sget-object v0, Lkotlin/b0;->a:Lkotlin/b0;` instead.

```smali
invoke-static {}, Lapp/morphe/ather/MapPref;->analyticsEnabled()Z
move-result v0
if-nez v0, :morphe_analytics_on
return-void
:morphe_analytics_on
```

The MoEngage dispatcher reads the context from its own field first.

```smali
iget-object v0, p0, Lcom/ather/analytics/b;->a:Landroid/content/Context;
invoke-static {v0}, Lapp/morphe/ather/MapPref;->analyticsEnabled(Landroid/content/Context;)Z
move-result v0
if-nez v0, :morphe_analytics_on
```

The PostHog guard sits before the initialiser and jumps to the instruction after the configuration is applied, which releases the monitor the initialiser holds.

**Verified.** `dexdump` of the patched APK shows `MapPref.analyticsEnabled` calls in all five classes.

## Map provider

**What it does.** Uses the map provider chosen in the Morphe settings row and falls back to OpenStreetMap when Google Maps or Mappls cannot load.

**Target.** Three provider lookups:

- 13.5.x: `com.ather.maps.usecase.b.a()`, `b(BasicScooterInfo)` and `c(ScooterShadow)`, all returning `com.ather.maps.a0`.
- 13.6.0: `com.ather.maps.usecase.c.a()`, `b(BasicScooterInfo)` and `c(ScooterShadow)`, all returning `com.ather.maps.x`.

**Smali.** Inserted before the return of each lookup.
The extension method takes and returns `Object`, so the patch casts back to the provider enum of the matched build.

```smali
invoke-static {p0}, Lapp/morphe/ather/MapPref;->apply(Ljava/lang/Object;)Ljava/lang/Object;
move-result-object p0
check-cast p0, Lcom/ather/maps/x;
```

On 13.5.x the cast target is `Lcom/ather/maps/a0;`.
`MapPref.apply` reads the enum constant by name, so it does not link against either enum at build time.

The extension honours a forced `google`, `mmi` or `osm` choice.
In auto mode it keeps Ather's choice but maps a resolved Google Maps or Mappls provider to OpenStreetMap.
Mappls needs a licence tied to Ather's signing certificate, so it cannot load in a re-signed build.

**Verified.** `dexdump` of the patched APK shows `MapPref.apply` called in `com.ather.maps.usecase.b.a`.

## Morphe settings row

**What it does.** Adds a "Morphe settings" row to the account screen, which opens the map provider, analytics and ride log settings.

**Target.** Two methods:

- `com.ather.account.model.AccountSectionMapperKt.createAccountSectionList(...)` builds the account screen's section list.
- `com.ather.account.ui.account.k1.m(k1, String)` handles a clicked row's link on 13.5.x.
  Ather 13.6.0 moved it to `com.ather.account.ui.account.i0.o(i0, String)`.

**Smali.** The last `return-object` of the list builder is replaced in place, so the label that ends the section loop stays on the injected call.
The click handler gets the routing call at index 0.

```smali
:cond_4
invoke-static {v0}, Lapp/morphe/ather/MorpheAccount;->inject(Ljava/util/List;)Ljava/util/List;
move-result-object v0
return-object v0
```

```smali
invoke-static {p1}, Lapp/morphe/ather/MorpheAccount;->route(Ljava/lang/String;)Ljava/lang/String;
move-result-object p1
```

The extension inserts a "Morphe" section above the section that holds the `set_app_icon` row and opens `MorpheMapSettingsActivity` for the `morphe://settings` link.

**Verified.** `dexdump` of the patched 13.5.1 APK shows `MorpheAccount.inject` in `createAccountSectionList` and `MorpheAccount.route` in `k1.m`.
`dexdump` of the patched 13.6.0 APK shows the same calls in `createAccountSectionList` and `i0.o`.

## Ride log

**What it does.** Shows the rides recorded on this phone in the ride story screens, including their detail screen.

**Target.** Three methods:

- `com.ather.ridestories.ui.allHighlights.composables.a.invoke` draws the "Your month so far" row.
  The row data is `allHighlights.d` on 13.5.x and `allHighlights.b` on 13.6.0.
- `com.ather.ridestories.ui.previousRides.l.i` loads the previous rides list on 13.5.1; 13.6.0 uses `previousRides.k.i` with the `d` continuation type.
- `com.ather.ridestories.ui.previousRides.l.a` handles a ride click on 13.5.1; 13.6.0 uses `previousRides.k.a` with the `base.d` event type.

**Smali.** Inserted after the monthly row data is read.
The 13.6.0 build keeps the chart in `v1`, the month in `v2`/`v3` and the flag in `v4`; `v31` and `v33` are scratch registers in that method.

```smali
invoke-static {v12, v13}, Lapp/morphe/ather/RideStats;->adjustMonth(Ljava/lang/String;Ljava/lang/Integer;)[Ljava/lang/Object;
move-result-object v18
if-eqz v18, :morphe_month_unchanged
const/16 v19, 0x0
aget-object v12, v18, v19
check-cast v12, Ljava/lang/String;
const/16 v19, 0x1
aget-object v13, v18, v19
check-cast v13, Ljava/lang/Integer;
const/4 v14, 0x0
:morphe_month_unchanged
invoke-static {v11}, Lapp/morphe/ather/RideStats;->adjustChart(Ljava/util/List;)Ljava/util/List;
move-result-object v11
```

On 13.6.0 the same injection uses `v2`, `v3`, `v31`, `v33`, `v4` and `v1` instead of `v12`, `v13`, `v18`, `v19`, `v14` and `v11`.

Inserted after the previous rides list is cast, and in place of the null list.

```smali
invoke-static {v6}, Lapp/morphe/ather/RideStats;->withLocalRides(Ljava/util/List;)Ljava/util/List;
move-result-object v6
```

```smali
invoke-static {}, Lapp/morphe/ather/RideStats;->localGroups()Ljava/util/List;
move-result-object v10
```

Inserted at the start of the click handler, which returns early when the ride belongs to the local log.

```smali
invoke-static {p1}, Lapp/morphe/ather/RideStats;->handleRideClick(Ljava/lang/Object;)Z
move-result v0
if-eqz v0, :morphe_not_ours
return-void
:morphe_not_ours
```

**Verified.** `dexdump` of the patched 13.5.1 APK shows `RideStats.adjustMonth` and `adjustChart` in `a.invoke`, and `withLocalRides` and `handleRideClick` in `l`.
`dexdump` of the patched 13.6.0 APK shows the same calls in `a.invoke` and `k`.

## Enable ride stats

**What it does.** Turns on the ride-stats feature flag that the app ships disabled.

**Target.** `com.ather.domain.featureAccess.a.k()` reads the server flag `app_ridestats` and returns it.
The class name is obfuscated, so the fingerprint pins the defining class plus the flag string.

**Smali.** The body is replaced.

```smali
const/4 p0, 0x1

return p0
```

**Verified.** `dexdump` of the patched APK shows `com.ather.domain.featureAccess.a.k` is `const/4 v2, #int 1` and `return v2`.

## Charge log

**What it does.** Records the charge sessions the scooter reports, so the Morphe history screen can show them.

**Target.** `com.ather.common.datastore.models.ScooterShadow$Telemetry$Bike`.
The class is obfuscated, so the marker field `bmsRcDisable:I` identifies the write sites instead of a method signature.
Three constructors end on that field: the synthetic one the serialiser uses and the two the app calls directly.

**Smali.** Inserted before every `return-void` that directly follows a write to the marker field.

```smali
# after the write to bmsRcDisable

invoke-static {p0}, Lapp/morphe/ather/RideLog;->onBikeFull(Ljava/lang/Object;)V

return-void
```

**Verified.** `dexdump` of the patched APK shows `RideLog.onBikeFull` called in the class constructors.

## True Health capture

**What it does.** Captures the True Health report while the app builds it, so the Morphe history screen can show the part wear.

**Target.** Three response constructors in `com.ather.atherapplabs.atherlabs.features.trueHealth.api.response`:

- `WearAndTearComponent.<init>(int, String, String, int, int, int, String, String, Tag, Description)`.
- `Health.<init>(int, OverallHealth, List, List)`.
- `Component.<init>(int, String, String, double, double, String, String, Tag, Description)`.

**Smali.** Inserted right after the super constructor call, where the payload fields are still intact.
The `Component` constructor has four local registers, so the two doubles occupy `v8`/`v9` and `v10`/`v11`.

```smali
invoke-direct {p0}, Ljava/lang/Object;-><init>()V

invoke-static {p2, p3, p4, p5, p6}, Lapp/morphe/ather/HealthLog;->onWear(Ljava/lang/String;Ljava/lang/String;III)V
```

The other two calls are `HealthLog.onHealth(Object, Object)` and `HealthLog.onComponent(String, String, double, double)` with `invoke-static/range {v6 .. v11}`.

**Verified.** `dexdump` of the patched APK shows `HealthLog.onWear`, `onHealth` and `onComponent` in the three constructors.

## Local notifications

**What it does.** Turns the track alerts the app receives into local notifications.

**Target.** `com.ather.common.datastore.models.ScooterShadow$Scooters`.
The class is obfuscated, so the marker field `users:Ljava/util/Map;` identifies the write sites.
Three constructors end on that field.

**Smali.** Inserted before every `return-void` that directly follows a write to the marker field.

```smali
# after the write to users

invoke-static {p0}, Lapp/morphe/ather/RideLog;->onScooters(Ljava/lang/Object;)V

return-void
```

The extension posts the notifications the server pushes over the shadow, plus alerts derived from the same stream: charging started, fully charged, charging stopped, movement detected, scooter switched on, update available, battery low and range low.
Every alert is an edge, so a value that persists does not alert again.

**Verified.** `dexdump` of the patched APK shows `RideLog.onScooters` called in the class constructors.

## Morphe screens

**What it does.** Registers the Morphe settings, history and ride screens, the background ride service and its boot receiver in the app manifest.

**Target.** `AndroidManifest.xml`.
This is a resource patch, so it edits the manifest document instead of smali.

**Change.** The patch adds three activities, a service and a receiver under the `application` element:

- `app.morphe.ather.MorpheMapSettingsActivity`, label "Morphe settings".
- `app.morphe.ather.MorpheHistoryActivity`, label "Morphe history".
- `app.morphe.ather.MorpheRideActivity`, label "Morphe ride".
- The activities are not exported, locked to portrait and use `@android:style/Theme.Material.NoActionBar`.
- `app.morphe.ather.RideService`, not exported, `foregroundServiceType="connectedDevice"`.
- `app.morphe.ather.RideBootReceiver`, not exported, with a `BOOT_COMPLETED` intent filter.

Android only starts a component that the manifest declares, so all five have to be added.
The app already asks for every permission these components need, so the patch adds components only.

**Verified.** `aapt2 dump xmltree` of the patched APK shows all five components with those attributes.
