# Soundsync

Keeps video in sync with the sound from the car when you watch on your phone over **wireless Android Auto**, or even when using the patched apps while inside of Android Auto.

Connecting to Wireless Android Auto and playing media - the sound plays noticeably later than the phone expects, and video players don't
know about the extra delay, so lipsync is off and sounds are not in sync with video. Soundsync is a
[Morphe](https://morphe.software) patch source with one universal patch, **Android Auto audio sync**,
that makes an app's video player hold the video back by your delay. The sound itself is untouched,
and it adds no noticeable battery use.

It works with apps whose video player uses Android's standard audio output. Tested to apply to
YouTube, Instagram, Facebook and Reddit.

## Using it

1. In Morphe Manager: **Add patch source → Remote**, and paste this repository's address.
2. Patch an app as usual, with its normal patch source too. In **Expert mode**, under
   **Universal patches**, tick **Android Auto audio sync** and set the delay (750 ms is a good start, this can be adjusted later).
3. Install the **SoundSync app** from the [latest release](../../releases/latest). Set the delay
   there and add its quick-settings button, which opens a small −/+ panel over a playing video.

By default the delay applies only while the phone is connected to Android Auto.

## What it can't fix

SoundSync changes how an app's own video player keeps time, so it only helps apps that play video
with a player built into the app. It can't help with:

- **Apps that play video through a built-in web page**, such as CarStream, CarTube and YouTube
  inside Fermata. Their sound goes through Android's web viewer, which isn't part of the app and
  can't be patched.
- **Apps with their own sound engine**, such as VLC. Many of these have their own audio delay
  setting; use that instead.
- **Screen-mirroring apps**, such as Screen2Auto. They show another app's screen, so patch the app
  that's actually playing the video (YouTube, say), not the mirroring app.

**Checking an app:** the patch log in Morphe Manager says *Redirected N AudioTrack position calls*
when SoundSync found something to adjust. If it shows a warning that nothing was found, the app plays
sound another way and the patch won't change anything.

**Before installing:** a patched app is signed differently from the original, so the original has to
be uninstalled first. Export its settings or data beforehand if you want to keep them.

## How it works

Players decide when to show each video frame by asking Android how much sound has been played
(`AudioTrack.getTimestamp()` and `getPlaybackHeadPosition()`). The patch redirects those calls in
the patched app so the answer is your delay smaller, and the player waits for the car. Video-call
code (WebRTC) is left alone. The SoundSync app shares the delay through a read-only content provider
and needs no permissions.

## Layout

- `patches/`: the patch (Kotlin, [Morphe patcher](https://github.com/MorpheApp/morphe-patcher))
- `extensions/extension/`: code added to the patched app (Java)
- `companion-app/`: the SoundSync app
- `.github/workflows/build.yml`: builds everything; a new version in `gradle.properties` publishes
  "Soundsync vX" and updates `patches-bundle.json`

Based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).
Licensed under GPLv3.
