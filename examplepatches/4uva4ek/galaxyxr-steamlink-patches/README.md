# Galaxy XR Steam Link Patches

4uva4ek's independent Steam Link patch source for [Morphe](https://morphe.software).
This repository has its own history, releases and update URL. It does not merge or
automatically follow XR Porting Hub. It contains only the existing author
features listed below and their required helpers.

[**Add this source to Morphe**](https://morphe.software/add-source?github=4uva4ek/galaxyxr-steamlink-patches)

Alternatively, add `4uva4ek/galaxyxr-steamlink-patches` as a GitHub source in
Morphe Manager, or import `patches-1.1.0.mpp` from [Releases](https://github.com/4uva4ek/galaxyxr-steamlink-patches/releases).
The update manifest is [patches-bundle.json](https://raw.githubusercontent.com/4uva4ek/galaxyxr-steamlink-patches/main/patches-bundle.json).

## Patches

| Patch | Default | Exact build codes |
|---|---|---|
| Controller velocity frame | On | All seven below |
| Controller pose extrapolation | Off | All seven below |
| Controller pose time (experimental) | Off, 5 ms | All seven below |
| Controller throw angle (experimental) | Off, 13 degrees | 5002363, 5002395, 5002527 |
| Controller tracking from the controller HAL through Shizuku | Off | All seven below |
| Controller grip haptics through Shizuku | Off | All seven below |
| Galaxy XR SteamVR driver (galaxyxr) | Off | All seven below |
| OpenXR CPU and GPU BOOST (experimental) | Off | All seven below |

Supported package: `com.valvesoftware.steamlinkvr` (arm64 native payloads).

| Version | Exact version codes |
|---|---|
| 2.0.20 | 5001712, 5001812 |
| 2.0.21 | 5001968 |
| 2.0.22 | 5002244 |
| 2.0.23 | 5002363 |
| 2.0.24 | 5002395, **5002527 beta** |

Keep compatibility checks enabled. A matching version name alone is insufficient.
Other codes, including 5002389, are not declared compatible.

## Using the source

Use Morphe Manager 1.30.0 or newer. Choose your exact Steam Link APK and this
source's patches. The beta already has native Android XR support.
This source intentionally does not provide the launch/Android XR port required
by older Quest-only APKs, or image, codec, face, resolution or network patches.
Earlier versions retain their controller support and may need an independently
prepared working Android XR base.

The vendor-driver patch requires the PC-side **Galaxy XR VRLink Setup** with
the `galaxyxr` resource driver. It sets HMD/controller names and resource paths,
keeps the VRLink-required `oculus_touch` controller type and hand suffixes, and
preserves the calibrated grip defaults: position `-0.7,0.279,-5.279` cm and
rotation `1.4,0,0` degrees. It directly edits existing config entries, including
the legacy fallback, without importing upstream launch or identity patches.

BOOST requests OpenXR CPU/GPU performance hints. Runtime acceptance does not
prove higher clocks or frame rate; no new beta runtime measurement is claimed.

Do not select the same controller feature from another source at the same time.
Do not stack equivalent KernelSU controller modules and APK layers.
Pose time rejects HAL tracking and extrapolation. Throw angle requires velocity
frame and rejects HAL tracking. Shizuku features require Shizuku running and
permission granted; otherwise they preserve stock tracking/haptics.

To remove an APK patch, repatch a preserved original without that feature and
replace the modified app. Rebooting does not remove a patch embedded in an APK.
The bundle itself is inert until used by Morphe.

## Validation

See [validation](docs/VALIDATION.md). Packaging and host patch application are
verified separately from headset gameplay. No new beta gameplay or throwing
measurement is claimed. Runtime-sensitive layers retain their existing firmware
and code guards; current checked firmware is I610UEU2AZF3.

## Build

Requires JDK 21. The framework versions are pinned: Morphe Gradle plugin 1.3.4,
patcher 1.13.0. They are build dependencies, not upstream patch sources.

For a source-based build without a GitHub Packages personal token:

```powershell
python -B tools/prepare_dependencies.py
$env:MORPHE_GRADLE_PLUGIN_SOURCE=(Resolve-Path '../build-dependencies/morphe-patches-gradle-plugin').Path
$env:MORPHE_PATCHER_SOURCE=(Resolve-Path '../build-dependencies/morphe-patcher').Path
# The framework requires nonempty values even with source dependency substitution.
$env:GITHUB_ACTOR='local'
$env:GITHUB_TOKEN='local-source-build'
.\gradlew.bat :patches:test :patches:buildAndroid :patches:generatePatchesList
```

Or omit the two source overrides and configure GitHub Packages credentials using
`GITHUB_ACTOR` and `GITHUB_TOKEN` (read:packages).
Build output and project caches live in `../builds/galaxyxr-steamlink-patches/`.
Tracked native libraries and DEX helpers are pinned by tests; corresponding
sources and rebuild instructions are under `extensions/`.

Releases are explicit workflow dispatches. Change `version` in `gradle.properties`,
then run the Release workflow. It builds the bundle and catalogs, writes the
matching update manifest, commits metadata, tags, and uploads that same artifact.
No APK or private device data is published.

## Credits and license

Controller, vendor-driver identity and BOOST work: **4uva4ek**. See [CREDITS](CREDITS.md) for retained integration and
dependency attribution. GPLv3; [LICENSE](LICENSE) and [NOTICE](NOTICE).
