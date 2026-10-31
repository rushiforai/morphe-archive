# AgriConnect mock-location flow

Target: `com.git.agriconnect` 1.0.2 (version code 6)
APK SHA-256: `fdc99ee7181814e588fbc7cedfd350a001de19c2753253ab0313f5324bedae02`

## Where the code lives

| Layer | Location |
|---|---|
| Submit logic | `assets/public/src_app_self-service_checkinout_checkinout_module_ts.7898b27f28c8edc6.js` |
| Alert | `main.4062ce35c40331c6.js` → `swallMockLocation()` |
| Native flag | `com.equimaps.capacitor_background_geolocation.BackgroundGeolocation.formatLocation` |
| Location stream | `BackgroundGeolocationService$LocalBinder.addWatcher` |
| Delivery | `BackgroundGeolocation$ServiceReceiver.onReceive` |
| Precondition | `cordova.plugins.Diagnostic_Location.isGpsLocationAvailable` |

## Flow

### 1. Submit gate

`submitCheckInOut()` runs only on a native platform. It first asks the Cordova diagnostic
plugin whether high-accuracy GPS is available and authorized.

```js
diagnostic.isGpsLocationAvailable().then(ok => {
  if (!ok) { this.presentLocationAlert(); return; }
  ...
})
```

### 2. Watcher

```js
BackgroundGeolocation.addWatcher(
  { requestPermissions: true, stale: true },
  location => { this.isMockLocation = location.simulated }
).then(id => {
  this.bgWatcherId = id;
  setTimeout(() => {
    BackgroundGeolocation.removeWatcher({ id });
    if (this.isMockLocation) {
      this.mainService.swallMockLocation();       // blocked
    } else if (this.location === 'outOffice') {
      ...face recognition / prepareDataSubmit...
    } else {
      this.getUserCurrentPosition('submit', t, n); // -> validateDistance -> submit
    }
  }, 100);
});
```

Because `stale: true`, a cached last location may be returned immediately by
`fetchLastLocation()` before the first fresh fix.

### 3. Native flag

`addWatcher` registers a Fused Location Provider request:
`PRIORITY_HIGH_ACCURACY` (100), interval 1000 ms, maxWait 1000 ms, displacement 0.

Each fix is broadcast to `ServiceReceiver`, which resolves the kept-alive plugin call with:

```java
jSObject.put("simulated", location.isFromMockProvider());
```

That is the complete detection logic: no speed, accuracy, timestamp or jump heuristics.

### 4. Decision

The JS callback stores the boolean, and 100 ms after the watcher was added the page reads it
once. If `true`:

- SweetAlert title **"GPS Palsu terdeteksi!"**
- body **"Harap matikan GPS Palsu Anda"**
- button **"Oke"** → `navCtrl.back()`
- no API request is made

The submit payload has no mock/simulated field (only `deviceVirtual`, the emulator flag), so
the server cannot re-check the decision.

## Patch strategy

### Primary: bytecode

`BackgroundGeolocation.formatLocation` contains:

```smali
const-string v1, "simulated"
invoke-virtual {p0}, Landroid/location/Location;->isFromMockProvider()Z
move-result v2
invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;
```

Replacing `move-result v2` with `const/4 v2, 0x0` makes `simulated` always `false`.
The fingerprint also checks for the `MOVE_RESULT`, so a future layout change fails the patch
instead of corrupting the method.

### Fallback: asset rewrite

The chunk contains the assignment twice (Android and iOS branches):

```js
this.isMockLocation = s.simulated
```

Replacing it with `this.isMockLocation = !1` neutralises both the variable and the ternary
`this.isMockLocation ? swallMockLocation() : ...`.

## Known limits of the original check

- One-shot, ~100 ms window; no monitoring after submission.
- The submitted coordinates come from `@capacitor/geolocation.getCurrentPosition`, a
  different API from the watcher that is inspected.
- The 100 ms timer starts when the JS call is dispatched, not when a fix arrives, so a slow
  first fix leaves the flag at its previous value (`false` by default).
- `stale: true` means an old cached fix can decide the result.
