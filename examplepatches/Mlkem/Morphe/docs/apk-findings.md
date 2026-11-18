# APK findings

- Manifest package: `com.musicleague.app`
- Version: `1.4.9`, versionCode `357`
- compileSdk: 35, targetSdk: 35, minSdk: 24
- Expo runtimeVersion: `1.4.9`
- Expo project/update URL: `https://u.expo.dev/c0a173c1-8772-4ecc-ab1d-821cd556380d`
- Expo channel header: `main`
- Local bundle: `assets/index.android.bundle`
- Local bundle file type: Hermes JavaScript bytecode, version 96
- App config: `assets/app.config`
- Embedded update manifest commit time: 2026-05-25 06:30:53 UTC

Important implication: patching native Java/Kotlin classes will not reach most app behavior. The app-specific UI and business logic is in Hermes bytecode.
