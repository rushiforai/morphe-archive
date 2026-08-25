# Aimal Patches

Morphe patches that give three streaming apps the two playback controls they
ship without: **playback speed** and **aspect ratio**.

That is the whole scope. There are no ad, tracker, region or unlock patches
here, and nothing in this bundle touches DRM, entitlement or licensing.

| App | Package | Built against |
| --- | --- | --- |
| Crunchyroll | `com.crunchyroll.crunchyroid` | any recent build |
| HBO Max | `com.wbd.stream` | 7.9.0.84 |
| Disney+ | `com.disney.disneyplus` | 26.14.1+rc2-2026.08.20 |

`com.wbd.hbomax` is the Android TV build of HBO Max and is a different app.
These patches target the phone and tablet builds.

## Install

[**Add this bundle to Morphe Manager**](https://morphe.software/add-source?github=hashtagbasit/aimal-patches)

Or add it by hand: Manager → patch sources → add source →
`https://github.com/hashtagbasit/aimal-patches`

With Morphe Desktop:

```
java -jar morphe-desktop-*-all.jar patch -p https://github.com/hashtagbasit/aimal-patches app.apkm
```

HBO Max and Disney+ are distributed as split bundles (`.apkm`); Manager and
Desktop merge them for you.

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.2](https://github.com/hashtagbasit/aimal-patches/releases/tag/v1.0.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Crunchyroll&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 3.117.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add fast playback speeds](#add-fast-playback-speeds) | Adds 1.25x, 1.5x, 1.75x, and 2.0x playback speed options. |  |
| [Aspect ratio control](#aspect-ratio-control) | Adds a Fit/Stretch toggle to the player. |  |
| [Enable speed control](#enable-speed-control) | Enables playback speed options (0.5x-2.0x) in the video player. |  |

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

<!-- PATCHES_END -->

&nbsp;
## How it works

**Crunchyroll** already has a speed menu behind a feature flag and a resize
mode it never exposes. Two patches flip the flag and widen the speed table; a
third adds a toggle button to the player overlay that cycles the resize mode,
appearing and disappearing with the app's own controls.

**HBO Max and Disney+** are handled by a single patch. Both play through
androidx.media3, so rather than fingerprinting two different player UIs it
injects two instructions — one to hand the extension an application context,
one in the player constructor to capture the ExoPlayer — and does the rest at
runtime: the video surface is found by walking the view tree, speed goes
through media3's `setPlaybackSpeed`, and the picture is reshaped through
`AspectRatioFrameLayout.setResizeMode`. A floating panel over the player
carries the controls; it dims and collapses a few seconds after you stop
touching it, and can be dragged out of the way.

Because none of that depends on either app's own layouts or class names, the
same patch covers both and should survive most app updates.

## Status

Crunchyroll and HBO Max are tested on device. **Disney+ is written against a
decompiled 26.14.1 but has not been run yet** — the hooks it needs were
verified in the bytecode, not in the app.

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
