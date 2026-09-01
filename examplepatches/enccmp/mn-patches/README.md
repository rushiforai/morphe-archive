# Monument — Morphe patches

A [Morphe](https://github.com/MorpheApp/morphe-patcher) patch bundle for the **Monument** photo
storage app (`com.getmonument.android`, version **4.3.5**, versionCode 683).

It contains two independent, default-on patches:

| Patch | Type | What it does |
|-------|------|--------------|
| [**Login with token**](patches/src/main/kotlin/app/morphe/patches/monument/loginwithtoken/README.md) | bytecode + extension | Adds a "Login with token" option to the setup screen that signs in against a local device using a serial + client id + access token, bypassing the cloud API. |
| [**Limit thumbnail cache by default**](patches/src/main/kotlin/app/morphe/patches/monument/limitedcache/README.md) | bytecode | Turns the "Unlimited cache size" preference **off by default** (limited ~100 MB thumbnail cache). Still user-toggleable in settings. |

Both are selectable independently in Morphe's patch list. Click a patch name above for its
detailed documentation.

---

## How to use the patches

0. **Get the app APK** — download Monument (`com.getmonument.android`) from [APKPure](https://apkpure.com/monument-photo-management/com.getmonument.android/download).
   These patches target version **4.3.5**.
1. **Build the bundle** (see below) or download a released `patches-<version>.mpp` from the
   repository's [Releases](../../releases).
2. **Add it to Morphe** as a **Local** patch source:
   - *Mobile (Morphe Manager):* Add patch source → **Local** → pick the `.mpp` (it must be `.mpp`,
     not a zip).
   - *Desktop:* the **+ source** control → select the `.mpp`.
3. **Select the app**: choose **Getmonument** / `com.getmonument.android`, version 4.3.5, and
   supply `Monument_4.3.5.apk` as the APK. Both patches show up under the patch list.
4. **Pick patches**: enable **Login with token** and/or **Limit thumbnail cache by default**.
5. **Patch & install** the resulting APK (Morphe re-signs it). If replacing an existing install
   with a different signature, uninstall the old app first.
6. **Log in** with the *Login with token* option — see the
   [patch doc](patches/src/main/kotlin/app/morphe/patches/monument/loginwithtoken/README.md)
   for how to get the serial / client id / token from the device database and the exact steps.

---

## Knowledge base

Tips and tricks for running Monument with a dead cloud backend. More entries will be added here
over time.

| Entry | What it covers |
|-------|----------------|
| [Creating a new user offline](docs/knowledge-base/offline-user-creation.md) | Add a fully working new user by editing the device SQLite DB directly, bypassing the cloud-gated invite / register flow. Log in with the *Login with token* patch. |
| [Disabling a user offline](docs/knowledge-base/offline-user-disable.md) | App-based user deletion fails with the cloud gone. Lock an account out instead with a one-line database change. |

---

## Building

Prerequisites: JDK 17+ and a GitHub token with `read:packages` (the `app.morphe.patches` plugin
and patcher library are on GitHub Packages).

1. Put credentials where Gradle (and the IDE) read them — `~/.gradle/gradle.properties`:
   ```properties
   gpr.user=YOUR_GITHUB_USERNAME
   gpr.key=ghp_YOURTOKEN
   ```
   `local.properties` holds only `sdk.dir` (the Android SDK path; the extension is an Android
   library module).
2. Build:
   ```bash
   ./gradlew :patches:buildAndroid
   ```
   Output: `patches/build/libs/patches-<version>.mpp` — this is the file you load into Morphe.

Bump `version` in `gradle.properties` on every change so each `.mpp` is uniquely identifiable.

## Releases (CI)

`.github/workflows/release.yml` publishes a release **when the version changes**. The flow is:

1. Bump `version` in `gradle.properties` locally (patch component) and push to `main`.
2. CI reads the version and checks whether a release `v<version>` already exists.
3. If it doesn't, CI builds `patches-<version>.mpp` and publishes a GitHub **Release** tagged
   `v<version>` (which also creates the tag) with the `.mpp` attached.
4. If it does (e.g. a docs-only push with an unchanged version), CI builds and releases nothing.

You can also trigger it manually via **Run workflow**.

Open the project in **IntelliJ IDEA** or **Android Studio** (not VS Code) for Kotlin/Gradle
resolution; there is no root `build.gradle` by design — the settings plugin configures the
subprojects.

## Compatibility

`com.getmonument.android`, versionName `4.3.5` (versionCode 683), minSdk 21. R8 in this build
keeps class names but obfuscates method names, which is why both patches match methods by
signature/strings rather than by name.
