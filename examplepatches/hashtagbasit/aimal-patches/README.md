# Aimal Patches

A small bundle of [Morphe](https://morphe.software) patches for four streaming
apps, all of it aimed at one thing: giving the player back the controls the app
decided you did not need.

Speed. Aspect ratio. Subtitles you can actually read. On Viki, also the ads and
the comments panel that eats a third of the screen when you unfold a phone.

| App | Package | Built against |
| --- | --- | --- |
| Crunchyroll | `com.crunchyroll.crunchyroid` | 3.117.0 |
| HBO Max | `com.wbd.stream` | 7.9.0.84 |
| Disney+ | `com.disney.disneyplus` | 26.14.1+rc2-2026.08.20 |
| Viki | `com.viki.android` | 26.5.0 |

Every fingerprint matches on structure or on names the apps cannot obfuscate,
so newer builds are expected to work and are offered as experimental targets.

`com.wbd.hbomax` is the Android TV build of HBO Max and is a different app.
These patches target the phone and tablet builds.

### What this bundle does not do

Nothing here touches DRM, licensing or entitlement. Viki's ad patch flips the
same no-ads flag the app already flips for a Viki Pass subscriber, and stops
there; rentals and subscriber-only titles behave exactly as before.

There was briefly an HD unlock for Viki. It was removed in v1.1.0-dev.9 once it
became clear it did nothing — Viki builds the rendition ladder server-side, so
forcing the client's entitlement changes the quality label and not one pixel of
the picture. The reasoning is written up in `viki/Fingerprints.kt` so nobody
adds it back.

## Install

[**Add this bundle to Morphe Manager**](https://morphe.software/add-source?github=hashtagbasit/aimal-patches)

Or add it by hand: Manager → patch sources → add source →
`https://github.com/hashtagbasit/aimal-patches`

With Morphe Desktop:

```
java -jar morphe-desktop-*-all.jar patch -p https://github.com/hashtagbasit/aimal-patches app.apkm
```

All four apps are distributed as split bundles (`.apkm`); Manager and Desktop
merge them for you.

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/hashtagbasit/aimal-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 Crunchyroll&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 3.117.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Aspect ratio control](#aspect-ratio-control) | Adds a Fit/Stretch toggle to the player. |  |
| [Playback speed](#playback-speed) | Unhides the player's speed menu and fills it out to 0.5x-2.0x. |  |
| [Subtitle styling](#subtitle-styling) | Adds subtitle size, font and outline controls to the player. |  |

</details>

<details open>
<summary>📦 HBO Max&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.9.0.84 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Playback speed and aspect ratio](#playback-speed-and-aspect-ratio) | Adds a floating panel to change playback speed and stretch, crop or zoom the picture. |  |

</details>

<details open>
<summary>📦 Disney+&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 26.14.1+rc2-2026.08.20 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Playback speed and aspect ratio](#playback-speed-and-aspect-ratio) | Adds a floating panel to change playback speed and stretch, crop or zoom the picture. |  |

</details>

<details open>
<summary>📦 Viki&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 26.5.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Playback speed and aspect ratio](#playback-speed-and-aspect-ratio) | Adds a floating panel to change playback speed and stretch, crop or zoom the picture. |  |
| [Remove ads](#remove-ads) | Removes pre-roll and mid-roll video ads, and the display banners. |  |
| [Use the whole screen for video](#use-the-whole-screen-for-video) | Hides the comments panel beside the player on tablets and unfolded foldables. |  |

</details>

<!-- PATCHES_END -->

&nbsp;
## How it works

**Crunchyroll** gets app-specific treatment, because it already has most of
this built and switched off. A playback-speed menu sits behind a feature flag
with a table that stops at 1.0x, so one patch forces the flag true and widens
the table. Aspect ratio and subtitles ride on a small chip row added to the
player when it attaches to the window — deliberately self-contained, because
tying it to the app's own show/hide callbacks broke on 3.117.0 when those
stopped firing.

Crunchyroll's subtitles are the interesting one. They are rendered natively by
libass straight into bitmaps, so by the time anything reaches a View there is no
text left to restyle. The entire ASS script does pass through one method as a
String on its way into the library, though, and ASS carries its styling as plain
text — so the script is rewritten in flight and libass renders the result. The
catch is that it only takes effect when a track loads, which is why the chips
say so when you tap them.

**HBO Max, Disney+ and Viki** share a single patch. All three play through
androidx.media3, so instead of fingerprinting three different player UIs it
injects two instructions — one handing the extension an application context, one
in the player constructor to capture the ExoPlayer — and does everything else at
runtime: the video surface is found by walking the view tree, speed goes through
media3's `setPlaybackSpeed`, and the picture is reshaped through
`AspectRatioFrameLayout.setResizeMode`. A floating panel over the player carries
the controls; it dims and collapses a few seconds after you stop touching it, and
can be dragged out of the way.

Because none of that depends on any app's layouts or class names, one patch
covers three apps that share nothing but their media stack, and it should
survive most app updates.

Viki is the exception that proves the rule: it strips media3's `Player`
interface down so far that no `(float)` method survives on it at all, so
`setPlaybackSpeed` simply is not there. The extension falls back to building a
`PlaybackParameters` and calling the setter that takes one, both found by shape
rather than by name. The patch never has to know.

**Viki's ads** are two independent systems — IMA video ads with Amazon header
bidding in front, and a Google Ad Manager banner — and both consult the same
entitlement, so one hook silences both. A second hook forces
`VideoFragment.shouldShowAds()` false directly, which matters because the
coroutine that fetches the ad tag is launched inside that method's true branch:
with it false, nothing is ever sent to doubleclick.net or to Amazon's bidder.

**Viki's full-screen patch** exists because Viki calls anything wider than 600dp
a tablet, which an unfolded foldable is, and then puts the player in a chain at
weight 0.65 with a comments panel at 0.35. Unfolding the device made the video
*smaller*. Hiding the panel is enough: ConstraintLayout drops GONE views from a
chain, so the player takes the full width. On a phone it is a no-op.

## Status

Crunchyroll and HBO Max are tested on device. Viki is built and verified
against 26.5.0 (versionCode 78800).

**Disney+ is written against a decompiled 26.14.1 but has not been run yet** —
the hooks it needs were verified in the bytecode, not in the app. Reports
welcome.

## Building

The Morphe Gradle plugin is published to GitHub Packages, which rejects
anonymous requests. For a local build, put a token with the `read:packages`
scope in `~/.gradle/gradle.properties`:

```properties
gpr.user = <github username>
gpr.key = <token>
```

Then:

```
./gradlew :patches:buildAndroid
```

The bundle is written to `patches/build/libs/patches-*.mpp`. CI needs no setup;
it uses the token GitHub provides to the workflow.

## Licence

GPLv3. Not affiliated with, endorsed by, or authored by the Morphe project.
