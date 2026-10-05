# Twitch version upgrades

Each upgrade has a saved baseline, an immutable original APK, local verification,
device acceptance and a separate release decision. Build and research artifacts
remain under `.local/`. Supported versions and results live in
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

For a 31.4.2 evaluation, create the source checkpoint after synchronization:

```powershell
$upgradeId = 'twitch-31.4.2-' + (Get-Date -Format 'yyyyMMdd-HHmmss')
$checkpoint = Join-Path '.local/checkpoints' $upgradeId
New-Item -ItemType Directory -Path $checkpoint | Out-Null
git branch "codex/baseline-$upgradeId" HEAD
git bundle create "$checkpoint/source.bundle" --all
git bundle verify "$checkpoint/source.bundle"
```

Check each command succeeds before continuing. Save the APK and identity records
in the same checkpoint. The bundle contains Git history, not ignored files.

A code/APK checkpoint does not contain the phone's private app data.

## Establish device recovery

Same-package updates signed with the existing key normally retain login and
settings. Returning to an older app version is a separate operation: Android
restricts version-code downgrades, and newer app data may be incompatible with
older code. ADB's `install -d` supports debuggable packages; it is not a general
rollback mechanism for release APKs. Apps targeting Android 12 or later also
exclude private data from ordinary ADB backups unless they are debuggable.

Select and verify a recovery route before replacing the daily-use installation:

| Route | Recovery |
| --- | --- |
| Emulator with an original-package candidate | Restore a snapshot of the emulator and its app data. |
| Separate candidate package on a physical device | Keep the stable installation intact; discard the candidate if testing fails. |
| In-place physical-device update | Requires a verified downgrade/data-restore route, or acceptance that recovery may require signing in again. |

A separate candidate package needs its own verified authorities, component
references, links and Firebase package header. It requires a separate login and
does not fully reproduce the original-package installation. Candidate package
renaming and emulator snapshots are not automated by the current scripts.
Different Android users or work profiles still share a package's installed code and do not isolate
two versions of the same package.

For strict preservation of the stable phone installation, use isolated testing.
An in-place update follows only after the recovery method and candidate are
accepted. Installation, data clearing and publication are separate decisions.

## Inspect the original

Supply an original APK or complete split bundle for the intended ABI. For example:

```powershell
./scripts/evaluate-update.ps1 -InputApk '.local/inputs/twitch-31.4.2.apkm' -ExpectedVersion '31.4.2' -Decompile
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
candidate target locally and keep the previous target where both versions pass
hook and regression checks. Update compatibility evidence after verification.

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
representative reduced patch selections and rebuild the previous supported
version when shared hook code changes.

## Device acceptance

Install the verified APK through the selected recovery route. Record its exact
hash and install time. Keep the package and signing key unchanged for an
in-place update. Retain logs locally while the candidate is used overnight.

| Area | Checks |
| --- | --- |
| Playback | Native, initial V2 Classic Split, Vertical View, swipe feed, rotation, background audio and raids. |
| Ads | Actual preroll/midroll opportunities, stream continuity, quality and normal controls without stale ad overlays. |
| Chat | Global/channel BTTV and 7TV emotes, previews, Back navigation and channel changes. |
| Channel points | An available bonus is claimed without a manual tap. |
| Promotions | Turbo, discounts and feed cards suppressed; Drops and train overlays remain usable. |
| Reload | Double-tap works on initial entry and after view changes, retaining quality and mode. |
| Settings | Feature toggles recover both ways; omitted patches have no settings. |
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
