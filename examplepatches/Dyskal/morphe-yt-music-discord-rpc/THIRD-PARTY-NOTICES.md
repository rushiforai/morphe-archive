# Third-party notices

This project is a separately branded derivative of the official Morphe patches template. MediaSession fingerprints are adapted from Morphe Patches (`e54643954`), copyright 2026 Morphe, under GPLv3 with the additional conditions in `UPSTREAM-NOTICE`.

Runtime libraries bundled into the Android extension:

| Component | Copyright / source | License |
| --- | --- | --- |
| AndroidX Browser 1.8.0 and AndroidX dependencies | The Android Open Source Project; https://android.googlesource.com/platform/frameworks/support | Apache License 2.0 |
| OkHttp 4.12.0 | Square, Inc.; https://github.com/square/okhttp | Apache License 2.0 |
| Okio (OkHttp dependency) | Square, Inc.; https://github.com/square/okio | Apache License 2.0 |
| Kotlin standard library (OkHttp/Okio dependency) | JetBrains s.r.o. and contributors; https://github.com/JetBrains/kotlin | Apache License 2.0 |

The full Apache License 2.0 and upstream notices are included in [`patches/src/main/resources/discord/notices.txt`](patches/src/main/resources/discord/notices.txt), copied into the patched app's assets, and displayed under **About and licenses**.

The protocol design and authentication guards were informed by Metrolist's OAuth/Gateway implementation. Its Kotlin source was not copied into this project. The Java implementation was written for this personal patch.

The profile-headline approach was also informed by https://github.com/kernoeb/mac-now-playing. Its Swift source was not copied. Artwork resolution follows Metrolist's external-assets protocol; it uses the original player's public image URL or a YouTube thumbnail rather than fetching third-party catalog matches.

The native OAuth URI follows the Android handoff used by Discord's Social SDK. No SDK implementation or native binaries are bundled.

Test-only dependencies (JUnit, MockWebServer, and org.json) are not bundled into patched apps.
