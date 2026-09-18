<!-- Accepted implementation plan. The user chose the repository slug
morphe-patches after this investigation. Historical findings below are
preserved; implementation evidence belongs in verification.md. -->

# Spotify Android patches for Morphe

Research completed on September 17, 2026.

A Spotify-focused Morphe patch repository is technically feasible. Start from
Morphe's official template and port a small set of Spotify customizations into
it. Existing source gives us useful starting points, but this investigation did
not establish a maintained collection that works on current Spotify phone
builds without adaptation.

My recommendation is a separate `spicetify/android-patches` repository, with
clean sharing links and basic theme colors as the first milestone. This is a
proposed name and scope, not a repository created by this investigation.

## Platform and distribution

Morphe patches Android APKs. This approach does not cover Spotify for iOS.
Its patcher changes Dalvik bytecode, Android resources, and other APK files.
Patches are normally Kotlin; Java or Kotlin extension code can be compiled to
DEX and injected into the app for runtime behavior. This is a separate
implementation from Spicetify's desktop JavaScript and CSS modules.
[Patcher overview](https://github.com/MorpheApp/morphe-patcher),
[patch anatomy](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_patch_anatomy.md).

The official Morphe bundle accepts work on YouTube, YouTube Music, and Reddit,
and explicitly directs other apps to third-party repositories. Its
[patch template](https://github.com/MorpheApp/morphe-patches-template) supplies
the build and release machinery for that route.
[Contribution scope](https://github.com/MorpheApp/morphe-patches#contributing).

Users add our repository as a source in Morphe Manager, select the Spotify
APK and patches, and install the result. Sources can be GitHub repositories
or bundle metadata URLs. A link such as
`https://morphe.software/add-source?github=spicetify/android-patches` would
open the source confirmation flow once the repository has a release.
[Source management](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md).

We can publish source, compiled `.mpp` bundles, and generated metadata.
There is no need to operate a replacement manager or distribute Spotify APKs.
Morphe Desktop also provides a CLI for repeatable patching and supports split
APK inputs. Manager documents merging APKM, APKS, and XAPK inputs too.
[Desktop documentation](https://github.com/MorpheApp/morphe-desktop/blob/main/docs/documentation.md),
[Manager patching guide](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-expert-mode.md).

## Reusable sources

The strongest candidates have actual implementation code. An old feature list,
a binary download, or a successful compilation is weaker evidence.

| Source | What is available | Assessment |
| --- | --- | --- |
| [Morphe template](https://github.com/MorpheApp/morphe-patches-template/tree/f99b2938bd25b202a6185a774d487a07d1061915) | Kotlin patch examples, fingerprints, an extension, metadata generation, and releases | Best foundation for a new repository. |
| [Historical anddea Spotify sources](https://github.com/anddea/revanced-patches/tree/3174510163d9787571bd93275b54932b575f82ed/patches/src/main/kotlin/app/revanced/patches/spotify) | Themes, share-link cleanup, branding, lyrics features, navigation changes, widget and login fixes | Best source of reusable customization implementations. These are historical ReVanced APIs and require a Morphe port. Current HEAD has no Spotify paths. |
| [cvnfork Spotify patches](https://github.com/cvnfork/morphe-spotify-patches/tree/289d59e2bdae0fa6f16ffa0e2769351be46a94e8) | Morphe settings, Home shortcut pinning, WebDAV/Nextcloud local files | Real Morphe code, but no releases or specific APK-version declarations. README declares GPL-3.0; tree lacks LICENSE and NOTICE files. Verify provenance before copying. |
| [rushiranpise patches](https://github.com/rushiranpise/morphe-patches) | Broad third-party Morphe collection | Useful project example. The inspected live tree contains no Spotify implementation. |
| [Spotify TV crossfade](https://github.com/ethan-manny/spotify-tv-crossfade/blob/main/docs/overview.md) | Morphe patch plus native audio library | Author reports testing Spotify TV 1.134.2 on Fire TV Stick 4K Max, 32-bit ARM only. Useful architecture reference, not a phone patch to import directly. |

The anddea source is pinned at
`3174510163d9787571bd93275b54932b575f82ed`. Its inspected theme and sharing
patches declare Spotify `9.0.90.1229`. That is a historical compatibility
declaration, not a recommendation to install that version today.
[Theme source](https://github.com/anddea/revanced-patches/blob/3174510163d9787571bd93275b54932b575f82ed/patches/src/main/kotlin/app/revanced/patches/spotify/layout/theme/CustomThemePatch.kt),
[sharing source](https://github.com/anddea/revanced-patches/blob/3174510163d9787571bd93275b54932b575f82ed/patches/src/main/kotlin/app/revanced/patches/spotify/misc/privacy/SanitizeSharingLinksPatch.kt).

The cvnfork revision is
`289d59e2bdae0fa6f16ffa0e2769351be46a94e8`, dated August 23, 2026.
Its README still links installation to `ImNoammm/morphe-spotify-patches`,
which returned 404 during this investigation. Its Home patch locates a
specific Spotify class and an obfuscated method. Declaring only the package
name does not establish compatibility with every version.
[README](https://github.com/cvnfork/morphe-spotify-patches/blob/289d59e2bdae0fa6f16ffa0e2769351be46a94e8/README.md),
[Home implementation](https://github.com/cvnfork/morphe-spotify-patches/blob/289d59e2bdae0fa6f16ffa0e2769351be46a94e8/patches/src/main/kotlin/app/noam/patches/spotify/home/HomePinsPatch.kt).

## Patch priorities and porting work

These priorities are engineering recommendations based on the inspected code.
They are not claims of current runtime support.

| Priority | Patch | Work needed |
| --- | --- | --- |
| First | Clean sharing links | Port the method fingerprint and small Java URL helper. Verify tracks, albums, playlists, and episodes still open correctly. |
| First | AMOLED/background and accent colors | Begin with a defined set of resources. Full theme coverage also needs hardcoded-color and animation hooks. Verify player, Home, library, settings, and dialogs. |
| Next | Custom app name and selected navigation controls | Reuse historical techniques after checking that the controls still exist and that hiding them remains useful. |
| Next | Shared settings and Home shortcut pinning | Resolve the cvnfork source provenance, then port its Spotify integration against the selected APK. |
| Later | Lyrics provider or lyrics search | Separate a simple external search action from replacing the in-app provider. Provider replacement adds service availability, request-header, and privacy work. |
| Later | WebDAV/Nextcloud local files | Larger feature involving credentials, indexing, content providers, streaming, seeking, caching, and failure recovery. |

The sharing patch calls a Java extension but does not declare its own
extension dependency in the inspected file. Extracting the Kotlin file alone
would be incomplete. Bundle the helper explicitly and verify the injected
method reference. The full theme patch similarly depends on a shared
extension, bytecode fingerprints, resource utilities, and optional icon assets.
[Sharing implementation](https://github.com/anddea/revanced-patches/blob/3174510163d9787571bd93275b54932b575f82ed/patches/src/main/kotlin/app/revanced/patches/spotify/misc/privacy/SanitizeSharingLinksPatch.kt),
[theme implementation](https://github.com/anddea/revanced-patches/blob/3174510163d9787571bd93275b54932b575f82ed/patches/src/main/kotlin/app/revanced/patches/spotify/layout/theme/CustomThemePatch.kt).

Morphe fingerprints identify methods through signatures, strings, and
instructions despite obfuscated names. Porting means adapting to the current
fingerprint and patch APIs, selecting the required dependencies, then checking
the target Spotify binary. Renaming imports or a bundle extension is not a
complete port.
[Fingerprint documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_1_fingerprinting.md).

Historical Premium patches also exist, but their own description excludes
server-side song downloads. Local entitlement changes do not demonstrate
current server acceptance. I would keep those out of the first milestone and
make customization the initial project promise.
[Historical implementation](https://github.com/anddea/revanced-patches/blob/3174510163d9787571bd93275b54932b575f82ed/patches/src/main/kotlin/app/revanced/patches/spotify/misc/UnlockPremiumPatch.kt).

## Build and release approach

Use the template at `f99b2938bd25b202a6185a774d487a07d1061915`, dated
September 10, 2026, as a reproducible starting reference. Its version catalog
uses Morphe Patcher `1.13.0`, its settings use the patches plugin `1.3.4`,
and its release workflow uses Java 21.
[Version catalog](https://github.com/MorpheApp/morphe-patches-template/blob/f99b2938bd25b202a6185a774d487a07d1061915/gradle/libs.versions.toml),
[Gradle settings](https://github.com/MorpheApp/morphe-patches-template/blob/f99b2938bd25b202a6185a774d487a07d1061915/settings.gradle.kts),
[release workflow](https://github.com/MorpheApp/morphe-patches-template/blob/f99b2938bd25b202a6185a774d487a07d1061915/.github/workflows/release.yml).

The template documents `./gradlew buildAndroid` and emits
`patches/build/libs/patches-*.mpp`. Keep its `dev` prerelease and `main`
stable release flow. Its automation updates the patch catalog, README,
changelog, and bundle metadata. Local dependency resolution can require
GitHub Packages credentials with `read:packages`.
[Template instructions](https://github.com/MorpheApp/morphe-patches-template/blob/f99b2938bd25b202a6185a774d487a07d1061915/README.md),
[release configuration](https://github.com/MorpheApp/morphe-patches-template/blob/f99b2938bd25b202a6185a774d487a07d1061915/.releaserc),
[environment setup](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md).

Keep Spotify-specific patches together, with a small extension for runtime
helpers. Record each imported file's upstream repository, revision, license,
and local changes. Avoid copying entire multi-app collections and their
unrelated dependencies.

## Licensing and naming

The template and historical anddea sources carry GPLv3. Reuse requires
preserving applicable notices, marking modifications, and making corresponding
source available for distributed binaries under the license's conditions.
Audit copied helpers and assets as well as the main patch file.
[Template license](https://github.com/MorpheApp/morphe-patches-template/blob/f99b2938bd25b202a6185a774d487a07d1061915/LICENSE),
[anddea license](https://github.com/anddea/revanced-patches/blob/3174510163d9787571bd93275b54932b575f82ed/LICENSE).

The template NOTICE requires distinct branding and permits Morphe references
as secondary compatibility descriptions. Use a name such as
"Spicetify Android patches" and describe it as compatible with Morphe.
The README's naming example is looser than the NOTICE; use the NOTICE as the
constraint when choosing the project name.
[Template NOTICE](https://github.com/MorpheApp/morphe-patches-template/blob/f99b2938bd25b202a6185a774d487a07d1061915/NOTICE).

The GPL on patch code does not license Spotify's application or establish
permission for every possible modification. A patch-only distribution avoids
shipping Spotify binaries, but is not by itself a legal clearance.

## What must be proven before release

The first release needs a real Android pass, starting from the same source-add
and APK-selection screens users will see. Keep build success, patch success,
installation, and runtime behavior as separate evidence.

1. Select a current stock Spotify build and record package, version name,
   version code, ABI, APK hash, Android version, and Morphe versions.
2. Build and inspect the bundle. Confirm Manager discovers only intended
   public patches and displays explicit supported app versions.
3. Patch each feature separately, then the default combination. Require
   informative failures for unmatched fingerprints or resources.
4. Install through Manager and test login, playback, queue, sharing, Connect,
   background playback, notifications, and the modified UI. Test widgets or
   Android Auto if the release claims support for them.
5. Test source updates, repatching, reinstalling with the same signing key,
   cancellation, unsupported APKs, and recovery to the stock client.

Signing is a material installation constraint. A normally installed patched
APK has a different certificate from stock Spotify, so using the original
package name requires uninstalling the stock app first and losing its local
app data. Later updates retain data when signed with the same key. Document
keystore backup and verify any proposed side-by-side package rename separately.
[Installation behavior](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-expert-mode.md),
[update and keystore behavior](https://github.com/MorpheApp/morphe-manager/blob/main/docs/updating-patched-apps.md).

The maintenance burden is concrete: historical reports show share fingerprints
and theme resource names breaking after Spotify changes. A passing patch job
must not automatically promote a new APK version to verified support.
[Sharing failure](https://github.com/anddea/revanced-patches/issues/1271),
[theme failure](https://github.com/anddea/revanced-patches/issues/1171).

## Exclusions and evidence limits

Some search results look more useful than their live sources support.

- SpotX is a desktop project. xManager publishes an installer, not the
  reusable Spotify patch collection this project needs.
  [SpotX Android discussion](https://github.com/SpotX-Official/SpotX/discussions/662),
  [xManager source](https://github.com/Team-xManager/xManager).
- The cached `wchill/anddea-rvx-morphed` feature list is a historical lead.
  Its live repository returned 404.
- The inspected `Diluc27/revanced-spotify-patches` tree contains a README and
  a binary bundle, without source or a license. The Spotify entries in
  `chirag127/morphe-patches` are explicitly stubs.
  [Binary-only candidate](https://github.com/Diluc27/revanced-spotify-patches),
  [stub declarations](https://github.com/chirag127/morphe-patches).
- Natoune's MIT-licensed lyrics API is archived, and its README says the old
  xManager patch script does not work on newer Spotify versions. Treat it as
  a protocol reference rather than a maintained service dependency.
  [Lyrics API](https://github.com/Natoune/SpotifyMobileLyricsAPI).
- The official ReVanced GitHub API returned HTTP 451 and linked a Morphe
  attribution complaint. That particular block is not evidence of a Spotify
  complaint, and no removal cause is inferred from a 404.
  [Linked notice](https://github.com/github/dmca/blob/master/2026/03/2026-03-12-morpheapp.md).

This investigation read source, metadata, documentation, and issue reports.
It did not build a patch bundle, obtain or modify a Spotify APK, test an
Android device, or create a GitHub repository. Current Spotify compatibility
remains unproven. The next useful experiment is one complete clean-sharing
patch applied and exercised through Morphe on a selected current build.
