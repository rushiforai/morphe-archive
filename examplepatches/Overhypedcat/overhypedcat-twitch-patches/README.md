# Overhypedcat Twitch Patches

Patches for the Twitch Android app, for use with [Morphe](https://morphe.software):

- **Ad blocker**: blocks stream ads the way [vaft](https://github.com/ryanbr/TwitchAdSolutions) does on desktop,
  and the ads on the main page.
- **Song removal**: takes the music a streamer plays out of the stream's sound, the way Mor Assistant does.
- **Quality unlock**: unlocks the higher qualities (1440p) Twitch offers only in some countries, through your own
  WireGuard VPN server.

## Install on the phone

1. Install Morphe 2.6.0 or newer from [morphe.software](https://morphe.software) (older versions can't load these patches).
2. Add this patch source:
   https://morphe.software/add-source?github=Overhypedcat/overhypedcat-twitch-patches
3. Patch Twitch in Morphe and install the result. Uninstall the Play Store Twitch first.

Morphe shows a banner when a new version of these patches is released.

## Switches

The three features are switched on and off in the video player's Options (the gear on the video), under
**Patches**, in every layout: portrait, horizontal full screen and the vertical view. In the vertical view the
Options sheet has a **Patches** row that opens the switches. Under each switch a line says what it is doing right
now (or what went wrong).

The app's Settings page has a **Patch settings** group with the VPN servers and Debug mode.

## Screen lock

In full screen, the player's controls have a padlock after the "fit video" button; it fades and hides with the
player's own buttons. Tapping it hides the controls at once, and touches don't bring them up again (for watching
while holding the phone loosely); it moves along when a label such as "Intended for certain audiences" shows there.
Tap three times quickly to unlock: each tap shows a padlock with the taps so far. While locked the screen stays
horizontal and in full screen however the phone is turned, with auto-rotate on or off. The back button, leaving
the app, or picture in picture unlocks too.

## Ad blocker

When Twitch stitches an ad into a live stream, the player gets the same stream requested as another player type
(popout, embed, ...) that has no ad. If every player type has the ad, the ad segments are cut out and the player
waits for live content. Twitch's ad server (`edge.ads.twitch.tv`) and tracking servers are refused inside the
app, which removes the banner and feed ads on the main page, and the ads the app plays itself are never started,
including the display ads shown beside the video in full screen.

While you watch a stream, a small label in the top left corner of the video shows each blocked ad: "Blocking ads
(360p)" while an ad in the stream is replaced (with the quality of the ad-free stream in use; during pre-rolls
often only 360p is ad-free), and briefly "Ad blocked" when an ad the app plays itself is stopped. The main page's
ads are blocked without a label.

## Song removal

Off until you switch it on, and remembered for each channel (a past broadcast has its own switch). While it is
on, the stream's sound is listened to: Shazam names the song, a clean copy is downloaded from YouTube, lined up
with the stream and subtracted live, so the streamer's voice and the game stay. The sound runs a fraction of a
second behind, and the picture is kept in step with it.

- Only the stream you watch is listened to, never the previews on the main or Following page, and it carries on
  in the mini player and picture in picture.
- When the player's controls are up, a pill beside the viewer count (in the vertical view: beside the stream's
  uptime) shows the step it is on in a few words ("Listening", "Asking Shazam", "Downloading", "Lining up",
  "Removing song", "Resting 52 s"), or what went wrong ("Shazam unreachable", "Not on YouTube").
- The line under the switch shows the same words; when something went wrong, the whole reason is written under
  them. **Retry** forgets the song and asks Shazam afresh, for when the wrong song or version was found.
- Shazam hears 5 seconds at a time: a new song is asked about the moment the last one ends, and with no music
  it asks again 8 seconds later, then rests a minute after two answers without a song.
- A live version of a song (a concert, a cover) can't be removed: only the recorded version is on YouTube.
- Songs heard before are kept on the phone (up to 1 GB, the oldest go first) and found again from 5 seconds
  of sound, without Shazam or a download.
- It works on streams with 48 kHz sound (the usual on Twitch), and needs a connection to Shazam and YouTube.

## Quality unlock

Some countries get Twitch's Enhanced Broadcasting qualities (1440p) only from elsewhere. The quality unlock asks
for each stream you open through your WireGuard VPN server as well; when that offers more, the stream plays
through the VPN, and when it doesn't, everything goes the normal way. Nothing else in the app uses the VPN.

1. Get a WireGuard config (`.conf`) from a VPN provider, for a country that gets the higher qualities.
2. Settings, Patch settings, VPN servers: **Add from file**, or copy the config's text and **Paste config**.
   Servers are tried in name order; a removed one can be put back with **Undo**.
3. Open a stream: the line under the switch says what the unlock did ("Unlocked 1440p60 through <server>",
   "<channel>'s stream has no higher quality to unlock", or what went wrong).

The VPN runs inside Twitch only (no Android VPN permission, the rest of the phone is untouched).

## Debug mode

Settings, Patch settings, Debug mode: while it is on, a window over the app shows in plain words what the patches
do as it happens (it can be moved, folded and closed), and everything, with every connection of the video player
and its timings, is written to `Downloads/TwitchMorphed-log-<date>.txt` (on Android 8 and 9:
`Android/data/tv.twitch.android.app/files/Download`). Turn it off to finish the file. Access tokens are cut from
every logged address. Send the file along when you report a problem.

## Error messages

Every failure is shown on screen with what went wrong; problems of song removal and the quality unlock also stay
on the line under their switch. When Twitch changes something and ads may get through, the app shows a short
message once per launch:

| Code | Meaning |
| --- | --- |
| E1 | Playlist has ad markers the patch does not know |
| E2 | No ad-free backup stream could be requested (token or usher API changed) |
| E3 | Playlist processing crashed (the original playlist was used), or the patches couldn't hook the video player |
| E4 | A live playlist URL the patch does not recognise |
| E5 | The client-side ad check changed, those ads may play |
| E7 | The ad label could not be shown (ads are still blocked) |

Details are in logcat under the tag `TwitchMorphed`, and in the Debug mode file.

## Development

- `extensions/twitch` - the Java code that runs inside Twitch, with unit tests
- `extensions/twitch/stub` - compile-time copies of the Amazon IVS classes it hooks
- `patches` - the Morphe bytecode patches, with unit tests

Build with `gradlew buildAndroid` (needs `GITHUB_ACTOR`/`GITHUB_TOKEN` with `read:packages`, JDK 21 and the
Android SDK); tests with `gradlew :extensions:twitch:testDebugUnitTest :patches:test`. Run `buildAndroid` last:
the test task rebuilds the patch file without the Android code Morphe needs.

To check stream ad blocking on a test device when Twitch serves no ads, `adb shell setprop debug.twitchmorphed.fake_ad 3`
makes the newest 3 segments of the watched stream look like a stitched ad (backup search, label, refresh after the
break all run for real); `0` ends it. Apps cannot set `debug.*` properties, so only adb can turn it on.

Commits to `dev` publish pre-releases, merges to `main` publish releases
([semantic commits](https://www.conventionalcommits.org): `fix:`, `feat:`, `chore:`).

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v4.3.2](https://github.com/Overhypedcat/overhypedcat-twitch-patches/releases/tag/v4.3.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>Twitch&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Package name:** `tv.twitch.android.app`

**Supported versions:**

| 31.8.0 |
| :---: |

| Patch | Description | Options |
|----------|----------------|-----------|
| [Block ad servers](#block-ad-servers) | Blocks Twitch's banner, display and feed ads (edge.ads.twitch.tv) and its tracking servers inside the app. |  |
| [Block client-side ads](#block-client-side-ads) | Makes the app treat every ad eligibility check like a Turbo viewer, so it never starts the ads it plays itself (a black screen while their ad server is blocked). |  |
| [Block stream ads](#block-stream-ads) | Replaces ad-laden live playlists with ad-free ones from other player types, and strips ad segments when no clean playlist exists. |  |
| [Highest quality](#highest-quality) | Adds a Highest quality switch to the video player's Options: with it on, every stream starts at its highest quality instead of Auto. A quality chosen afterwards stays as chosen. |  |
| [Patch settings](#patch-settings) | Adds a Patch settings group to the app's Settings (VPN servers for the quality unlock, and Debug mode: a live log window and a log file in Downloads), and the patches' switches to the video player's Options. |  |
| [Patch switches in the vertical view](#patch-switches-in-the-vertical-view) | Adds a Patches row to the video player's Options in the vertical view, which opens the patches' switches (the vertical view's Options can't hold them itself). |  |
| [Quality unlock](#quality-unlock) | Unlocks the higher qualities (1440p) Twitch offers only in some countries: a stream's playlist is also asked for through your WireGuard VPN server, and when it offers more, that stream plays through the VPN. Nothing else in the app uses it. Servers are added in Settings, Patch settings. |  |
| [Song removal](#song-removal) | Takes the songs a streamer plays out of the stream's sound (Shazam names the song, its clean copy comes from YouTube, and it is subtracted live). Switched on and off in the video player's Options. |  |

</details>

<!-- PATCHES_END -->
