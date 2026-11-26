# Nezumi Patches

Community patches for Zalo, compatible with Morphe.

## ❓ About

This repository contains Zalo patches for chat heads, chat reactions and optional privacy controls for delivery receipts, read receipts and typing indicators. Compatibility is limited to the app versions declared by each patch.

### How to use these patches

Add this source in Morphe: https://morphe.software/add-source?github=Nezumi-2711/morphe-patches

### Clone package (local development)

The optional `Clone package` patch supports Zalo 26.11.01 on ARM64.
Set `packageName` (default `com.zing.zalo.clone`) and `appName` (default `Zalo Clone`)
in the patch options. Each clone must use a distinct package. It includes the native
signature fix and separates provider authorities, custom permissions, and Android
account types from the original app. Use a different Zalo account in each copy;
this does not change server-side login/session restrictions. Do not combine it
with another package-renaming patch. Login and simultaneous account operation
still require device validation; local APK checks alone do not verify them.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.8.0-dev.2](https://github.com/Nezumi-2711/morphe-patches/releases/tag/v1.8.0-dev.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;26 patches total
<details open>
<summary>📦 Zalo&nbsp;&nbsp;•&nbsp;&nbsp;26 patches</summary>
<br>

**🎯 Supported versions:**

| 26.11.01 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED dark theme](#amoled-dark-theme) | Use true-black backgrounds in Zalo's dark mode, with slightly lifted popups, sheets and chat bubbles, and a dimmed call screen. |  |
| [Bug log](#bug-log) | Adds a Debugging section to Nezumi's Settings that records patch errors, crashes and ANRs to a local log the user can export and share with the developer. Recording is off until the user turns it on. |  |
| [Bypass conversation protection](#bypass-conversation-protection) | Unblock screenshots, screen recording, forwarding, copying and saving media in protected conversations when enabled in Nezumi Settings. |  |
| [Call recording](#call-recording) | Adds a record button to the Zalo 1-1 in-call screen. Recordings are saved as m4a in Music/ZaloRecordings. |  |
| [Chat heads instead of Android bubbles](#chat-heads-instead-of-android-bubbles) | Use Zalo's overlay chat heads rather than native Android bubbles on Android 11 and newer. |  |
| [Chat reaction picker](#chat-reaction-picker) | Allow the enabled chat reaction UI without a matching subscription package. |  |
| [Clone package](#clone-package) | Install an ARM64 Zalo clone alongside the original with a custom package and app name. Separate accounts are required. | • Clone package name<br>• Clone app name |
| [Custom font](#custom-font) | Choose a font in Nezumi's Settings for Zalo's text, chat messages, info card, options, and contacts. |  |
| [Custom sounds](#custom-sounds) | Choose custom notification and incoming-call sounds in Nezumi's Settings. |  |
| [Drive backup via microG](#drive-backup-via-microg) | Enable Google Drive photo backup and use microG for Drive accounts and authentication. |  |
| [Hide Business Box in Messages](#hide-business-box-in-messages) | Hide the Business Box row in Messages when enabled in Nezumi Settings. |  |
| [Hide Discovery tab](#hide-discovery-tab) | Remove the Discovery tab from Zalo's main navigation. |  |
| [Hide Media Box in Messages](#hide-media-box-in-messages) | Hide the Media Box row in Messages when enabled in Nezumi Settings. |  |
| [Hide OA accounts in Messages](#hide-oa-accounts-in-messages) | Hide OA accounts in Messages and/or mute their notifications. Both options are configurable in Nezumi Settings. |  |
| [Hide ads in Messages](#hide-ads-in-messages) | Hide Z Instant Ads rows in Zalo's Messages page when enabled in Nezumi Settings. |  |
| [Hide delivery receipts](#hide-delivery-receipts) | Suppress outgoing message delivery ACKs when enabled in Nezumi Settings. |  |
| [Hide feed ads](#hide-feed-ads) | Remove sponsored and advertising items from Zalo's user feed when enabled in Nezumi Settings. |  |
| [Hide read receipts](#hide-read-receipts) | Keep outgoing read receipts private while retaining delivery ACKs when enabled in Nezumi Settings. Adds a Mark as read button to the chat toolbar for sending a read receipt on demand. |  |
| [Hide text typing](#hide-text-typing) | Hide outgoing text typing in direct and group chats when enabled in Nezumi Settings. |  |
| [Keep recalled messages](#keep-recalled-messages) | Keep received messages and locally available photos after another user recalls them, when enabled in Nezumi Settings. |  |
| [Native signature fix](#native-signature-fix) | Allow Zalo 26.11.01 ARM64 to start after patching and re-signing. ARMv7 is not supported. |  |
| [Open links in external browser](#open-links-in-external-browser) | Applies Zalo's "Mở bằng trình duyệt web" choice (Settings > Privacy > Chọn cách mở link) to all links, including link-preview video cards, feed and comment links, group board/My Cloud links and scanned QR links. Zalo's own links (zalo.me) still open in Zalo. You must select "Mở bằng trình duyệt web" in that setting; with the default "Mở bằng Zalo" nothing changes. |  |
| [Save media](#save-media) | Adds Save to Gallery for profile avatar, profile cover, Story and Zalo Video. |  |
| [Send photos in original quality](#send-photos-in-original-quality) | Unlocks Zalo's native original-photo quality option and selects it by default while preserving its normal quality picker. |  |
| [Unlimited quick messages](#unlimited-quick-messages) | Remove the client-side limit on the number of quick messages, ignoring the server-provided cap. |  |
| [View online status privately](#view-online-status-privately) | Hide your activity and show confirmed current-online status in the individual chat header when available. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

  ### Release signing

  To make Morphe Manager show the bundle signer and reject tampered releases:

  1. Run `./gradlew generateSigningKey` once. This creates `morphe-signing.pub` and `morphe-signing.key`.
  2. Commit `morphe-signing.pub`; never commit `morphe-signing.key`.
  3. Store the contents of `morphe-signing.key` in the repository secret `MORPHE_SIGNING_KEY`.

  The release workflow signs every published `.mpp` and publishes its signature alongside the bundle. Keep a secure backup of the private key; replacing it requires users to trust the new signer in Morphe Manager.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Nezumi Patches are licensed under the [GNU General Public License v3.0](LICENSE)
