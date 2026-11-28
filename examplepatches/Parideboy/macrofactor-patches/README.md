# 👋🧩 MacroFactor Morphe Patches

## ❓ About

Morphe patches for **MacroFactor** (`com.sbs.diet`) only — forked from
[Beyonder Morphe Patches](https://github.com/callMeBeyonder/morphe-patches), stripped down
to the MacroFactor patches with the release pipeline intact.

> [!IMPORTANT]
> **Root required.** MacroFactor is shielded by Google Play PairIP and its premium/unlock
> patches also spoof the signing certificate hash, so the patched build must be mounted over
> the genuine Play-signed install (`requireRootMount`) — a normal sideload will not run.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Parideboy/macrofactor-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.1](https://github.com/Parideboy/macrofactor-patches/releases/tag/v1.1.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 MacroFactor&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 5.8.11 | 5.8.13 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium (Root)](#unlock-premium-root) | Unlocks all premium features. Requires root: the patched build must be mounted over the genuine Play-signed install — a re-signed sideload will not work. |  |

</details>

<details open>
<summary>📦 MacroFactor Workouts&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.4.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium (Root)](#unlock-premium-root) | Unlocks all premium features. Requires root: the patched build must be mounted over the genuine Play-signed install — a re-signed sideload will not work. |  |

</details>

<details open>
<summary>📦 Targapp&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.10.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Reports an active RevenueCat entitlement to the Flutter layer, unlocking the Pro surfaces the app computes on-device (Pro badge, paywall bypass, report customization). Pro work executed by Targapp's backend (AI report compilation, revision requests) still requires a real subscription. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

Prerequisites: JDK 21, an Android SDK (platform + build-tools), and a GitHub personal access
token with `read:packages` — the `app.morphe.patches` plugin resolves
`maven.pkg.github.com/MorpheApp/registry` with those credentials.

1. Point Gradle at your SDK: `local.properties` with `sdk.dir=/path/to/android-sdk`, or export
   `ANDROID_HOME`.
2. Build: `GITHUB_ACTOR=<your-github-user> GITHUB_TOKEN=<pat> ./gradlew buildAndroid`
   (or put `gpr.user`/`gpr.key` in `~/.gradle/gradle.properties`, never in this repo).
3. The built patches bundle is `patches/build/libs/patches-*.mpp`.
4. Patch the `.mpp` file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
   like any other patch bundle.

Only need the bundle? `./gradlew :patches:buildAndroid` skips the extension tests.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

MacroFactor Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
