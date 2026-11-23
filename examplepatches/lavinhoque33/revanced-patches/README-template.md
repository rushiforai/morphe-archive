<div align="center"> 
<img src="assets/rvx-logo.png" alt="RVX logo" width="128">

## 🧩 ReVanced Extended Patches
[![Static Badge](https://img.shields.io/badge/RVX_Wiki-gray?logo=github)](https://github.com/anddea/revanced-patches/wiki)   [![Static Badge](https://img.shields.io/badge/Translations-gray?logo=crowdin)](https://rvxtranslate.vercel.app/)
<br>
[![Static Badge](https://img.shields.io/badge/Telegram-Community-gray?logo=telegram&color=%2326A5E4)](https://t.me/AnddeaChat)   [![Static Badge](https://img.shields.io/badge/Reddit-YTAdvanced-gray?logo=reddit&color=red)](https://www.reddit.com/r/YTadvanced)
</div>

<!-- modified by lavinhoque33, 2026-11-10: Morphe Manager stable and dev source instructions. -->
## Morphe Manager

### Stable builds

To add this fork as an updatable patch source:

1. Open **Sources** on Morphe Manager's home screen, tap **+**, and choose **Remote**.
2. Paste this patch source URL:

   ```text
   https://raw.githubusercontent.com/lavinhoque33/revanced-patches/rvx-latest/patches-bundle.json
   ```

3. Tap **Add**. The source appears as **RVX Patches**.
4. When patching YouTube or YouTube Music, select this source. Do not combine its patches with Morphe's
   patches for the same app.

Use the source's **Update** button to fetch newer bundles, then patch and install the app again.
Updating the source alone does not update an installed app.

Use the full URL above. A bare repository link resolves to upstream metadata on `main`. If Manager 2.7.x
shows v4.3.0 release notes for RVX, add the URL above as a separate source and select it instead. The older
`refs/heads/rvx-latest` URL still downloads the right bundle, but Manager reads the wrong changelog.

### Dev builds (prereleases)

For dev builds, add this URL as a **second source** using **Sources > + > Remote**:

```text
https://raw.githubusercontent.com/lavinhoque33/revanced-patches/rvx-dev/patches-bundle.json
```

Select the dev source instead of the stable source when patching if you want dev builds.
Do not combine the two sources' patches for the same app.

Manager's own **Pre-release patches** switch does not appear for this source. The dev feed is a separate
source, not a switch on the stable source.

These bundles declare **YouTube 21.45.90** and **YouTube Music 9.45.51** as experimental app targets.
Manager's **Experimental app versions** switch is available for this source. Suggested versions remain
**YouTube 21.39.525** and **YouTube Music 9.40.51**.
If a download search offers `21.45.90-EXTENDED`, choose the plain `21.45.90` APK instead. The two
manifest versions are different; do not override the compatibility warning.

You can also download a `.mpp` from a release and import it via **Sources > + > Local**.
Local imports do not update automatically; import the new `.mpp` for each update.

## 📋 List of patches in this repository

{{ table }}
