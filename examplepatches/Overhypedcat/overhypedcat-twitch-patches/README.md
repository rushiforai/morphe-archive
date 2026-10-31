# Overhypedcat Twitch Patches

Patches for the Twitch Android app, for use with [Morphe](https://morphe.software).

Blocks stream ads the way [vaft](https://github.com/ryanbr/TwitchAdSolutions) does on desktop: when Twitch
stitches an ad into a live stream, the player gets the same stream requested as another player type
(popout, embed, ...) that has no ad. If every player type has the ad, the ad segments are cut out
and the player waits for live content.

## Install on the phone

1. Install Morphe from [morphe.software](https://morphe.software).
2. Add this patch source:
   https://morphe.software/add-source?github=Overhypedcat/overhypedcat-twitch-patches
3. Patch Twitch in Morphe and install the result. Uninstall the Play Store Twitch first.

Morphe shows a banner when a new version of these patches is released.

## Error codes

While an ad break is being blocked, a small "Blocking ads" label shows in the top left corner, with the
quality of the ad-free stream in use, for example "Blocking ads (360p)". During pre-rolls often only the
360p stream is ad-free; the original quality returns when the break ends.

When Twitch changes something and ads may get through, the app shows a short message once per launch:

| Code | Meaning |
| --- | --- |
| E1 | Playlist has ad markers the patch does not know |
| E2 | No ad-free backup stream could be requested (token or usher API changed) |
| E3 | Playlist processing crashed, the original playlist was used |
| E4 | A live playlist URL the patch does not recognise |

Details are in logcat under the tag `TwitchMorphed`.

## Block ad servers

Banner, display and in-feed ads come from Twitch's own ad server (`edge.ads.twitch.tv`). This patch
refuses it and Twitch's tracking servers inside the app; everything else connects as usual.

## Detailed log

Settings, Preferences, Detailed log: while it is on, everything the ad blocker does and every connection
of the video player (with timings) is written to `Downloads/TwitchMorphed-log-<date>.txt`. Turn it off
to finish the file. Access tokens are cut from every logged URL.

## Development

- `extensions/twitch` - the Java code that runs inside Twitch, with unit tests
- `extensions/twitch/stub` - compile-time copies of the Amazon IVS classes it hooks
- `patches` - the Morphe bytecode patch

Commits to `dev` publish pre-releases, merges to `main` publish releases
([semantic commits](https://www.conventionalcommits.org): `fix:`, `feat:`, `chore:`).

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v2.0.0](https://github.com/Overhypedcat/overhypedcat-twitch-patches/releases/tag/v2.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>Twitch&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `tv.twitch.android.app`

**Supported versions:**

| 31.8.0 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Block ad servers](#block-ad-servers) | Blocks Twitch's banner, display and feed ads (edge.ads.twitch.tv) and its tracking servers inside the app. |  |
| [Block stream ads](#block-stream-ads) | Replaces ad-laden live playlists with ad-free ones from other player types, and strips ad segments when no clean playlist exists. |  |
| [Detailed log setting](#detailed-log-setting) | Adds a Detailed log switch to Settings, Preferences. While it is on, a detailed log of the ad blocker and the video player's connections is written to Downloads. |  |

</details>

<!-- PATCHES_END -->
