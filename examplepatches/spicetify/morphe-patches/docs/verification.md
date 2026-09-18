# Verification record

The initial target is experimental. This record separates source checks from
patching, installation, and Android runtime evidence. Unchecked items remain
release blockers.

## Target and tools

The stock fixture was copied from an installed Android application on
September 17, 2026. Only APK files were copied, without account or app data.

| Field | Value |
| --- | --- |
| Package | `com.spotify.music` |
| Version | `9.1.80.2221` |
| Version code | `145767611` |
| ABI | `arm64-v8a` |
| Stock base APK SHA-256 | `3dc0c561236d4dc01c17acc12dd219914fa2de61992a3d1428ff6ee677cd45ee` |
| Stock signing certificate SHA-256 | `6505b181933344f93893d586e399b94616183f04349cb572a9e81a3335e28ffd` |
| Build JDK | Temurin 21 |
| Morphe Patcher | `1.13.0` |
| Morphe Gradle plugin | `1.3.4` |
| Morphe Desktop | `1.16.0` |

## Evidence

Static inspection found one current share URL builder with the expected
parameter signature and tracking strings. The historical `ShareUrl(url=`
constructor fingerprint no longer matches this build. All ten selected
theme resource names exist in the stock resource table.

The bundle builds with Java 21. Five Java URL tests, 22 Kotlin resource
cases, and three option-submission cases pass. Android extension lint passes.
Generated metadata contains exactly two public patches, with the expected
options, defaults, ARM64 version code, and experimental target.

Morphe Desktop 1.16.0 patched the sharing-only, theme-only, and combined
profiles successfully. Independent artifact checks verify 1,145 default
color entries and resource IDs. Theme profiles change the ten selected
colors; other default colors stay equivalent. Where resource rebuilding
relocates XML selectors, the checker compares decoded XML contents.
The sharing helper and its call appear exactly once when enabled and are
absent from the theme-only output. Android signature verification passes.
These runs use FULL bytecode mode. The input base APK hash is listed above.
The combined output rebuilt after the option-validation fix has SHA-256
`f82cfe6de544ffddd6c90f3addfe7360e22a2056a93e0a4e7c5fea73520bcbc7`.

Selecting the sharing patch for the unrelated Manager package applies zero
patches. Desktop still signs an unchanged output and returns success in that
case. A CLI exit code alone is insufficient; check the report's applied patch
names and run the artifact verifier.

An invalid color initially exposed Morphe's option setter retaining defaults
after validator errors. Commit `56c4cc0` moves format validation into patch
execution. The repeated CLI test now exits 1, reports the invalid format, and
produces no APK. Regression tests use Morphe's actual option setter for all
three fields.

A source review found a verifier gap: a same-name call with a mismatched
method descriptor could pass. Synthetic DEX tests reproduced that false pass.
The verifier now requires the exact String-to-String descriptor and a public
static helper. It accepts the valid fixture and rejects four malformed cases.

Initial Android 16 emulator startup was overloaded and showed a Spotify ANR.
Stock Spotify subsequently reached its welcome screen in the same emulator.
The combined patched APK installs and reaches the same welcome-screen
accessibility controls on a controlled retry. Hardware-rendered screenshots
showed a black app area. Restarting the emulator with SwiftShader and Vulkan
disabled restored visible Manager rendering. Spotify's welcome and login
controls respond through accessibility. Its login activity sets Android's
`SECURE` window flag, so black captures there do not prove a rendering bug.
Spotify's visual color checks and logged-in behavior remain unverified.

Morphe Manager 1.31.1 imports the Android bundle and lists both patches.
Enabling **Experimental app versions** makes Spotify visible. The default
flow accepts the stock split archive and starts the sharing patch. Cancelling
that job and confirming **Stop patcher** returns to the app list.

An earlier local import contained JVM classes without `classes.dex`, and
Manager reported zero patches. Replacing that stale file with the
`buildAndroid` output resolved it. A `.mpp` filename alone does not establish
Android compatibility.

## Published prerelease

[CI run 35241568299](https://github.com/spicetify/morphe-patches/actions/runs/35241568299)
passed tests, extension lint, bundle compilation, release, and attestation.
It published [v1.0.0-dev.1](https://github.com/spicetify/morphe-patches/releases/tag/v1.0.0-dev.1)
as a prerelease from source commit `22b1524`. Stable publishing remains gated.

[CI run 35247182789](https://github.com/spicetify/morphe-patches/actions/runs/35247182789)
also passes on `07fd462`. Both runs were explicitly dispatched. Subsequent
SSH pushes did not create Actions runs during this test, despite enabled
workflows and matching branch triggers. Automatic push-triggered release
admission remains unverified.

The downloaded `patches-1.0.0-dev.1.mpp` contains `classes.dex` and
`extensions/spotify.mpe`. Its SHA-256 is
`fec60b3452aa9af9f195d2ccc544015cc2f04444c7ef1352052507b2590d76fa`.
`gh attestation verify` succeeds for this file and repository. Manager downloads
this release from the following feed and lists both patches:

```text
https://raw.githubusercontent.com/spicetify/morphe-patches/refs/heads/dev/patches-bundle.json
```

The explicit `refs/heads/dev` URL keeps this feed on experimental releases.
Enable **Experimental app versions** in the source's controls to show Spotify.
The remote source was tested with the duplicate local source disabled.
In **Expert mode**, both patches were selected with default colors. Manager
merged the five stock splits, patched with its default **Fast** bytecode mode
and 896 MB process limit, and reported success. Its installation flow detected
the existing Desktop-signed test app, explained the certificate conflict and
data loss, and offered uninstall. After uninstalling that unauthenticated test
app, Android installed the Manager-built APK and Manager marked it installed.

The installed APK was copied back from the emulator and independently checked.
Its sharing call and helper, all 1,145 default colors and resource IDs, the ten
expected theme changes, and Android signing verification pass. Its SHA-256 is
`23dcb4098406f60c70bb6657f22ece21d524f6f36332afe0401e5f57f69b43b3`.
The Manager-built app reaches its welcome and login screens after an emulator
restart. A later source version update and same-key reinstall still need
verification.

## Runtime and release checklist

Use the normal Manager entry point before claiming release readiness.

- [x] Build the Android bundle and run all unit tests.
- [x] Inspect generated patch metadata and extension contents.
- [x] Patch sharing, colors, and their combination against the stock fixture.
- [ ] Check informative failures for unsupported inputs and invalid options.
- [x] Install and launch the output in a disposable Android environment.
- [x] Add the source in Manager and patch through its visible flow.
- [ ] Test login, playback, queue, Connect, background playback, notifications.
- [ ] Test sharing for tracks, albums, playlists, episodes, and timestamps.
- [ ] Check Home, library, player, settings, and dialog colors.
- [ ] Test source updates, same-key reinstall, cancellation, and stock recovery.
- [ ] Verify a push starts CI and prerelease automation for the expected commit.

No patched application has been installed on the source phone. No stable
compatibility claim is made from a successful build or static match.
