# Spotify Scroll Lock Patches (for Morphe)

One patch: **Now Playing scroll lock**.

It adds a small padlock button to Spotify's Now Playing screen.

- **Locked (green 🔒):** the screen can't scroll up to the song info, credits or lyrics cards. Swiping left or right on the cover art still changes the song. Locking also jumps the screen back to the top.
- **Unlocked (grey 🔓):** Spotify works as normal.
- **Tap** the button to toggle it. **Drag** it to move it somewhere else. The app remembers both the lock state and where you put the button.

## How it works

The Now Playing screen sits inside one vertical scroll container. That container "steals" a swipe as soon as it looks more vertical than horizontal. The patch hooks three methods on that container:

- `onInterceptTouchEvent`
- `onTouchEvent`
- `onStartNestedScroll`

These are Android framework method names, so Spotify's code obfuscation does not rename them. While the lock is on, the container only ever sees a cancelled gesture and never claims a touch. That leaves every swipe to the cover art carousel. The button is a plain view drawn on top of the screen. The patch adds no resources.

## Step 1: Find the scroll container class (only if auto-detect fails)

By default the patch tries to auto-detect the container. It looks for a view class with `nowplaying` in its package and `Scroll` in its name.

- If it finds **several**, patching fails with a list of them. Pick one and set the patch option.
- If it finds **none**, find the class yourself:
  1. Turn on USB debugging. Open Spotify (the original, unpatched app) and go to Now Playing.
  2. Run `adb shell dumpsys activity top > top.txt`.
  3. In `top.txt`, find the view hierarchy. Look for the large view that fills the screen under the header and holds the cover art, controls and info cards. It usually has `scroll` in its class or id. Copy its full class name.
  4. You can confirm it in [jadx](https://github.com/skylot/jadx). Open the APK, find that class, and check that it extends a scroll view, `NestedScrollView`, `RecyclerView` or similar.

Then set the patch option **`scrollViewClass`** to that class name. In Morphe Manager, use the patch's options screen. On the command line, use:

```
java -jar morphe-desktop-*-all.jar patch -p patches-*.mpp \
  -O scrollViewClass=com.spotify.example.NowPlayingScrollView spotify.apk
```

(Run `morphe-desktop ... patch --help` to check the option flag for your CLI version.)

## Step 2: Build

Requirements: JDK 17+, the Android SDK (set `sdk.dir` in `local.properties` or `ANDROID_HOME`), and a GitHub personal access token with `read:packages`. You need the token because the Morphe patcher is published on GitHub Packages. Put it in `~/.gradle/gradle.properties`:

```
gpr.user=YOUR_GITHUB_USERNAME
gpr.key=ghp_yourtoken
```

Then run:

```
./gradlew :patches:buildAndroid
```

The output is `patches/build/libs/patches-<version>.mpp`.

## Step 3: Patch

- **Morphe Manager:** add the `.mpp` file, or your GitHub repo, as a patch source. Select Spotify and pick the APK.
- **Morphe Desktop/CLI:** `java -jar morphe-desktop-*-all.jar patch -p patches-*.mpp spotify.apk`

Uninstall the Play Store Spotify first, because the patched app is signed with a different key.

## Files

- `patches/src/main/kotlin/app/template/patches/spotify/nowplaying/NowPlayingScrollLockPatch.kt`: the bytecode patch (finds the class, hooks its constructors and touch methods).
- `extensions/extension/src/main/java/app/template/extension/spotify/NowPlayingScrollLockPatch.java`: the runtime logic (lock state, button, gesture blocking).
- `patches/src/main/kotlin/app/template/patches/shared/Constants.kt`: the Spotify compatibility entry. Add the exact version you tested.

## Troubleshooting

- **The button never appears:** the wrong class was hooked. Recheck Step 1.
- **The button shows on other screens:** the auto-detected class is used elsewhere too. Set `scrollViewClass` to the more specific Now Playing class.
- **The screen still scrolls when you swipe on a list inside the info cards:** that list is driving the scroll through androidx nested scrolling, which uses obfuscated method names. Open an issue with the class names from `dumpsys`.

Licensed GPLv3 (inherited from the Morphe patches template).

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.4](https://github.com/sujaan13/spotify-scroll-lock-patches/releases/tag/v1.0.4)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**1 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Spotify**](PATCHES.md#spotify-comspotifymusic) | 1 | — | [`com.spotify.music`](https://play.google.com/store/apps/details?id=com.spotify.music) |
<!-- PATCHES_END -->
