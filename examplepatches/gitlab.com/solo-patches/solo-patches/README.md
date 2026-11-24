<p align="center">
  <img src="docs/assets/solo-patches.jpg" alt="Solo Patches artwork" width="190" height="190">
</p>

<h1 align="center">Solo Patches</h1>

<p align="center">Ad blocking, appearance and navigation patches for WebNovel, for use with Morphe.</p>

<p align="center">
  <a href="https://morphe.software/add-source?gitlab=solo-patches/solo-patches" title="Add Solo Patches to Morphe">
    <img src="https://img.shields.io/badge/Morphe-Add%20this%20source-00A8FF?style=for-the-badge" alt="Add to Morphe" height="32">
  </a>
</p>

<p align="center">
  <a href="https://gitlab.com/solo-patches/solo-patches/-/releases">Releases</a> ·
  <a href="https://gitlab.com/solo-patches/solo-patches/-/issues">Issues</a> ·
  <a href="docs/DEVELOPMENT.md">Building</a>
</p>

> This is an independent community source, not an official Morphe patch bundle.

**Supported app:** [WebNovel](https://play.google.com/store/apps/details?id=com.qidian.Int.reader) **8.24.2 APKM** (`com.qidian.Int.reader`). Other versions and input formats are not supported.

## Contents

- [Installing](#installing)
- [Patches list](#patches-list)
- [FAQ](#faq)
- [Reporting bugs](#reporting-bugs)
- [Building and contributing](#building-and-contributing)
- [Credits](#credits)
- [License](#license)

## Installing

1. Install [Morphe Manager](https://morphe.software). Read the [release notes](https://gitlab.com/solo-patches/solo-patches/-/releases) and check the published `SHA256SUMS` and bundle-signing identity, `morphe-signing.pub`.
2. Use **Add to Morphe** above, or open **Sources > + > Remote** and enter:
   ```text
   https://gitlab.com/solo-patches/solo-patches
   ```
   You can also import the release's `.mpp` file through **Sources > + > Local**. Local sources need manual updates.
3. Choose the untouched, publisher-signed **8.24.2 APKM**. Select **WebNovel GmsCore compatibility** and the features you want. Its included signature, certificate and GmsCore dependencies are automatic. Leave **Custom fonts** unselected unless testing it.
4. Keep the GmsCore defaults: `gmsCoreVendor=app.revanced.android.gms` and `mainActivityName=/BaseSignInActivity;`. Google sign-in needs an installed, trusted **`app.revanced.android.gms`** provider; the provider itself is not included. Do not also select duplicate compatibility patches from another source.
5. Patch and install. Open **Profile > Settings > Patch controls** to customize the app.

**Updating an existing installation requires the same APK signing key.** Stop on a signature mismatch. Do not uninstall, clear app data or log out as a workaround. This project distributes patches and source only, never WebNovel APKs. Obtain the supported input lawfully yourself.

Single-bundle CLI patching passed locally. Manager installation and fresh Google sign-in with the integrated build still need device validation. See [Development](docs/DEVELOPMENT.md#patch-a-local-candidate) for the local method, pinned metadata URL and validation boundaries.

## Patches list

The bundle contains **15 patches for one app**, including the compatibility dependencies. See the generated [patch catalog](patches-list.json) for options and defaults.

| Patch | What it does |
| --- | --- |
| **Hide ads** | Hides launch promotions, the bottom-bar campaign button, reader ads/placeholders, Library promoted books and the daily recommendation banner. Runtime switch starts on. |
| **Hide popups** | Hides automatic campaigns, sale icons, check-in/rating prompts, notification nags and reader-exit promotions. A separate switch hides the full-screen Featured Works page. Manual check-in, rating and login dialogs remain. Runtime switches start on. |
| **Material You colors** | Optional native app colors and a separate reader-color override on Android 12+. App theming starts off. Saved native reader presets are preserved; some artwork, gradients and WebView/Flutter surfaces stay stock. |
| **AMOLED dark theme** | Turns the main dark mode background, bottom bar and reader pages pure black. Only applies while WebNovel's dark mode is on. The Patch controls switch starts on; cards, dialogs, artwork and WebView/Flutter screens stay stock. Works with or without Material You colors. |
| **Main navigation controls** | Reorders bottom tabs and optionally hides Featured, Writing or Explore. Opens Library at launch when Featured is hidden. Library and Profile remain reachable. |
| **Copy and translate** | Adds a **Translate** button to book reviews, replies and chapter and paragraph comments. Choose where it goes under **Patch controls > Comments**: beside Like (default), in the ⋯ menu, or in the paragraph-comment long-press menu, where Dislike is hidden. Translates with WebNovel's own machine translation into a language chosen in Patch controls (default: app language); copy the result from the translation window. Long-press a book's details page to select, copy or translate its synopsis. Review previews on the details page are Flutter and have no button; tap one to open its review page. Author's note selection does not work yet. |
| **Hide blocked authors' books** | Removes books by users you blocked from tag and genre results. Searching for a book by name still finds it. Fetches your block list and each blocked user's book list with WebNovel's own requests. Blocks made in the app apply at once; blocks made on the website can take up to a minute. Signed out, nothing is hidden. **Patch controls > Accounts > Blocked accounts** opens WebNovel's own block list, where you can unblock users. |
| **GIF search providers** | Chooses the GIF picker's search in comments under **Patch controls > GIFs**: KLIPY, WebNovel's own provider (default), or GIPHY with your own API key from [developers.giphy.com](https://developers.giphy.com/). GIPHY results are rated PG-13 or lower. Tenor is not offered because Google shut its API down on June 30, 2026. |
| **Disable reader reward timer** | Optional switch that stops the corner controller and ticker, not just its widget. **Enabling it stops timer-based reading rewards.** Starts off; independent reading statistics remain. Battery savings are not measured. |
| **Disable Firebase Analytics** | Optional build-time deactivation of Firebase Analytics. Does not disable Firebase Auth/FCM, other trackers or anti-tamper reporting. Repatch without it to restore the native collection policy. |
| **Custom fonts** | Experimental separate UI/reader TTF/OTF imports and resets. Further font work is paused; leave unselected. |
| **WebNovel GmsCore compatibility** | Adapts WebNovel's classic Google sign-in protocol and includes the three dependencies below automatically. Explains a missing MicroG RE or a failed sign-in instead of doing nothing. |
| **Spoof app signature** | Upstream startup compatibility hook. Preserves process-local certificate reads without changing the APK's actual signing certificate or bypassing hardware attestation. |
| **GmsCore support (MicroG)** | Upstream Google-service routing through the installed GmsCore provider, with WebNovel's activity default. |
| **Provide Original app certificate** | Upstream dependency that reads the publisher certificate from the untouched input. Leave manual certificate options unset. |

Controls save automatically. Reopen Library after changing ad blocking, and reopen the reader after changing its colors or timer. Turning off the reader-color override restores the saved native preset. **Reopen app** recreates the activity stack without clearing data or signing out; it is not an OS process restart.

## FAQ

### Do I need rushiranpise's bundle separately?

No. The required signature, certificate and GmsCore sources from **v1.23.1** are included here. Selecting **WebNovel GmsCore compatibility** includes them automatically. A trusted GmsCore provider is still required for Google sign-in.

### Does Google sign-in work?

The earlier two-source build reached owner-confirmed Google login. The integrated single-bundle build passed local patching but still needs a fresh device/login check. An account picker alone does not prove successful login. Future server changes or a forced app update can break older versions. The installed provider's provenance has not been independently audited here.

### Does this unlock chapters or give free rewards?

No. Purchases, memberships, rewarded ads, server-side content access and independent reading accounting remain native. Reading activity and ad completion are not fabricated. Manual check-in stays available.

### Can my account be banned?

Modified apps can violate WebNovel's terms and lead to restrictions, bans, broken login or data loss. **There is no anti-ban protection.** Firebase Analytics deactivation does not hide a modified client. Trust the patch source and GmsCore provider before granting account access. **You use these patches at your own risk and accept responsibility for any resulting bans or account restrictions. The project maintainers are not responsible for those outcomes.**

### How do updates work?

Source updates do not change an installed APK. Repatch a clean, supported input and install a same-package, same-key update. Back up your private APK signing key securely; the published bundle verification key is a separate identity.

## Reporting bugs

Use [GitLab issues](https://gitlab.com/solo-patches/solo-patches/-/issues) and the **Bug report** or **Feature request** template. Include the app version/input format, Solo bundle version, Manager/CLI version, Android version, selected options and safe reproduction steps. For older two-source builds, also name the external bundle version.

**Do not submit account/session/token values, signing keys, full logs, APKs, app data, chapter text or private screenshots.** A short, manually redacted error excerpt is enough. Search existing issues first. Comments-only notification filtering is not implemented; font development remains paused.

## Building and contributing

Use JDK 21 and the Android SDK. [Development](docs/DEVELOPMENT.md) covers build credentials, serial low-memory commands, patching and release gates. [Contributing](CONTRIBUTING.md) covers focused changes and privacy-safe reports. [Changelog](CHANGELOG.md) records user-facing changes.

Patch bundles require a separate, manually approved release. Community-directory listing is also separate; an Add to Morphe badge is an installation link, not evidence of review or endorsement.

## Credits

- [rushiranpise and contributors](https://github.com/rushiranpise/morphe-patches): the included signature, certificate and GmsCore patches, fingerprints and Java runtime hooks. Pinned to **v1.23.1**, commit [`92c0fca`](https://github.com/rushiranpise/morphe-patches/commit/92c0fca0ae103a419c7fc61f9c5b8b38b7d6b82a). Local adaptations scope them to WebNovel, set its activity default and declare compatibility dependencies.
- [jkennethcarino/adobo](https://github.com/jkennethcarino/adobo) and [L-JINBIN/ApkSignatureKillerEx](https://github.com/L-JINBIN/ApkSignatureKillerEx): signature-hook origins credited by the upstream implementation.
- [LSPosed / AndroidHiddenApiBypass](https://github.com/LSPosed/AndroidHiddenApiBypass): runtime dependency **4.3**, under Apache License 2.0.
- [Morphe](https://github.com/MorpheApp) and its [patches template](https://github.com/MorpheApp/morphe-patches-template): framework, build tooling and repository base.
- [ReVanced](https://github.com/ReVanced) and [microG](https://github.com/microg): foundational patching/GmsCore work referenced upstream. No provider APK is distributed here.
- [hxreborn](https://github.com/hxreborn/morphe-patches) and rushiranpise: README and repository-layout references. hxreborn's AMOLED patches inspired **AMOLED dark theme**. No hxreborn patch implementation is imported.
- [SysAdminDoc's HushMessenger](https://github.com/SysAdminDoc/HushMessenger) and [HushGram](https://github.com/SysAdminDoc/HushGram): Patch controls design references, not imported runtime code.

## License

[GNU General Public License v3.0](LICENSE), with inherited branding conditions in [NOTICE](NOTICE). Original notices are retained. The bundle includes the HiddenApiBypass license at `META-INF/licenses/hiddenapibypass/LICENSE.txt`.

Solo Patches is independent and not affiliated with WebNovel, Morphe, ReVanced or Google. Names identify compatibility and prior work only. No warranty or account-safety guarantee is provided.

Header artwork was supplied by the project owner. No separate artwork license was provided; the code license does not grant rights to third-party artwork.
