# Personal Niagara Weather

Use your own OpenWeather API key in Niagara Launcher **1.16.28, build 1634**.
An independent community patch source compatible with Morphe, maintained by rokuOP.

## Add to Morphe

[Add Personal Niagara Weather to Morphe](https://morphe.software/add-source?gitlab=rokuOP/personal-niagara-weather)

Or open Sources → + → Remote in Morphe and paste:

```text
https://gitlab.com/rokuOP/personal-niagara-weather
```

Choose the original Niagara APK, select **Personal OpenWeather**, then patch and install.
Optionally select **Install alongside Niagara** to keep the original app installed.
Open Niagara's widget settings → Weather and enter your OpenWeather key and city.

## Features

- Supplies your personal OpenWeather data to Niagara's native date row and forecast popup.
- Celsius/Fahrenheit selection, and Save & test weather.
- Saved key encrypted using Android Keystore; no API key is embedded in the patch.
- Optional separate package and app name for installation alongside the original launcher.

Uses standard current weather and five-day/three-hour forecast endpoints. Minute-by-minute rain data is not provided by these endpoints. Unrelated membership features are unchanged.

## Build

Use JDK 21, SDK platform 35 and Build Tools 36.0.0. Set JAVA_HOME and ANDROID_HOME.
The public-source composite build avoids a GitHub account or GitHub Packages token;
see [public-source instructions](docs/PUBLIC-SOURCE-BUILD.md).

```powershell
.\gradlew.bat buildAndroid '-PmorphePluginSource=C:\dev\morphe-gradle-plugin' '-PmorphePatcherSource=C:\dev\morphe-patcher'
```

Output: `patches/build/libs/patches-VERSION.mpp`, using the configured project version.

## Development and releases

Work on **dev** and use semantic commit messages: `feat:`, `fix:`, or `chore:`.
GitLab CI builds the bundle and runs semantic-release using the adapted template
configuration in `.releaserc`:

- Feature and fix commits on dev produce pre-releases.
- Chore commits still compile but do not publish a release by themselves.
- Merge dev into main with a merge commit, without squashing, for a stable release.
- The release job builds the exact version, checks Morphe metadata compatibility,
  generates the changelog, patch list, source metadata, and README patch list,
  commits those generated files, and publishes an MPP plus checksum as GitLab release assets.
- Stable releases are merged back into dev automatically.

Do not manually edit, stage, or commit generated `patches-list.json`,
`patches-bundle.json`, `CHANGELOG.md`, the generated README section, or checksums.
Do not upload release bundles by hand, rewrite release commits, or move released tags.
Fix a broken release with a new fix commit and a new version.

The pipeline uses this project's temporary CI_JOB_TOKEN, with project-local Git
push enabled, rather than a stored personal token. See
[release setup and template adaptations](docs/RELEASES.md).

The old bundles/patches-1.0.2.mpp snapshot is retained only to keep existing source
links working during migration. New versions are published as release assets.

### Generated patch list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.4](https://gitlab.com/rokuOP/personal-niagara-weather/-/releases/v1.0.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Niagara Launcher&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.16.28 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Install alongside Niagara](#install-alongside-niagara) | Give the patched app a separate name and package. Keep the original installation and its settings. |  |
| [Personal OpenWeather](#personal-openweather) | Use your own API key in Niagara's weather display, with modern private key settings. Supports 1.16.28 / 1634. |  |

</details>

<!-- PATCHES_END -->

## License and credits

Based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).
Retain LICENSE and NOTICE when redistributing. This project is not affiliated with the Niagara or Morphe developers. See [verification notes](docs/VERIFICATION.md).
