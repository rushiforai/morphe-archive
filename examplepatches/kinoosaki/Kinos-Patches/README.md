# Kino's Patches

<p align="center">
  <a href="https://morphe.software/add-source?github=kinoosaki/Kinos-Patches">
    <img src="https://img.shields.io/badge/%E2%9E%95%20%20Add%20to%20Morphe-1E5AA8?style=for-the-badge" height="46" alt="Add to Morphe">
  </a>
</p>

<p align="center">
  <a href="https://github.com/kinoosaki/Kinos-Patches/releases/latest"><img src="https://img.shields.io/github/v/release/kinoosaki/Kinos-Patches?label=stable&color=2ea44f" alt="Latest stable release"></a>
  <a href="https://github.com/kinoosaki/Kinos-Patches/releases"><img src="https://img.shields.io/github/v/release/kinoosaki/Kinos-Patches?include_prereleases&label=pre-release&color=orange" alt="Latest pre-release"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPLv3-blue" alt="GPLv3"></a>
</p>

Unofficial [Morphe](https://morphe.software) patches for Tasker.

## Supported app

Tasker **6.7.8** and **6.7.9**. Download the official APK from [Tasker's website](https://tasker.joaoapps.com/download.html),
[6.7.8 directly](https://tasker.joaoapps.com/releases/playstore/Tasker.6.7.8.apk),
or [6.7.9 directly](https://tasker.joaoapps.com/releases/playstore/Tasker.6.7.9.apk).

## Install

1. Add this repository to Morphe Manager using **[Add to Morphe](https://morphe.software/add-source?github=kinoosaki/Kinos-Patches)**.
2. Download Tasker 6.7.8 or 6.7.9 from the official links above. Morphe's automatic Google search may not find this paid app.
3. In Morphe Manager, open **Patcher**, choose **Storage**, select the APK, select patches, then patch and install.

Enable **Pre-release patches** for this source in Morphe Manager to receive prereleases; otherwise it uses the stable release.

## Patches

The list below is generated from the current release metadata.

<!-- PATCHES_START EXPANDED -->
> **[v4.1.4](https://github.com/kinoosaki/Kinos-Patches/releases/tag/v4.1.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;**1** apps&nbsp;&nbsp;•&nbsp;&nbsp;**2** patches&nbsp;&nbsp;•&nbsp;&nbsp;updated 2026-11-21

🚫 ads&nbsp;&nbsp;🛡️ telemetry / tracking&nbsp;&nbsp;💎 premium / pro&nbsp;&nbsp;🔑 license check&nbsp;&nbsp;🔕 prompts / notifications&nbsp;&nbsp;🧪 experimental

📝 Productivity & notes

#### 📝 Productivity & notes <sub>1 app</sub>

| | App | Patches | Latest verified | Type | Google Play |
|:-:|---|---|---|:-:|:-:|
| <img src="assets/icons/net.dinglisch.android.taskerm.png" width="20" height="20" alt=""> | **Tasker** | 💎 🧩 2 | `6.7.9` <sub>+1 older</sub> | APK | [Play](https://play.google.com/store/apps/details?id=net.dinglisch.android.taskerm) |

### 🔍 Patch details

#### 📝 Productivity & notes

<details>
<summary><img src="assets/icons/net.dinglisch.android.taskerm.png" width="16" height="16" alt=""> <b>Tasker</b> &nbsp;·&nbsp; 2 patches &nbsp;·&nbsp; <code>net.dinglisch.android.taskerm</code></summary>

Verified on: `6.7.9`, `6.7.8`

| Patch | What it does | Default |
|---|---|:-:|
| 💎 **Enable Full Version** | Unlocks the full version. | ✅ |
| 🧩 **GmsCore support** | Lets you sign in with Google through MicroG RE. | ➖ |

</details>

<sub>✅ on by default&nbsp;&nbsp;➖ off by default (enable it in Morphe Manager)</sub>
<!-- PATCHES_END -->

## Notes

- **Enable Full Version** bypasses Tasker's local licence check; it does not grant server-side features. Tasker is paid—consider purchasing it.
- **GmsCore support** is optional. It routes Google sign-in and token requests through [MicroG RE](https://github.com/MorpheApp/MicroG-RE/releases); other Google Play services, including location and FCM, remain unchanged.
- Back up the original APK and Tasker data before installing a patched build.
- Patches and tests are AI-assisted. Smoke tests check emitted bytecode when a matching APK fixture is available; fixtures are not committed, so tests may skip. Review and verify before use.

## Development and support

See [CONTRIBUTING.md](CONTRIBUTING.md) to report issues or contribute. To build the bundle, run `./gradlew :patches:buildAndroid`; see the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for registry credentials.

Licensed under [GPL-3.0](LICENSE). See [NOTICE](NOTICE) for attribution.
