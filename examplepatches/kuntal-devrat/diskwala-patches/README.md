<div align="center">

# DiskWala Patches for Morphe

## ⛔ PROJECT DISCONTINUED

**This project has been permanently dropped.** DiskWala's server-side attestation (Play Integrity + Keystore attestation) makes it impossible for a re-signed/patched APK to communicate with `api.diskwala.com` without root. See the [technical explanation](#why-this-project-is-impossible-without-root) below.

[![Release](https://img.shields.io/github/v/release/kuntal-devrat/diskwala-patches?sort=semver&label=last%20release)](https://github.com/kuntal-devrat/diskwala-patches/releases)
[![License](https://img.shields.io/badge/license-GPL--3.0-blue)](LICENSE)

</div>

---

> [!CAUTION]
> **Do not use these patches.** While the existing v1.0.3 patches (targeting DiskWala 24.5) can bypass PairIP and remove ads locally, the patched app **cannot connect to the DiskWala server**. Shared files, streaming, link resolution, and any server-dependent feature will fail with `attestation_failed` / `missing_token` / `invalid_token` errors. This applies to **all versions** of DiskWala with server-side attestation (24.x and newer).

---

## Why this project is impossible without root

### The attestation chain

DiskWala 26.9 (and recent versions) implement a multi-layer server-side attestation flow that cannot be bypassed by client-side patching alone:

```
App launch
  │
  ├─► POST /attest/challenge          → Server returns nonce
  │
  ├─► Play Integrity token request    → Google Play Services (separate process)
  │     • Checks APK signing cert against Play Store
  │     • Returns signed token with app verdict
  │     • Runs OUTSIDE the app — cannot be hooked without root
  │
  ├─► Keystore attestation (TEE)      → Hardware-backed
  │     • Generates attestation key bound to app identity
  │     • Attestation cert chain includes real signing cert SHA-256
  │     • Rooted in Google's root CA — cannot be forged
  │
  └─► POST /attest/verify             → Server validates both tokens
        • Decrypts Play Integrity token via Google's API
        • Verifies Keystore attestation cert chain
        • Checks signing cert matches Play Store listing
        • Result: "modified_app" → REJECTED ❌
```

### Diagnostic test results

Tested on a certified device (vivo, Android 16, `MEETS_DEVICE_INTEGRITY`):

| Step | Result |
|---|---|
| `POST /attest/challenge` | ✅ 200 |
| Play Integrity token request | ✅ succeeded |
| `POST /attest/verify` | ❌ 400 `attestation_failed` |
| Server reason | `modified_app` |

The server does **not** reject the device — it rejects the **re-signed app**. The signing identity is verified through Google Play Integrity (which runs in Google Play Services, outside the app process) and TEE-backed Keystore attestation (hardware-level, cryptographically unforgeable).

### Why no client-side patch can fix this

1. **Play Integrity runs in Google Play Services** — a separate system process. Without root, you cannot hook or modify its behavior. It will always report the real APK signing certificate.

2. **Keystore attestation is TEE-backed** — the Trusted Execution Environment is hardware-isolated. The attestation certificate chain is rooted in Google's hardware root CA and includes the app's real signing cert digest. No software patch can alter what the TEE reports.

3. **Server-side validation** — DiskWala's server decrypts the Play Integrity token using Google's server-side API and verifies the Keystore attestation chain. These checks happen entirely on the server and cannot be influenced by the client.

4. **Nonce prevents replay** — each attestation session starts with a fresh server nonce, so tokens from the official app cannot be replayed.

### What would actually work (but requires root)

- **Magisk + Play Integrity Fix** — spoofs device properties so Google Play Services reports the app as legitimate
- **LSPosed/Xposed framework** — hooks PackageManager and Keystore at the system level
- Both require an **unlocked bootloader + Magisk**, which conflicts with the no-root goal of this project

---

## Alternatives for users (no root required)

### 1. Official DiskWala + system-wide ad blocking (recommended)

Install the official app from the Play Store (passes attestation), then block ads at the network level:

- **Private DNS**: Set `dns.adguard.com` or `dns.nextdns.io` in Settings → Network → Private DNS
- **Local VPN blockers**: [AdGuard](https://adguard.com/), [Blokada](https://blokada.org/), or [NextDNS](https://nextdns.io/)

Server features work normally. Most ads are blocked. Premium features remain locked.

### 2. Official app + local playback

Use the official app for downloading/resolving links, play downloaded content in a third-party player (VLC, MX Player).

---

## Previous patches (archived, non-functional for server features)

<details>
<summary>v1.0.3 patches — DiskWala 24.5 (server connectivity broken)</summary>

These patches target DiskWala `24.5` (`versionCode 334`). They successfully bypass PairIP anti-tamper, disable ads, and unlock premium UI — but the patched app **cannot authenticate with the server**.

| Patch | Description |
|---|---|
| Disable ads | Stubs AppLovin, AdMob, InMobi and other ad SDKs |
| Disable forced update | Bypasses PairIP license check and signature verification |
| Patch native libraries | Neutralizes PairIP traps in native .so libraries |
| Unlock premium | Makes RevenueCat entitlements appear active |

**Source:** [`patches/`](patches/) directory

</details>

---

## Development (archived)

<details>
<summary>Build instructions (for reference only)</summary>

### Requirements

- JDK 21
- GitHub PAT with `read:packages` scope in `~/.gradle/gradle.properties`:

  ```properties
  gpr.user=your_github_username
  gpr.key=ghp_your_token
  ```

### Build

```bash
./gradlew buildAndroid
# → patches/build/libs/patches-<version>.mpp
```

### Layout

```
patches/
  build.gradle.kts
  src/main/kotlin/app/diskwala/patches/
    shared/Constants.kt
    ad/
    premium/
    update/
settings.gradle.kts
```

</details>

---

## License

[GPL-3.0](LICENSE).

## Credits

- [Morphe](https://github.com/MorpheApp) — patcher, patch framework and release tooling.

## Acknowledgments

Thank you to everyone who reported bugs, tested builds, and supported this project. The DiskWala team has implemented robust server-side security that makes no-root patching infeasible. This is not a failure of effort — it's a fundamental technical limitation imposed by hardware-backed attestation.
