# Package rename: `com.kimkim` → `com.kakazaro.kimlauncher`

**Decision (2026-11-17): not doing this.** The patched build keeps `com.kimkim` and replaces the
original install. These notes are kept for reference only.

## What has to change

Manifest (resource patch; same approach as gmaps-patches' `GoogleMapsMicroGPatch`):

| Item | Original | Change |
|---|---|---|
| `package` | `com.kimkim` | new name |
| Provider authorities | `com.kimkim.fileprovider`, `com.kimkim.androidx-startup` | must be unique per device, so rename them |
| Custom permission | `com.kimkim.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION` | rename (also referenced in dex by AndroidX) |
| `com.kimkim.ic_stack_seed` (affinity/scheme) | | rename |
| Component class names (`com.kimkim.KimLauncherActivity` and others) | | **keep**: classes stay in `com.kimkim.*`, so names stay fully qualified |

Dex (bytecode patch):

| String | Where | Change |
|---|---|---|
| `"/.MainActivityLauncher"` | shell command for `cmd package set-home-activity` | Relative form resolves to `<new pkg>.MainActivityLauncher`, which won't exist. Replace with `/com.kimkim.MainActivityLauncher`. |
| `"com.kimkim"` | `byd/KimAccSentryDaemon`, `KimBydDilink5CarAdapterDaemon`, `KimBydDilink5ExtendedDaemon` | Fallback when the daemon gets no package argument. Replace with the new name. |
| `com.kimkim.external_map_overlay.SHOW/HIDE` | `K1/O3`, `byd/IcCastMainOverlayService`, `byd/SentryForegroundService` | Broadcast actions. Rename them, or both apps will react to each other's broadcasts. |
| everything else | 31 classes use `getPackageName()` | follows the rename automatically |

## What Morphe cannot change (Dart, `libapp.so`)

The Dart code has hard-coded paths:

- `/storage/emulated/0/Android/data/com.kimkim/files/wallpapers`
- `/storage/emulated/0/Android/data/com.kimkim/files/transfers`
- `/storage/emulated/0/Android/data/com.kimkim/files/events` (Sentry recordings)

After a rename the patched app still uses the **original app's** folders. On Android 11+ it
can't write there at all, so wallpapers, file transfer and event recording break. On older
Android both apps would share one folder. Dart AOT strings are length-prefixed objects, so they
can't be edited in place to a longer name. Only a same-length name (10 characters, e.g.
`com.kimkiz`) could be byte-patched in `libapp.so`, and that hasn't been tested.

## Running both apps on one head unit

Even with a clean rename, the two apps compete for the same car resources:

- **HOME launcher**: only one can be the default home
- **Key mapping accessibility service** and **notification listener**: both would grab the
  steering-wheel keys and media sessions
- **Self-ADB** to `127.0.0.1:5555` and the local daemon/PWA servers (port `47888` and others):
  the second app fails to bind, or the two fight over the connection
- **Cameras** (Sentry, live camera, blind-spot on the IC) and the **IC cast overlay**:
  exclusive hardware
- **Vehicle identity** is stored in shared storage (`KimLauncher/vehicle_id.txt`): both apps
  would claim the same vehicle in the cloud backend
- Both use process name `com.byd.warning`. That's allowed for different apps, but it
  confuses BYD tooling and the logs

Practical result: having both installed is fine. Running both at the same time on the car is
not. Keep one disabled, or use the renamed one only on a bench or test unit.
