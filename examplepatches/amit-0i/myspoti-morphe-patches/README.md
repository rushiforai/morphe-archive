# Credits

This project builds on the work of the following projects and their contributors:

- **[Morphe](https://github.com/MorpheApp)** — For providing the patching framework and tools that make Android app customization possible.
- **[Morphe Patches Template](https://github.com/MorpheApp/morphe-patches-template)** — For the original project structure and build configuration used as the starting point for this repository.
- **[MySpoti](https://github.com/kota-zo/myspoti)** — Thanks to kota-zo and the MySpoti contributors for developing the original Android application that this branding patch targets.

# MySpoti Spotify Branding Patch

A Morphe resource patch for the MySpoti Android app. It changes the Android launcher/display name to **Spotify**, then applies one shared Spotify logomark geometry across the launcher icon family, Android themed/monochrome icon, in-app logo previews, splash screen, widget launcher art, and notification icon.


## Branding coverage

- **Launcher icons**
- **Themed icons**
- **In-app previews and splash**
- **Widget and system notification**

## Supported package variants

- `app.myspoti` (beta/default builds)
- `app.myspoti.stable` (stable release builds)
- `app.myspoti.dev` (debug/dev builds)
- `app.myspoti.stable.dev` (stable debug/dev builds)

The patch uses resource-only changes and does not alter the package name, app logic, or sign-in/playback behavior.

## Available patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/amit-0i/myspoti-morphe-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 MySpoti&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spotify branding](#spotify-branding) | Renames MySpoti to Spotify and replaces every launcher, themed, supporter-preview, splash, widget, and notification mark with Spotify branding. |  |

</details>

<details open>
<summary>📦 MySpoti&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spotify branding](#spotify-branding) | Renames MySpoti to Spotify and replaces every launcher, themed, supporter-preview, splash, widget, and notification mark with Spotify branding. |  |

</details>

<details open>
<summary>📦 MySpoti dev&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spotify branding](#spotify-branding) | Renames MySpoti to Spotify and replaces every launcher, themed, supporter-preview, splash, widget, and notification mark with Spotify branding. |  |

</details>

<details open>
<summary>📦 MySpoti stable dev&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Spotify branding](#spotify-branding) | Renames MySpoti to Spotify and replaces every launcher, themed, supporter-preview, splash, widget, and notification mark with Spotify branding. |  |

</details>

<!-- PATCHES_END -->

## Build

Use Java 21 and the Gradle wrapper from this repository:

```bash
./gradlew buildAndroid
```

The patch bundle (`.mpp`) is written to `patches/build/libs/`.

Then add the `.mpp` bundle as a local patch source in Morphe Desktop / Morphe Manager and apply **Spotify branding** to a MySpoti APK. Use a normal install, not a root-mounted install, for branding changes to take effect.

### Trademarks and Disclaimer

Spotify and its logo are trademarks of their respective owner and are used here solely to identify the branding customization provided by this patch.

This is an independent, community-made project. It is not affiliated with, endorsed by, or officially associated with Morphe, the MySpoti developers, or Spotify.

Thank you to all the developers and contributors whose work makes projects like this possible.
