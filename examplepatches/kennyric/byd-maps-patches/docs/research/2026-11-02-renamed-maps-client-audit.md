# Renamed Maps client: native car interfaces

## Exact user-supplied client

- File: `~/Desktop/Ungoogled_Maps-v26.43.05.1002020710-Dutch_App_Patches-v1.26.0.apk`
- SHA-256: `59704bef2b91c30c7800f907a8bf8101848edf453207986da5954ec387a80812`
- Package: `org.ungoogled.android.apps.maps`
- Maps version: `26.43.05.1002020710`
- APK signer: `CN=Morphe`, SHA-256 `8a47c1bacd4161681c22797ce63c240ae706a5e69778bebde95c7c5fe8b0c4e5`

The reviewed original Maps APK uses Google's signing certificates: `7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053` for SDK 33+ and `f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83` for SDK 24–32. Re-signing changes that app identity; changing its package or installer does not restore Google's certificate.

REA package evidence: `ev_069e7afc0065f6c315e345715bc943da2063a4fef34220aa2aaab9fb5082a4b2`. Signatures were independently checked with `apksigner verify --print-certs`. Full JADX source is retained locally under `.analysis/gearslip-maps-native/user-v1.26-jadx/`; signature records are in `user-client-signatures.json` beside it. The fingerprint tool identifies native Java/Kotlin. Its namespace-based obfuscation estimate is not authoritative; the relevant original classes retain short R8 names.

## Separate public and private interfaces

| Interface | Client behavior in this APK | Consequence |
| --- | --- | --- |
| Standard Car App Library navigation service | No `androidx.car.app.CarAppService` / `NAVIGATION` service declaration | Gearslip cannot discover a native map template service from this client as supplied. |
| Original Maps projection service | `GmmCarProjectionService`, with projection-navigation categories, is retained under the renamed package/process | Its original car renderer remains available, but this protocol differs from Car App Library. |
| Google-private vehicle/sensor/message client | The original `pwx` / `beil` / `pww` path remains | It can still try Google's privileged car APIs, independently of public navigation-app discovery. |
| Android Auto installer attribution | An installation property, separate from APK signer | KingInstaller can help public app discovery; it cannot grant Google's private signing identity. |

The distinction explains why Android Auto can accept a renamed app through the public navigation interface and subsequently reject a different call made by that app's retained private integration.

## Recovered private-client call flow

```text
Maps' original CarNavigationProviderService
  -> tqj creates pwx
  -> pwx creates a beil token with the pww connection listener
  -> beil.e creates the real Android Auto car client
  -> pww.b handles onCarConnected
  -> CarInfo, CarSensorManager and car-message requests to Android Auto
  -> Android Auto checks the calling APK's signing identity
```

`pwx.java`, `beil.java` and `pww.java` decompile identically in the exact user APK and the reviewed original Maps APK. Focused REA evidence `ev_991cd42090c834da80ecbc46d244aedf83cbec52f5db0805df2b094c221866b5` covers `pwx` construction; `ev_b9ae0e3c6606bc8b8bc9ed1af514a078ad65c24950a5e5e0c2abc2b0e088d80e` covers the real connection start in `beil.e()`.

The genuine Android Auto 18 test of the development build observed an uncaught `SecurityException: Wrong signature - go/gearhead-retail-device` through `pww.b`. That is runtime evidence for the development build; the supplied user APK itself was statically inspected, not installed over any user device.

## Patch boundary

The Morphe work adds a public navigation service that runs the patched package's own original Maps car activity. It authenticates the actual host UID and binds the original projection service **inside the same renamed package**. No stock Maps fallback is used.

A narrow guard at the connection-start method leaves only tokens with the original `pww` listener disconnected. This avoids requesting the denied private vehicle/sensor/message APIs. Vehicle readings remain unavailable rather than invented. Other token listeners and the native renderer's separate `beld` connection retain their original paths. Selecting this native-navigation patch deliberately disables that optional private integration throughout the patched client, including original projection/phone flows; it does not disable Android location or the routing engine.

Android Auto's certificate checks remain unchanged. This audit establishes the relevant binary structure and signing distinction, not completion of the separate host-runtime acceptance gates tracked in [the native-car investigation](2026-11-02-maps-native-car-ui.md).
