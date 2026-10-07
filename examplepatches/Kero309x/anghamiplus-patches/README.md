<div align="center">

# 🎵 AnghamiPlus Patches

**A Morphe patch bundle for the Anghami Android app — ad-free playback, unlocked synced lyrics, unrestricted track selection, a cleaner interface and no third-party telemetry. No root required.**

[![Latest Release](https://img.shields.io/github/v/release/Kero309x/anghamiplus-patches?style=for-the-badge&color=8A2BE2&logo=github)](https://github.com/Kero309x/anghamiplus-patches/releases/latest)
[![Build](https://img.shields.io/github/actions/workflow/status/Kero309x/anghamiplus-patches/build.yml?style=for-the-badge&logo=githubactions&logoColor=white&label=build)](https://github.com/Kero309x/anghamiplus-patches/actions/workflows/build.yml)
[![Morphe Ecosystem](https://img.shields.io/badge/Morphe-Compatible-00C853?style=for-the-badge&logo=android)](https://morphe.software)
[![Target App](https://img.shields.io/badge/Target-Anghami%208.0.28-FF5722?style=for-the-badge&logo=google-play)](https://play.google.com/store/apps/details?id=com.anghami)
[![Patches](https://img.shields.io/badge/Patches-17%20active-blue?style=for-the-badge)](https://github.com/Kero309x/anghamiplus-patches#-patch-catalogue)
[![License](https://img.shields.io/badge/License-GPL--3.0-0A84FF?style=for-the-badge)](LICENSE)

<br>

[Overview](#-overview) • [Features](#-features) • [Install](#-installation) • [Patch catalogue](#-patch-catalogue) • [Architecture](#-architecture) • [Development](#-development) • [FAQ](#-frequently-asked-questions)

</div>

---

## 📖 Overview

**AnghamiPlus Patches** is an open-source patch bundle for the official Anghami Android client, built for the [Morphe](https://morphe.software) patch ecosystem.

Each patch targets a specific client-side gate in `com.anghami` — advertising, entitlement flags, UI upsells, forced shuffle, limited downloads and analytics SDKs — and neutralises it inside the APK's bytecode. Patching happens entirely on-device or on your own machine: the patched APK installs like any other app and **does not require root**.

Nothing here touches Anghami's servers. Entitlement checks that are enforced server-side, DRM licence issuance and account state remain the responsibility of Anghami's own backend, exactly as before.

> **🙏 Attribution** — This project is **based on** the Anghami patch set by
> **[Mohamed Amr Nady](https://github.com/mohamedamrnady)**
> ([mohamedamrnady/anghami-patches](https://github.com/mohamedamrnady/anghami-patches), GPLv3).
> The patch sources here are derived from that project and have been reworked by Kero309x from
> **2026-10-05** onwards. See [ATTRIBUTION.md](ATTRIBUTION.md) for the complete list of changes.

---

## ✨ Features

| Area | What the bundle changes |
| :--- | :--- |
| 🚫 **Ad-free playback** | Silences mid-track promotional audio and marks every track as ad-free at the client flag level. |
| 🎤 **Full synced lyrics** | Unlocks the full-screen, time-synced lyrics view and removes the lyrics paywall banner. |
| 🔀 **On-demand selection** | Breaks out of forced shuffle so any track can be played directly from albums, playlists and search. |
| ⏭️ **Unlimited skips** | Removes the client-side skip counter and queue navigation restrictions. |
| 📸 **Screenshots & recording** | Drops the `FLAG_SECURE` restriction so the app can be captured and recorded. |
| 👑 **Client-side Plus state** | Restores the Plus badge on the profile header and activates the local Plus UI states. |
| 🧹 **Decluttered interface** | Hides upgrade tabs, header promo banners, Gold upsells and locked premium buttons. |
| 🎯 **No sponsored cards** | Removes sponsored feed cards, Car Mode promotions and radar promo entries. |
| ⭐ **No rating prompts** | Blocks the in-app review dialogs and "rate us" launches. |
| 🛡️ **Privacy hardening** | Neutralises the in-house analytics pipeline and the Braze, Adjust, Firebase, Google Analytics, Bugsnag and share-telemetry hooks. |
| 📦 **Local download limits** | Removes the local offline quota checks and plan-based download locks. |

---

## 📲 Installation

### Option 1 — Add the source to Morphe Manager (recommended)

1. Install **Morphe Manager** on your device.
2. Tap the link below from your phone to register this bundle as a patch source:

<div align="center">

**[➕ Add AnghamiPlus Patches to Morphe Manager](https://morphe.software/add-source?github=Kero309x/anghamiplus-patches)**

</div>

3. Get the original **Anghami 8.0.28** APK (`com.anghami`, version code `8000280`) from a source you trust.
4. In Morphe Manager, pick the APK, keep the patches you want selected, and tap **Patch**.
5. Install the generated APK.

### Option 2 — Add the source manually

1. Open **Morphe Manager** → **Settings** ⚙️ → **Sources**.
2. Choose **Add source** and enter:
   * **Name**: `AnghamiPlus Patches`
   * **Repository**: `Kero309x/anghamiplus-patches`
3. Go back to the dashboard, select Anghami `8.0.28` and patch.

### Option 3 — Patch locally with the CLI

```bash
# Build the bundle (see Development below), then:
java -jar morphe-desktop*-all.jar patch \
  --patches patches/build/libs/patches-*.mpp \
  --out anghami-patched.apk \
  anghami-8.0.28.apk
```

---

## 🎯 Compatibility

| Property | Value |
| :--- | :--- |
| **Package name** | `com.anghami` |
| **Supported version** | **8.0.28** (version code `8000280`) |
| **ABIs** | `arm64-v8a`, `armeabi-v7a`, `x86`, `x86_64` |
| **Root required** | No |
| **Minimum Android** | Android 8.0 (Oreo) |

Only the version listed above is verified. Other Anghami releases usually install but the patches
are signature-matched and may fail to apply, so re-verify before re-targeting the bundle.

---

## 💊 Patch catalogue

<!-- PATCHES_START EXPANDED -->
> **[v1.3.4](https://github.com/Kero309x/anghamiplus-patches/releases/tag/v1.3.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;17 patches total
<details open>
<summary>📦 Anghami&nbsp;&nbsp;•&nbsp;&nbsp;17 patches</summary>
<br>

**🎯 Supported versions:**

| 8.0.28 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow Screenshots](#allow-screenshots) | Bypasses secure window restrictions to allow screenshots and screen recording across the app. |  |
| [Block Audio Ads](#block-audio-ads) | Prevents audio advertisements between songs and treats playback tracks as ad-free. |  |
| [Block Promotional Popups](#block-promotional-popups) | Blocks startup popup offers, promotional flyers, and marketing dialogs. |  |
| [Disable Analytics & Crash Logging](#disable-analytics-crash-logging) | Disables third-party trackers (Braze, Adjust, Firebase, Google, Bugsnag), in-house Silo tracking, and listening telemetry. |  |
| [Disable Forced Shuffle](#disable-forced-shuffle) | Disables forced shuffle mode on playlists and radio, enabling full on-demand song selection. |  |
| [Disable In-App Rating](#disable-in-app-rating) | Disables the in-app review dialogs and 'Love us? Rate us!' rating prompts. |  |
| [Expand Download Limits](#expand-download-limits) | Removes local offline storage caps and disables limited-plan quota checks. |  |
| [Hide Gold Upsell](#hide-gold-upsell) | Hides Gold-tier promotional sections and unsupported server-gated features. |  |
| [Hide Premium Feature Buttons](#hide-premium-feature-buttons) | Hides locked upsell buttons including Sing Along (Karaoke) and AI Mix triggers. |  |
| [Hide Shuffle Badges](#hide-shuffle-badges) | Hides 'Plays in shuffle' badges from playlists, album headers, and feed rows. |  |
| [Hide Upgrade Banners](#hide-upgrade-banners) | Hides navigation upgrade tab, header promo banners, and feed subscription upsell cards. |  |
| [Remove Sponsored Content](#remove-sponsored-content) | Hides sponsored cards, recommended promotions in Car Mode, and radar sponsored content. |  |
| [Show Profile Plus Badge](#show-profile-plus-badge) | Displays the official Plus badge on your profile header and account settings. |  |
| [Spoof App Signature](#spoof-app-signature) | Emulates official application signature headers to preserve API authorization compatibility. |  |
| [Unlimited Track Skips](#unlimited-track-skips) | Removes song skip limitations and queue navigation restrictions. |  |
| [Unlock Full Lyrics](#unlock-full-lyrics) | Enables full synced lyrics display and removes paywall banners on song lyrics. |  |
| [Unlock Plus Experience](#unlock-plus-experience) | Enables client-side Plus features, eliminates free-tier playback restrictions, and enables offline UI mode. |  |

</details>

<!-- PATCHES_END -->

The table above is generated from `patches-list.json` by the release workflow — do not edit it by hand.

---

## 🏗 Architecture

Every patch is a self-contained feature file: the patch itself plus the bytecode signatures it
matches, in one place. There is no shared "fingerprint dump" that has to be cross-referenced while
reading a patch.

```text
patches/src/main/kotlin/app/anghami/patches/
├── core/
│   ├── AnghamiTarget.kt          # package name, supported version/version codes, Compatibility
│   └── Bytecode.kt               # forceTrue / forceFalse / forceNull / forceVoid smali stubs
├── ads/                          # advertising surfaces
│   ├── AudioAdBlock.kt
│   ├── PromoPopupBlock.kt
│   └── SponsoredContentBlock.kt
├── playback/                     # queue and playback gates
│   ├── ForcedShuffleRemoval.kt
│   └── PlaybackGateUnlock.kt
├── download/OfflineLimitUnlock.kt
├── entitlement/                  # Plus state and badge
│   ├── PlusUnlock.kt
│   └── PlusBadgeRestore.kt
├── store/                        # monetisation surfaces
│   ├── GoldUpsellBlock.kt
│   └── UpgradeUpsellBlock.kt
├── ui/                           # interface clean-up
│   ├── PremiumButtonBlock.kt
│   └── ShuffleBadgeBlock.kt
├── lyrics/SyncedLyricsUnlock.kt
├── privacy/TelemetryNeutralizer.kt
├── system/                       # platform-level behaviour
│   ├── ScreenshotUnlock.kt
│   └── RatingPromptBlock.kt
└── integrity/SignatureSpoof.kt

extensions/extension/             # bundled dex used by the lyrics patch (OkHttp URL rewrite)
```

Design rules the codebase follows:

- **One feature, one file.** A patch never depends on another feature's file; the only shared code
  is `core/`.
- **Signatures live next to their patch.** Fingerprint objects are named `*Signature` and describe
  the exact class/method they match, so a version bump is a local change.
- **Bytecode edits are named.** Instead of repeating raw smali, patches express intent through the
  `forceTrue()` / `forceFalse()` / `forceNull()` / `forceVoid()` helpers.
- **`AnghamiTarget` is the single source of truth** for the supported package, version and ABIs.
- **Generated files are never edited by hand**: `patches-list.json`, `patches-bundle.json`,
  `CHANGELOG.md` and the catalogue section of this README are produced by the release workflow.

---

## 🛠️ Development

### Prerequisites

* **JDK 21** or newer.
* A **GitHub personal access token** with the `read:packages` scope — the Morphe Gradle plugin is
  published to GitHub Packages. Store it in `~/.gradle/gradle.properties`:

  ```properties
  gpr.user = <your GitHub username>
  gpr.key  = <your personal access token>
  ```

### Build

```bash
git clone https://github.com/Kero309x/anghamiplus-patches.git
cd anghamiplus-patches

# Build the patch bundle
./gradlew :patches:buildAndroid
# → patches/build/libs/patches-<version>.mpp
```

### Branch and commit model

* `dev` — development branch. Every `fix:` / `feat:` commit publishes a pre-release.
* `main` — stable branch, fed by merging `dev` (no squash).
* Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/):
  `feat:`, `fix:`, `perf:`, `refactor:`, `docs:`, `chore:`, `build:`.
* Releases are cut automatically by semantic-release — never publish or tag by hand, and never
  force-push a release commit.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the full workflow.

---

## ❓ Frequently Asked Questions

<details>
<summary><b>Do I need root?</b></summary>
<p>No. Morphe rewrites the APK package and re-signs it, so the patched app installs on any device.</p>
</details>

<details>
<summary><b>Can I download songs for offline playback?</b></summary>
<p>All <em>client-side</em> download quotas and lock checks are removed. Server-side entitlement and DRM licence issuance are not touched, so behaviour that depends on the backend stays as Anghami implements it.</p>
</details>

<details>
<summary><b>Is my account or are my playlists affected?</b></summary>
<p>You sign in with your own account. Playlists, followed artists and listening history sync through Anghami exactly as before.</p>
</details>

<details>
<summary><b>How do I get a new patch release?</b></summary>
<p>Morphe Manager picks up new releases from this repository automatically. Re-patch the APK after an update.</p>
</details>

<details>
<summary><b>Does this work with other Anghami versions?</b></summary>
<p>The bundle is pinned to Anghami <code>8.0.28</code> (<code>8000280</code>). Other versions are rejected rather than patched incorrectly.</p>
</details>

---

## 👥 Authors & Contributors

* **[Mohamed Amr Nady](https://github.com/mohamedamrnady)** — original author of the Anghami patch set
  this project is based on ([mohamedamrnady/anghami-patches](https://github.com/mohamedamrnady/anghami-patches), GPLv3).
* **[Kero309x](https://github.com/Kero309x)** — maintainer: restructuring, verification, packaging and releases.
* **[Ahmed Ramzy](https://www.facebook.com/ahmd.ramzy.101)** — contributor.

Contributions are welcome — see [CONTRIBUTING.md](CONTRIBUTING.md). Please report security issues
through [SECURITY.md](SECURITY.md) instead of a public issue.

---

## ⚠️ Disclaimer

This project is published for **educational, interoperability and personal research purposes only**.
It is not affiliated with, sponsored by, or endorsed by Anghami. All trademarks, service marks and
product names belong to their respective owners. The patches operate exclusively on the copy of the
app that you already own and install on your own device; server-side protections, DRM and
entitlements are left untouched. You are responsible for complying with the terms of service and
with the laws that apply to you.

---

## 📜 License

Released under the **GNU General Public License v3.0** — see [LICENSE](LICENSE).
This project is based on the Anghami patch set by Mohamed Amr Nady; redistributions of
this bundle or of derivative works must keep the licence, the attribution described in
[ATTRIBUTION.md](ATTRIBUTION.md), and the branding terms described in [NOTICE](NOTICE).

---

<div align="center">

`anghami plus` • `anghami patches` • `morphe patches` • `morphe manager` • `anghami adblock` • `anghami synced lyrics` • `anghami unlimited skips` • `android bytecode patching` • `anti-telemetry`

</div>
