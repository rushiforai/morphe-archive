# Waze System TTS Morphe Patch

This patch targets Waze `5.24.5.0` (version code `1030732`, package `com.waze`).

It adds an **Android system TTS** button to Waze's Settings screen. Enable **Use system voice for navigation** there. The setting is off by default; disabling it restores Waze playback.

The patch captures online navigation chunks, synthesises their text using Android's default `TextToSpeech` engine, and gives the resulting local audio to Waze's own player. This retains its mute checks, audio routing and completion callbacks. Street names are included when supplied in the chunk text. Keep a Waze voice with street-name support selected to request the corresponding navigation instructions.

Select **Voice & sound → Waze voice** and choose a voice marked **Including street names**. This requirement is also shown inside the system TTS settings window.

The Settings button also offers **Customize alert text**, **Test / status** and a shortcut to Android TTS settings. The searchable alert editor saves custom wording for recognised static phrases and provides **Reset to default** for each phrase. Identical default phrases share one override. Overrides apply to subsequent matching file, online and cached speech requests; already queued speech is unchanged. Dynamic templates, unrecognised audio and sound effects are not editable. Overrides are stored locally and require system TTS to be enabled. Restart Waze after changing the system engine or voice. The test button checks system speech; testing a real route is separately required to verify navigation interception.

The setting also covers file-based spoken prompts and cached TTS. The patch captures free-text requests and uses the APK's built-in phrase table for recognised prompt filenames, including speed bumps, school zones, police and railway crossings. That bundled fallback table is English; server-provided text retains its original language. Sound effects and phrases without identifiable text retain original playback. Unfilled templates are never spoken literally.

Cached TTS without a known text mapping is requested again once per process as needed, so that text can be captured. Synthesis errors fall back to original playback. The status dialog shows the last unmatched filename for troubleshooting; this can also be a normal beep or click. Device testing remains necessary to establish coverage of every alert; compilation alone cannot prove it.

## Build

The Morphe Gradle plugin is hosted in Morphe's GitHub Packages registry and may require the `GITHUB_ACTOR` / `GITHUB_TOKEN` credentials described by the Morphe development documentation.

From this directory:

```text
gradlew.bat buildAndroid
```

The resulting Morphe bundle is written to `patches/build/libs/`.

Commits using the `fix:` or `feat:` Conventional Commit prefixes trigger the GitHub Actions release workflow. A successful release publishes the `.mpp` bundle on the repository's Releases page.

## Apply

Use the generated `.mpp` with Morphe Desktop or add this repository as a Morphe patch source. Select `Use Android system TTS for navigation`, then patch the supplied APKM.

The output is a repackaged APK and must be installed as a separate signed build unless the same signing key is already used for the installed Waze package.

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/CasketPizza/morphe-waze-system-tts/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Waze&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 5.24.5.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Use Android system TTS for navigation](#use-android-system-tts-for-navigation) | Adds a system TTS control to Settings and replaces online navigation chunks using Android's default engine. |  |

</details>

<!-- PATCHES_END -->
