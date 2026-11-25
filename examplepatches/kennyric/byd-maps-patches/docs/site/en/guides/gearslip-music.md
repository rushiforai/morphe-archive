# More music players in Gearslip

Gearslip has its own music browser and player panel. A compatible music app can supply folders, artwork and playback controls while your map stays open. Some apps already connect; others restrict their browser to Android Auto and need a patch in the music app as well as the Gearslip launcher fix.

## Choose your player

| Music app | What to apply | What to expect |
| --- | --- | --- |
| [YouTube Music / YT Music Morphe](../apps/youtube-music.md) | **Android Auto** from Morphe Patches, plus **Gearslip music browser support** from Dutch App Patches, together on the original YouTube Music APK | Personal Home and Library through the existing signed-in account. There is one Gearslip patch to select; its library support is included. |
| [Myspoti](../apps/myspoti.md) | **Allow any Android Auto host** from Dutch App Patches, on the original publisher-signed APK | The app's existing Home, Library and Downloads, search and music selection. Sign in on the phone first. |
| SoundCloud | Gearslip's existing player; no SoundCloud patch from this project is required for the panel | Artwork and playback controls were checked in the official Gearslip phone preview. Browse content and extra controls depend on the app. |
| Another music app | Try its existing car/media browser first | Compatibility depends on what the app exposes. A working notification or phone player does not establish a browseable personal library in Gearslip. |

The YouTube Music compatibility entry is **Any** only when its required structures are recognized. The complete combined workflow was checked with YouTube Music 9.30.53 and Morphe Patches 2.0.0; Morphe's Android Auto patch must also support your selected version. Myspoti patching/rebuilds were checked with 2.2.0 and 2.3.0, with user-confirmed Gearslip operation on 2.2.0. See the app pages for current targets and test limits.

## 1. Prepare Gearslip

Patch the [official Gearslip APK](../apps/gearslip.md) with **Keep music player entries**. When a music app also advertises a car Settings service, this keeps one functional player tile and removes the unusable Settings tile. It does not add a media browser to the music app.

**Hide apps from drawer** is optional. On the phone, open Gearslip's **Car → Apps** card and keep your player ticked. A hidden app stays installed. Existing pinned navigation-bar tiles are separate from the drawer selection.

The music and drawer patches support Gearslip 0.3.12-alpha and 0.3.31-alpha. Use the app page's exact input and signing guidance when updating.

## 2. Prepare the music app

For YouTube Music, select the original `com.google.android.apps.youtube.music` APK in Morphe. Combine the two patches listed above in one attempt; do not use an already renamed YT Music Morphe APK as the input. For Myspoti, select the publisher-signed original and apply its one Gearslip patch.

The **Trusted Gearslip and DriveDeck packages** option defaults to Gearslip and DriveDeck, including their development builds: `app.seb3thehacker.gearslip`, `app.seb3thehacker.gearslip.dev`, `app.johninnl.drivedeck` and `app.johninnl.drivedeck.dev`. A patched Gearslip that keeps its package uses the same setting. If Manager shows only `app.seb3thehacker.gearslip`, reset the option to its default before patching. Add a different package only if you intentionally use a renamed host. The music patches check that the actual Android caller owns the configured package.

Install your result with the same signing key as the existing patched copy when updating. A publisher-signed installation cannot accept an update signed with a different key. Preserve its account and data; follow the [installation and signing guide](install.md#4-install-and-update) before replacing anything.

Open the music app on the phone, sign in if required and check that it can play a track. These compatibility patches do not supply an account, subscription or access to unavailable content.

## 3. Open and dock the player

1. Open Gearslip's car launcher or phone preview and choose your music app.
2. Open a folder or search where supported, then start a track.
3. Return to your map.
4. Tap the dock button at the right end of the navigation bar's now-playing pill. Gearslip places its player panel beside the map. Its existing player setting controls left/right placement.

Playback controls, shuffle, repeat, likes and catalogue contents depend on the music app. Playback can work while browsing is still restricted or incomplete; check the folders and personal content you use as well as Play/Pause.

## If something is missing

| Symptom | Check |
| --- | --- |
| Player is absent from the drawer | Keep it ticked in **Car → Apps**, then reopen the car screen. Check that the music app has a compatible car/media browser. |
| Music app has a second Settings icon | Update patched Gearslip with **Keep music player entries** enabled. |
| YouTube Music plays but Home or Library is empty | Check that both required patches were applied together, that you used the original APK and that the phone app is signed in. Host admission alone does not populate a personal library. |
| Myspoti cannot be browsed | Apply **Allow any Android Auto host**, sign in and keep the app's supported-version limits in mind. |
| No panel beside the map | Start playback in Gearslip's player, return to the map and use the dock button in the now-playing pill. |

**SoundCloud in Waze** and **YT Music Morphe in Waze** are separate patches for Waze's built-in audio player. They are not required for Gearslip's panel, and their browse contents differ from the personal-library integrations above.

SoundCloud's panel has phone-preview evidence. YouTube Music has combined patching and browser-folder checks; signed-in catalogue contents and playback still need checks on your setup. Myspoti's device acceptance currently covers 2.2.0. A physical car display is a separate check from the phone preview.
