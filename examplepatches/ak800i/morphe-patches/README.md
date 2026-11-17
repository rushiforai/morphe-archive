# ak800i patches

Morphe patches for various apps. Each app has its own section below.

| App | Patches |
| --- | --- |
| [MiXplorer](#mixplorer) | [Fix scoped-storage file sharing](#fix-scoped-storage-file-sharing) |
| [Waze](#waze) | [Voice pack import and export](#voice-pack-import-and-export) |

## How to use these patches

Click the button below, or add this repo URL to Morphe Manager by hand: https://github.com/ak800i/morphe-patches

<a href="https://morphe.software/add-source?github=ak800i/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.1](https://github.com/ak800i/morphe-patches/releases/tag/v1.1.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 MiXplorer&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.mixplorer`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix scoped-storage file sharing](#fix-scoped-storage-file-sharing) | Hides unreadable _data filesystem paths from external apps for single-file and multi-file shares, preserving content URI access and same-app queries. |  |

</details>

<details open>
<summary>📦 MiXplorer Beta&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.mixplorer.beta`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix scoped-storage file sharing](#fix-scoped-storage-file-sharing) | Hides unreadable _data filesystem paths from external apps for single-file and multi-file shares, preserving content URI access and same-app queries. |  |

</details>

<details open>
<summary>📦 Waze&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.waze`

**🎯 Supported versions:**

| 5.27.5.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Voice pack import and export](#voice-pack-import-and-export) | Adds Import and Export buttons to the custom voice screen, so custom voices can be shared as zip files of MP3 prompts. |  |

</details>

<!-- PATCHES_END -->

## MiXplorer

Patches for MiXplorer, stable (`com.mixplorer`) and beta (`com.mixplorer.beta`), on Android 11
or later. They used to be published separately as
[mixplorer-patches-for-morphe](https://github.com/ak800i/mixplorer-patches-for-morphe), which is
no longer updated. The patch name is unchanged, so you can switch to this source without
changing your patch selection.

This project is not affiliated with MiXplorer. No modified MiXplorer APK is distributed.

### Fix scoped-storage file sharing

Some apps, such as Telegram, fail to receive files shared from MiXplorer, especially several
files at once. MiXplorer tells them the file's filesystem path (the `_data` column), which they
are not allowed to read under scoped storage, instead of making them use the shared
`content://` link. This patch hides that path from other apps, so they fall back to the link.

- **Provider fix:** A small check is added to `FileProvider.query()`. When another app asks for
  `_data`, it gets an empty value. When MiXplorer itself asks, it still gets the path. File
  names, sizes, MIME types and the `content://` links stay the same.
- **Signing support:** MiXplorer checks its own signing certificate when it starts and quits if
  the app was re-signed. The patch adds the certificate of the installed app to MiXplorer's
  allowed list. It does not fake the developer's signature or change Android's signature
  checks. Morphe adds this part automatically.

Only two existing classes change. No permissions, resources or user interface are added.

#### Compatibility and tested input

The patch is offered for any version of the two packages on Android 11 or later. If a version
changes the code that the patch edits, patching stops with an error before anything is changed.
Don't use a patched APK after such an error.

These inputs were tested on a Galaxy A71 (Android 13):

| Edition | Package | Version | ARM64 build | SHA-256 of the original APK |
| --- | --- | --- | --- | --- |
| Stable | `com.mixplorer` | 6.71.15 | 26090422 | `bc2627659872cfc9895155d129c03eb8ac2b3c112cbdbe7303feb718f10c83f0` |
| Beta | `com.mixplorer.beta` | 6.71.15-BETA | 26090412 | `62b0f397ee751e90b5b0f619004dff2c39ba466a5fe5d2f8ae1a23413cf8ff98` |

The stable APK is `MiXplorer_v6.71.15_B26090422-arm64.apk` from the
[official download folder](https://drive.google.com/drive/folders/1Rj8kOmcZwXkWhjQI48wBd21v7yG73x7D).
The beta is the [official beta APK](https://mixplorer.com/beta/MiXplorer_v6.71.15-BETA_B26090412-arm64.apk).
MiXplorer Silver and other package names are not supported.

#### Before you install

**Back up first.** Android won't install a re-signed APK over the official MiXplorer of the same
edition. Export your settings (Settings > More settings > Export) and keep important files
outside MiXplorer's private storage. Then uninstall that edition, install the patched APK, and
restore your settings. Keep your Morphe signing key, because later patched updates must be signed
with the same key.

#### Verification

- Nine unit tests cover the patch name, the compatibility rules, unusual register layouts,
  missing or duplicate matches, and refusing to patch twice. They run on every build.
- On the stable APK, shared files keep their name, size, MIME type and read permission, and the
  received content matches the original byte for byte. Single-file and two-file shares were
  tested. Details are in [mixplorer/evidence/patched-two-files.json](mixplorer/evidence/patched-two-files.json).
- MiXplorer's own queries still see the real paths:
  [mixplorer/evidence/internal-query.txt](mixplorer/evidence/internal-query.txt), from the
  instrumentation test in [mixplorer/device-tests](mixplorer/device-tests).
- After the move to this repository, the patched stable APK was compared with the APK from the
  last separate release (0.2.2). The changed classes are identical, and the app starts normally.

Uploads in the live Telegram app were not tested.

## Waze

Patches for Waze (`com.waze`). You can apply them together with
[bearinmind patches](https://github.com/bearinmindcat/morphe-patches) to the same Waze. Tested with
bearinmind patches 2.10.0 and all of its Waze patches that are on by default.

### Voice pack import and export

Waze lets you record your own voice for navigation prompts (Settings > Voice & sound > Voice >
Record a new voice). This patch adds two buttons at the top of that recording screen:

- **Import pack** opens a voice pack (`.zip`, or a `.tar.gz` as Waze itself shares) and puts its prompts on the screen. This replaces any
  prompts that are already on the screen. Then tap **Done** and save the voice as usual. The
  name field is filled in from the pack. If you import while editing an existing voice, the
  voice keeps its current name.
- **Export pack** saves the prompts on the screen as a zip file. To export a voice that you
  already have, open it from the voice list (edit or view it), then tap **Export pack**.
  Import is not shown for voices that you can only view.

Waze still saves, uploads and shares the voice itself. The patch only fills or reads the
prompts on the recording screen.

#### Zip structure

```
My voice.zip
├── voicepack.json     optional metadata
├── StartDrive1.mp3    one file per prompt, named <promptId>.mp3
├── TurnLeft.mp3
├── TurnRight.mp3
└── ...
```

Import is lenient:

- Prompt files can be at the top of the archive or in any folder inside it.
- Prompt ids are matched without regard to case, so `turnleft.mp3` works.
- Files whose names are not Waze prompt ids, files that are not `.mp3`, and empty files are
  skipped. The patch shows how many files it skipped.
- You don't need every prompt. Waze only requires at least one recording. Prompts without
  a recording use the fallback voice that you choose in Waze.
- Each prompt can be at most 8 MB.

Import also reads the `.tar.gz` voice packs that Waze uses when it shares a custom voice, for
example `996e7c80-7922-4b5e-93b3-39beff864f3c.tar.gz`. They hold the same `<promptId>.mp3` files,
plus Waze sound effects that are skipped, and a `metadata.json` whose `set_name` fills in the
voice name. Plain `.tar` files work too. You don't need to repack them as a zip.

The audio can be any format that Android's media player can play: MP3, or AAC/M4A. Waze's own
recordings are AAC audio in files that end in `.mp3`, so exported packs contain those files
unchanged. Keep each prompt short, because Waze plays it in the middle of navigation. The
recording screen shows the maximum length for each prompt.

#### Prompt ids

The patch reads the list of prompt ids from Waze when it runs, so it always matches the
installed Waze version. The safest way to get the exact file names is to record one prompt,
export the voice, and look at the zip.

Waze 5.27.5.0 has these 43 prompt ids:

| Category | Prompt ids |
| --- | --- |
| Start of a drive | `StartDrive1` … `StartDrive9` |
| Distances (imperial) | `200`, `400`, `800`, `1500` (a tenth, a quarter, half a mile, one mile) |
| Distances (metric) | `200meters`, `400meters`, `800meters`, `1000meters`, `1500meters` |
| Instructions | `KeepLeft`, `KeepRight`, `TurnLeft`, `TurnRight`, `ExitLeft`, `ExitRight`, `Straight`, `uturn`, `Roundabout`, `AndThen`, `Arrive` |
| Roundabout exits | `First`, `Second`, `Third`, `Fourth`, `Fifth`, `Sixth`, `Seventh` |
| Alerts | `Police`, `ApproachAccident`, `ApproachHazard`, `ApproachTraffic`, `ApproachRedLightCam`, `ApproachSpeedCam` |
| Other | `TickerPoints` |

Waze shows only the metric or the imperial distances, depending on your units setting. If a
later Waze version changes the list, export a voice to see the new names, or run
`adb logcat -s WazeVoicePack` while you tap Import or Export; the patch logs the full list.

#### voicepack.json

The metadata file is optional. Export always writes it.

```json
{
  "format": "waze-voicepack",
  "version": 1,
  "name": "My voice",
  "createdAt": "2026-11-16T12:43:30Z",
  "app": { "package": "com.waze", "version": "5.27.5.0" },
  "prompts": ["StartDrive1", "TurnLeft", "TurnRight"]
}
```

| Field | Meaning |
| --- | --- |
| `format` | Always `waze-voicepack`. If it is present with another value, the import is refused. |
| `version` | Version of this format, currently `1`. A newer version is still imported, with a warning. |
| `name` | Name of the voice. Import uses it to fill in the name field (Waze allows 40 characters). Without it, the zip's file name is used. |
| `createdAt` | When the pack was exported, in UTC. Informational. |
| `app` | The Waze package and version that exported the pack. Informational. |
| `prompts` | The prompt ids in the pack. Informational; import uses the `.mp3` files that are actually in the zip. |

## Development

- Build with `./gradlew build`. The patch bundle is written to `patches/build/libs/patches-*.mpp`.
  The build needs a GitHub token that can read packages, as described in the
  [Morphe patcher setup guide](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment).
- Apply the bundle with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop):
  `java -jar morphe-desktop-all.jar patch -p patches/build/libs/patches-<version>.mpp waze.apkm`
- Each app has its own package under [patches/src/main/kotlin/app/ak800i/patches](patches/src/main/kotlin/app/ak800i/patches),
  and unit tests go under [patches/src/test/kotlin](patches/src/test/kotlin). `./gradlew build` runs them.
- Code that runs inside an app goes in its own module under [extensions](extensions). The Waze code is in
  [extensions/waze/src/main/java/app/ak800i/extension/waze](extensions/waze/src/main/java/app/ak800i/extension/waze).
- Use [semantic commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index)
  messages (`feat:`, `fix:`, `chore:`); the release workflow builds the changelog from them.

## License

GPLv3. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
