# YTM Extras Pitch

[Leggi in italiano](README.it.md)

A pitch patch for YouTube Music, compatible with [Morphe](https://morphe.software). This is an
independent project, not made or endorsed by the Morphe project or by Google.

**Supported version:** YouTube Music 9.30.53, built with Morphe Patcher 2.0.0.

## What it does

- Adds `-`, the current value and `+` to the player, below the shuffle button.
- Changes the pitch from -2 to +2 semitones in steps of 1, with the factor `2^(semitones/12)`.
- Does not change the speed.
- Uses the Sonic processor already in the app, at the sample rate the audio arrives with.
- At 0 the app receives its own values, so the audio is not processed.
- Keeps the value between tracks and after a restart.
- Adds a button to share the current track, below the repeat button.

The Pitch item in the Morphe settings opens a page with an On/Off switch that shows or hides the
controls. While it is off the audio is not processed, and the last value comes back when it is
on again. If the app does not have the Morphe settings, the item is in the YouTube Music settings.

If the official "Playback speed" patch is set to change the pitch with the speed, that option
can replace this one.

## Use with Morphe Manager

1. Open [Add to Morphe](https://morphe.software/add-source?github=AnTo88-svg/ytm-extras-pitch) on
   the phone, or add `https://github.com/AnTo88-svg/ytm-extras-pitch` as a patch source in
   Morphe Manager. You can also download the `.mpp` file from the releases and load it by hand.
2. Keep the official patches as a source too.
3. Select the original YouTube Music 9.30.53 APK and apply the patches.
4. To sign in, also apply the official "GmsCore support" patch.

## Build

You need JDK 21 or newer and the Android SDK with platform 36.

```bash
cd pitch
./gradlew buildAndroid
```

The result is in `pitch/patches/build/libs/`. The Morphe Gradle plugin is hosted on GitHub
Packages, so create a personal access token with the `read:packages` scope and add it to
`~/.gradle/gradle.properties`:

```properties
gpr.user = <GitHub username>
gpr.key = <token>
```

## License

[GNU General Public License v3.0](LICENSE) with the additional terms in [NOTICE](NOTICE).
This project starts from the Morphe patches template and follows code of the Morphe patches.
