# Build requirements

## 1. JDK 17 or newer

```powershell
$env:JAVA_HOME = 'C:\Program Files\Eclipse Adoptium\jdk-25.0.2.10-hotspot'
```

## 2. Android SDK

Needs `build-tools` and at least one `platforms/android-XX`.

```powershell
$env:ANDROID_HOME = "$env:LOCALAPPDATA\Android\Sdk"
$env:ANDROID_SDK_ROOT = $env:ANDROID_HOME
```

## 3. GitHub token (mandatory)

Morphe's Gradle plugin `app.morphe.patches` is published on
`https://maven.pkg.github.com/MorpheApp/registry`. GitHub Packages requires authentication for all
reads, including public packages, so the build fails with

```
Plugin [id: 'app.morphe.patches', version: '1.3.4'] was not found
```

until a token is configured.

Create a **classic** Personal Access Token with the `read:packages` scope
(Settings → Developer settings → Personal access tokens → Tokens (classic)), then either:

```powershell
# environment variables
$env:GITHUB_ACTOR = 'your-username'
$env:GITHUB_TOKEN = 'ghp_xxxxxxxxxxxxxxxxxxxx'
```

or configure it in your **user-level** Gradle properties (`~/.gradle/gradle.properties`), which is
outside the repository:

```properties
gpr.user=your-username
gpr.key=ghp_xxxxxxxxxxxxxxxxxxxx
```

> ⚠️ Do **not** put the token in the project `gradle.properties`: that file is already
> tracked by git in this repository, and a `.gitignore` rule has no effect on tracked files.
> If you really want it there, run `git rm --cached gradle.properties` first.

## 4. Build

```powershell
.\gradlew.bat buildAndroid
```

`build` compiles and runs tests; `buildAndroid` produces the deployable patch bundle
(`patches/build/libs/patches-*.mpp`).

`generatePatchesList` refreshes `patches-list.json`, which is what Morphe Manager reads to
list the available patches.

## 5. Patch an APK from the console (optional)

The official CLI lives in [morphe-desktop](https://github.com/MorpheApp/morphe-desktop):

```bash
git clone -b dev https://github.com/MorpheApp/morphe-desktop
cd morphe-desktop && ./gradlew build && cd ..

java -jar morphe-desktop/build/libs/morphe-desktop*-all.jar patch \
  --patches lovaion-patches/patches/build/libs/patches-*.mpp \
  --out app-patched.apk \
  app.apk \
  --install
```

## 6. CI release

The `Release` workflow runs `semantic-release` on every push to `main`/`dev`. The Morphe
Gradle plugin is resolved from GitHub Packages, so the workflow needs a token with the
`read:packages` scope: add a repository secret named `GPR_TOKEN` (classic PAT with
`repo` + `read:packages`). If the secret is missing, the workflow falls back to the
automatic `GITHUB_TOKEN`.

Releases published by CI attach `patches-<version>.mpp` and update `patches-bundle.json`.
