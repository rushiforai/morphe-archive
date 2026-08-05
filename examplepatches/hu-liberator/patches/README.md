# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

TODO: Update this about section with a brief introduction/summary about this repo and what it offers.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/hu-liberator/patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;11 patches total
<details open>
<summary>📦 MÁVPlusz&nbsp;&nbsp;•&nbsp;&nbsp;10 patches</summary>
<br>

**🎯 Supported versions:**

| 2.4.19-prod |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Firebase Crashlytics](#disable-firebase-crashlytics) | Adds the official firebase_crashlytics_collection_enabled=false manifest flag, disabling all crash/log reporting to Firebase Crashlytics at SDK init. |  |
| [Disable Pairip license check](#disable-pairip-license-check) | Prevents the Pairip-injected Application class from binding to the Play Store licensing service, which would otherwise redirect to / force-close for a side-loaded APK. |  |
| [Disable Play Integrity failure crash](#disable-play-integrity-failure-crash) | Prevents SecurityException when the Play Integrity API call itself fails (APP_NOT_INSTALLED / APP_UID_MISMATCH), as happens for side-loaded APKs. |  |
| [Disable Play Integrity gating flag wait](#disable-play-integrity-gating-flag-wait) | Stops the startup coroutine from waiting forever on a Remote-Config-backed flag to decide whether to run the Play Integrity flow, by always treating it as disabled. |  |
| [Disable Play Integrity token request](#disable-play-integrity-token-request) | Makes the Play Integrity token request always fail immediately with an unclassified exception, so the app treats it as gracefully unavailable and continues initialization instead of getting stuck on a Play-Store-required gate. |  |
| [Disable Play Integrity verdict validation](#disable-play-integrity-verdict-validation) | Removes client-side SecurityException throws that reject unlicensed/unattested/unrecognized Play Integrity verdicts, without touching unrelated code sharing the same method. |  |
| [Disable StoreLogs telemetry](#disable-storelogs-telemetry) | Prevents the app from uploading queued client-side log entries to its own backend telemetry endpoint (.../Log/StoreLogs). |  |
| [Disable broadcast receiver security check](#disable-broadcast-receiver-security-check) | Removes SecurityException throws gating a BroadcastReceiver's onReceive, which fail when the broadcast sender isn't verified as the real Play Store. |  |
| [Disable certificate pinning](#disable-certificate-pinning) | Prevents the app's OkHttp CertificatePinner from ever being installed, allowing HTTPS traffic to be intercepted (e.g. by a proxy) for analysis. |  |
| [Trust user-installed certificates](#trust-user-installed-certificates) | Adds a user certificate trust anchor to the network security config, so a MITM proxy's installed CA is accepted (this is separate from and in addition to disabling OkHttp's code-level certificate pinning). |  |

</details>

<details open>
<summary>📦 Időkép&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.3.7 | 1.0.2 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove idokep ads](#remove-idokep-ads) | Removes ads from the idokep app. |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=hu-liberator/patches

Or manually add this repository url as a patch source in Morphe: https://github.com/hu-liberator/patches

### 🛠️ Building

To build UserXYZ Patches,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
