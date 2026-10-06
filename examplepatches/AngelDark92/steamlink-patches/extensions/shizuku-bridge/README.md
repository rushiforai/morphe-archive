# Shizuku bridge (2026-10-04)

Source of `extensions/shizuku-bridge.mpe`, added by every patch that needs
[Shizuku](https://github.com/RikkaApps/Shizuku): **Controller grip haptics through Shizuku
(experimental)** and **Controller tracking from the controller HAL through Shizuku
(experimental)** with its 2.0.20 - 2.0.22 variant. It is not a patch of its own.

## Why it is shared

Shizuku finds an application's provider by the authority `<package>.shizuku`, and an
application can declare that authority once. Two patches each bringing a provider and a copy
of the Shizuku API could not be applied together, so the provider and the API live here and
the patches bring only their own classes.

`java/gxr/shizuku/ShizukuBridge` (a `ShizukuProvider`) asks Shizuku for permission when
Steam Link starts. For every feature whose classes are in the application it binds a
Shizuku user service, which runs with shell rights, and passes the service's binder to the
feature's bridge class through its `public static void setBinder(IBinder)`:

| Feature | User service | Bridge class |
|---|---|---|
| Grip haptics | `gxr.haptic.HapticService` | `gxr.haptic.HapticBridge` |
| Controller HAL poses | `gxr.pose.PoseService` | `gxr.pose.PoseBridge` |

A feature whose classes are absent is skipped. Without Shizuku, or without its permission,
nothing is bound and the layers leave every call to the runtime. Logcat tag: `GxrShizuku`.

A changed user service needs a higher version number in `ShizukuBridge.FEATURES`, or
Shizuku keeps the running one.

The user services are started 1.5 s apart, and one that has not connected within 8 s is
unbound and started again, up to five times. Started at the same moment, one of the two was
seen left without a connection (`ShizukuServiceStarter: server binder not received`), and
Shizuku does not start it again by itself; the feature then stayed off until Steam Link was
restarted.

## Build

Take `classes.jar` out of the `api`, `provider`, `aidl` and `shared` AARs of
`dev.rikka.shizuku` 13.1.5 (Maven Central, Apache-2.0), then

```powershell
javac --release 8 -cp "<android.jar>;api.jar;provider.jar;aidl.jar;shared.jar" -d classes java/gxr/shizuku/*.java
jar cf gxr.jar -C classes gxr
d8 --release --min-api 29 --lib <android.jar> --output <dir> gxr.jar api.jar provider.jar aidl.jar shared.jar
```

Copy `classes.dex` to `patches/src/main/resources/extensions/shizuku-bridge.mpe` and update
the SHA-256 in `ShizukuBridgePatchTest`.
