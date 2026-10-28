<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/readme-hero.png">
    <img src="assets/readme-hero-light.png" width="800" alt="Lurk: Morphe privacy patches for Twitch, Kick and Rumble. Watch the stream. Skip the tracking.">
  </picture>
</p>

<p align="center">
  <a href="https://morphe.software/add-source?github=jordanwoodson/lurk-morphe-patches&name=Lurk"><img src="https://img.shields.io/badge/Add_to_Morphe-39F8AE?style=for-the-badge&logo=android&logoColor=080D1B" alt="Add to Morphe"></a>
</p>

<p align="center">
  <a href="https://github.com/jordanwoodson/lurk-morphe-patches/releases/latest"><img src="https://img.shields.io/github/v/release/jordanwoodson/lurk-morphe-patches?label=release&color=39F8AE" alt="Latest release"></a>
  <a href="https://github.com/jordanwoodson/lurk-morphe-patches/actions/workflows/release.yml"><img src="https://img.shields.io/github/actions/workflow/status/jordanwoodson/lurk-morphe-patches/release.yml?branch=main&label=build" alt="Build"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL--3.0-blue" alt="License GPL-3.0"></a>
</p>

<p align="center">
  <a href="#install">Install</a> &nbsp;•&nbsp;
  <a href="#lurk-settings">Lurk settings</a> &nbsp;•&nbsp;
  <a href="#patches">Patches</a> &nbsp;•&nbsp;
  <a href="#screenshots">Screenshots</a> &nbsp;•&nbsp;
  <a href="#faq">FAQ</a> &nbsp;•&nbsp;
  <a href="#reporting-problems">Reporting problems</a> &nbsp;•&nbsp;
  <a href="#contributing">Contributing</a>
</p>

Lurk is a set of privacy-focused patches for Twitch, Kick and Rumble, applied on your phone with
[Morphe](https://morphe.software). The patches stop analytics and tracker SDKs, block ad requests,
clean shared links, and add what the apps leave out: third-party emotes, chat timestamps, a sleep
timer, background audio and more. Everything runs on the phone; nothing goes through a server of ours.

What Lurk does that other Morphe patch bundles don't (as of October 2026):

- **Twitch ad breaks avoided without a proxy.** When Twitch's server stitches an ad break into a live
  stream, *Avoid stitched ads* plays the stream from an ad-free picture-by-picture session, at 360p at
  most, until the break is over, then goes back to your quality. When no such session is available,
  *Mute stitched ads* mutes the break and covers it.
- **Kick, with 26 patches**: its analytics off, 7TV emotes in chat and the emote picker, background
  audio, a sleep timer, a quieter chat and Home. Other bundles go no further than a Kick theme.
- **Rumble Premium and ad blocking.** *Unlock Premium* turns on Rumble's local premium state (ad-free
  playback, no upsells) once you sign in; *Block ads* stops the app requesting ads, signed in or not.
- **Switches in the app.** Every patch that changes how an app behaves has its own setting on a Lurk
  settings screen inside the patched app, so you can turn it off and on again without patching again.

Each patch's description says what it does and what it doesn't, and the [app pages](docs/README.md)
say what each one sends where. Lurk has no connection to Twitch, Kick, Rumble or the Morphe
project. The name "Morphe" is used only to say what the patches are for (see [NOTICE](NOTICE)).

## Install

1. Install [Morphe Manager](https://morphe.software) on your Android phone.
2. Tap **Add to Morphe** above on the phone. On a computer the link shows a QR code to scan with
   the phone. Manager adds Lurk as a patch source.
3. In Manager, pick Twitch, Kick or Rumble, download the version Lurk supports (Manager links to
   APKMirror or Uptodown for it; on APKMirror, take the variant listed below), choose the patches you
   want and patch. Manager installs the result.

Lurk is tested on these APKMirror variants. Other variants of the same version may fail to patch or
to install, so take these:

- **Twitch 31.7.0**: the [arm64-v8a bundle, 480-640dpi, Android 10+](https://www.apkmirror.com/apk/twitch-interactive-inc/twitch/twitch-live-streaming-31-7-0-release/twitch-live-streaming-31-7-0-4-android-apk-download/).
- **Kick 40.32.5**: the arm64-v8a bundle, 480-640dpi, Android 10+, on the
  [40.32.5 release page](https://www.apkmirror.com/apk/kick-live-streaming/kick-live-streaming/kick-live-streaming-40-32-5-release/)
  (not one of the two universal builds).
- **Rumble 3.21.0**: the universal bundle (all four architectures, 120-640dpi, Android 8.0+) on the
  [3.21.0 release page](https://www.apkmirror.com/apk/rumble-inc/rumble/rumble-stream-watch-videos-3-21-0-release/).

> [!IMPORTANT]
> **Keep your signing key.** Manager signs every app it patches with a key it creates on first use,
> and Android only installs an update over an app signed with the same key. Export the key in Morphe
> Manager under **Settings › System › Import & export › Signing key** and keep the file somewhere
> safe. After reinstalling Manager or moving to a new phone, import it before you patch: without it,
> updating a patched app means uninstalling it first, which deletes its data.

Releases from the `dev` branch are pre-releases: turn on pre-releases for this source in Manager
to get new patches early. Patch updates with the same Manager install (or the same imported key)
you patched with the first time.

Patches are written for one version of each app and refuse to apply to others. When an app
updates, wait for a Lurk release that lists the new version.

## Lurk settings

Patched apps get a **Lurk** settings screen that turns included patches off and on without
patching again. Ways in:

- **Inside the app**: Twitch's Settings › **Lurk**, after Privacy Notice (signed out, Settings is
  the gear on the Log In tab). Rumble's Settings › App info › **Lurk**. Kick's account menu (tap
  your profile picture) › **Lurk**, from the Lurk in account menu patch; signed out, Kick has no
  such menu, so use one of the ways below.
- **Long-press the app icon** › **Lurk settings**. Lurk puts this shortcut back at the top every
  time the app starts, so the app's own shortcuts can't push it off the menu. Some launchers show
  no app shortcuts at all.
- **Android's App info page** for the app (long-press the icon › App info, or Settings › Apps) ›
  **Additional settings in the app** (on some phones a gear icon).

The screen has:

- **Search** across every setting, with switches you can flip right in the results.
- **Pause Lurk**: every switch off from the next start, to see whether Lurk causes a problem. Your
  settings are kept, and lockout protection (Block update prompts, Kick's Lurk row) stays on. If
  the app stops three times in a row within a minute of starting, Lurk pauses itself and says so
  on the screen.
- **Restart** bar: settings the app reads at startup (Kick's and Twitch's JavaScript ones, for
  example) apply after a restart, which the bar at the top does for you.
- **Export settings** and **Import settings**: a JSON file through the system file picker.
  Importing lists what would change before anything is applied.
- **Report a problem**: opens the GitHub bug report with the app, its version, the Lurk version and
  which switches are on filled in. Nothing is sent until you submit it; word and user lists are
  never included.
- **Debug logging** (Advanced, off by default): detailed lines for bug reports, read with
  `adb logcat -s lurk`.

If the settings can't be read, every patch is off and the screen says so. See the
[Kick notes](docs/kick.md) for the experimental VOD option and the [Twitch notes](docs/twitch.md)
for coverage and testing limits.

## Patches

A few patches per app to start with; the full list for each app is below them (tap an app to open it).
Patches marked *off* aren't selected in Manager until you select them. Some selected patches add a
switch that starts off; the full list says which, and where to turn it on.

**Twitch**

| Patch | What it does |
|---|---|
| Avoid stitched ads | During an ad break Twitch's server stitches into a live stream, plays an ad-free picture-by-picture session (360p at most), then returns to the stream's own quality. No proxy, and the player doesn't reload. |
| Mute stitched ads | Mutes an ad break that still plays and covers it with black until the stream is back. |
| Block client ads, Block display ads | Decline the ads the app asks for itself: display and audio ads, ad pods, feed ads, the Following headliner and brand surveys. |
| Third-party emotes, Third-party badges | 7TV, BetterTTV and FrankerFaceZ emotes in chat, chat history and VOD replay, plus FrankerFaceZ and Chatterino badges and pronouns. Each service has its own switch, off until you turn it on. |
| Watch without signing in | Opens Twitch in its own signed-out mode instead of stopping at the Log In / Sign Up screen. |
| Disable analytics | Stops Spade event uploads from the native and React Native app, Crashlytics uploads, Nielsen pings, Sprig surveys and Sentry. |

**Kick**

| Patch | What it does |
|---|---|
| Disable analytics | Turns off Firebase Analytics, Insider, Datadog, Mux and Datazoom player analytics and PAL nonce requests. |
| Third-party emotes | 7TV emotes in chat, the emote picker and autocomplete, with live set updates. Off until you turn it on. |
| Background audio | Keeps live streams and videos playing as audio when you leave Kick, with Kick's own media notification. |
| Hide chat highlights | Hides pinned messages, polls, predictions, goals, sub and gift messages and banners, each with its own switch. |
| Stay on channel when it hosts | Kick's host dialog waits for you instead of switching channels when its countdown ends. |
| AMOLED black | Pure black backgrounds for OLED screens, optionally with near-black cards and sheets. |

**Rumble**

| Patch | What it does |
|---|---|
| Unlock Premium | Turns on Rumble's local premium state after you sign in: ad-free playback, no premium upsells. Content and benefits the server checks still need a subscription. |
| Block ads | Video ads before and during videos and live streams, and the ads in feeds and under videos, are never requested, signed in or not. |
| Disable analytics | Stops Rumble's own analytics (clicks, searches, watch progress, with your user and advertising IDs), which it sends whatever the consent setting. |
| Remove tracking permissions | Removes the advertising ID, ad measurement, install referrer and phone state permissions; every SDK gets an all-zero advertising ID. |
| Remember playback speed | Keeps the speed you last picked for every video, also after a restart, instead of going back to 1x. |
| Hide Shorts *(off)* | Removes Shorts from the bottom bar, Home, My Feed, channels, categories and search. Shorts links still open. |

<!-- PATCHES_START -->
> **[v1.15.0](https://github.com/jordanwoodson/lurk-morphe-patches/releases/tag/v1.15.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;130 patches total
<details>
<summary><img src="assets/kick-icon-round.webp" width="28" height="28" align="center" alt="">&nbsp;&nbsp;<b>Kick</b>&nbsp;&nbsp;•&nbsp;&nbsp;36 patches</summary>
<br>

**🎯 Supported versions:**

| 40.32.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| AMOLED black | Makes Kick's dark background pure black for OLED screens, optionally with near-black cards and sheets. Starts off. Choose it in Lurk settings > Interface. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Anonymous chat | Adds a switch that opens Kick's chat as a guest, the way Kick opens it when you're signed out, while the rest of the app stays signed in: the chat page gets neither your sign-in token nor your account's name and ID, so its own connection to Kick's chat isn't yours. Sending chat messages is disabled while it's on, and messages that mention you aren't highlighted. Kick can still tell that you are watching: the player's playback request (postPlayerTelemetry) and the app's own live connection still identify you. Checked signed out only; whether Kick then leaves you off a channel's chatter list needs an account to see. The switch applies after a restart. Starts off. Turn it on in Lurk settings > Chat. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Background audio | Keeps live streams and videos playing as audio when you leave Kick, using Kick's own audio notification. A second switch turns off the automatic picture-in-picture window. On by default, as on Twitch. Turn it off in Lurk settings > Playback. |  |
| Block update prompts | Stops Kick from asking for or forcing an app update. A patched Kick can't be updated from Google Play, so update by patching a newer version. On by default. Turn it off in Lurk settings > Interface. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Bypass VOD ad sessions | Experimental: uses the original VOD URL instead of requesting a separate ad-session manifest. Does not remove ads stitched into live streams. Not selected by default; once included, its switch starts off. Turn it on in Lurk settings > Playback. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Change app name | Changes Kick's name in the launcher and Android settings. | • App name |
| Chat keywords | Highlights chat messages that mention you or contain your highlight words with a tinted background, optionally with a vibration, and hides messages with blocked words or from blocked users. Matching happens on your phone; nothing is sent anywhere. Mentions need a signed-in account; the word and user lists start empty. A hidden message can show for a moment before it disappears. Starts off. Turn it on in Lurk settings > Chat. |  |
| Chat text size | Sets the chat text size, from 12 to 24 pixels, and can pack chat messages closer together (compact chat). Kick's own chat settings have a text size for signed-in accounts; this one also works signed out and, while set, wins over Kick's. Kick's chat page draws the text, so a change to that page can stop it. Starts at Kick's size with compact chat off. Choose another in Lurk settings > Chat. |  |
| Chat timestamps | Shows the time next to each chat message, in 24-hour (13:05) or 12-hour (1:05) format as on Twitch. Kick's own chat settings can show times for signed-in accounts; this one also works signed out and, while on, wins over Kick's. Kick's chat page draws the times, so a change to that page can stop it. Starts off. Turn it on in Lurk settings > Chat. |  |
| Clean share links | Removes known campaign and advertising click parameters from kick.com links in share sheets. Keeps timestamps, clip IDs, unknown parameters and fragments. Kick's current share links are already clean. |  |
| Clone app | Installs Kick under another package name alongside the original, with separate sign-in and settings. Sharing sign-in with Kick's broadcaster app may not work after re-signing. | • Package name |
| Default startup tab | Adds a choice of the screen Kick opens on instead of Home: Browse or Following. Links and notifications still open what they point to. Starts on Home. Choose another in Lurk settings > Interface. |  |
| Default video quality | Sets the default adaptive quality ceiling to the selected height when that rendition exists. Kick can still choose a lower quality. The player's Auto option uses this ceiling. A lower starting ceiling can be set for mobile data in Lurk settings > Playback; it's off until then. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. | • Default quality ceiling |
| Disable analytics | Turns off Firebase Analytics, Insider (start-up, events and queued uploads), Datadog (its start-up, so its view, action, log and trace calls go nowhere), Mux and Datazoom player analytics, and Google PAL nonce requests. Kick's own API requests still run, including the playback request that returns the stream. A second switch, Block device fingerprinting, stops FingerprintJS Pro, which Kick uses to identify this device when you sign up, for age checks and when a signed-in session starts; it starts off because sign-up and age checks can fail while it is on. Disable analytics is on by default; turn it off in Lurk settings > Privacy and restart Kick. This does not remove video ads. |  |
| Disable autoplay | Starts Kick's feed previews switched off. Existing preferences and Kick's own autoplay switch keep working. Does not change intentionally opened streams. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Don't save searches | Stops Kick from saving what you search for on this device. Searches you saved earlier stay until you remove them. On by default. Turn it off in Lurk settings > Privacy. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Fill screen | Zooms streams and videos to fill the screen in landscape, cropping their top and bottom instead of showing black bars at the sides, on phones taller than 16:9. Vertical videos and the player next to the chat keep their bars. Starts off. Turn it on in Lurk settings > Playback. |  |
| Hide Clips | Hides Clips tabs in Browse, channels and categories, and the popular-clips row on channels. Shared clip links still open. Starts off. Turn it on in Lurk settings > Interface. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Hide Home sections | Hides the featured carousel, recommended streams and categories rows on Home, each with its own switch. Starts off. Turn them on in Lurk settings > Interface. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Hide KICKs tipping | Hides the chat gift-shop button, KICKs purchase button and leaderboard tipping prompt. Received gifts still show. Starts off. Turn it on in Lurk settings > Interface. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Hide chat highlights | Hides pinned messages, polls and predictions, goals, sub and gift messages, host messages, reward redemptions, event and drops banners, pinned KICKs gifts and celebration prompts, each with its own switch. Other chat messages are unchanged. The sub, gift, host and reward lines inside chat are found by the class names of Kick's chat web page, which Kick can change at any time; those switches then stop hiding the lines until Lurk is updated. Starts off. Turn them on in Lurk settings > Interface. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Hide mature-content warning | Skips Kick's "18+ Mature Content Warning" on mature streams when you're signed out, as if you had tapped "I am 18+". Signed in, Kick goes by your account's own age and this changes nothing; age checks Kick runs where the law requires them aren't touched. Starts off. Turn it on in Lurk settings > Interface. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Hide rating prompt | Stops Kick from asking you to rate the app. On by default. Turn it off in Lurk settings > Interface. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Hide subscription upsells | Hides channel Subscribe and Gift a Sub buttons and the leaderboard gift-subscription prompt. Keeps the existing subscribed indicator. Starts off. Turn it on in Lurk settings > Interface. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Lurk icon | Replaces Kick's launcher icon with Lurk artwork, including Android's themed icon. |  |
| Lurk in account menu | Adds a Lurk row to Kick's account menu (tap your profile picture while signed in), which opens Lurk settings. Pause Lurk leaves it on. Turn it off in Lurk settings > Advanced. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Mute stitched live ads | Experimental: ads could not be observed signed out. While Kick's player reports an ad break stitched into a live stream, mutes the player and covers the video with black and a small "Ad break", then restores both when the break's time is up, it ends, or another stream loads. The ad still plays for its full length and can't be skipped; this only silences and hides it. It acts on the ad signals Kick's player can get: an ad cue or ad break from Amazon IVS, or an ad of a MediaTailor session, which Kick only starts with Disable analytics off. None arrived in signed-out sessions, so this was checked only with made-up ad signals fed to Kick's own player code. Starts off. Turn it on in Lurk settings > Playback. |  |
| Normal latency | Adds a switch that turns off low-latency mode for live streams: a few seconds more delay, fewer rebuffers on weak connections. Starts off. Turn it on in Lurk settings > Playback. |  |
| Remove tracking permissions | Removes advertising ID, ad attribution and Google Play install-referrer permissions. Other identifiers and analytics require separate controls. |  |
| Seek interval | Sets how far the rewind and forward buttons skip in videos and rewound live streams: 5, 15, 20 or 30 seconds instead of 10. Starts at Kick's 10 seconds. Choose another in Lurk settings > Playback. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Show deleted messages | Keeps chat messages that moderators delete, or remove with a timeout or ban, struck through with a (Deleted), (Timed out) or (Banned) label, the way Kick's chat shows them to moderators, along with its ban, timeout and unban lines. Lurk turns this view on inside the chat page on your phone; the chat address the app sends to Kick stays as Kick builds it, so Kick's server sees no change. Large KICKs gifts in chat also get the moderators' menu, whose Delete does nothing unless you moderate the channel. Needs an Android System WebView that can run a script before the page's own (any current one). A second switch keeps the chat when a moderator clears it. Both on by default, as on Twitch. Turn them off in Lurk settings > Chat. |  |
| Show exact counts | Shows viewer and follower counts in full, such as 306,112 followers instead of 306.1K. Starts off. Turn it on in Lurk settings > Interface. |  |
| Show video stats | Shows a small panel in the corner of the player with what Kick's video player reports, refreshed every second: latency to the broadcaster, bitrate and the network estimate, buffer, dropped frames, quality and codecs. The numbers come from the player on your phone; nothing is sent anywhere, and the panel never takes a tap. Starts off. Turn it on in Lurk settings > Playback. |  |
| Sleep timer | Pauses playback a chosen time after it last started or resumed, including background audio. Starts off. Choose a time in Lurk settings > Playback. |  |
| Stay on channel when it hosts | When the channel you're watching hosts another one, Kick's host dialog waits for you instead of switching when its countdown ends: Watch now still switches, Cancel stays. Starts off. Turn it on in Lurk settings > Interface. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |
| Third-party emotes | Adds optional 7TV emotes to chat, the native picker and autocomplete, with zero-width layers and live set updates. Sends the channel owner's Kick user ID to 7tv.io, asks again every 5 minutes while the chat is open, keeps a websocket to events.7tv.io open for the channel's emote sets and loads images from cdn.7tv.app, so 7TV can see which channels you watch and for how long. Starts off. Turn it on in Lurk settings > Chat. Like every patch that changes Kick's JavaScript, it turns off Kick's over-the-air JavaScript updates, so Kick's code fixes arrive only when you patch a newer version. |  |

</details>

<details>
<summary><img src="patches/src/main/resources/rumble/icon/mipmap-xxxhdpi/ic_launcher_round.webp" width="28" height="28" align="center" alt="">&nbsp;&nbsp;<b>Rumble</b>&nbsp;&nbsp;•&nbsp;&nbsp;40 patches</summary>
<br>

**🎯 Supported versions:**

| 3.21.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| AMOLED black | Turns the dark grey of Rumble's raised surfaces (the bottom bar, search fields, cards, chips and tags) pure black for OLED screens, optionally near-black so their edges still show. Rumble's dark theme already draws pages, sheets and dialogs black; dividers and buttons keep their grey. Applies after a restart. Starts off. Turn it on in Lurk settings > Interface. |  |
| Background audio by default | Makes Settings > Playback > Background Play default to Sound only: leaving the app keeps the sound playing instead of opening a picture-in-picture window. A choice made in Rumble's settings still wins. Starts off. Turn it on in Lurk settings > Playback. |  |
| Block ads | Removes video ads (before and during videos and live streams), the ads in feeds and under videos and Home's ad sections, signed in or not. The app never requests them, so it never sends the ad server your advertising ID. Boosted (paid) videos are left out of Home, related videos, search and categories, and no ad or Boosted video impressions or clicks are reported. |  |
| Block cookie notice | Stops Rumble's Ketch consent SDK from loading, so the cookie notice never appears and no consent is recorded, and ignores consent recorded earlier. AppsFlyer, Firebase Analytics, Crashlytics, Firebase Performance and the Facebook SDK's app events then stay off, as before anyone consents. Push notifications keep working: Airship, Rumble's push service, still starts after a restart, with only the essential purpose Rumble asks for and its own analytics off. Settings > Data Consent no longer opens. |  |
| Block update prompts | Stops the "update required" screen and the "new version available" dialog that Rumble turns on remotely, so a patched version keeps working when Rumble raises its minimum version. Update by patching a newer version. On by default. Turn it off in Lurk settings > Interface. |  |
| Change app name | Changes the name shown under Rumble's launcher icon and in Android's settings. | • App name |
| Chat keywords | Highlights live chat messages that mention you or contain your highlight words with a tinted background, optionally with a vibration, and hides messages with blocked words or from blocked users. Mentions are on by default; the word and user lists start empty. On by default. Turn it off in Lurk settings > Chat. |  |
| Chat timestamps | Shows the time each live chat message was sent in front of the sender's name. On by default. Turn it off in Lurk settings > Chat. |  |
| Clean share links | Removes everything after the ? from Rumble links before they are shared, so tracking tags such as e9s (where you found the video) can't go out with them. Rumble 3.21.0 shares clean links; this keeps them clean if the server starts adding tags. |  |
| Clone app | Installs Rumble under another package name, so it sits alongside the original app with its own sign-in and settings. Use "Change app name" to tell the two apart in the launcher. | • Package name |
| Default playback speed | Starts videos at a chosen playback speed instead of 1x, until you pick another speed in the player. Live streams without rewind still play at 1x. Starts off (1x). Choose a speed in Lurk settings > Playback. |  |
| Default startup tab | Opens Rumble on Home or My Feed every time, instead of the one you last chose. Starts off. Choose a tab in Lurk settings > Interface. |  |
| Default video quality | Starts videos at a chosen quality, or the closest one available, instead of Rumble's 480p. Once you pick a quality in the player, Rumble keeps using that one. Starting live streams at it too, and a lower cap on mobile data, are separate settings. Starts off (Rumble's default). Choose a quality in Lurk settings > Playback. | • Quality<br>• Live streams too<br>• On mobile data |
| Disable analytics | Stops Rumble's own analytics, which it sends whatever the consent setting: clicks, impressions, searches, watch progress and player state, with your user ID, username, advertising ID and AppsFlyer ID, to e.rumble.com and its debug log. Signed-in watch history may stop updating unless watch progress is kept. | • Keep watch progress |
| Disable autoplay | Stops Rumble from playing the next video when one ends, and from playing muted previews in feeds, including the featured video on Home. Only the defaults change: Settings > Playback can turn either back on. Starts off. Turn them on in Lurk settings > Playback. | • Next video<br>• Feed previews |
| Disable tracking SDKs | Switches Firebase Analytics and Firebase Performance off for good, so recorded consent can't turn them on, and stops the Facebook SDK from initializing itself fully, logging app events or reading the advertising ID by default. Crashlytics and AppsFlyer have no such switch and still follow consent; Block cookie notice keeps them off. Changes the APK when patching, so it has no switch in Lurk settings. |  |
| Don't save searches | Stops Rumble from keeping your searches on the phone and hides the ones it kept, so they no longer show under the search box. Suggestions still come from Rumble's server as you type. On by default. Turn it off in Lurk settings > Privacy. |  |
| Fill screen | Zooms videos to fill the screen in landscape, cropping the edges instead of showing black bars, on phones taller than 16:9. Starts off. Turn it on in Lurk settings > Playback. |  |
| Hide Create tab | Removes the Create (camera and upload) button from the bottom bar. Starts off. Turn it on in Lurk settings > Interface. |  |
| Hide Home sections | Hides Home's categories, creators and playlists rows, each with its own switch, and any section whose title you list in Lurk settings, such as Live or Rumble Originals. Starts off. Turn them on in Lurk settings > Interface. |  |
| Hide Join and Shop buttons | Hides the Join (paid channel membership) and Shop (a creator's store) buttons next to Follow on channels and videos, each with its own switch. Starts off. Turn them on in Lurk settings > Interface. |  |
| Hide Premium upsells | Hides Rumble Premium promotions: the sheet that opens over videos, the Upgrade Now banner on Home and My Feed, the special offer on the account screen, the downloads pitch and Premium gifts in live chat. Premium-only videos still say so. |  |
| Hide Shorts | Removes Shorts from the bottom bar, Home, My Feed, channel pages, categories and search. Shorts links still open. Starts off. Turn it on in Lurk settings > Interface. |  |
| Hide chat clutter | Hides pinned messages, raid and gift notices and sponsor reads in live chat, each with its own switch, and optionally chat badges or the whole chat. Starts off. Turn them on in Lurk settings > Chat. |  |
| Hide comments and related videos | Hides the comments under videos, and the related videos the video page lists, each with its own switch. Without related videos, Autoplay next video has nothing to play. Starts off. Turn them on in Lurk settings > Interface. |  |
| Hide premium-only videos | Leaves videos only Rumble Premium members can watch out of Home, related videos, search and categories, unless your account has access to them. Other lists, such as channel pages and My Feed, may still show them. Starts off. Turn it on in Lurk settings > Interface. |  |
| Hide tipping and Rants | Hides the Tip buttons on channels, videos and Shorts, Rants (paid live chat messages) and paying with Rumble Wallet. Rants other viewers send still show. Starts off. Turn it on in Lurk settings > Interface. |  |
| Keep playing during other sounds | Choose whether Rumble pauses when another app plays sound: always (Rumble's behavior), only for longer interruptions, or never. Calls still pause playback. Starts off. Choose it in Lurk settings > Playback. |  |
| Keep screen on while paused | Keeps the screen on while a video is paused in the player, as it is during playback. When the video ends or you leave the player, the screen can turn off again. Starts off. Turn it on in Lurk settings > Playback. |  |
| Lurk icon | Replaces Rumble's launcher icon with the Lurk icon, including the themed icon on Android 13+. |  |
| Player gestures | In landscape, swipe up or down on the left of the video to change the brightness, on the right to change the volume. Rumble's own double-tap to skip stays. Starts off. Turn it on in Lurk settings > Playback. |  |
| Refresh stream | When a video or live stream fails, tap the error screen to reload it at the same point. On by default. Turn it off in Lurk settings > Playback. |  |
| Remember playback speed | Keeps the playback speed you last picked for every video, including after Rumble restarts, instead of going back to 1x. Live streams without rewind still play at 1x. Starts off. Turn it on in Lurk settings > Playback. |  |
| Remove tracking permissions | Removes the advertising ID, ad measurement, install referrer and phone state permissions. On Android 13 and newer, every SDK and Rumble's own requests then get an all-zero advertising ID; on Android 12 and older, Google Play services hands out the real one regardless, unless you delete it in Android's settings. |  |
| Resume videos when signed out | Starts videos where you left off when you aren't signed in, from the positions Rumble already keeps on the phone. Signed in, Rumble's own watch progress is unchanged. On by default. Turn it off in Lurk settings > Playback. |  |
| Seek interval | Sets how far the player's rewind and forward buttons skip, instead of 15 seconds. Starts off. Choose it in Lurk settings > Playback. |  |
| Show deleted messages | Shows the text of live chat messages that moderators remove, or that Rumble hides because the sender was muted, after Rumble's "Message was removed by moderator" label. On by default. Turn it off in Lurk settings > Chat. |  |
| Show exact counts | Shows view, like, comment, follower and "watching now" counts in full (12,345 instead of 12K). Starts off. Turn it on in Lurk settings > Interface. |  |
| Sleep timer | Pauses playback a chosen time after it last started or resumed, including background play and picture-in-picture. Starts off. Choose a time in Lurk settings > Playback. |  |
| Unlock Premium | Turns on Rumble's local premium state once you sign in (or sign out and in again): the app then treats you as a Premium member, which skips its ad requests and Premium upsells. Rumble's server still decides premium-only videos, live gates, downloads and premium comments, and may refuse them. Checked on the app's code without a Rumble account; never tried signed in. |  |

</details>

<details>
<summary><img src="assets/twitch-icon-round.webp" width="28" height="28" align="center" alt="">&nbsp;&nbsp;<b>Twitch</b>&nbsp;&nbsp;•&nbsp;&nbsp;54 patches</summary>
<br>

**🎯 Supported versions:**

| 31.7.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| AMOLED black | Turns the dark theme's greys black on screens drawn with Android views: the window and navigation bar, Home, Browse and channel pages, the theatre and chat, whose backgrounds are repainted after each layout. Screens Twitch draws with Compose (parts of settings, the emote picker and some sheets) and pop-up sheets keep their dark grey. Only in Twitch's dark mode. Applies after a restart. Starts off. Turn it on in Lurk settings > Interface. |  |
| Anonymous chat | Adds a switch that reads chat as an anonymous guest, the way Twitch does when signed out, while the rest of the app stays signed in, so you aren't listed among a channel's chatters. Sending chat messages is disabled while it's on. Off by default; applies after a restart. |  |
| Auto-claim Drops | Adds a switch that claims a Drop for your account as soon as Twitch's drops notification in a channel shows it as claimable, by pressing that notification's Claim button for you: the same claim request and the same "claim" analytics event a tap sends (Disable analytics blocks the event). Each drop is claimed once per app start. Needs a signed-in account and the notification, which shows while you watch a channel with Drops; drops earned elsewhere stay in your inventory. Checked against Twitch's code on Android's runtime, not yet with a real account. Starts off. Turn it on in Lurk settings > Chat. |  |
| Auto-claim channel points | Adds a switch that claims the channel points bonus for your account as soon as its chest appears in a channel's chat, with the same request as tapping the chest. Each bonus is claimed once. Needs a signed-in account. Checked against Twitch's code and with a stand-in for the claim service, not yet with a real account. The claim leaves out the chat mode a tap sends, which Twitch only adds to its analytics event. Starts off. Turn it on in Lurk settings > Chat. |  |
| Avoid stitched ads | While Twitch's server stitches an ad break into a live stream, plays the stream instead from a picture-by-picture session, the kind Twitch itself shows during breaks, which gets no ads: at 360p at most, with sound, then back to the stream's own session and quality when the break is over. The player doesn't reload. The playback token for that session is requested without your account. If a break runs past 4 minutes or the stream's own playlist stops answering, the stream comes back on a new session instead; when your own token has under a minute left, that session's token is also requested without your account, and the rest of the stream plays as a signed-out viewer's (how that affects subscriber ad exemption, minutes watched and Drops is untested). When no picture-by-picture session can be had, the break plays, and Mute stitched ads still mutes and covers it. Native and React Native players; streams started while it's off are left alone, and turning it off during a break lets that break finish on picture-by-picture first. Does nothing for streams loaded through Playlist proxy. |  |
| Background audio | Keeps streams and videos playing as audio when you leave the app, using Twitch's own "Continue Playing Audio in the Background" with its audio-only stream and media notification. Changes only the default, Never in Twitch: a choice made in Twitch's settings still wins. |  |
| Block client ads | Declines ads handled by Twitch's native client ad eligibility check using its existing not eligible result. Does not remove ads stitched into streams by the server or guarantee ad-free playback. |  |
| Block cookie notice | Hides Twitch's automatic cookie consent notice without accepting it or changing saved vendor consent. Manual consent settings stay available. Use Disable analytics to block tracking. |  |
| Block display ads | Blocks the ad requests that Block client ads doesn't cover: stream display ads (squeezeback and lower third), audio ads, multi-format ad pods, the Following headliner, feed display and video ads and brand surveys, in both the native and React Native parts of the app. Each request gets the failure or no-ad answer Twitch already handles. Sponsorship and paid-promotion labels are kept. Ads stitched into the stream by the server still play. |  |
| Change app name | Changes the name shown under Twitch's launcher icon and in Android's settings. | • App name |
| Chat appearance | Adds chat look settings: text, emote and badge size, message spacing, alternating row backgrounds, plain /me messages, and the width and background opacity of the landscape chat panel. Each keeps Twitch's look until changed in Lurk settings. Native live chat, chat history and VOD chat replay; React Native chat gets the text size, row backgrounds, /me style and landscape panel only. |  |
| Chat keywords | Highlights chat messages that mention you or contain your highlight words with a tinted background, optionally with a vibration, and hides messages with blocked words or from blocked users. Mentions are on by default; the word and user lists start empty and are set in Lurk settings. Native and React Native live chat and history, plus native VOD chat replay. |  |
| Chat overlay | Adds a switch that scrolls live chat messages right to left across the top of the video in landscape (danmaku), as plain white text with the sender's name. Off until turned on in Lurk settings, with choices for speed and number of lines. Native live channels only: not React Native chat, VODs or chat replay. The overlay never takes touches. |  |
| Chat timestamps | Shows the time each live chat message was sent in front of it, the way Twitch already shows it on chat history, in 24-hour or 12-hour format. Whispers are unchanged. |  |
| Clean share links | Removes known Twitch attribution and campaign parameters from shared links and copied share text. Keeps timestamps, clip IDs, unknown parameters and fragments. Covers native and React Native sharing. |  |
| Clip download | Adds "Download clip" to the menu (⋮) of a clip in Twitch's clips feed, where clip links open. It asks gql.twitch.tv for the clip's video addresses and signed access token with the app's Client-ID only (no account), and Android's download manager saves the best quality as an MP4 in Downloads/Twitch. Starts off. Turn it on in Lurk settings > Playback. |  |
| Clone app | Installs Twitch under another package name alongside the original, with separate sign-in and settings. Amazon sign-in and verified app links may not work after re-signing. | • Package name |
| Compact chat | Adds switches that leave chatters' badges out of native chat lines (Twitch's and third-party ones) and show emotes as their text, so no emote images load. Native live chat, chat history and VOD chat replay; React Native chat is unchanged. Starts off. Turn it on in Lurk settings > Chat. |  |
| Default startup tab | Adds a choice of the screen Twitch opens on instead of Home: Browse, Following or Activity. Links and notifications still open what they point to. |  |
| Default video quality | Starts playback at the selected rendition when available, with Source as the default. Saved player choices, including Auto, take priority. Unavailable renditions use Twitch's fallback. A lower rendition for metered networks (mobile data, or Wi-Fi marked as metered) can be chosen in Lurk settings > Playback > On mobile data; it's the same as on Wi-Fi until then. | • Default rendition |
| Disable analytics | Stops Twitch's native and React Native Spade event uploads, denies local analytics SDK consent, enables Branch's limited tracking mode, blocks Crashlytics uploads, Nielsen audience pings and Sprig surveys, and prevents Sentry initialization. Watch progress, viewing statistics and rewards may stop updating. Restart Twitch after changing this setting. Playback requests still run. |  |
| Disable autoplay | Stops the next recommended video and React Native feed clip from playing automatically, and defaults feed previews to Never. Manual Play and saved feed preview choices keep working. | • Feed previews<br>• Next video |
| Emote and badge info | Adds a switch that shows a small sheet when you tap an emote or a badge in native chat, chat history or VOD chat replay: the image larger, its name, where it comes from (Twitch, 7TV, BetterTTV, FrankerFaceZ, Chatterino; channel or global; who made it, when the service's list says) and a Copy name button. Signed in, Twitch emotes keep Twitch's own emote card; usernames and long presses keep what Twitch does. Native chat only; React Native chat is unchanged. Starts off. Turn it on in Lurk settings > Chat. |  |
| Fill screen | Zooms streams and videos to fill the screen in landscape, the strip beside the camera cutout included, cropping their top and bottom instead of showing black bars at the sides, on phones taller than 16:9. The player's buttons and the stream's details stay clear of the cutout. Vertical videos, the player next to the chat and picture-in-picture keep their bars. Works in the native theatre and in the React Native one Twitch can use while Use native player is off. Starts off. Turn it on in Lurk settings > Playback. |  |
| Fix notifications | Lets the patched app register for push notifications. Firebase only accepts Twitch's original package name and signing certificate, and refuses the re-signed app, so its registration requests send the original ones, which are what unpatched Twitch sends. Registration was checked; delivering a notification needs an account and wasn't. On by default; the switch is in Lurk settings > Interface and applies after a restart. |  |
| Fix stuck start screen | Opens Twitch when its start screen is still waiting after 5 seconds. Twitch waits for Branch's link lookup before it routes, and when that never answers, it stays on a blank start screen until it's closed, unpatched Twitch included. On by default; the switch is in Lurk settings > Interface. |  |
| Force ExoPlayer | Adds a switch that plays live channels and videos with the ExoPlayer backend Twitch still ships instead of Amazon IVS. Off until turned on in Lurk settings. Clips, encrypted streams and React Native players stay on IVS. Lurk patches that hook IVS, such as Normal latency, Mute stitched ads and Show video stats, don't act on ExoPlayer. |  |
| Force landscape | Turns the screen to landscape when a live stream or video opens in Twitch's native theatre, and back to the orientation the app had when the theatre closes. Twitch's rotate button still switches to portrait. Home's feed previews don't rotate. Starts off. Turn it on in Lurk settings > Playback. |  |
| Hide Bits tipping | Hides chat Bits buttons, Bits purchase cards, the cheering tray and one-tap Bits controls. Keeps normal chat and Bits messages sent by other viewers. |  |
| Hide Clips | Hides the Clips discovery tab on Home and the Clips tab on native channel profiles. Shared clip links still open. |  |
| Hide Home sections | Hides Stories on Home and, each with its own switch, the Continue watching, offline channels and recommended channels sections of Following. |  |
| Hide chat highlights | Hides the Hype Train, Bits and gift leaderboards, other viewers' sub and gift messages and gift banners, pinned cheers and watch-streak pop-ups, each with its own switch. Celebrations can be hidden too. Other chat messages are unchanged. |  |
| Hide mature content warning | Skips the content warning on streams, videos and clips with mature content labels, as if you had chosen Start Watching. Age, region, guardian and account restrictions still apply. Off by default. |  |
| Hide player buttons | Hides the player's Clip, Cast and Share buttons, each with its own switch. Cast stays visible by default. Other ways to clip and share, such as the channel page, are unchanged. |  |
| Hide subscription upsells | Hides Subscribe and Gift a Sub prompts, Turbo promotions and the native Turbo signup/startup offer. Keeps the existing subscribed indicator and legitimate account entitlements. |  |
| Highlight first-time chatters | Tints a chatter's first message in a channel in native live chat, using the first-msg tag Twitch's chat server puts on it. Chat history, VOD replay and React Native chat carry no such tag. Starts off. Turn it on in Lurk settings > Chat. |  |
| Latency badge | Shows how far a live stream plays behind the broadcast on Twitch's native player in the theatre, read from the player itself once a second (the latency the stats panel reports). Tapping it reloads the stream through Twitch's own Retry, a new access token and playlist that start at the live edge: the native player has no seek to live. Feed previews, videos and clips show nothing. Starts off. Turn it on in Lurk settings > Playback. |  |
| Lurk icon | Replaces Twitch's launcher icon with Lurk artwork, including Android's themed icon. |  |
| Mute stitched ads | While an ad break that Twitch's server stitched into a stream plays, mutes the player and covers the video with black, then restores both when the stream returns. Works in the native and React Native players. The ad still plays and the break isn't shorter. |  |
| Navigation bar position | Adds a choice that moves Twitch's bottom navigation bar to the top of the screen and/or hides its labels, leaving only the icons. Twitch's own layout stays until another choice is made in Lurk settings. |  |
| Normal latency | Adds a setting that turns off the player's low-latency mode for live streams: a few seconds more delay to the broadcaster, for fewer rebuffers on a weak connection. Off until turned on in Lurk settings. |  |
| Player gestures | Sets the skip interval of the video (VOD) rewind and forward buttons and the media notification, and adds brightness (left) and volume (right) swipes on the video in landscape. Twitch's -10/+30 seconds stay until you choose another interval in Lurk settings; swipes start off. |  |
| Playlist proxy | Sends live stream playlist requests to a proxy server you set in this patch's options, for example one that returns playlists without stitched ads. The proxy sees which channel you watch and when, and receives each request in full, including your signed playback token, which identifies your account. The token is in the request's address (its query, or with {url} the whole Twitch URL), so the proxy's access logs can keep it. The proxy decides what the player plays and can add segments of its own: only use a proxy you trust. An http:// proxy gets an exception from Twitch's HTTPS-only rule for its host alone, and the token then travels unencrypted. Does nothing while the proxy URL is empty; once it's set, the patch's switch starts on (Lurk settings > Playback). Videos and clips are not proxied. Avoid stitched ads leaves proxied streams alone: the proxy decides what their playlists hold. | • Proxy URL |
| Refresh stream | Long-press the player's settings gear, or the middle of the video, to reload a stuck stream through Twitch's own Retry: a new access token and playlist for live streams, the same position for videos. Covers Twitch's native players. |  |
| Remove tracking permissions | Removes advertising ID and Google Play install-referrer permissions. Other identifiers and analytics require separate controls. |  |
| Show deleted messages | Keeps the text of chat messages that moderators delete, or remove with a timeout or ban, struck through and dimmed instead of Twitch's "message deleted" placeholder. A second switch keeps the messages when a moderator clears the whole chat. |  |
| Show video stats | Adds the video stats button Twitch shows only to its staff to the native player: latency to the broadcaster, bitrate, buffer, dropped frames, codecs and server, and for live streams the stream's uptime, from the stream age Twitch's playlist already carries. Everything shown is local to the player. |  |
| Sleep timer | Pauses playback a chosen time after it last started or resumed, through Twitch's own pause for native, portal and React Native players, and says so in a short notice. Choose the time in Lurk settings; it is off until then. |  |
| Tablet layout | Adds a switch that makes Twitch treat the phone as a tablet: Home and the player rotate, the player shows chat beside the video in landscape, and a navigation rail on the left replaces the bottom bar in landscape (and in portrait too with a second switch). Off until turned on in Lurk settings; applies after a restart. |  |
| Third-party badges | Adds switches that show FrankerFaceZ and Chatterino badges and pronouns.alejo.io pronouns next to chatters' names in native and React Native chat. Each switch is off until turned on in Lurk settings. The badge switches download that service's public list of all badge holders (api.frankerfacez.com, api.chatterino.com) about once an hour and check it on the phone, then load each badge's image from the https address the list names (FrankerFaceZ: cdn.frankerfacez.com; Chatterino: currently fourtf.com, but any host its list gives). The pronouns switch sends the username of each chatter whose message you see to pronouns.alejo.io. 7TV badges are not included. |  |
| Third-party emotes | Adds switches that show 7TV, BetterTTV and FrankerFaceZ emotes in chat, Twitch's chat history and VOD chat replay. When on, each sends the ID of the channel you watch to that service (7tv.io, api.betterttv.net, api.frankerfacez.com) for its emote lists and loads the emote images from its CDN. "Emotes in the picker" also lists them in the emote picker, one section per service, and in autocomplete after ':', from the same lists; that part was checked with Twitch's own picker and autocomplete code on Android's runtime, not in the app, which needs an account to open the picker. Starts off. Turn it on in Lurk settings > Chat. |  |
| Use native player | Always opens live channels in Twitch's native player, never the React Native "Ultralight" player a server experiment can switch some users to. Most Lurk playback, chat and ad patches hook the native player. |  |
| VOD chapters | Adds a Chapters button to the native video (VOD) player that lists the stream's game and category changes and jumps to one through Twitch's own seek. The list comes from Twitch's public data: one request to gql.twitch.tv per video the native player loads, feed previews included, with the app's client ID and without your account. On by default; the switch is in Lurk settings > Playback. |  |
| Watch without signing in | Opens Twitch without an account instead of stopping at the Log In / Sign Up screen, using Twitch's own signed-out mode. Streams, videos and chat can be watched; following, chatting and other account actions still ask you to sign in. Signed-in use is unchanged. |  |

</details>

<!-- PATCHES_END -->

## Screenshots

The Lurk settings screen in patched Twitch, Kick and Rumble:

<p align="center">
  <img src="assets/screenshots/twitch-settings.png" width="240" alt="The Lurk settings screen in patched Twitch">
  <img src="assets/screenshots/kick-settings.png" width="240" alt="The Lurk settings screen in patched Kick">
  <img src="assets/screenshots/rumble-settings.png" width="240" alt="The Lurk settings screen in patched Rumble">
</p>

## FAQ

**Why do I still see ads on Twitch?**
Twitch puts some ad breaks into the live video itself, on its server ("stitched" ads), so there is
no request on the phone to decline. When Twitch offers an ad-free picture-by-picture session for the
break, *Avoid stitched ads* plays that instead, at 360p at most; when it doesn't, *Mute stitched ads*
mutes the break and covers it, but the break still runs its full length. The ads the app requests
itself (display, audio and feed ads) are declined by *Block client ads* and *Block display ads*.
*Playlist proxy* can send live playlists through a proxy that removes stitched ads, but the proxy
receives your playback token, which identifies your account: only use one you trust. On Kick, ads
stitched into live streams are not removed.

**What does Lurk send to other services?**
Lurk has no server and sends nothing of its own. A few patches contact a third-party service, and
only once you turn them on in Lurk settings:

- Twitch *Third-party emotes*: the ID of the channel you watch, to 7tv.io, api.betterttv.net and
  api.frankerfacez.com, and the emote images from their servers.
- Twitch *Third-party badges*: downloads the public badge lists of api.frankerfacez.com and
  api.chatterino.com about once an hour; the pronouns switch sends the username of each chatter whose
  message you see to pronouns.alejo.io.
- Kick *Third-party emotes*: the channel owner's Kick user ID to 7tv.io and events.7tv.io, and the
  emote images from cdn.7tv.app.
- Twitch *Playlist proxy* (not selected by default): live playlist requests, with your playback
  token, to the proxy address you set when patching.

Each app's page under [docs/](docs/README.md) lists what every patch sends where.

**Why doesn't Kick update itself any more?**
Besides app updates, Kick downloads new JavaScript over the air, which would replace the JavaScript
Lurk patched. Kick patches that change its JavaScript therefore turn those downloads off, even
while their own switches are off. *Block update prompts* also stops Kick asking you to update. To
get Kick's fixes, patch the newer Kick version once a Lurk release supports it.

**How do updates work?**
A patched app can't be updated from Google Play. When Twitch, Kick or Rumble releases a new version,
wait for a Lurk release that lists it, then download that version in Manager and patch it with the
same Manager install (or the same imported signing key, see [Install](#install)). Android installs it
over the patched app and keeps your data and Lurk settings. A new Lurk release for the same app
version works the same way: patch again and install over the old one.

## Documentation

- [docs/twitch.md](docs/twitch.md), [docs/kick.md](docs/kick.md), [docs/rumble.md](docs/rumble.md):
  per app, what each patch hooks, what it can't do, what it sends where, and how it was tested.
- [docs/development.md](docs/development.md): building the bundle, the workspace commands, writing
  and testing a patch, releasing.
- [CHANGELOG.md](CHANGELOG.md): what changed in each release.

## Reporting problems

Open a [bug report](https://github.com/jordanwoodson/lurk-morphe-patches/issues/new?template=bug_report.yml)
with the app and its version, the Lurk release, the patches you selected and, for a crash or a
patch that seems inactive, the output of:

```sh
adb logcat -s lurk AndroidRuntime
```

Check the app's page under [docs/](docs/README.md) first: some things that look like bugs are
documented limits, for example ads Twitch stitches into the stream on the server. Problems inside
Morphe Manager itself go to [the Morphe project](https://github.com/MorpheApp/morphe-manager/issues).
Security issues go through [SECURITY.md](SECURITY.md), not the public tracker.
Questions, setup help and ideas that aren't a bug go to [Discussions](https://github.com/jordanwoodson/lurk-morphe-patches/discussions).

## Contributing

Bug reports, tested patches and notes on how the apps work inside are all welcome.
[CONTRIBUTING.md](CONTRIBUTING.md) has the rules that matter here: APKs only from APKMirror,
Google Play or Uptodown; original patches, not ports of other bundles; fingerprints on strings
and signatures rather than obfuscated names; a Lurk setting for every behavior change; honest
descriptions. [docs/development.md](docs/development.md) gets you building.

## Disclaimer

Lurk modifies apps you download yourself. The services' terms may not allow modified clients,
and a patched app can break when the service changes something on its side. Use it at your own
risk; the software comes without warranty (see the license).

## License

GPL-3.0. Copyright © 2026 Jordan Woodson. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
