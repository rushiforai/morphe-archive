# Changelog

## Unreleased

## 0.2.0 (2026-11-13)

### Features

* `Open on Home` (on by default) starts PineDrama on the Home tab every time. It used to open on Discover for some accounts.

### Changes

* Retargeted to PineDrama 47.7.3 (version code 2024707030). All the patches apply to it, and every patch that hooks the app's own code was checked again against 47.7.3's code. 47.6.3 isn't a target anymore, so update PineDrama before you repatch.

## 0.1.1 (2026-11-07)

### Bug Fixes

* Saved posts opened from Favorites play in your Dub priority language. The post's page doesn't list the video's dubs, so it used to switch the audio back to the original. Right after PineDrama started, a dub request could also get lost before the audio tracks loaded.

## 0.1.0 (2026-11-07)

### Features

* `Episodes in full screen` is new. Swipe up for the next episode and down for the previous one in PineDrama's full screen view, and an episode that ends moves on to the next instead of looping. Leave full screen and the portrait player is on the episode you stopped at. It's on by default, with a switch under Playback.
* `Keep list position` is new. History and Favorites on your profile hold your place when you switch tabs or come back from a video, and a list you haven't scrolled still shows what you just watched. It's on by default.
* `Subtitle and dub preference` is new. Give Playback an ordered list of subtitle languages and another for dubs, like `en, original`. Force subtitle and Force dub use the first one a video has, while Force original subtitle and Force original dub keep the video's own track. When nothing on your list exists, PineDrama's own pick plays as usual. Feed filter can also hide videos without one of your subtitles or dubs, and on Mini Drama a page it would empty keeps one video so there's still something to swipe from. A dub language counts only when the video has a dubbed track in it, since subtitles in your language don't mean a drama is spoken in it. Everything here starts off.

### Changes

* The bundle is built on Morphe patcher 2.3.0 now, the one that comes with Morphe Manager 2.5.0 and Morphe Desktop 2.1.0. Update Manager to 2.5.0 or newer before you add this release, since older Manager builds can't load it.
* Retargeted to PineDrama 47.6.3 (version code 2024706030). All the patches apply to it. Every patch that hooks the app's own code was checked again against 47.6.3's code.
* Auto-advance no longer depends on a panel check 47.6.3 dropped, and the streak button patch lets go of a getter the new build removed.
* The Feature Gate Lab's Manage topics and More hashtags per post presets are gone, and AI Self sets one rule fewer. PineDrama 47.6.3 took those gates out of the app.

### Bug Fixes

* What's new shows up again on a PineDrama you first patched with Hushfeed's bundle. The version you'd dismissed there was higher than HushPine's, so the row stayed hidden.
* Picking another language on PineDrama's App language page and tapping Done switches the app's language again. PineDrama waited on a Play Store language download that a patched copy never gets, so nothing changed.

## 0.0.1 (2026-11-01)

### Features

* HushPine starts here. The PineDrama patches used to ship inside Hushfeed's bundle, and they now live in their own repo with their own bundle and signing key. Your settings and saved data carry over when you move from Hushfeed's patches.
* Press and hold any tab at the top of the feed to open HushPine's settings. It used to work on one tab only, and PineDrama's server decides which middle tab you get, so the shortcut could disappear.
* Latest first on Following now leaves alone what you've already scrolled past. It used to reorder the whole list each time PineDrama read it.
* New saves go to `DCIM/PineDrama` by default instead of `DCIM/TikTok`. A folder you picked yourself stays as it is, and files you've already saved don't move.
* Settings no longer describe buttons and rows PineDrama doesn't have. The story save rows are gone, and so are the Balance and TikTok Minis rows for the profile menu, since PineDrama's gear goes straight to Settings and privacy.

