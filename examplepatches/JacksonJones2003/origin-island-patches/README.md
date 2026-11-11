# Origin Island Patches

Patches for use with Morphe that make YouTube Music, YouTube, LastWave and Apple Music work with the
OriginOS music card, the player on the Origin Island and the lock screen of vivo and iQOO phones.

> [!NOTE]
> This project was made entirely by Claude, the AI model of Anthropic: the reverse engineering,
> the patches and this README. It was tested by the owner of this repository on one vivo phone
> running OriginOS 7.

## Disclaimer

This is an unofficial hobby project. It is not affiliated with, endorsed by or supported by
vivo, iQOO, Google, YouTube, Apple or the Morphe project, and all names and trademarks belong to
their owners.

The patches change how another app behaves, which can be against the terms of service of that
app. They are provided as they are, without warranty of any kind, and you use them at your own
risk. See the [license](LICENSE) for details.

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.14.0](https://github.com/JacksonJones2003/origin-island-patches/releases/tag/v1.14.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;10 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 21.38.123 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Comments under the video](#comments-under-the-video) | Shows the comments under the video in the wide layout, as on an opened foldable phone held sideways, instead of over the suggested videos. |  |
| [Origin Island music card](#origin-island-music-card) | Lets the OriginOS music card on the lock screen and Origin Island like videos, show the captions of a video as its lyrics, and show what plays next as the playlist. |  |
| [Pause on fold](#pause-on-fold) | Pauses what plays when a foldable phone is closed. |  |

</details>

<details open>
<summary>📦 YouTube Music&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 9.40.51 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Jovi voice requests](#jovi-voice-requests) | Lets the Jovi voice assistant play songs asked for by voice. Only works in a second copy of YouTube Music installed next to it under the package of QQ Music with the Clone app patch. |  |
| [Lyrics in player](#lyrics-in-player) | Shows the line of the lyrics that is sung between the cover and the title in the player. Requires the Third-party lyrics patch. |  |
| [Origin Island music card](#origin-island-music-card) | Lets the OriginOS music card on the lock screen and Origin Island like songs, switch between repeat and shuffle, show the playlist, the playlists of the library and the downloads, and show the lyrics of the Third-party lyrics patch. | • Package name |
| [Pause on fold](#pause-on-fold) | Pauses what plays when a foldable phone is closed. |  |

</details>

<details open>
<summary>📦 Apple Music&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.0.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Origin Island music card](#origin-island-music-card) | Lets the OriginOS music card on the lock screen and Origin Island show lyrics, like songs, switch between repeat and shuffle, and show the playlist and play from it. This does not get past any checks of the app, so the app may refuse to work once it is patched. |  |

</details>

<details open>
<summary>📦 LastWave&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 4.3.1 | 5.0.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Origin Island music card](#origin-island-music-card) | Lets the OriginOS music card on the lock screen and Origin Island show lyrics, like songs, switch between repeat and shuffle, and show the playlist and play from it. |  |
| [Pause on fold](#pause-on-fold) | Pauses what plays when a foldable phone is closed. |  |

</details>

<!-- PATCHES_END -->

## Origin Island music card (YouTube Music)

Makes the OriginOS music card work with YouTube Music the way it does with the music apps
vivo supports:

- the heart button likes the current song, and shows if it is liked
- the loop mode button switches between repeat all, repeat one and shuffle
- the playlist shows the queue, and plays the song that is tapped
- the favorites list shows the playlists of the library, and plays the one that is tapped
- the download list shows the downloaded playlists and mixes, and plays the one that is tapped
- a list with nothing in it says so, instead of loading until the card reports a network error
- synced lyrics are shown, if the **Third-party lyrics** patch of Morphe is applied and enabled

### Using it

1. Add this patch source to Morphe Manager, next to the official Morphe patches:
   https://morphe.software/add-source?github=JacksonJones2003/origin-island-patches
2. Patch YouTube Music in Expert mode, and enable **Origin Island music card** on the tab of
   this source together with the Morphe patches you normally use.
3. Restart the phone once after installing. The card only looks for apps that support these
   features when it starts.

YouTube Music has to be signed in, since it does not accept likes otherwise.

The favorites list can take a few seconds to load the first time after YouTube Music is
started, while YouTube Music loads the library.

### A copy under a package the card knows

> **You need two YouTube Music apps for this.** Keep YouTube Music installed under its own
> package, patched, for Gemini, Android Auto and your library, and install a second, patched
> copy next to it under another package for the card. The copy cannot replace YouTube Music:
> Gemini only sends songs to YouTube Music under its own package.

The card only lists the apps of a list of its own to pick from while nothing plays, and
YouTube Music is not one of them. A copy of YouTube Music under the package of one that is can
be picked there:

- `cn.missevan`: the card has no name of its own for it, so it shows the copy as YouTube Music
- `com.luna.music`: the card shows the copy as Qi Shui Yin Yue, its name for Luna Music

To make the copy, patch YouTube Music again with the package in the **Package name** option of
the **Clone app** patch of the Morphe patches. With the Morphe patches, set this one there:
Clone app sets the package of the app after the other patches, and the Google sign-in patch
takes it from Clone app. Leave the **Package name** option of **Origin Island music card** on
**Keep**; it is for building the copy without the Morphe patches. The copy cannot be installed
next to the app the card knows the package for.

For such a copy the patch does the following:

- the card opens the copy to have it play, and the copy then resumes what it last played
  and moves out of view again
- if YouTube Music is installed under its own package and patched as well, the copy has it
  play instead, and shows its downloads in the download list. A copy cannot read the
  downloads of YouTube Music, so YouTube Music plays the ones that are tapped

The card only offers the lists of an app it has no list support built in for while that
app plays, so the playlist button of a copy stays disabled until something plays.

Pressing play on the card while YouTube Music or the copy is closed starts it, and has it
resume what it last played, as the play button of a headset does.

### How it works

The card (`com.vivo.musicwidgetmix`) controls most apps through a generic media session
controller that only knows the basic playback controls, which is why the other buttons are
dimmed for them. It offers the rest to apps it controls through a media browser service that
declares the `com.vivo.musicwidgetmix.support.service` action, and reads what it shows from
keys of its own in the session metadata and the session extras.

The patch opts YouTube Music into that path and translates between the two:

- declares the action on YouTube Music's media browser service, and lets the card connect to it
- adds to the metadata YouTube Music publishes what the card may show and control,
  and a media id so the card notices song changes
- heart button: adds a heart rating from the like action of YouTube Music's playback state,
  which is kept up to date better than its own thumb rating, and turns the heart rating sent
  by the card into a thumb rating, since YouTube Music would otherwise treat a heart as a
  dislike
- loop mode button: maps the loop mode of the card to the repeat and shuffle modes of the session
- playlist: answers the card's request for the current list with the queue of the session
- favorites and download list: YouTube Music only lets clients it knows, such as Android Auto,
  browse its library. The patch connects to YouTube Music's media browser service from inside
  the app, has the app take that connection for Android Auto, and answers the card with the
  playlists and the downloads it finds. The card plays them from their own media ids
- lyrics: sends the lyrics the Third-party lyrics patch loaded to the card in the LRC format
- a copy under another package: the card opens some apps with an extra in the intent to have
  them play, which the main activity of YouTube Music is made to act on. The copy reaches
  YouTube Music through its media browser service, which is made to answer a patched copy

Reverse engineered from `com.vivo.musicwidgetmix` 17.0.8.3 (OriginOS 7)
and tested with YouTube Music 9.40.51.

## Origin Island music card (YouTube)

Makes the OriginOS music card work with YouTube the way it does with the music apps vivo
supports:

- the heart button likes the video that plays, and shows if it is liked
- the captions of the video are shown as synced lyrics
- the playlist shows what plays next, and plays the video that is tapped: the videos of the
  playlist or mix a video is played from, or otherwise the video autoplay continues with
  and the videos YouTube suggests for the video
- a video that was closed in YouTube stays on the card, paused where it was closed. The play
  button plays it again from there, also while YouTube is not in view, and the heart button
  still likes it

### Using it

1. Add this patch source to Morphe Manager, next to the official Morphe patches:
   https://morphe.software/add-source?github=JacksonJones2003/origin-island-patches
2. Patch YouTube in Expert mode, and enable **Origin Island music card** on the tab of this
   source together with the Morphe patches you normally use.
3. Restart the phone once after installing. The card only looks for apps that support these
   features when it starts.

YouTube has to be signed in, since it does not accept likes otherwise.

The captions shown are the ones in the language of the phone, if the video has them, and
otherwise the ones YouTube would show, which can be made by speech recognition. A video
without captions has no lyrics. The card reads the time of a line with two digits for the
minutes, so the lyrics end after 100 minutes of a video.

### How it works

The card finds YouTube the same way as YouTube Music, through the action the patch declares
on the media browser service of YouTube. The session of YouTube tells less than the one of
YouTube Music, so the patch reads the rest from inside the app:

- which video plays: the session does not tell. The media session callback of YouTube reads
  the id of the video to rate it, which the patch makes a getter of
- heart button: YouTube likes the video for a thumb rating, so the heart rating sent by the
  card is turned into one. If a video is liked is kept by YouTube in an entity of its own,
  which the patch reads as YouTube reads or changes it
- lyrics: the player response of a video lists its caption tracks. The patch loads the track
  from the address in that list, the way YouTube does to show captions, and sends the lines
  to the card in the LRC format
- playlist: the watch next response of a video has its playlist, the video autoplay
  continues with and the videos YouTube suggests. The card is answered with these, and the
  video that is tapped is played from its address, as YouTube does for a voice assistant
- a closed video: YouTube has nothing to play or to like once a video is closed, and answers
  the play button with an error. The patch keeps the metadata of the video on the session,
  with a paused playback state, plays the video again from its address, and has YouTube like
  the video by its id. YouTube opens to play a video from an address unless it plays in the
  background already, which Android does not let an app do that is not in view, so the patch
  has YouTube play the video without opening then

Tested with YouTube 21.38.123.

## Lyrics in player (YouTube Music)

Shows the line of the lyrics that is sung in the player, between the cover and the title:

- a new line rises into place as the line before it rises away, and each word fills with
  light and lifts a little as it is sung
- until the first line is sung, who wrote the song is named, or the artist if that is not known
- a line that does not fit in one row is wrapped, and drawn smaller if it does not fit in two

The player is given more room below the cover for the line, taken from the room above the
cover and below the controls, so that the cover keeps its size.

The lyrics are those of the **Third-party lyrics** patch of Morphe, which has to be applied
and enabled, and only lyrics with the time of each line can be shown. Words are only brought
out one by one for lyrics that have a time for each word, which depends on where that patch
found them. That patch keeps the lyrics it found for a song on the device, so after its
sources are changed, its stored lyrics have to be cleared for a song to be looked up again.

### How it works

The line is a view of its own that is added to the player from the main activity, found by
the names of the views of YouTube Music, so that nothing of the player has to be patched.
YouTube Music places the cover and the title by moving them, so the line is placed in the room
between them every time the player is drawn, and fades with the title as the player is pulled
down. The room is made by changing the sizes of the resources YouTube Music lays out the
player with. The position of the song is read from the media session.

## Origin Island music card (LastWave)

Makes the OriginOS music card work with LastWave the way it does
with the music apps vivo supports:

- the cover, the song and the playback controls are shown
- the loop mode button switches between repeat all, repeat one and shuffle. LastWave can repeat
  and shuffle at the same time, which the card has no mode for, so each turns the other off
- the heart button likes the song, and is filled when the song is in the liked songs of LastWave.
  Liking it in LastWave fills it on the card as well
- the playlist shows the queue, and plays the song that is tapped
- the lyrics LastWave loads for the song are shown, line by line
- on LastWave 5.0.0 and later, the favorites and download lists LastWave has for the card stay available

The patch also lets LastWave play a song asked for by voice when Android Auto prepares it before
playing it, which LastWave ignored. Gemini only asks the music apps it works with for a song, so
in the car it starts LastWave, but only plays a song asked for by name in apps such as YouTube Music.

LastWave is installed from its own APK, so the patched LastWave is signed by Morphe Manager and
not by its developers. The first time it is installed, the LastWave that was installed before has to
be uninstalled, which removes its library, playlists and settings from the phone. Updates of
LastWave are then installed by patching them as well. Restart the phone once after installing,
since the card only looks for apps that support these features when it starts.

### How it works

The patch declares the action the card looks for on the media browser service of LastWave, answers
the card when it connects, and adds to the metadata what the card may show and control. It only hooks
calls of the Android framework, which have the same names in every version of LastWave, except for
the heart.

Since version 5.0.0, LastWave answers the card itself: it declares the action, and has the heart, the
loop mode button and the favorites and download lists. The patch leaves the heart and those lists to
LastWave there, which also mirrors a like to YouTube Music, and adds the lyrics, the covers and the
fix for voice searches. The rest of this section on the heart is about the versions before that.

LastWave keeps its liked songs in a manager that it toggles a like with in a coroutine. Its classes are
obfuscated, so the patch finds the manager, the toggle and how a coroutine is started by the text they
log and by how they call each other, and the heart of the card toggles the like the same way the heart
of LastWave does.

The lyrics are taken as the player of LastWave keeps the lyrics it loaded for the song that plays,
and are given to the card as LRC once the card has that song.

The card draws the cover from the image in the metadata, but prefers the address of the cover, and
can only read that address from files of the device. LastWave gives the cover by its address on the
web, so the card is given the cover as an image without its address. The cover is loaded from its
address, since the image LastWave gives the session may only stand in for it while it loads.

## Origin Island music card (Apple Music)

Makes the OriginOS music card work with Apple Music the way it does with the music apps vivo
supports:

- the cover, the song and the playback controls are shown
- the heart button favorites the song, and is filled when the song is a favorite
- the loop mode button switches between repeat all, repeat one and shuffle
- the playlist shows the queue, and plays the song that is tapped
- the favorites list shows your favorite songs, the songs you starred, newest first
- the download list shows **All Downloads**, your downloaded playlists and your downloaded albums
- synced lyrics are shown, looked up on [LRCLIB](https://lrclib.net), as Apple Music keeps its own
  lyrics to itself. The title, artist, album and length of each song are sent there

The patch does not get past any checks of Apple Music, and adds nothing but the above. This was
tested with Apple Music 7.0.0 on one phone, and Apple can change how the app treats a patched copy
at any time.

### Using it

The patched app is signed by you and not by Apple, so the Apple Music that was installed before
has to be uninstalled first. **That removes your downloaded songs and settings from the phone**, and
you have to sign in again. Your library and playlists are kept by your account.

Apple Music on the phone comes as a split APK, so patch the full set of its parts. Restart the phone
once after installing, since the card only looks for apps that support these features when it starts.

Playing a song from the favorites or download list replaces the queue. The card only connects to the
app once it plays or a control of the card is pressed, so the playlist button stays dimmed until then,
also while Apple Music is closed. Pressing play on the card starts the music and connects it.

The favorites list reads names of Apple Music 7.0.0 that are obfuscated, so it is expected to stop
working with other versions, and then shows the playlist of favorites as one entry. The list stops at
300 songs.

### How it works

The patch declares the action the card looks for on the media session service of Apple Music, answers
the card when it connects, and adds to the metadata what the card may show and control. If a song is a
favorite, and the repeat and shuffle modes, are only told by the icons of the custom actions of the
session. Apple Music only takes those actions from Android Auto and its own notification, but takes a
rating, which toggles the favorite, and the modes of the media library from any app.

The download list comes from the tree Apple Music keeps for Android Auto, which it lets itself browse,
and which it plays from the media ids. The tree has no list of favorites, so these are asked of the
library the way Apple Music does for its own suggestions. Loading can take longer than the card waits,
so the lists are loaded when the card connects and are kept.

## Jovi voice requests (Apple Music)

> **This needs a small companion app as well as the patched Apple Music.** Jovi only sends songs to a
> few music apps it knows by their package, so the companion app is installed under the package of
> QQ Music (`com.tencent.qqmusic`). It plays nothing itself: every song plays in Apple Music.

Lets the Jovi voice assistant of vivo play a song asked for by voice, such as
"play Money for Nothing by Dire Straits on QQ Music", in Apple Music.

### Using it

1. Patch Apple Music with **Origin Island music card**, as above. The patched app takes the requests.
2. Download `jovi-stand-in.apk` from the [latest release](../../releases/latest) and install it. It
   shows up as **Jovi voice requests**, and opening it opens Apple Music.
3. Ask Jovi for a song "on QQ Music". Jovi may ask you to confirm before it plays.

vivo can warn about the companion app as it is installed, since it has the package of QQ Music without
its signature; keep the app to use it. The real QQ Music and the copy of YouTube Music for Jovi
cannot be installed next to it, as they use the same package.

Apple Music has to be running, open or in the background. When it is swiped away from the recent
apps, vivo stops it, and Android does not let another app start a stopped app again. Lock Apple Music
in the recent apps to keep it running, or ask Jovi to open it first.

### How it works

Jovi asks QQ Music for songs through the interface QQ Music has for other apps: it binds a service of
QQ Music, says hi, searches for what was asked for, plays a song of the results by its id, and waits
to be told that it plays. The companion app answers a search with what was asked for as the only song.
Jovi puts the singer and the name of the song together without a space, so they are split where a
lowercase letter is followed by a capital one.

vivo does not let an app in the background connect to another app, which the companion app is when
Jovi asks it, so it sends the song to Apple Music in a broadcast, which Android delivers even to an app
in the background. The patched Apple Music only takes it from the companion app, which shares who it is
with the broadcast, and searches for the song and plays it, with the singer and the name of the song
as well, so its search finds the right one. Pausing, resuming and skipping by voice go the same way.

The companion app is built from [`jovi-stand-in`](jovi-stand-in) with
`gradle -p jovi-stand-in assembleRelease`.

## Jovi voice requests (YouTube Music)

> **You need two YouTube Music apps for this.** Keep YouTube Music installed under its own
> package, patched, and install a second, patched copy next to it under the package of QQ Music
> (`com.tencent.qqmusic`). Jovi only sends songs to a few music apps it knows by their package,
> so this only works in the copy. With the copy for the music card as well, that is three:
> YouTube Music, the copy for the card and the copy for Jovi.

Lets the Jovi voice assistant of vivo play a song asked for by voice, such as
"play In the Air Tonight by Phil Collins on QQ Music", in a copy of YouTube Music.

### Using it

1. Add this patch source to Morphe Manager, next to the official Morphe patches.
2. Patch YouTube Music in Expert mode with **Jovi voice requests**, which turns on **Origin Island
   music card** as well, and set the **Package name** option of the **Clone app** patch to
   `com.tencent.qqmusic`. Leave the **Package name** option of Origin Island music card on **Keep**.
3. Install the copy next to YouTube Music, open it, and sign in. The copy plays the songs
   itself, so it has its own sign-in, cache and downloads.
4. Allow the copy to start by itself in its battery or app settings. vivo does not let other apps
   start an app that is closed unless it is allowed to, so Jovi cannot reach the copy otherwise.

vivo can warn about the copy as it is installed, since it has the package of QQ Music without its
signature; keep the app to use it. The real QQ Music cannot be installed next to the copy.

While the copy plays, the music card and Origin Island show it as they show QQ Music: the card asks
the copy for the song, its cover, whether it plays and how far, its lyrics, the playlist, the
favorites and downloads lists, the heart and the play mode, which the copy answers from YouTube
Music. The playlist is the queue, the favorites list has the playlists of the library, and the
download list has the downloads of YouTube Music under its own package if it is patched as well,
which then plays them, or otherwise the downloads of the copy.

Jovi puts the singer and the name of the song together without a space, so a space is put back
where a lowercase letter is followed by a capital one. What Jovi heard is what is searched for.

### How it works

Jovi asks QQ Music for songs through the interface QQ Music has for other apps: it binds a
service of QQ Music, says hi, searches for what was asked for, plays a song of the results by
its id, and waits to be told that it plays. The patch gives YouTube Music that service, which
only answers in a copy under the package of QQ Music. It answers that no authorization is
needed, answers a search with what was asked for as the only song, and has YouTube Music play
that from a search, as it does for a voice assistant. YouTube Music only plays from a search
for clients it knows, which it tells from the controller of each command to its session, so
commands of the copy itself are taken as commands of Android Auto. Jovi is told once the song
plays, with the events of the interface.

## Comments under the video (YouTube)

In the wide layout of YouTube, as on an opened foldable phone held sideways, the comments of a
video open over the suggested videos, and the space under the title and buttons stays empty.
The patch shows the comments in that space instead:

- the comments open under the title and buttons as a video is opened, where their teaser was,
  and the suggested videos stay in view next to them
- scrolling there scrolls the comments, and the title and buttons stay on the screen
- dragging the header of the comments up expands them over the title and buttons, and dragging
  it down brings those back
- closed comments stay closed until another video is opened
- the description and the other panels of a video open under it as well

The comments are opened by their teaser, which is found by the word "Comments", so they only
open by themselves while YouTube is in English.

### How it works

The watch page lays out its parts itself: it measures each for its space, places it there with
an offset, and clips it there as it draws it. The patch has the panels measured, placed and drawn
for the space under the player instead, ends them at the bottom of the screen, and keeps the
suggested videos shown and undimmed while a panel would cover them.

## Pause on fold (YouTube, YouTube Music, LastWave)

Pauses what plays when a foldable phone is closed, the way a laptop does when its lid is closed.
Playing on the cover screen of a closed phone is not paused, only closing it.

### How it works

Foldable phones report the angle between their halves with a hinge angle sensor of Android.
While a session of the app plays, the patch listens to it, and pauses the session once the angle
drops below 15 degrees after it was above 45. The sensor only reports as the angle changes, and
it is not listened to while nothing plays.

## Building locally

Requires JDK 17+, the Android SDK, and a GitHub token with the `read:packages` scope
set as `gpr.user` / `gpr.key` in `~/.gradle/gradle.properties`
(see the [Morphe patcher setup](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment)).

- Run `./gradlew buildAndroid`
- The built patches file is found in `patches/build/libs/patches-*.mpp`
- Add it to Morphe Manager as a local patch source, or apply it with
  [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop)

## License

Licensed under the [GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE) for the
additional terms inherited from the Morphe patches template.
