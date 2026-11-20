# Ben Thamizha Morphe patches

An independent Morphe patch bundle for the **Ben Thamizha** Android app.

## Install in Morphe Manager

Click **Add to Morphe**, or add this repository as a GitHub patch source:

<a href="https://morphe.software/add-source?github=MuguDEV/ben-thamizha-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Repository URL: `https://github.com/MuguDEV/ben-thamizha-patches`

## Included patch

<!-- PATCHES_START -->
> **[v1.0.0](https://github.com/MuguDEV/ben-thamizha-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Ben Thamizha&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.ben.thamizha`

**🎯 Supported versions:**

| 1.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ad checks](#disable-ad-checks) | Disables native and JavaScript ad-block detection without changing playback or navigation. |  |

</details>

<!-- PATCHES_END -->

### Disable ad checks

Targets `com.ben.thamizha` version `1.0` and:

- disables the native ad-block check entry point;
- makes the advertising-domain connectivity test return `false`;
- suppresses the blocking warning dialog;
- removes the WebView JavaScript ad-element check while preserving the normal `onPageFinished` call.

This patch changes checks implemented in the APK. Ads or behavior delivered remotely by the website may change independently.

## Build

Requirements: JDK 21 and GitHub Packages credentials configured for Morphe's registry.

```bash
./gradlew buildAndroid
```

The bundle is created under `patches/build/libs/` as an `.mpp` file.

## Test status

The patch bundle has been compiled with Morphe Patcher 2.4.0 and successfully applied to the supplied Ben Thamizha 1.0 APK with Morphe Desktop. Install and runtime testing must be performed on an Android device.

## Development and releases

- Work on `dev` for prereleases and merge into `main` for stable releases.
- Use semantic commits such as `feat:`, `fix:`, and `chore:`.
- The included release workflow builds the bundle, updates Morphe metadata, publishes the `.mpp`, and creates provenance attestations.
- Do not manually edit `CHANGELOG.md`, `patches-list.json`, or `patches-bundle.json`.

## License

Licensed under [GNU GPL v3.0](LICENSE). This project is independent and does not imply authorship or endorsement by the Morphe project or the Ben Thamizha app developer.
