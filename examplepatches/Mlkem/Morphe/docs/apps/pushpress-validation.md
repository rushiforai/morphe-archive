# Validation performed

- Confirmed XAPK package: `com.pushpress.memberportal`
- Confirmed app version: `3.42.0`
- Confirmed version code: `1780597459`
- Confirmed Flutter AOT code is in the `arm64-v8a` split
- Confirmed `MainActivity` has the zero-argument constructor used by the fingerprint
- Confirmed the inspected FlutterView exposes `getAttachedFlutterEngine()` and `getAccessibilityNodeProvider()`
- Confirmed FlutterJNI exposes `setSemanticsEnabled(boolean)`
- Compiled `CrossFitOnly.java` against Android API-shaped stubs with Java 8 language level
- Compiled all patch Kotlin files against Morphe API-shaped stubs
- Verified the source archive after creation with `unzip -t`

Not performed in this environment:

- Dependency-resolved `buildAndroid` execution
- Generation of the final `.mpp`
- Installation and physical-device UI test
