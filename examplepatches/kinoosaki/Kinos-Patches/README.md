# 🧩 Kino's Patches

<p align="center">
  <a href="https://morphe.software/add-source?github=kinoosaki/Kinos-Patches">
    <img src="https://img.shields.io/badge/%E2%9E%95%20%20Add%20to%20Morphe-1E5AA8?style=for-the-badge" height="46" alt="Add to Morphe">
  </a>
  <br>
  <sub>One tap adds this patch source to Morphe Manager</sub>
</p>

<p align="center">
  <a href="https://github.com/kinoosaki/Kinos-Patches/releases/latest"><img src="https://img.shields.io/github/v/release/kinoosaki/Kinos-Patches?label=stable&color=2ea44f" alt="Latest stable release"></a>
  <a href="https://github.com/kinoosaki/Kinos-Patches/releases"><img src="https://img.shields.io/github/v/release/kinoosaki/Kinos-Patches?include_prereleases&label=pre-release&color=orange" alt="Latest pre-release"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPLv3-blue" alt="GPLv3"></a>
  <a href="https://kinosaki.in"><img src="https://img.shields.io/badge/website-kinosaki.in-1E5AA8" alt="kinosaki.in"></a>
</p>

A small [Morphe](https://morphe.software) patch source for **Tasker** - and nothing else.
Two patches, one app, no surprises.

| Patch | What it does | Default |
|---|---|:-:|
| 💎 **Enable Full Version** | Unlocks Tasker's full version. | ✅ |
| 🧩 **GmsCore support** | Lets Tasker sign in with Google through MicroG RE. | ➖ |

Verified on Tasker `6.7.8`. Other versions may work but are not guaranteed.

## 🚀 Quick start

1. Install [Morphe Manager](https://morphe.software).
2. Tap **[Add to Morphe](https://morphe.software/add-source?github=kinoosaki/Kinos-Patches)**,
   or add this repository as a patch source by hand:
   `https://github.com/kinoosaki/Kinos-Patches`
3. Pick **Tasker**, choose the patches you want and patch.

**Stable or pre-release?** The stable channel follows the
[latest release](https://github.com/kinoosaki/Kinos-Patches/releases/latest). Turn on
**Pre-release patches** for this source in Morphe Manager to get fixes earlier.

## 🩹 Patches list

Tasker `6.7.8` is the version the patches were verified on (shown in Morphe Manager).
Older or newer versions may work but are not guaranteed; if an app update breaks a patch,
[open an issue](https://github.com/kinoosaki/Kinos-Patches/issues).

<!-- PATCHES_START EXPANDED -->
> **[v4.0.1](https://github.com/kinoosaki/Kinos-Patches/releases/tag/v4.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;**1** apps&nbsp;&nbsp;•&nbsp;&nbsp;**2** patches&nbsp;&nbsp;•&nbsp;&nbsp;updated 2026-11-18

🚫 ads&nbsp;&nbsp;🛡️ telemetry / tracking&nbsp;&nbsp;💎 premium / pro&nbsp;&nbsp;🔑 license check&nbsp;&nbsp;🔕 prompts / notifications&nbsp;&nbsp;🧪 experimental

📝 Productivity & notes

#### 📝 Productivity & notes <sub>1 app</sub>

| | App | Patches | Latest verified | Type | Google Play |
|:-:|---|---|---|:-:|:-:|
| <img src="assets/icons/net.dinglisch.android.taskerm.png" width="20" height="20" alt=""> | **Tasker** | 💎 🧩 2 | `6.7.8` | APK | [Play](https://play.google.com/store/apps/details?id=net.dinglisch.android.taskerm) |

### 🔍 Patch details

#### 📝 Productivity & notes

<details>
<summary><img src="assets/icons/net.dinglisch.android.taskerm.png" width="16" height="16" alt=""> <b>Tasker</b> &nbsp;·&nbsp; 2 patches &nbsp;·&nbsp; <code>net.dinglisch.android.taskerm</code></summary>

Verified on: `6.7.8`

| Patch | What it does | Default |
|---|---|:-:|
| 💎 **Enable Full Version** | Unlocks the full version. | ✅ |
| 🧩 **GmsCore support** | Lets you sign in with Google through MicroG RE. | ➖ |

</details>

<sub>✅ on by default&nbsp;&nbsp;➖ off by default (enable it in Morphe Manager)</sub>
<!-- PATCHES_END -->

## ⚠️ Good to know

- **Tasker is a paid app.** Enable Full Version bypasses the local licence check; it does not
  add anything the app cannot do offline. If you rely on Tasker's paid features, consider
  buying it.
- **Only local checks can be unlocked.** Anything Tasker validates on a server stays as it is;
  this bundle does not fake server responses.
- **Google sign-in may break.** Patched apps are re-signed, so "Sign in with Google" can stop
  working. GmsCore support routes Tasker's sign-in through
  [MicroG RE](https://github.com/microg/GmsCore) so it keeps working; enable it in Morphe
  Manager before patching if you use Google Drive backup.
- **GmsCore support only moves sign-in and token clients.** Location, Maps, FCM and the rest of
  Play Services are left untouched, so the patch stays compatible with stock Tasker behaviour.
- **Keep a backup.** Patch a copy of the APK and keep Tasker's backup (`.xml` export) somewhere
  safe before you install the patched build.

## 💬 Contact

- Website: **[https://kinosaki.in](https://kinosaki.in)**
- Bugs and questions: [open an issue](https://github.com/kinoosaki/Kinos-Patches/issues).

## 🤖 How the patches are made

> **AI-generated patches.** The code analysis, patch code and smoke tests are written with AI
> assistance. Before each release they are verified by applying them to the real APK (smoke
> tests in `patches/src/test/`) and checking the patched code. Review before use; no warranty.

## 🛠️ Building

```
./gradlew :patches:buildAndroid
```

The bundle is written to `patches/build/libs/`. The Morphe Gradle plugin is downloaded from
GitHub Packages, so set `GITHUB_ACTOR` and `GITHUB_TOKEN` (a token with `read:packages`)
first. See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for
details.

## 📜 License

Kino's Patches is licensed under the [GNU General Public License v3.0](LICENSE). The Tasker
patch code descends from Heval's Morphe Patches; see [NOTICE](NOTICE) for attribution.
