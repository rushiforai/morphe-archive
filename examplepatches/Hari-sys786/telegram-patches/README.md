<h1 align="center">Telegram Patches</h1>

<p align="center">
  Morphe patch source for the official Telegram Android app — premium unlock, faster transfers,
  banned-channel access and quality-of-life fixes, built as real bytecode patches.
</p>

<p align="center">
  <a href="https://github.com/OWNER/telegram-patches/releases/latest"><img alt="Latest release" src="https://img.shields.io/github/v/release/OWNER/telegram-patches?display_name=tag&label=Release&style=for-the-badge"></a>
  <a href="https://github.com/OWNER/telegram-patches"><img alt="Total downloads" src="https://img.shields.io/github/downloads/OWNER/telegram-patches/total?label=Downloads&style=for-the-badge"></a>
  <a href="https://morphe.software/add-source?github=OWNER/telegram-patches"><img alt="Add to Morphe" src="https://img.shields.io/badge/Morphe-Add%20Source-00A8FF?style=for-the-badge"></a>
</p>

> Replace `OWNER` with the GitHub account that hosts this repository, then the badges, the
> `repoSlug` gradle property and the "Add to Morphe" link are all consistent.

## Overview

A public [Morphe](https://morphe.software) patch source for Telegram. Every patch is a
fingerprint-based bytecode patch (dexlib2 through `morphe-patcher`) — nothing depends on hardcoded
file offsets, and a patch that cannot find its target **fails loudly** instead of mis-patching.

The bundle is a port of the Telegram smali patcher `tgpatcher.py` plus two extra patches, so users
can patch the APK **they supply** and sign it with their **own** key.

## Included patches

| # | Patch | What it does |
|---|-------|--------------|
| 1 | Disable signature verification | `AndroidUtilities.getCertificateSHA256Fingerprint()` returns the mod's known certificate, so a repacked official APK runs |
| 2 | Force premium (UserConfig.isPremium) | `isPremium()` → `true` |
| 3 | Force premium (StoriesController.isPremium) | premium stories unlocked |
| 4 | Force premium (PremiumPreviewFragment.forcePremium) | forces every read of `forcePremium` |
| 5 | Disable marking stories as read | views stay hidden |
| 6 | Force premium feature available | `isPremiumFeatureAvailable` → available |
| 7 | Increase download speed | `FileLoadOperation.updateParams()`: chunk 128 KB → 512 KB, requests 4 → 8 |
| 8 | Allow forwarding/saving restricted media | `isChatNoForwards()` → `false` |
| 9 | Access banned channels | `checkCanOpenChat()` → `true` |
| 10 | Bypass isRestrictedMessage | restricted-message gate off |
| 11 | Enable saving media everywhere | `enableSavingMedia` |
| 12 | Unlock premium-locked content | `premiumLocked` |
| 13 | Enable screenshots | `FLAG_SECURE` / `allowScreenCapture` sites |
| 14 | Hide sponsored messages | `MessageObject.isSponsored()` → `false` |
| 15 | Remove proxy sponsored channels | `checkPromoInfoInternal` |
| 16 | Secret media enabler | secret-media timers/methods |
| 18 | Disable sponsored messages (client flag) | `isSponsoredDisabled()` → `true` |
| 19 | Delete Account dialog | Cherrygram-style dialog: Settings menu entry (red, id 3), 20 s countdown, `account.deleteAccount`, logout |
| 21 | Raise max account count | `UserConfig.getMaxAccountCount()` → 999 (stock: 3, or 5 with premium) |
| 22 | Increase upload speed | `FileUploadOperation.startUploadRequest()` throughput cap 0x800 → 0x2000 (up to 4× parallel upload parts) |

**Not included on purpose:** anti-messages-delete and AyuGram ghost mode.

## Compatibility

* `org.telegram.messenger.web` (official APK from telegram.org)
* `org.telegram.messenger` (Play Store build)
* `org.telegram.messenger.beta`

Versions are unconstrained because every patch is fingerprint-based. Verified against **12.10.1
(versionCode 70389)**.

> Morphe forces *universal* patches (no declared package) to `default = false`. Declaring the
> Telegram packages is what keeps these patches `default = true`.

## Usage

**Morphe Manager (Android):** add this source, select Telegram, patch your APK, sign with your key.

**Morphe CLI / desktop:**

```bash
java -Xmx6g -jar morphe-desktop-<version>-all.jar patch telegram.apk \
  -p patches-1.0.0.mpp -o telegram-modded.apk \
  --keystore=my.keystore --keystore-password=**** --keystore-entry-alias=my --keystore-entry-password=****

# inspect what the bundle offers
java -jar morphe-desktop-<version>-all.jar list-patches --patches=patches-1.0.0.mpp \
  -f org.telegram.messenger.web -p
```

Without `--keystore` you get an unsigned APK that you sign yourself — the recommended flow, so each
user keeps their own signer and can update installs in place.

## Building

```bash
./gradlew :patches:jar generatePatchesList    # -> patches/build/libs/patches-<version>.mpp
                                             #    + patches-list.json, patches-bundle.json
```

### Toolchain

Pinned to what the reference Morphe sources use, because the bundle **advertises its patcher
version** in the manifest and Morphe refuses a bundle built for a newer patcher than it ships:

| Component | Version |
|---|---|
| Gradle | 9.6.1 |
| `app.morphe.patches` (Gradle plugin) | 1.3.3 |
| `app.morphe:morphe-patcher` | **1.8.0** |

Morphe publishes the plugin and the patcher only to GitHub Packages, which needs credentials with
`packages:read`. This repo therefore vendors both upstreams (`tools/vendor-upstream.sh`) and wires
them in as composite builds:

* `vendor/morphe-patches-gradle-plugin-1.3.3`
* `vendor/morphe-patcher-1.8.0`

> The Gradle **wrapper** download can fail on networks that break TLS on redirects
> (`SSLException: Unsupported or unrecognized SSL message`). Install the distribution manually if
> that happens: download the zip with `curl`, unzip it, and run `gradle` from there.

`gradle.properties` carries dummy `gpr.user`/`gpr.key` values because the plugin passes registry
credentials through unconditionally; all real dependencies resolve from Maven Central / Google /
JitPack first.

## Verification

* `./gradlew :patches:verifyPatches -PverifyIncludeDisabled=false` — applies the built bundle to a
  real Telegram APK and reports per-patch fingerprint resolution (20/20 on 12.10.1).
* The `verifyPatches` task and `VerifyMain.kt` are development-only; they are not part of the bundle.

## Release metadata

`patches-bundle.json` (version, changelog block, download URL) and `patches-list.json` (patch list)
are generated by `generatePatchesList` and committed by the release workflow, which is what Morphe
Manager shows as the source's version/changelog.

## License

GPLv3 — see [LICENSE](LICENSE) and [NOTICE](NOTICE). Telegram is a trademark of Telegram FZ-LLC;
this project is not affiliated with Telegram.
