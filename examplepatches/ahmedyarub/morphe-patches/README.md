# 🧩 Ahmed Yarub's Patches

Personal patches for use with [Morphe](https://morphe.software).

## ❓ About

Patches built with [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher) for apps I
use. Each patch is developed against a specific, decompiled APK version, and only versions
that have actually been verified are declared as compatible.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=ahmedyarub/morphe-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.8.0](https://github.com/ahmedyarub/morphe-patches/releases/tag/v1.8.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;17 patches total
<details open>
<summary>📦 Instagram&nbsp;&nbsp;•&nbsp;&nbsp;15 patches</summary>
<br>

**🎯 Supported versions:**

| 449.0.0.52.84 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass signature check](#bypass-signature-check) |  |  |
| [Disable analytics](#disable-analytics) | Blocks analytics requests sent to Instagram and Facebook servers. |  |
| [Disable screenshot detection](#disable-screenshot-detection) | Disables screenshot detection in direct messages and stories. |  |
| [Download media](#download-media) | Adds ability to download posts, reels, stories and highlights |  |
| [Download voice message](#download-voice-message) | Enables ability to download voice messages |  |
| [Filter stories](#filter-stories) | Hides categories of stories from the story tray. | • Hide ad stories<br>• Hide suggested stories<br>• Hide highlights |
| [Hide Instants](#hide-instants) | Hides Instants from DMs page. |  |
| [Hide Threads profile button](#hide-threads-profile-button) | Hides the Threads button from the profile page action bar (top right of the profile page). |  |
| [Hide ads](#hide-ads) | Hides ads in the feed. |  |
| [Hide suggested content](#hide-suggested-content) | Hides suggested reels and suggested accounts. Suggested stories are hidden by Filter stories. | • Hide suggested reels<br>• Hide suggested accounts |
| [Improve image viewing](#improve-image-viewing) | Requests the maximum resolution images from the server. |  |
| [Make ephemeral media permanent](#make-ephemeral-media-permanent) | Changes unexpired view once, view twice media to permanent view. |  |
| [Open links externally](#open-links-externally) | Opens links in the system browser instead of the in-app browser. |  |
| [Sanitize share links](#sanitize-share-links) | Removes tracking parameters from links shared out of the app. |  |
| [Save deleted messages](#save-deleted-messages) | Keeps a local copy of incoming DMs so ones the sender deletes stay readable. Messages are stored unencrypted in the app's private storage. | • Days to keep messages |

</details>

<details open>
<summary>📦 Reddit&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.37.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove Reddit Pro section](#remove-reddit-pro-section) | Removes the Reddit Pro section from the community drawer, and the Reddit Pro promos: the post creation and subreddit join upsell sheets, and the Reddit Pro banner on the profile feed. |  |
| [Remove Resources and Games on Reddit sections](#remove-resources-and-games-on-reddit-sections) | Removes the Resources and Games on Reddit sections from the community drawer. |  |

</details>

<!-- PATCHES_END -->

&nbsp;

## 🚀 Building

The Morphe patches Gradle plugin is published to GitHub Packages, so a GitHub token with
`read:packages` is required to build:

```sh
GITHUB_ACTOR=<username> GITHUB_TOKEN=<token> ./gradlew build
```

Or put `gpr.user` and `gpr.key` in `~/.gradle/gradle.properties`.

## 🧪 Testing

`./gradlew :patches:test` checks the bundle itself and runs on every pull request.

The patches only mean something against the app builds they target, so the main tests apply
them to real APKs, which are not in the repository:

```sh
./gradlew :patches:apkTest -Pmorphe.apks=instagram=<base.apk or .apkm>,reddit=<base.apk or .apkm>
```

This applies every patch for each app and fails when a patch throws, when a fingerprint
matches anything but exactly one method, or when patched code refers to a method or field
that does not exist. Add `-Pmorphe.isolated=true` to also apply each patch on its own, which
catches a patch that only works because another one was selected with it.

The patched APKs are left in `patches/build/patched`. `scripts/verify-dex.sh` runs ART's
verifier over one on a rooted emulator, which catches register and type mistakes that only
fail when the app loads the class.

## 📜 License

GNU General Public License v3.0. See [LICENSE](LICENSE).
