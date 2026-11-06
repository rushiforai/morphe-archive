# v1.10.2 source payload

This is the immutable source reference for the nicoid Re v1.10.2 release. The helper and native-method payloads are built from the recovered v1.10.1 Smali baseline and the reviewed v1.10.2 Java/Smali overlay.

Build with JDK 21, the Android SDK, and configured Morphe dependencies using `./gradlew :patches:buildAndroid --no-daemon`. Use `verify-mpp.py 1.10.2` to confirm the manifest, runtime version and exact DEX payloads.

The original nicoid 6.49 APK is required for patching, not for building the MPP. Previously released source trees and tags remain unchanged.
