# NuvioTV GitHub APK updates

Current target: **NuvioTV 1.1.0-beta.9 (1072)**. See [beta.9 contracts and verification](NuvioBeta9.md). Version-specific DEX notes, commands and artifacts for earlier versions below are historical; use the beta.9 contract and `verifyNuvioLatest` for the current release.

Select **NuvioTV - GitHub APK updates** when patching the original
`com.nuvio.tv` **1.1.0-beta.9** (`1072`). The patch is optional and unselected by
default. It redirects the existing native updater to `Santodan/santodan-patches`.
It retains native update settings, stable/beta channels, release notes, update
prompts, download progress, cached downloads, errors, and the Android installation
handoff. Android may ask for permission to install unknown apps and confirmation
to install the update; this does not enable silent installation.

## Download and installation progress (2026-10-24)

The `nuvio-apk-updates` extension retains the native OkHttp transfer, cache,
mutex and error handling. When HTTP content length is unavailable, progress
uses the GitHub asset size. It also shares transfer callbacks with a foreground
request waiting on a background download of the same asset URL and size. Joining
requests receive current progress; updates are throttled to about four per
second, with actual completion bytes delivered immediately. Unknown sizes stay
unknown. Weak observers, per-transfer limits, registry size limits and expiry
bound retained state. No extra download or progress polling thread is started.

Foreground Install now opens Android's normal APK installer using the real
FileProvider, APK MIME type and read-URI grant. This avoids staging the whole
APK in an app-owned session before confirmation, and lets the system installer
own the installation progress screen. Duplicate taps are debounced. Missing
files or unavailable installer activities retain native error/session handling;
background installation and permission checks stay native.

Android controls this screen and OEM firmware may present it differently. Nuvio
cannot remain running while Android replaces its package. The supplied log
records a background download completing at 16:23:55, three confirmation-only
sessions, a normal package-replacement stop at 16:25:09, then roughly 31 seconds
of code optimization. Disappearance of that confirmation dialog did not mean
the installation stopped. No fabricated in-app installation percentage is shown.

Original beta.8 contracts: `Lkb/q;->b(AppUpdate,Function2,ContinuationImpl)Object`
wraps the callback before the native mutex; `Lkb/b;->a` streaming code is
validated and unchanged. `Lkb/c;->b(Context,File,ZZ)V` routes only foreground
requests. The injected URI bridge directly invokes native
`FileProvider->c(Context,String):Lb4/a` and `Lb4/a;->c(File):Uri`. Both methods
and public asset fields `f:String` and `g:Long` are checked against original
DEX. Original compiled `res/8K.xml` explicitly shares `files/updates/`.
Evidence under `../.inspect-nuvio-beta8/`: `download-contracts.txt`,
`download-callback-contracts.txt`, `provider-contracts.txt` and
`update-extension-contracts.txt`.

Run `verifyNuvioUpdateFlow`, `verifyNuvioUpdateProgressRuntime` and
`verifyNuvioUpdateUiRuntime`, then the packaged bundle checks. They cover DEX
roundtrip/rejection, header/asset sizes, sharing, replay, throttling, completion,
unknown sizes, observer isolation/bounds, intent flags, background fallback,
duplicate taps and launch failures. Actual download cancellation, installer UI
and replacement still require device testing. No device install is performed.

## Download location and cleanup

Native downloads are stored under `Context.getFilesDir()/updates/<asset-name>`.
For the default clone this is
`/data/user/0/com.nuvio.santodan/files/updates/`. This is private app storage,
not the public Downloads directory or Android's cache directory.

The APK remains available for installation/retry. At the next updater
initialization, native `Lkb/q;->a` removes the updates directory and clears the
saved download record when the downloaded release is no newer than the embedded
installed release version. Reopen Nuvio after a successful update to let that
cleanup run. A successful new download also removes older files in this directory.
The progress/installer patch preserves this behavior. An incorrectly overridden
installed release version can prevent cleanup for the same reason it causes
repeated update offers.

There is currently no separate delete-download button. Normal file managers
cannot browse private app storage, and Android's Clear cache does not delete
this folder. Clear storage/data would also erase app settings; it is not needed
for normal update cleanup.

## Configure each APK build

Patch options:

- `repository`: public GitHub repository, default `Santodan/santodan-patches`.
- `releaseVersion`: the release version of **the APK being built**. Its default
  is generated from the bundle version during the build.
  Leave it at the default when publishing the APK under the matching bundle tag;
  override it when publishing the APK under a different version. A previously
  saved patch option can override the new default, so reset an old `0.12.0`
  option before rebuilding.

For example, patch the first APK with `releaseVersion=0.12.0`, then publish it
under tag `v0.12.0`. Patch the next APK with `releaseVersion=0.12.1` and publish it
under `v0.12.1`. The first APK will detect the second; after installation the
second will stop offering itself. Changing only a filename or replacing the
asset on the same tag does not create a new version.

Use three-part semantic versions, optionally with a prerelease suffix such as
`0.13.0-beta.1`. The patch option excludes the leading `v`; release tags may have
it. Do not use `+build` metadata to distinguish updates: native semantic version
comparison ignores build metadata. If you forget to update `releaseVersion`
inside the new APK, the app can repeatedly offer the release already installed.

## Installer repair and supplied device log (2026-10-23)

The original updater patch incorrectly retained a `0.12.0` default after the
bundle advanced to `0.13.0`. Downloading/installing an APK does not change that
compiled updater constant. The corrected default follows the build version.
An APK already built with the old value must be rebuilt and installed once.
Inspection of the workspace's `NuvioTV-1.1.0-beta.8-patches-0.13.0.apk`
confirms all six updater version strings are `0.12.0` and both native fallback
authorities still name `com.nuvio.tv.fileprovider`.

The native installer can attach original app DEX metadata to a session. These
profiles describe the original DEX layout and must not be paired with patched
DEX files. The updater now forces the native `withDexMetadata` argument to false.
Its result receiver also skips native metadata retry, which could copy the whole
APK synchronously inside `onReceive()`. Native permission checks, background
installation policy, session results and the system installer fallback remain.

The independent side-by-side patch now rewrites the two hardcoded
`com.nuvio.tv.fileprovider` strings in the install action and result receiver to
the selected clone package's authority. Renaming only the manifest provider left
the native fallback referencing a provider which does not belong to the clone.
It works with the updater patch in either order and with side-by-side alone.

Original beta.8 evidence is in `../.inspect-nuvio-beta8/installer-contracts.txt`
and `installer-lambda-contract.txt`: installer `Lkb/c;->b(Context,File,ZZ)V`,
receiver `UpdateInstallResultReceiver->onReceive(Context,Intent)V` and install
action `Lcom/nuvio/tv/data/local/gc;->invokeSuspend(Object)Object`. Original
instruction/register/branch hashes guard all changes; the receiver validator
normalizes only the independently applied provider/metadata edits.

The supplied log records cold launches of about 14–37 seconds, two Nuvio ANRs,
interrupted installer `FileBridge` writes, and frequent blocking garbage
collection while playback/provider work is active. It also records a successful
system-installer session later. It does not contain a startup main-thread stack
or a Java installer crash stack, so it does not prove one cause for all startup
delays. No device is connected locally for a cold-start/ANR trace. Startup speed
and on-device installation remain device checks; these repairs do not claim to
resolve the separate observed memory pressure.

## Publish the APK on GitHub

1. Build an APK with the desired patches, including this updater patch, and set
   `releaseVersion` to the version you intend to publish.
2. Sign it with the **same signing key** as the already installed patched app.
   Keep the **same Android package name**, including any side-by-side package
   option. Its Android version code must not be lower than the installed one.
   Preserve the signing key used by your patching/signing tool across releases.
3. Open [the repository's Releases page](https://github.com/Santodan/santodan-patches/releases)
   and create a release, or edit the matching release if it already exists.
4. Choose the matching tag, for example `v0.12.1`, and enter release notes.
5. Drag the **signed APK** into the release's binary attachments area. Suggested
   name: `NuvioTV-Santodan-0.12.1-universal.apk`.
6. Publish the release. For regular releases leave **pre-release** unchecked and
   set it as the latest release. Draft releases are invisible to the updater.
7. In the installed patched app, use NuvioTV's native update check and download /
   install action. Enable installation from this app if Android requests it.

The APK must be a **Release asset**, not merely committed to a repository folder,
put in source ZIPs, or mentioned as a link in release notes. No JSON file or
workflow is required. The `.mpp` can remain attached to the same release; native
asset selection filters for `.apk`, so it will not download the patch bundle.

Use the same release created by the existing release workflow: edit that release
and attach the APK alongside its generated `.mpp`. The workflow still publishes
only the patch bundle; it does not build, sign or upload an APK automatically.
Keep the generated `.mpp` filename and release tag unchanged when attaching the
APK. Morphe's configured bundle URL continues to point to
`patches-<version>.mpp`; adding an APK asset does not change that URL. Keep the
release's stable/prerelease status consistent with the channel you publish to.

Attach one universal APK for this installation identity to each release. Avoid
mixing stock/clone variants or other applications' APKs in the same release:
native selection matches architecture, not package name. Multiple architecture
builds can use native ABI names (`arm64-v8a`, `armeabi-v7a`, `x86_64`, `x86`) in
their filenames; prefer the single universal APK workflow.

The native stable channel requests GitHub's latest non-prerelease release. If
your latest release contains only an `.mpp`, stable users will not find an APK
update there. Attach the APK to every release you want to distribute to NuvioTV.
The beta channel lists releases, excludes drafts, and sorts eligible semantic
versions, selecting one with an APK. For prerelease APKs, use a tag such as
`v0.13.0-beta.1`, mark the release as a pre-release and select the beta channel
in NuvioTV. The repository must be publicly readable; no token is embedded.

GitHub instructions: [Managing releases](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository).
Android requirements: [How app updates work](https://developer.android.com/google/play/app-updates).

## Implementation and evidence

Original: `../OriginalApps/NuvioTV-1.1.0-beta8.apk`, SHA-256
`7aeae6f64e9128be2c7545c50061376839e20a88d47722ac220ba40be7c182f8`.
Original manifest confirms `com.nuvio.tv`, `1.1.0-beta.8`, `1071`.
Inspection: `../.inspect-nuvio-beta8/updater-contracts.txt`, derived from original
DEX using dexlib2. Progress and foreground installer routing use the independent
`nuvio-apk-updates` extension.

`Lkb/j0;->a(Lkb/l;Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;`
is the instance release repository coroutine. Its unique `NuvioMedia` and
`NuvioTV` constants feed both GitHub release API routes. They are changed in
place. Contributor queries and unrelated GitHub URLs remain unchanged.

Seven native local-version constants also change in place: `Lkb/q0;->a` and `b`
(static UI/post-install reconciliation and channel label),
`Lkb/m0;->invokeSuspend` (instance update-check coroutine), `Lkb/k;->a`
(static default channel), and `Lkb/q;->a` and `d` (instance cached-download
cleanup/restoration), and static `UpdateJobService->a` (background update
comparison). The background job contract is recorded in
`../.inspect-nuvio-beta8/update-job-contracts.txt`. The updater's `Lkb/r0;` semantic parser/comparator,
`Lkb/a;->a(List):GitHubAssetDto` asset selection, `Lkb/b;` downloader and
installation handoff are retained. The visible general app version remains
the original NuvioTV version; updater comparisons use the patch option.

All eight version/repository methods are uniquely selected and checked against
original instruction/register/literal/branch fingerprints before mutation.
Nine `const-string` instructions change without changing their registers or
width. The installer repair additionally inserts two `const/4` flag overrides;
the independent side-by-side patch changes the two FileProvider strings.
Native branches, try regions and coroutine suspension logic are preserved.

Run:

```powershell
.\build-local.ps1 :patches:buildAndroid :patches:generatePatchesList
.\build-local.ps1 :patches:verifyNuvioApkUpdates :patches:verifyNuvioBeta8Bundle
.\build-local.ps1 :patches:verifyNuvioUpdateInstaller :patches:verifyMorpheDesktopImport
```

The focused verifier checks missing, changed, ambiguous and already-patched
rejection, validation before mutation, option validation, and DEX write/reload
with only the nine intended constants changed. Packaged verification covers
standalone APK updates and coexistence with the other NuvioTV behavior patches.
Device checks remain: publish two correctly versioned/signed APKs, confirm
native manual/automatic check, stable/beta selection, progress/error UI,
unknown-source permission, install confirmation, preserved app data and no
repeat offer after updating. No APK is uploaded or installed by these tests.

## Local validation results

### 2026-10-24 progress and system-installer flow

`buildAndroid`, `generatePatchesList`, `verifyNuvioUpdateFlow`,
`verifyNuvioUpdateProgressRuntime`, `verifyNuvioUpdateUiRuntime`,
`verifyNuvioApkUpdates`, `verifyNuvioUpdateInstaller`, `verifyMorpheDesktopImport`
and `verifyNuvioBeta8Bundle` passed. The Desktop imports 31 patches across eight
apps. Standalone and combined Nuvio DEX checks retain the same 36 original
optional-library findings. Exact hook registers/branch targets and exception
regions survived DEX write/reload.

Desktop 1.19.0 rebuilt all sixteen NuvioTV patches into
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-update-progress-unsigned.apk` with no failed
patches. The final updater/installer/playback APK checks passed, including all
17 playback hooks and unchanged cross-DEX findings. Package/version are
`com.nuvio.santodan`, `1.1.0-beta.8` / `1071`; ZIP alignment passed. Signature
verification confirms the expected unsigned output. The artifact has not been
signed, installed or tested on the TV.

Current bundle: `patches/build/libs/patches-0.14.0.mpp`. Logs under
`../.inspect-nuvio-beta8/`: `update-progress-final.log`,
`update-progress-hooks-final.log`, `update-progress-rebuild.log`,
`update-progress-result.json` and `update-progress-apk-verification.log`.

The separately signed release APK,
`NuvioTV-1.1.0-beta.8-patches-0.14.0.apk`, also passed signature and exact
updater/installer/playback checks. Its SHA-256 matches the APK already attached
to v0.14.0, so the release repair retains that signed asset while replacing the
MPP and matching metadata. Existing custom release notes are preserved.
Signed-APK verification log: `../.inspect-nuvio-beta8/release014-signed-verification.log`.

### 2026-10-23 updater and installer repairs

`buildAndroid`, `generatePatchesList`, `verifyNuvioApkUpdates`,
`verifyNuvioUpdateInstaller`, `verifyMorpheDesktopImport` and
`verifyNuvioBeta8Bundle` passed. These cover the generated default, both UI and
background version comparisons, metadata/retry flags, both clone authorities,
independent selections, both patch orders, invalid/duplicate inputs and DEX
roundtrip with preserved try regions. Standalone and combined packaged outputs
retain the same 36 original optional-library findings.

The current validation APK is
`../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-updater-repair-unsigned.apk`, rebuilt by
Desktop 1.19.0 with all fifteen patches. Its inspected updater strings are
`0.13.0` and its fallback authorities are `com.nuvio.santodan.fileprovider`.
It is unsigned and has not been installed or tested on a device. Runtime
startup/installation behavior still requires testing on the affected TV.

Logs: `../.inspect-nuvio-beta8/updater-repair-final.log`,
`updater-repair-rebuild.log`, `updater-repair-rebuild-result.json` and
`updater-repair-apk-final.log`.

### Original implementation validation (2026-10-22)

`buildAndroid`, `generatePatchesList`, `verifyNuvioApkUpdates` and
`verifyNuvioBeta8Bundle` passed. The packaged standalone updater and all fourteen
behavior patches together introduced no new cross-DEX findings (36 unchanged
optional-library findings in the original). The final stricter signature checks
also passed the focused verifier and CLI patch application.

The CLI rebuilt all fifteen public patches, including side-by-side installation,
with no failed patches. The output is `com.nuvio.santodan`, `1.1.0-beta.8` /
`1071`, with updater release version `0.12.0`. The focused verifier confirmed
the exact updater methods in the rebuilt APK. ZIP alignment passed; signature
verification reports a missing signature manifest, as expected for `--unsigned`.

- Bundle: `patches/build/libs/patches-0.12.0.mpp`.
- Unsigned validation APK: `../Apps/NuvioTV/NuvioTV-1.1.0-beta.8-apk-updates-unsigned.apk`.
- Logs: `../.inspect-nuvio-beta8/apk-updates-verification.log`,
  `apk-updates-final.log`, `apk-updates-rebuilt-verification.log` and
  `apk-updates-rebuild.log`.

This APK has not been signed, uploaded, installed or tested on a device. Sign
with your existing update key before publishing; the unsigned validation output
is not ready to distribute.
