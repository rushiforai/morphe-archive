# Side-by-side installation acceptance result

Retested on 2026-08-22 with the native `.mpp` bundle applied by Morphe Desktop 1.12.0 to the registered Stremio 1.10.4 x86_64 APK.

| Check | Result |
| --- | --- |
| Side-by-side manifest finalizer applies | Pass |
| Result package is `com.stremio.morphe` | Pass |
| Result launcher label is `Stremio Morphe` | Pass |
| App-defined permission and provider authorities use the Morphe package | Pass |
| APK Signature Scheme v2 and v3 verification | Pass |
| Existing Morphe installation accepts the in-place update | Pass |
| Official `com.stremio.one` remains separately installed | Pass |
| Launcher resolves to `com.stremio.morphe.ProfileChooserActivity` | Pass |
| Fatal Android runtime exceptions after chooser and MainActivity launch | 0 |

No APK contents, signing material, screenshots, or device captures are retained in this module.
