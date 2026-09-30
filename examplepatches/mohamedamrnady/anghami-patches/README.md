# 🎵 Anghami patches by Nady

Morphe patches for [Anghami](https://play.google.com/store/apps/details?id=com.anghami) (`com.anghami`).

## ❓ About

Client-side patches for Anghami **8.0.28** (versionCode `8000280`, APKM) that relax
locally-enforced gates: Plus checks, playback/download restrictions, forced shuffle,
upgrade upsell UI, in-house ads, and Gold-gated rows. Everything here hooks **local
boolean gates** — stream/download URLs, audio quality authorization, and plan data
from `/authenticate` remain server-enforced, so anything the server refuses still
fails after patching.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=mohamedamrnady/anghami-patches

Then in Morphe Manager (Expert Mode): pick the stock `base.apk` + matching
`arm64_v8a` + dpi splits (or a merged APK), select the patches below, and install.
All patches are enabled by default (`default=true`) — disable any you don't need.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/mohamedamrnady/anghami-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;17 patches total
<details open>
<summary>📦 Anghami&nbsp;&nbsp;•&nbsp;&nbsp;17 patches</summary>
<br>

**🎯 Supported versions:**

| 8.0.28 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable audio ads](#disable-audio-ads) | Forces AdSettings.noAd=true and PlayQueue.getDisableAds=true so songs are treated as ad-free locally. Client flag only. |  |
| [Hide Gold features](#hide-gold-features) | Forces Account.isGold/isGoldUser and all GoldUtilsKt.isGold overloads to false. Hides server-gated Gold UI instead of spoofing it. |  |
| [Hide shuffle badges](#hide-shuffle-badges) | Hides PLAYS IN SHUFFLE badges on playlist/album headers, feed cards, and rows. Cosmetic only. |  |
| [Hide upgrade upsell](#hide-upgrade-upsell) | Hides the nav upgrade entry, header promo banner, feed upsell cards and AI MIX button model (gap-free), and settings subscribe banner. Server-driven UI the Plus spoof cannot remove. |  |
| [Hide upsell feature buttons](#hide-upsell-feature-buttons) | Hides TRY SING ALONG karaoke upsell, the player AI MIX switch, and the playlist AI MIX button. Feature gates untouched. |  |
| [Monet dynamic colors](#monet-dynamic-colors) | Replaces the static neon brand accents with wallpaper-based Monet dynamic colors (M3 Expressive primary/secondary/tertiary roles) on Android 12+. Older versions keep stock colors. |  |
| [Player theme background](#player-theme-background) | Makes the player background, text, icons and seekbar follow the app's day/night theme. Keeps the darker split below the progress bar. Pair with 'Player: remove cover-art tint'. |  |
| [Player: accent action icons](#player-accent-action-icons) | Paints the share button with the normal theme text color (black day / white night) and keeps the like/download lotties on the primary accent (pink day / lime night, Monet dynamic) across animation swaps. |  |
| [Player: accent now-playing + pills](#player-accent-now-playing-pills) | Paints the now-playing queue row with the primary accent (pink day / lime night stock, Monet dynamic). Shuffle/enhance/save pills and unselected rows stay on theme text. Removes the grey highlight wash. |  |
| [Player: readable queue in day mode](#player-readable-queue-in-day-mode) | Keeps the player queue rows in theme text colors in day mode instead of unreadable white-on-light. Night mode is unchanged. |  |
| [Player: remove cover-art tint](#player-remove-cover-art-tint) | Stops the player background from being tinted by the current album cover, in both day and night mode. |  |
| [Remove popup promos](#remove-popup-promos) | No-ops the in-house popup funnel, the fullscreen startup dialog, and the flyer ad callback. Google SDK ads untouched. |  |
| [Spoof stock app signature](#spoof-stock-app-signature) | Forces SignatureUtils.getAppSignature to hash with the stock cert prefix (he9B...kw=), so X-ANGH-APP-RGSIG matches a stock install. Salt/body hashing unchanged. |  |
| [Unforce shuffle](#unforce-shuffle) | No-ops PlayQueue.shuffle(), forces server shuffleOn=false at both sync points, disables the pick-a-song radio redirect, enables shuffle buttons, and disarms the shuffle upsell dialog. Manual shuffle toggle keeps working. |  |
| [Unlock downloads](#unlock-downloads) | No-ops download limit asserts, forces limited-plan=false and large offline caps (999999). Local gates only; the server still authorizes files. |  |
| [Unlock local Plus](#unlock-local-plus) | Forces Account.isPlus/isPlusUser=true, enablePlayerRestrictions=false, canPlayOfflineAndFree=true. Local UI/gating only; server premium checks remain. |  |
| [Unlock playback limits](#unlock-playback-limits) | Disables skip and queue limits (skipLimitReached/queueRestrictionsEnabled=false, disable-flags=true). Local gates only. |  |

</details>

<!-- PATCHES_END -->

### 🎯 Compatibility

| App | Package | Version | File type |
|-----|---------|---------|-----------|
| Anghami | `com.anghami` | 8.0.28 (8000280, all ABIs) | APKM |

Fingerprints pin 8.0.28 method shapes — re-verify them against a fresh decode
before using these patches on any other app version.

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
  (needs JDK 17+ and a GitHub PAT with `read:packages`, e.g. via `GITHUB_ACTOR` / `GITHUB_TOKEN`, for the Morphe registry)
- The built patches `.mpp` file is found in `patches/build/libs/patches-*.mpp`
- Apply the `.mpp` with [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## ⚠️ Disclaimer

For research and interoperability purposes. Spoofing entitlement on a commercial
streaming service can violate its Terms of Service — use a throwaway account,
expect server-gated features (full lyrics, high-quality streams, downloads) to
keep failing, and do not redistribute patched APKs as "Premium Unlocked".

## 📜 License

Anghami patches by Nady are licensed under the [GNU General Public License v3.0](LICENSE)
