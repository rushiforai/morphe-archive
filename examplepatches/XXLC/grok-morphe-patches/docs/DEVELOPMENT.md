# Development

## Architecture and patch targets

The three public bytecode patches are enabled by default and share the app target
in [Compatibility.kt](../patches/src/main/kotlin/io/github/xxlc/patches/grok/Compatibility.kt):
`ai.x.grok` **1.2.53-release.00**, versionCode **11253200**, with `.apkm` input.
Sources are in [patches/grok](../patches/src/main/kotlin/io/github/xxlc/patches/grok).

The method names and descriptors below come from `Fingerprints.kt` and the Kotlin
injections. Roles assigned to obfuscated classes describe their use by these
patches; they are inferred from the source, not original xAI class names or an
independent verification of the APK at runtime.

### Bypass license check

`LicensePatch.kt` makes the static method
`Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V`
return immediately. This Pairip class is not an obfuscated Grok class; its
fingerprint also checks for the string `LicenseClient`.

### Download all (post)

`PostDownloadAllPatch.kt` adds a public boolean field `b` to `Le7/s0;`, the download
action used by the patch, to distinguish Download all from the original Download.

| Modified method | Role and injected behavior |
| --- | --- |
| `Le7/s0;->equals(Ljava/lang/Object;)Z` | Download action equality: return false when two download actions have different `b` flags, otherwise continue with the original comparison. |
| `Lf60/q;->u(La7/tb;)Ljava/util/List;` (static) | Post menu builder: copy the menu list and insert an action with `b = true` after Download, or at the end if Download is absent. |
| `Lg60/me;->d(Le7/h1;)Lfb/a;` (static) | Menu label mapping: substitute the shared Download all string ID when the download action has `b = true`. |
| `Ly9/o2;->z0(Le7/h1;Lr7/u1;Ly2/de;)Ljava/lang/Object;` | Post action handler: when `b` is set, iterate the post's media and dispatch downloads for the other items; the current item continues through the original path. |

The post handler obtains the post through `Ly9/o2;->p0()Li7/i;` and its media
through `Li7/i;->d()Ljava/util/List;`. It skips the current item by object identity
or equal media identifiers, and creates `Lwb/x0;` coroutine callbacks with
discriminator `0x1b` for the remaining items. These methods and the callback
constructor are referenced by the injected code, not modified by this patch.

### Download all (library)

`LibraryDownloadAllPatch.kt` adds a separate button and includes
`extensions/extension.mpe` through `extendWith`.

| Modified method | Role and injected behavior |
| --- | --- |
| `Ldb/q1;->invoke()Ljava/lang/Object;` | Click dispatcher: handle discriminator `0x7f` before the original packed switch, set the extension flag and invoke the existing download action. The original Download branch clears the flag. |
| `Leb/b;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;` | Library button rendering: add Download all after the existing Download button, reusing the layout and enabled state. |
| `Ln6/k;->y(Ljava/lang/Object;)Ljava/lang/Object;` | Selection processing: when the action is Download and the extension flag is set, create a `La7/b1;` download request for each media item in each selected post, then advance to the next post. Clear the flag at the reset point. |

`La7/o0;->a` identifies the existing library download action. The patch uses
discriminator `0x7f` because `0x1d` is already used. Neither `La7/o0;` nor the
`La7/b1;` request constructor is modified.

### Shared resources and extension

Both download patches depend on `DownloadResourcesPatch.kt`, an unnamed internal
resource patch that does not appear as a separate choice in Morphe Manager. It
adds `grok_imagine_post_download_all` to `res/values/strings.xml` as `Download all`
and to `res/values-vi/strings.xml` as `Tải tất cả`. `PublicXmlManager` allocates the
public string ID used by the bytecode injections.

[DownloadAllState.java](../extensions/extension/src/main/java/io/github/xxlc/extension/grok/DownloadAllState.java)
contains the static boolean `all` used by the library patch. It is an in-memory
flag, not a persisted preference. The post patch uses the action's `b` field
instead of this extension flag.

## Supporting a new Grok version

Fingerprints pin the obfuscated classes, method signatures and instruction
patterns of **1.2.53-release.00**. They are not version-independent lookups.
Changing the supported version alone is insufficient.

1. Decode a lawfully obtained new app version with apktool and inspect its smali
   and resources, including the relevant splits when starting from `.apkm`.
2. Find equivalent methods using the strings, resource names, opcodes and
   references in `Fingerprints.kt`: for example `LicenseClient`, `VideoDownload`,
   `grok_media_action_save`, `listOfNotNull` and the library packed switch.
3. Recheck control flow, register allocation, fields, constructors and callback
   discriminators. Update fingerprints and every affected injected reference;
   obfuscated names can change between releases.
4. Update `Compatibility.kt` only after confirming the new package, version,
   versionCode and input format against the patch targets. Have CI build the
   bundle, then verify patching and behavior on a device, including both original
   Download actions and the two Download all actions.

`BytecodeChecks.kt` provides patch-time guards for total register counts, the
registers used at insertion points, and unique opcode/reference matches. The
patches also check selected return and branch instructions. These checks reject
some incompatible bytecode layouts; compilation alone does not exercise them
against an APK or prove runtime behavior.

Injected smali with internal labels must use `addInstructionsWithLabels`, or
`addInstructionsAtControlFlowLabel` when existing branch-target labels must be
preserved at the insertion point. Plain `addInstructions` only handles internal
labels correctly at index 0. Morphe Patcher does not verify DEX by default during
patching, so label errors may only surface on a device. After generating a new
APK, inspect the branch targets in every modified method.

## Build and validation

Use GitHub Actions for builds; do not run Gradle locally for this repository's
maintenance workflow. Local builds require an Android SDK and authenticated
access to GitHub Packages, which are not available in the documented local setup.
`settings.gradle.kts` resolves the Morphe plugin from GitHub Packages using
`GITHUB_ACTOR` / `GITHUB_TOKEN`, with `gpr.user` / `gpr.key` Gradle properties as
overrides. Keep credential values out of the repository and logs.

The [Release workflow](../.github/workflows/release.yml) uses Java 21 and Node.js.
It runs semantic-release on pushes or manual dispatch. When a release is created,
the release pipeline builds the bundle, generates the patch list, publishes the
release assets and attests the bundle. Otherwise, the workflow runs
`:patches:buildAndroid clean --no-daemon` to check compilation. Device testing is
still required for app behavior; the README records the existing verification and
known sign-in limitation.

## Releases

[.releaserc](../.releaserc) configures semantic-release:

- `main` publishes stable releases; `dev` publishes prereleases.
- Conventional Commits determine whether and how to release: `feat` produces a
  minor release, `fix` a patch release, and breaking changes a major release.
  Non-breaking `docs` and `chore` commits do not trigger a release on their own.
  The configuration also maps `bump`, `perf` and `build(Needs bump)` to patch
  releases. Use the type that describes the actual change.
- The release bot updates `patches-bundle.json`, `patches-list.json`,
  `CHANGELOG.md` and the version in `gradle.properties`. Do not edit these files
  manually. The release configuration also stages `README.md`, but its generator
  leaves the hand-maintained README unchanged while patch-generation markers are
  absent.
- Stable releases are backmerged from `main` to `dev` by the release automation.

The [Open a PR to main workflow](../.github/workflows/open_pull_request.yml)
opens a PR from `dev` to `main` on pushes to `dev` when there are commits to merge
and no existing PR. Manual dispatch uses the selected branch as the source.
It requires **Settings > Actions > General > Workflow permissions > Allow GitHub
Actions to create and approve pull requests** to be enabled in the repository.
Its workflow permissions alone do not enable that repository setting.

Bundle signing is optional. The release workflow forwards the optional Actions
secret `MORPHE_SIGNING_KEY`, while `.releaserc` currently leaves
`signatureUrlTemplate` empty and no `morphe-signing.pub` file is committed. Never
commit a private signing key or its value. The presence of the workflow variable
does not establish that a published bundle is signed.
