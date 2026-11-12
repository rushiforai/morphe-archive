# Sby Patches

Morphe patch source for the **foodpanda** Android app, by [Saad Bin Yousaf](https://saadbinyousaf.dev).

Based on the prior work of [ReVanced](https://github.com/ReVanced/revanced-patches) and built on the
[Morphe](https://github.com/MorpheApp) patcher. Licensed under GPLv3.

## Target

| App | Package | Version |
|-----|---------|---------|
| foodpanda | `com.global.foodpanda.android` | 26.44.0 |

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/saadbinyousaf1/sby-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 foodpanda&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `com.global.foodpanda.android`

**🎯 Supported versions:**

| 26.44.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass anti-tamper (foodpanda)](#bypass-anti-tamper-foodpanda) | Bypasses foodpanda's DeliveryHero MAS integrity block so re-signed / sideloaded builds no longer hit the "This device or application is not supported" screen. Required. |  |
| [Force dark mode](#force-dark-mode) | Repaints foodpanda's built-in light colour constants with dark equivalents so the app runs in a real dark theme. Palette classes are located by their colour constants, so the patch survives obfuscation renames. The foodpanda pink brand colour is kept. |  |
| [Remove ads](#remove-ads) | Removes foodpanda's adtech banner ads (order-tracking, home, discovery, reels) and suppresses the forced PandaMart cross-sell / grocery upsell popup. |  |
| [Spoof signature (maps fix)](#spoof-signature-maps-fix) | Experimental. Redirects PackageManager.getPackageInfo so the app reports foodpanda's original signing certificate, which can restore Google Maps on re-signed builds. May not work because Google Play Services verifies the installed signature out of process. |  |

</details>

<!-- PATCHES_END -->

## The maps caveat

Re-signing a patched APK changes its signing certificate. foodpanda's Google Maps key is restricted to the
original certificate, so Google stops serving map tiles. The **Spoof signature** patch makes the app report
the original certificate to code running *inside* the app — but Google Play Services validates the installed
signature *out of process*, so this may not fully restore maps. It's off by default; enable and test on-device.
If it doesn't work, the reliable fix is to inject your own unrestricted Maps API key (planned for a later version).

## Using these patches in Morphe

1. Open on the Android device where Morphe is installed:
   `https://morphe.software/add-source?github=saadbinyousaf1/sby-patches`
   Or paste the repo URL into Morphe Manager's "add source" field.
2. Select foodpanda, enable **Expert Mode** to choose patches individually, and patch.

## Building

CI builds the bundle on every push. A `feat:` / `fix:` commit on `main` cuts a release with `patches-<version>.mpp`
attached; any other commit just compiles to verify the project.

Locally (requires a GitHub token with `read:packages` for the Morphe registry):

```
./gradlew :patches:buildAndroid
```
