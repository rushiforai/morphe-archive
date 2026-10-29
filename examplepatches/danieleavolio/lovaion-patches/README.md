# Lovaion Patches

> **PATCHED BY MORPHE** 🛠️ — all patches in this repository are built for and applied
> with [Morphe](https://morphe.software) / Morphe Manager.
>
> ☕ **Support this work:** [ko-fi.com/danieleavolio](https://ko-fi.com/danieleavolio) —
> see [Support this work](#support-this-work) and the [legal notice](#legal-notice).

Morphe patches for the apps I use.

## Patches

<!-- PATCHES_START -->
> **[v1.4.1](https://github.com/danieleavolio/lovaion-patches/releases/tag/v1.4.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Tickdrop&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.9.6 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass PairIP license check](#bypass-pairip-license-check) | Disables the PairIP license check so a re-signed build of Tickdrop starts instead of being refused. Required by every other patch. |  |
| [Unlock Plus](#unlock-plus) | Forces the Plus entitlement to always resolve as active, unlocking the premium skins, the unlimited tasks, pinning and backup. |  |

</details>

<details open>
<summary>📦 Column&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.0.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Forces the premium entitlement to always resolve as active, hides the feed's premium activation banner, shows the active plan as MORHPE in the profile and disables the app's over-the-air updates, which would otherwise replace the patched bundle on the next launch. |  |

</details>

<details open>
<summary>📦 GuitarTuna&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.103.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks the premium subscription, its song catalog and practice tools, and skips the subscription screen the app shows on launch. |  |

</details>

<details open>
<summary>📦 Cinemaniac&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 5.0.7 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Forces the Pro entitlement to always resolve as active, regardless of purchase or backend status. |  |

</details>

<!-- PATCHES_END -->

## Supported apps

| App | Package | Version |
|---|---|---|
| Cinemaniac | `it.papalillo.moviestowatch` | 5.0.7 |
| Column | `com.columnapp.column` | 2.0.1 (XAPK) |
| GuitarTuna | `com.ovelin.guitartuna` | 7.103.0 (XAPK) |

## Apply

1. Get the original release of the app (the exact version listed above).
2. In Morphe Manager, add this repository as a remote patch source:
   - direct link: `https://morphe.software/add-source?github=danieleavolio/lovaion-patches`
   - or manual endpoint:
     `https://raw.githubusercontent.com/danieleavolio/lovaion-patches/main/patches-bundle.json`
   - or import the latest `patches-*.mpp` release asset as a local source.
3. Select the app, keep the patch enabled (both are on by default), patch and install.
   The original app must be uninstalled first (different signature).

Patches are listed only for the exact versions above: if your installed build differs,
Morphe shows no patches for that app until you install the supported version.

If the source reports that the patch bundle could not be downloaded, it is pointing at a
release asset that is not available yet — refresh the source (or remove and add it again)
so it picks up the current release listed at the top of this page.

## Build

Morphe's Gradle plugin is published on GitHub Packages, which requires authentication even
for public packages. Provide a token with the `read:packages` scope.

```bash
export GITHUB_ACTOR=your-username
export GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxx
./gradlew buildAndroid
```

Output: `patches/build/libs/patches-*.mpp`. See `BUILD.md` for the full setup.

## Support this work

These patches are free and stay free. If they save you time, you can buy me a coffee:

**☕ [ko-fi.com/danieleavolio](https://ko-fi.com/danieleavolio)**

Support is voluntary and pays for maintenance: tracking new app releases, rebuilding
against Morphe updates and answering issue reports. It is not a sale — no patched app,
no premium content and no access to anyone else's software is provided in exchange.

## Legal notice

This is a statement of the legal basis on which this repository is published, and of the
rights it exercises. It is written to be read as a notice, not as a request for
permission.

**What is published.** Source code for Morphe patches, technical descriptions and build
configuration. No APK, no application asset, no signing key, no licence key and no paid
content. Every patched application is downloaded by the user from its own distributor and
patched on the user's own device.

**What the law allows.** The exceptions that govern computer programs cover exactly this
activity: modification of a copy you lawfully hold, for your own use, and reproduction of
the code needed to make programs work together.

- **European Union** — Directive 2009/24/EC: Article 5(1) (reproduction, translation,
  adaptation and transformation necessary for the use of the program by the lawful
  acquirer, including error correction), Article 5(2) (backup copy) and Article 6
  (decompilation for interoperability, without authorisation of the rightholder, where it
  is indispensable and limited to the parts required).
- **Italy** — Legge 633/1941: art. 64-ter (free uses for the legitimate acquirer),
  art. 64-quater (decompilation for interoperability) and art. 64-quinquies (observation,
  study and testing of the program's functioning).
- **United States** — 17 U.S.C. §117(a) (adaptation as an essential step in the use of the
  program) and §1201(f) (reverse engineering for interoperability), together with the
  exemptions adopted by the Librarian of Congress under §1201(a)(1)(B) for software that
  runs on devices the user owns.

**What is protected as expression.** Publishing patch code and the technical analysis
behind it is original expression by its author: art. 21 and art. 33 of the Italian
Constitution, art. 10 ECHR, art. 11 and art. 13 of the EU Charter of Fundamental Rights.
Describing a technique, and shipping code that implements it, is not the same act as
committing an offence with it.

**What this repository does not do.** It does not host or distribute third-party
binaries, does not redistribute premium content or application assets, does not collect or
resell accounts or credentials, and does not sell anyone else's software. The patches are
diffs applied by the user to a copy already on their device, and the resulting build stays
there.

**No affiliation.** This project is independent. It is not affiliated with, endorsed by or
acting on behalf of Morphe, ReVanced or any of the applications it targets. Product names
and trademarks belong to their respective owners and are used only to identify what a
patch applies to.

## Credits & license

Based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template),
which derives from ReVanced. Licensed under GPLv3 — see `LICENSE` and `NOTICE`.
This project uses its own branding and is not affiliated with the Morphe project.
