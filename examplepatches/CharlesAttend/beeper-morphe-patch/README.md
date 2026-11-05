# Beeper patches for Morphe

Patches for the [Beeper](https://play.google.com/store/apps/details?id=com.beeper.android) Android app (`com.beeper.android`), for use with [Morphe](https://morphe.software).

## How to use these patches

Click the button below, or add this repository URL to Morphe Manager manually: https://github.com/CharlesAttend/beeper-morphe-patch

<a href="https://morphe.software/add-source?github=CharlesAttend/beeper-morphe-patch">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/CharlesAttend/beeper-morphe-patch/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Beeper&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.beeper.android`

**🎯 Supported versions:**

| 4.61.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide transcribe button](#hide-transcribe-button) | Hides the transcribe button below voice messages in chats. Existing transcriptions and auto-transcribe are not changed. |  |
| [Inbox order option](#inbox-order-option) | Adds an "Oldest first" item to the menu of the inbox title. When it is on, the main inbox shows the oldest chats first. Pinned chats and the other spaces keep their order. |  |

</details>

<!-- PATCHES_END -->

## Development

1. Set up a GitHub personal access token with the `read:packages` scope, as the
   [patcher setup guide](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment) describes.
   The Morphe libraries come from GitHub Packages.
2. Build the patch bundle with `./gradlew :patches:buildAndroid`.
   The bundle is at `patches/build/libs/patches-*.mpp`.
3. Apply the bundle with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop), or load it in Morphe Manager.

Releases are made by `release.yml` with semantic-release. Use [conventional commit](https://www.conventionalcommits.org) messages:
`feat:` and `fix:` make a new release, and `chore:` does not.

This project is based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).
It is not part of the Morphe project.
