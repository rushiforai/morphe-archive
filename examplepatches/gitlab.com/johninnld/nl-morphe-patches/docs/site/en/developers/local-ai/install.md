# Install and verify Local AI

This flow works without Gboard or Play Store distribution. Android still asks the user to approve installation from your app. A model download is a separate setup step.

## Pin one release

The [companion project](https://gitlab.com/johninnld/local-model-host) publishes the signed APK, matching client AAR, `model-host-release.json` and `SHA256SUMS` together. Its [package registry](https://gitlab.com/johninnld/local-model-host/-/packages) provides immutable artifact URLs.

Bundle an approved descriptor in your app. It identifies the package, source commit, numeric version code, exact APK size and SHA-256, signing certificate and immutable download URL. Do not allow unsigned remote metadata to replace your trust pins. A trusted compatible newer host should be accepted without downgrading it.

Official package: `app.johninnl.modelhost`.

Official signing-certificate SHA-256:

```text
1c45e972f387160e6994391954d0f1ebd983a2b0ab506e444645f4ca9f47bdc4
```

## Offer installation or an update

1. Call `ProviderDiscovery.isOfficialProviderSupported()`. The official APK requires Android 11/API 30 or later and arm64. Explain an unsupported device before offering a download.
2. Check package presence, enabled service, signer and numeric version. A disabled service is a different state from an absent package.
3. Download on a worker into your private cache. Enforce HTTPS, bounded redirects/timeouts, the descriptor's exact size and `VerifiedApk.MAX_APK_BYTES` (256 MiB).
4. Call `VerifiedApk.verify(...)` with the expected package, APK hash and certificate. Also require `verified.versionCode` to match the descriptor.
5. If needed, request Android's installation-source approval for **your own package**. Gboard's approval does not grant it to your app.
6. Launch `ProviderInstallIntent.create(activity, verified)` through an Activity Result flow. Keep a visible Install action if your app loses foreground focus.
7. Reinspect package identity, version, Binder protocol and required capabilities after return. An installer success screen alone is insufficient.

Keep the existing app data and signing identity during updates. Present verification failures clearly; never work around them by uninstalling or accepting another certificate.

For an in-app APK download and installer, declare these permissions in your app:

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
```

The AAR merges its private APK provider and package visibility, but does not request these app permissions. A client using an already installed host needs neither permission merely to call local Binder inference.

## Add the SDK

Use the AAR belonging to the approved descriptor:

```kotlin
android { buildFeatures { aidl = true } }
dependencies { implementation(files("libs/modelhost-client-api.aar")) }
```

Add package visibility to your manifest:

```xml
<queries>
    <package android:name="app.johninnl.modelhost" />
</queries>
```

The client AAR contains no model weights or inference runtime. Keep LiteRT/ONNX engine modules in the companion. The SDK helpers handle discovery, identity verification and installer intents; your app owns the download and installation UI.

## Finish model setup

Open Local AI's settings. The user enables the host, chooses and downloads models, then waits for the required feature to report Ready. A client binding cannot override user Stop. Only selected managed downloads are retained; a model switch drains current use before removing the old managed files. Original user import files remain untouched.

Continue with the [first request](quickstart.md).
