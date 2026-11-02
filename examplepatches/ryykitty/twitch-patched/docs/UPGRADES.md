# Twitch version upgrades

Patches support the latest stable Twitch release and the latest beta. Start an
upgrade when the stable release advances.

Develop version upgrades on `dev`. Keep original APKs, recovery copies and build
artifacts under `.local/`. Record supported versions and verification results in
`config/compatibility.json`.

## Synchronize and save the baseline

GitHub's file editor creates a remote commit. Local files change after that
commit is fetched and merged. Commit completed local changes before merging:

```powershell
git fetch origin
git log --oneline HEAD..origin/dev
git merge --no-edit origin/dev
```

Check `origin/main` for edits made directly on the stable branch and merge those
into `dev` as well. Resolve overlapping edits before starting an upgrade. README
and documentation edits normally use `docs:` commits, which run CI without
creating a release by themselves.

At the start of an upgrade, save a local baseline branch and verified Git bundle
under `.local/checkpoints/<upgrade-id>/`. Record the source commit, patch-bundle
hash, installed APK hash, app version/code, signing certificate and patch
selection. Copy the installed APK and all its splits into that checkpoint.
Retain the existing signing key and immutable originals.

Create the source checkpoint after synchronization:

```powershell
$upgradeId = 'twitch-update-' + (Get-Date -Format 'yyyyMMdd-HHmmss')
$checkpoint = Join-Path '.local/checkpoints' $upgradeId
New-Item -ItemType Directory -Path $checkpoint | Out-Null
git branch "baseline-$upgradeId" HEAD
git bundle create "$checkpoint/source.bundle" --all
git bundle verify "$checkpoint/source.bundle"
```

Check each command succeeds before continuing. Save the APK and identity records
in the same checkpoint. The bundle contains Git history, not ignored files.

A code/APK checkpoint does not contain the phone's private app data.

## Establish device recovery

Development updates use the original package and the installed app's signing key
to retain login and settings. Export Morphe Manager's key under **Settings >
System > Signing key** and keep it under `.local/signing/`. Compare certificate
fingerprints before installing an update.

Keep app-data recovery separate from APK backups. Android restricts release APK
downgrades, and newer app data may not work with older code. `adb install -d`
does not provide a general rollback route for release apps. Returning to an older
version may require reinstalling and signing in again.

Use an emulator snapshot when recovery must preserve the previous app state.
The current scripts do not automate emulator snapshots or candidate package
renaming. Android work profiles share installed package code and do not isolate
two versions of the same package.

## Inspect the original

Supply an original APK or complete split bundle for the intended ABI. Set
`$targetVersion` to its Twitch version before running the intake:

```powershell
./scripts/evaluate-update.ps1 -InputApk '.local/inputs/twitch.apkm' -ExpectedVersion $targetVersion -Decompile
```

The intake verifies Twitch's publisher signature, package, version and split
consistency, copies the input into a new run and records hashes in
`candidate.json`. Originals and decompilations remain local.

Acquire the original separately; the intake script does not download it.
Committing or rebuilding the patch bundle does not add support for a new Twitch
version. Target declarations and changed hooks need evaluation first.

Compare the candidate with the baseline by feature: native and React Native
playback, ad playlists/state, chat rendering, points, settings, promotions,
notifications and player controls. Resolve hooks from the candidate's code and
require unique matches. Record missing or changed hooks before adapting them.

## Adapt and verify locally

Make focused changes on `dev` and commit completed fixes separately. Add the
candidate target locally while retaining the supported baseline during evaluation.
After acceptance, retire the previous target and its exclusive hooks. Keep shared
contracts used by the new baseline. Update compatibility evidence after verification.

```powershell
./scripts/check-source.ps1
./scripts/build.ps1 -Clean
./scripts/test.ps1
npm.cmd test
```

Select patch names explicitly. `patch.ps1` defaults to the inspection patch;
that default is not a full feature evaluation. Use the prepared original from
`candidate.json` for patching and original-aware verification:

```powershell
./scripts/patch.ps1 -InputApk $preparedOriginal -AuditOriginalBaseApk $preparedOriginal -Patch $selectedPatches
```

`$preparedOriginal` is the recorded prepared-input path. `$selectedPatches` is
the saved array of feature names. FULL DEX recompilation and the original-aware
audit must pass before the resulting APK becomes a device candidate. Also check
representative reduced patch selections and rebuild the other supported target
when shared hook code changes.

Every modifying selection must include the shared settings, notification, theme
and DJ playback fixes. An inspection-only selection must leave the app unchanged.

## Device acceptance

Install the verified APK through the selected recovery route. Record its exact
hash and install time. Keep the package and signing key unchanged for an
in-place update. Retain logs locally while the candidate is used overnight.

| Area | Checks |
| --- | --- |
| Playback | Native, initial V2 Classic Split, Vertical View, swipe feed, rotation, background audio and raids. |
| Ads | Actual preroll/midroll opportunities, stream continuity, quality and normal controls without stale ad overlays. |
| Chat | Static and animated BTTV, FrankerFaceZ and 7TV emotes in live chat, VOD replay and the picker; provider switches, previews, Back navigation and channel changes. |
| Channel points | An available bonus is claimed without a manual tap. |
| Promotions | Turbo, discounts and feed cards suppressed; Drops and train overlays remain usable. |
| Reload | Double-tap works on initial entry and after view changes, retaining quality and mode. |
| Settings | Feature toggles recover both ways; omitted patches have no settings. |
| UI settings | Group and individual controls work independently, empty action rows collapse, and fullscreen player/settings windows respond to both system-bar toggle directions. |
| Theme | Dark, Light and System settings update Following, Live, Clips and navigation. Check initial entry, clip loading, refresh and tab changes; headers scroll and category labels remain visible. Patch settings opens immediately after a theme change. |
| DJ playback | Background audio, audio-only and picture-in-picture controls work in native and V2 playback when the corresponding renditions are available. |
| Notifications | A real live alert arrives in the background and opens its channel; record delivery timing separately. |

Record a check as unobserved when the necessary event did not occur. For a bug,
retain the candidate hash, channel, layout, approximate time and reproduction
steps. Correlate logs with the failing path, apply a focused fix and repeat that
check plus any affected shared paths.

## Recovery and release

Restore isolated environments from their checkpoints. In-place recovery uses the
previously verified device procedure; a failed downgrade stops the procedure
without automatically uninstalling or clearing data.

Use `git revert` for the relevant upgrade commits to restore source behavior
while retaining history and unrelated documentation changes. Git reverts leave
`.local/` and ignored artifacts intact. Restore a local feature branch from the
checkpoint if work needs to continue from the older baseline.

Once device acceptance is complete, update compatibility evidence and commit
support with `bump: support Twitch <version>`. Push `dev` when a prerelease is
wanted. Merge verified changes into `main` for the stable release. Existing
release tags and assets remain available throughout the evaluation.

References: [ADB installation options](https://android.googlesource.com/platform/packages/modules/adb/+/refs/heads/main/client/commandline.cpp),
[Android backup restrictions](https://developer.android.com/about/versions/12/behavior-changes-12#adb-backup).
