# Brave patches (experimental and incomplete)

These local, opt-in patches target `com.brave.browser` version **1.98.63**,
the version targeted by the reference project. This is a provisional target,
not a claim that this bundle has been tested with that APK. We could not access
the official release APK in this environment and have not patched it or tested
on an Android device. Do not use this on a primary browser installation until
it has been validated. Back up data first; installation of a re-signed APK may
require uninstalling Brave and will not preserve its app data automatically.
The reference project supports the standalone ARM64 and ARM32 APKs, not universal
builds. Release assets:
[ARM64](https://github.com/brave/brave-browser/releases/download/v1.98.63/BraveMonoarm64.apk),
[ARM32](https://github.com/brave/brave-browser/releases/download/v1.98.63/BraveMonoarm.apk).

The stock APK stores its native libraries uncompressed at 16 KB zip offsets
(`android:extractNativeLibs="false"`); the patcher re-creates the APK with the
libraries at 4 KB offsets, which 16 KB page-size devices cannot map. Every
Brave patch in this bundle therefore depends on an internal compatibility patch
that enforces `android:extractNativeLibs="true"` in the manifest (libraries are
extracted to disk at install time instead of mapped from the APK). This fixes
the `INSTALL_FAILED_NO_MATCHING_ABIS: Failed to extract native libraries,
res=-113` install failure on Android 15/16 16 KB devices (including the
realme RMX5110). It is harmless on 4 KB devices. Installation is expected to
work from v2.2.6 onward; startup on those devices remains unverified.

### Install troubleshooting

- **`INSTALL_FAILED_NO_MATCHING_ABIS … res=-113`** — you patched an older
  bundle, or the extraction compatibility patch did not run. Re-patch with a
  bundle that includes it (v2.2.6+); any Brave patch selection is sufficient,
  because the fix rides along as a dependency.
- Use the **standalone ARM64 APK** (`BraveMonoarm64.apk`) on arm64 devices
  (and `BraveMonoarm.apk` on arm32-only devices). Universal or
  split-build APKs are unsupported.

## Implemented so far

The app target is marked experimental; Morphe may require enabling experimental
app versions (and, for a remote source, its pre-release patches setting) before
it is shown. This affects source channel selection, so return the toggle to stable
if you do not want pre-releases.

All patches below default **off**. The bytecode patches throw when their required
fingerprint (or every optional alternative in a group) is absent. A successful
patch operation does not prove that the modified path is exercised or that it
covers every equivalent path.

- **Block Motion Sensors**: disables known Chromium sensor availability/creation
  entry points. May also disable ambient sensors; a surviving alternative path
  could still expose sensors. The provider object itself is not replaced with null.
- **Stop Text Sharing with System**: disables the known Chromium onscreen content
  capture gate, not clipboard, accessibility or all other text-sharing paths.
- **Block Popups & Ratings**: disables the identified rating and Ads signup
  eligibility gates if present; other promos and dialogs can remain.
- **Stop Promo Notifications**: disables identified tips scheduling and retention
  receiver entry points if present. Other promo notification paths can remain.
- **Skip Welcome Screens**: forces the identified first-run completion check.
  Setup, consent or search-provider choices may be skipped; use with caution.
- **Stop Background Wakeups**: forces the identified background-sync disable
  check; this can break site background sync and cannot stop all wakeups.
- **Preserve last active tab**: disables the identified inactivity opening-screen
  override. It is deliberately *not* called “Keep All Tabs Loaded”: that hook
  does not stop Android/Chromium from unloading tabs under memory pressure.
- **Remove Extra Languages**: option `Languages to keep`; English is always kept.
  A selected language retains all its regions. Only larger, non-gender-variant
  `assets/locales/*.pak` files are replaced with the English PAK, not deleted;
  Android resources, small PAKs and gender variants remain. Missing/empty English
  fallback fails the patch before rewriting files. Runtime locale fallback is
  unverified.
- **Remove Unused AI & VPN**: stubs (zeroes, keeps the zip entry) the unused
  AR/XR native libraries — the Impress renderer, androidx.xr OpenXR and ARCore
  libraries — for arm64-v8a and armeabi-v7a to shrink the APK. The name says
  "AI" but the bloat is AR/XR; the two are not interchangeable. Option
  `Remove VPN library` (default off) additionally stubs the WireGuard backend
  (`libwg-go.so`), which disables Brave VPN. Native stubbing can break browser
  features; unverified on device.
- **Block Telemetry**: strips the Play install-referrer permission from the
  manifest, redirects the identified analytics, crash-upload and experiment
  endpoints (P3A `star-randsrv`/`collector.bsg`, `usage-ping`, WDP `patterns`/
  `collector`/`star`/`quorum`, `cr.brave.com`, `crashpad.chromium.org`,
  `variations.brave.com`) to `0.0.0.0` by patching `libchrome.so` at fixed,
  pre-validated byte offsets for Brave v1.98.63 — the patch aborts before
  writing anything if the expected bytes are not where they are pinned, it
  never writes blindly — and rewrites the shopping-offers host literals in code.
  Option `Block offers server` (default **on**) gates that last part — turn it
  off to keep the offers host reachable. Only the identified endpoints are
  touched; others can remain. Off by default; unverified on device.
- **Clean New Tab**: forces the sponsored news/stats preference defaults off at
  runtime (NTP gate preference getters and listeners) and neutralizes the
  NTP layout-initialization path so the sponsored surfaces do not render.
  Option `Hide shortcut tiles` (default off) additionally forces the
  most-visited tiles list off. App-side extension code is required and is
  shipped inside the bundle's extension. Off by default; unverified on device.
- **Close Tab In Group Order**: when the active tab is closed, preselects its
  predecessor in the same tab group instead of letting the stock selection
  policy jump anywhere. Bulk closes, closing a non-selected tab, single-tab
  groups and session restores fall back to stock behavior. Off by default;
  unverified on device.
- **Brave Origin**: turns the Brave Origin feature switches (Rewards, News,
  Wallet, VPN, Leo AI) on by default at the Android resource layer and
  neutralizes the identified policy gatekeepers and the Leo AI feature flag in
  bytecode so the switches stick. The interactive Origin settings page still
  exists; this removes the policy friction, not the page. Off by default;
  unverified on device.
- **Custom Brave theme**: rewrites the dark palette colors, Android system
  Material You role colors (`values-v31+`), tonal `lStar` luminance selectors,
  and vector drawable background fills to custom colors, and can force OLED
  black chrome. Thirteen options; colors are plain opaque hex strings in
  `#rgb`, `#rrggbb` form (this bundle's patcher has no color-picker option, so
  there is no swatch UI). Defaults: pure OLED black backgrounds (`#000000`),
  Brave light slate ink (`#f0f2ff`), Brave purple-blue accent (`#737ade`),
  `Disable Material You dynamic colors` on, `Surfaces use background color` on
  (two-tier mode off by default). Unverified on device.

## Not implemented

Custom NTP wallpaper; Keep All Tabs Loaded. Both require additional work and
actual-APK validation.

## Validation and licensing

`./gradlew :patches:testBravePrivacy` runs synthetic DEX round-trip checks for
the injected return helpers and locale-selection tests. It does not run the
fingerprints against Brave or establish ART/runtime behavior.

The Brave target fingerprints, the locale fallback approach, and the six
patches added in this bundle (Remove Unused AI & VPN, Block Telemetry, Clean
New Tab, Close Tab In Group Order, Brave Origin, Custom Brave theme) were
adapted from [kveld9/kveld-morphe-patches](https://github.com/kveld9/kveld-morphe-patches),
revision `8afd78f0b57964b9ae9a0a387bdd4ae157345707`, GPL-3.0. The Brave patch
source files and the project as a whole are GPL-3.0-only; see
`LICENSES/GPL-3.0.txt`. This note is not a substitute for the full license or
the third-party attribution notices.
