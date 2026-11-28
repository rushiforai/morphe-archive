# Third-party notices

- Project layout and Gradle tooling: MorpheApp/morphe-patches-template, main snapshot 2026-11-19; original GPL-3.0 LICENSE and NOTICE preserved. https://github.com/MorpheApp/morphe-patches-template
- AirPlay authentication classes under com.connectsdk: Connect SDK Android Core, reference commit 2f7ebbc. Original notices retained; unused DiscoveryManager import removed. Apache 2.0 license copies in licenses/. https://github.com/ConnectSDK/Connect-SDK-Android-Core
- AirPlay icon: Lucide; license retained in licenses/Lucide-LICENSE.txt and bundled assets. https://lucide.dev/license
- Runtime dependencies: dd-plist 1.23 (com.googlecode.plist), EdDSA-Java 0.3.0 (net.i2p.crypto), srp6a 2.1.0 (com.nimbusds). Download URLs and exact checksums are in tools/build.py. Embedded license/notice resources from these JARs are copied into the generated patch bundle.
- Build-only tool: Morphe Desktop 2.2.0 / Morphe Patcher 2.4.0, fetched from its public release and checked by SHA-256. It is not bundled as part of the patch. https://github.com/MorpheApp/morphe-desktop

No APK of YouTube, signing key, device backup, authentication token or account data is distributed with this repository.
