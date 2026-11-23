# 🧩 Dyno Patches

Personal Android patches for apps I own, built with the Morphe patcher.

## ❓ About

Two kinds of patches live here:

- **Universal** — `patches/src/main/kotlin/dev/dyno0311/patches/universal/`: apply across many apps (ad SDK blocking, telemetry removal, and similar).
- **App-targeted** — `patches/src/main/kotlin/dev/dyno0311/patches/apps/<appname>/`: written for one package and pinned to the exact version that was tested.

Shared compatibility declarations and cross-patch constants belong in `patches/src/main/kotlin/dev/dyno0311/patches/shared/`.

These are private, personal-use patches. No patched APKs are distributed from this repository.

### How to use these patches

**This repository is currently private**, and Morphe Manager cannot fetch a private repo as a patch source. Until it is published, build the bundle locally and apply the `.mpp` by hand:

```sh
./gradlew buildAndroid   # -> patches/build/libs/patches-*.mpp
```

Once the repo is made public (only on the owner's explicit decision), it can be added as a patch source: https://github.com/Dyno0311/dyno-patches

<a href="https://morphe.software/add-source?github=Dyno0311/dyno-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.6.0](https://github.com/Dyno0311/dyno-patches/releases/tag/v1.6.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 CamScanner&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**Package name:** `com.intsig.camscanner`

**🎯 Supported versions:**

| 7.27.0.2609220000 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide piracy warning](#hide-piracy-warning) | Removes the "This CamScanner copy is not genuine" dialog and toast. The app's internal genuine/pirate state is left alone, so nothing re-routes features. |  |
| [Remove PDF watermark](#remove-pdf-watermark) | Stops the Scanned with CamScanner watermark from being drawn into exported and shared PDFs. The local document is otherwise produced by the same native PDF engine, unmodified. |  |
| [Remove ads](#remove-ads) | Blocks every CamScanner ad position at the interceptor choke point (app launch, main/share/page banners, doc list, scan-done and rewarded inventory). Ad SDKs stay bundled but receive no requests. |  |
| [Spoof app signature](#spoof-app-signature) | Reports the original signing certificate to the app so tamper and licence checks pass. |  |
| [Unlock premium](#unlock-premium) | Reports a local VIP / super-VIP account status and sync entitlement, unlocking the features CamScanner gates behind its subscription check on device. Cloud credits, Word/Excel conversion and other server-side work stay validated remotely. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

Requirements:

- **JDK 21.** The `app.morphe.patches` plugin will not run on JDK 17.
- **A GitHub token with `read:packages`.** The Morphe patcher artifacts live on GitHub Packages, which requires this scope *even for public packages*. Without it Gradle reports the plugin as "not found" (it is really a 401).

```sh
# gh CLI: add the scope once
gh auth refresh -h github.com -s read:packages

# Build. Note: a pre-set GITHUB_TOKEN environment variable shadows `gh auth token`,
# and an older token without read:packages produces a confusing 401 — hence `env -u`.
export JAVA_HOME=/path/to/jdk-21
T=$(env -u GITHUB_TOKEN -u GITHUB_ACTOR gh auth token)
GITHUB_ACTOR=<github-user> GITHUB_TOKEN="$T" ./gradlew --no-daemon buildAndroid
```

Output:

- The built patches `.mpp` file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

**No `extensions/` module.** The template's `extensions/extension` project was removed: any `.mpe` runtime extension is an Android library and therefore needs a full Android SDK (`ANDROID_HOME`), which a plain headless JDK build does not have. No patch here uses one. If a future patch needs an `.mpe`, copy `extensions/extension` back from
[MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template)
and install the Android command-line tools + platform + build-tools first.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Dyno Patches are licensed under the [GNU General Public License v3.0](LICENSE)
