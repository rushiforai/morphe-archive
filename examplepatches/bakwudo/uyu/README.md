# uyu

Patches for the Android Twitch app, for use with [Morphe](https://morphe.software).

> [!WARNING]
> uyu is in early development. Ad blocking is not available yet.

## About

uyu is one self-contained patch bundle. You do not need any other Twitch bundle.

| Feature | Status |
|---|---|
| **Fix login**: log in after the app is re-signed | Works (tested on a device) |
| **Fix notifications**: receive push notifications after the app is re-signed | Implemented, not yet tested |
| **Auto claim channel points**: claim the bonus chest on the channel you are watching | Works (tested on a device) |
| **Danmaku comments**: chat messages scroll across the video, Niconico style, in landscape fullscreen, portrait, the mini player and picture in picture | Works (tested on a device) |
| **Hide promotions**: hide the subscribe and Bits buttons above chat, the Bits button in the chat box, the gift leaderboard and subscription promotion banners | Works (tested on a device) |
| **Install as a separate app**: install as an app named "uyu" next to the official Twitch app | Works (tested on a device) |
| **Block ads**: block live, VOD, audio and display ads, with an optional proxy | Planned |

Channel points, danmaku and each hidden item can be switched on or off in an **uyu** entry added to Twitch's settings.

These features work in Twitch's native player, so uyu opens streams there instead of in the new React Native player that Twitch is testing. The home feed is unchanged.

Each uyu release supports exactly one Twitch version. New Twitch versions are adopted irregularly, on a best-effort basis.

### How to use these patches

Add this bundle to Morphe Manager: https://morphe.software/add-source?github=trivisa-itihasa/uyu&name=uyu

Or add `github.com/trivisa-itihasa/uyu` as a remote patch source.

Morphe uses stable releases and keeps the source up to date. To try new patches before they are released, turn on **Pre-release patches** for the uyu source.

- **Twitch APK:** APKMirror only offers Twitch as a split bundle (APKM). Morphe accepts it as is.
- **Separate app:** uyu installs as its own app (package `io.github.trivisa_itihasa.uyu`), so you can keep the official Twitch app. If you installed an earlier uyu build that replaced Twitch, it stays installed until you remove it, and you need to log in again in the new app.
- **Signing in:** Google sign-in does not work in a re-signed app. Log in with your username and password.
- **Other bundles:** do not apply a channel points patch from another bundle together with uyu's.

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/trivisa-itihasa/uyu/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary> Twitch&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

** Supported versions:**

| 31.3.1 |
| :---: |

| &nbsp;Patch | &nbsp;Description | &nbsp;Options |
|----------|----------------|-----------|
| [Auto claim channel points](#auto-claim-channel-points) | Adds an option to claim the channel points bonus chest automatically on the channel you are watching. It works while chat or the points button is hidden, for example in fullscreen. Streams open in Twitch's native player instead of the new React Native one, which this relies on. |  |
| [Danmaku comments](#danmaku-comments) | Adds an option to scroll chat messages across the video on live streams, Niconico style, in landscape fullscreen and optionally in portrait, the mini player and picture in picture. A button in the player turns it on and off, and the rows, speed, number of comments, font and colors can be changed in the uyu settings. An option hides Twitch's chat in landscape so the stream fills the screen. Streams open in Twitch's native player instead of the new React Native one, which this relies on. |  |
| [Fix login](#fix-login) | Fixes the "This app version/OS is not currently supported" error that blocks login after patching. Twitch reports a Play Integrity result to its login server and the re-signed app fails that check. This stops the app from sending the attestation, so it behaves like a device without Google Play, where login works normally. |  |
| [Fix notifications](#fix-notifications) | Fixes push notifications after patching. Firebase rejects device registration because the patched app has a different signing certificate, and a different package name when it is installed as a separate app. This sends Twitch's original certificate fingerprint and package name with Firebase Installations requests only. |  |
| [Hide promotions](#hide-promotions) | Adds options to hide the subscribe and Bits buttons above chat, the Bits button in the chat box, the gift leaderboard and banners that advertise subscriptions. All of them are hidden by default. They can be shown again in the Appearance section of the uyu settings. Streams open in Twitch's native player instead of the new React Native one, which this relies on. |  |
| [Install as a separate app](#install-as-a-separate-app) | Installs the patched app as "uyu" next to the official Twitch app instead of replacing it. The package name becomes io.github.trivisa_itihasa.uyu. |  |

</details>

<!-- PATCHES_END -->

## Disclaimer

Modifying the Twitch app is against the [Twitch Terms of Service](https://legal.twitch.com/en/legal/terms-of-service/). You use these patches at your own risk.

uyu is not affiliated with Twitch or with the Morphe project.

## Building locally

Requirements:

- JDK 21
- Android SDK with SDK Platform 37 (for the extension module)
- GitHub CLI logged in with the `read:packages` scope, because Morphe's dependencies are served from GitHub Packages:

  ```
  gh auth refresh -h github.com -s read:packages
  ```

Build with:

```
./scripts/gradlew.ps1 buildAndroid
```

The bundle is written to `patches/build/libs/patches-*.mpp`. Apply it with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop). Run Morphe Desktop on an OpenJDK-based Java, such as the one bundled with Android Studio. Oracle JDK rejects the signing provider bundled with Morphe Desktop.

To see which patches apply to a given APK, run `./scripts/check-patches.ps1`. See [docs/updating.md](docs/updating.md) for how to move to a new Twitch version.

Development happens on the `dev` branch. Commits follow [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `chore:`). Releases are created only by `release.yml`, never by hand.

## Credits

- [Morphe](https://github.com/MorpheApp): patcher, patches template, and tools.
- [hoomans-morphe-patches](https://github.com/arandomhooman/hoomans-morphe-patches) by arandomhooman: basis for Fix login and Fix notifications.
- [ReVanced](https://gitlab.com/ReVanced/revanced-patches): reference for the settings entry and channel points claiming.
- [niconico-yt-morphe-patches](https://github.com/david419kr/niconico-yt-morphe-patches) by david419kr: reference for the danmaku overlay design.
- [morphe-androidtv-patches](https://github.com/ajstrick81/morphe-androidtv-patches) by ajstrick81: reference for client-side ad blocking.

## License

uyu is licensed under the [GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE) for additional terms from Morphe under GPLv3 section 7.
