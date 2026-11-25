<div align="center"> 
<img src="assets/rvx-logo.png" alt="RVX logo" width="128">

## 🧩 ReVanced Extended Patches
[![Static Badge](https://img.shields.io/badge/RVX_Wiki-gray?logo=github)](https://github.com/anddea/revanced-patches/wiki)   [![Static Badge](https://img.shields.io/badge/Translations-gray?logo=crowdin)](https://rvxtranslate.vercel.app/)
<br>
[![Static Badge](https://img.shields.io/badge/Telegram-Community-gray?logo=telegram&color=%2326A5E4)](https://t.me/AnddeaChat)   [![Static Badge](https://img.shields.io/badge/Reddit-YTAdvanced-gray?logo=reddit&color=red)](https://www.reddit.com/r/YTadvanced)
</div>

<!-- modified by lavinhoque33, 2026-11-25: shared Manager source instructions. -->
## Patch Managers

Add this repository as one remote patch source:

```text
https://github.com/lavinhoque33/revanced-patches
```

### Morphe Manager

1. Open **Sources**, tap **+**, paste the repository URL into **Source URL**, and tap **Add**.
2. Leave **Pre-release patches** off on the RVX source for stable releases. Turn it on to
   follow the newest bundle from either channel. You do not need a second source.
3. Select **RVX Patches** when patching YouTube or YouTube Music. Do not combine it with
   another patch source for the same app.

The existing [stable](https://raw.githubusercontent.com/lavinhoque33/revanced-patches/rvx-latest/patches-bundle.json)
and [dev](https://raw.githubusercontent.com/lavinhoque33/revanced-patches/rvx-dev/patches-bundle.json)
JSON links still work as separate, fixed-channel sources in Morphe Manager. To use the
channel switch, add the repository URL above and select that source instead.

Both bundles declare **YouTube 21.45.90** and **YouTube Music 9.45.51** as experimental app
targets. On the repository source, Morphe offers **Experimental app versions** when
**Pre-release patches** is on. Suggested versions remain **YouTube 21.39.525** and
**YouTube Music 9.40.51**. If a download search offers `21.45.90-EXTENDED`, choose plain
`21.45.90`; the APK manifest versions differ.

### UP Manager

Open **Patch Bundles → Add**, then enter the same repository URL. In the bundle settings,
leave **Use latest** and **Use pre-releases** off for stable. Enable **Use latest** to
follow the most recently published stable or dev release. **Use pre-releases** by itself
follows dev releases only.

Published patch bundles reach the Manager feeds automatically. To use an update, refresh the
source, then repatch and reinstall your app. Refreshing a source alone does not update installed apps.
For a local import in Morphe Manager, open **Sources → + → Select patch source files** and choose the `.mpp`.
Local sources must be updated manually.

<!--
Fork release maintenance: attach patches-<version>.mpp before publishing vX.Y.Z (stable) or vX.Y.Z-dev.N (prerelease).
Sync Manager feeds runs on publication and checks again every 30 minutes. It mirrors GitHub Latest to main/rvx-latest
and the newest higher-version prerelease, or stable if none is newer, to dev/rvx-dev.
Use Actions > Sync Manager feeds > Run workflow on rvx-latest to sync on demand.
main/dev are Manager metadata mirrors, not source or release build branches.
-->

## 📋 List of patches in this repository

{{ table }}
