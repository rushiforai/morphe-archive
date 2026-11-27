# Brave Morphe Patches

A collection of [Morphe](https://github.com/MorpheApp) patches for **Brave Browser on Android** (`com.brave.browser`).

Built for **Brave v1.100.58** (`versionCode: 430005804`, Android 8.0+ / API 26+). It adds a built-in media & HLS downloader, true AMOLED black dark mode, debloating, privacy tweaks, and a few quality-of-life fixes.

---

## Included Patches (22)

### Media & Downloads
- **Media & HLS Downloader** — Adds a download button to the top toolbar that sniffs video/audio streams (MP4, WebM, M3U8/HLS, TS, fMP4, embedded iframes, YouTube progressive & adaptive HD MP4+M4A) and downloads/remuxes HLS streams in parallel in the background to MP4 (including AES-128 encrypted streams and alternate audio renditions).
- **Force Picture-in-Picture** — Strips `disablePictureInPicture` restrictions on HTML5 video elements (including inside Shadow DOM roots) so PiP stays enabled.

### UI & Usability
- **AMOLED Black Theme** — Replaces dark-gray dark mode surfaces (`#1F1F1F`) across the browser UI, omnibox, menus, and settings with pure black (`#000000`).
- **Strip Menu & Settings Bloat** — Removes Brave Wallet, Leo AI, Brave News, Brave Rewards, and VPN entries from the 3-dot menu and Settings.
- **Brave Origin** — Unlocks Brave Origin feature switches across Rewards, News, Wallet, Leo AI, and VPN.
- **Clean New Tab Page** — Forces a 4-column shortcut grid, removes sponsored NTP background ads, and disables the Brave News feed.
- **Force Copy / Paste** — Unblocks text selection, copy, cut, paste, and context menus on sites that try to disable them.
- **Close Tab In Group Order** — Selects the previous tab in the tab group when closing a tab instead of jumping forward.
- **Preserve Last Active Tab** — Stops Brave from forcing the New Tab screen after inactivity so your last tab stays open.
- **Skip Welcome Screens** — Marks first-run onboarding as completed to skip welcome prompts on fresh installs.
- **Block Popups & Ratings** — Disables the in-app rating prompt and Brave Ads signup onboarding dialogs.

### Privacy
- **Strip Tracking Parameters** — Removes marketing and analytics parameters (`utm_*`, `fbclid`, `gclid`, etc.) when copying or sharing URLs.
- **Allow Incognito Screenshots** — Removes the screenshot/recents restriction inside Incognito tabs.
- **Block Motion Sensors** — Disables Chromium's Android `PlatformSensorProvider` so pages can't read accelerometer or orientation sensors.
- **Stop Promo Notifications** — Disables Brave retention notification alarms/receivers and Chromium tips opt-in promos.

### Performance & Cleanup
- **Force Max Refresh Rate** — Locks the display mode to the highest supported refresh rate (90Hz / 120Hz / 144Hz) at native panel resolution.
- **Startup Optimization** — Skips partner customization checks on cold start and drains deferred startup listeners immediately.
- **Telemetry & Locale Trim** — Disables P3A telemetry serialization and metrics consent, and prunes unused locale resources.
- **Stop Background Wakeups** — Disables Chromium's background-sync task scheduler gate to prevent periodic background wakeups.
- **Remove Unused AR & XR** — Strips unused ARCore native libraries from the APK to cut down install size.

### Core & Cloning
- **Brave Core Infrastructure** — Shared active-tab tracking and navigation lifecycle hooks used by the other patches.
- **Clone Package & Branding** — Rewrites the manifest package name (`com.brave.browser.clone`), application label, ContentProvider authorities, and custom permissions so you can install the patched build alongside official Brave. Standalone adaptive icon source vectors live in `branding/` (not yet automatically injected into `resources.arsc`).

---

## Building from Source

You'll need **JDK 17 or 21** and an **Android SDK** (API 26+).

```bash
# Linux / macOS
./gradlew build

# Windows
.\gradlew.bat build
```

The compiled patch bundle is written to:
```
patches/build/libs/patches-1.0.0.mpp
```

To regenerate `patches-list.json` after editing patches:
```bash
./gradlew generatePatchesList
```

---

## Using in Morphe Manager (Android)

1. Open **Morphe Manager** -> **Sources** -> **+** (`Add source`).
2. Paste the repository URL:
   ```
   https://github.com/beepboopmachine/brave-patches
   ```
   Or tap the deep link: `https://morphe.software/add-source?github=beepboopmachine/brave-patches`
3. Tap **Add**. Morphe reads `patches-bundle.json` and downloads `patches-1.0.0.mpp` from GitHub Releases.

---

## Patching Brave (CLI)

1. Grab a clean **Brave Browser v1.100.58** APK/APKM (`com.brave.browser`).
2. Build `patches-1.0.0.mpp` (or download it from Releases if available).
3. Run Morphe CLI against the APK:

```bash
java -jar morphe-cli.jar patch \
  --patches patches/build/libs/patches-1.0.0.mpp \
  --out brave-patched.apk \
  base.apk
```

---

## Repo Layout

- `patches/` — Morphe patch definitions in Kotlin (`dev.brave.patches.*`)
- `extensions/` — Injected Android/Java extension code (`dev.brave.extension.*`) and Chromium compile stubs
- `branding/` — Adaptive vector launcher icons for cloned builds
- `docs/` — QA verification checklist
- `patches-list.json` — Auto-generated patch metadata

---

## License

[GPLv3](LICENSE). Not affiliated with Brave Software, Inc.
