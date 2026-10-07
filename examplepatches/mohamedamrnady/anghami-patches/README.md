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

Then in Morphe Manager (Expert Mode): pick the stock `the-stock-apk` + matching
`arm64_v8a` + dpi splits (or a merged APK), select the patches below, and install.
All patches are enabled by default (`default=true`) — disable any you don't need.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/mohamedamrnady/anghami-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;18 patches total
<details open>
<summary>📦 Anghami&nbsp;&nbsp;•&nbsp;&nbsp;18 patches</summary>
<br>

**🎯 Supported versions:**

| 8.0.28 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED black background](#amoled-black-background) | Forces pure-black app background in dark mode (window_background_color -> #000000). Surfaces/cards keep stock greys; light mode untouched. |  |
| [Disable audio ads](#disable-audio-ads) | Forces AdSettings.noAd=true and PlayQueue.getDisableAds=true so songs are treated as ad-free locally. Client flag only. |  |
| [Header Play + Shuffle](#header-play-shuffle) | Playlist/album headers show Play + Shuffle instead of Shuffle + Edit/Follow/Like (functional LEAVECOLLAB, local-songs ADD_MORE and podcasts untouched). Pulls in 'Unforce shuffle'. |  |
| [Hide Gold features](#hide-gold-features) | Forces Account.isGold/isGoldUser and all GoldUtilsKt.isGold overloads to false. Hides server-gated Gold UI instead of spoofing it. |  |
| [Hide shuffle badges](#hide-shuffle-badges) | Hides PLAYS IN SHUFFLE badges on playlist/album headers, feed cards, and rows. Cosmetic only. |  |
| [Hide upgrade upsell](#hide-upgrade-upsell) | Hides the nav upgrade entry, header promo banner, feed upsell cards and AI MIX button model (gap-free), and settings subscribe banner. Server-driven UI the Plus spoof cannot remove. |  |
| [Hide upsell feature buttons](#hide-upsell-feature-buttons) | Hides TRY SING ALONG karaoke upsell, disables the karaoke feature itself, and hides the player/playlist AI MIX buttons. Feature UI stays hidden rather than paywalled. |  |
| [LRCLIB lyrics fallback](#lrclib-lyrics-fallback) | When the server returns truncated/empty lyrics, fetches the full text from LRCLIB (opt-in free source) into a separate cache. Native full lyrics and the Plus path are untouched. |  |
| [Lyrics options on play long-press](#lyrics-options-on-play-long-press) | Long-press play/pause for lyrics options (retry, LRCLIB search, synced/plain toggle, server version) instead of the sleep timer. Pulls in 'LRCLIB lyrics fallback'. |  |
| [Monet dynamic colors](#monet-dynamic-colors) | Replaces the static neon brand accents with wallpaper-based Monet dynamic colors (M3 Expressive primary/secondary/tertiary roles) on Android 12+. Older versions keep stock colors. |  |
| [Player theme](#player-theme) | Night-only player theme: removes the cover-art tint and paints the now-playing row, pills and action icons with the primary accent at night; day mode keeps the stock tinted player. Pulls in 'Player theme background' resources. |  |
| [Player theme background](#player-theme-background) | Makes the player background, text, icons and seekbar follow the app's day/night theme. Keeps the darker split below the progress bar. Pair with 'Player theme'. |  |
| [Remove popup promos](#remove-popup-promos) | No-ops the in-house popup funnel, the fullscreen startup dialog, and the flyer ad callback. Google SDK ads untouched. |  |
| [Spoof stock app signature](#spoof-stock-app-signature) | Forces SignatureUtils.getAppSignature to hash with the stock cert prefix (he9B...kw=), so X-ANGH-APP-RGSIG matches a stock install. Salt/body hashing unchanged. |  |
| [Unforce shuffle](#unforce-shuffle) | Forces server shuffleOn=false at both sync points, never reports shuffle to the server, disables the pick-a-song radio redirect, enables shuffle buttons, and disarms the shuffle upsell dialog. Manual shuffle toggle and the header Shuffle button keep working. |  |
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

## AI Disclousre and Contribution

The code in this repo is written using Frontier LLMs, planned and stress-tested by a human. Feel free to report bugs, request features and open pull requests within the acceptable scope of Morphe and ToS of Anghami.

## 📜 License

Anghami patches by Nady are licensed under the [GNU General Public License v3.0](LICENSE)

anghami-patches is an independent project and is not affiliated with Anghami. Anghami is a trademark of Anghami Inc.
