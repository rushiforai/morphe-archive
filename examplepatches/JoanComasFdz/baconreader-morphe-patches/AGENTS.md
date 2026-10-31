<!-- SPDX-FileCopyrightText: 2026 JoanComasFdz -->
<!-- SPDX-License-Identifier: GPL-3.0-only -->

# Agents

Follow [STYLE.md](STYLE.md). A change is done when the checks below pass for every commit.

## Shared and patcher-specific files

The same BaconReader patches exist for two patchers: [baconreader-reseam-patches](https://github.com/JoanComasFdz/baconreader-reseam-patches) (Reseam) and [baconreader-morphe-patches](https://github.com/JoanComasFdz/baconreader-morphe-patches) (Morphe).

- **Shared, word for word in both repos:** `AGENTS.md`, `CLAUDE.md`, `STYLE.md`, `docs/patches.md`. The "Shared docs" workflow fails when one differs from the other repo's. Change them in both repos, in one PR each.
- **Patcher-specific:** what really differs between the patchers, one set per repo:
  - [patcher-specific-build.md](patcher-specific-build.md): tools, build, list, patch, sign.
  - [patcher-specific-code.md](patcher-specific-code.md): layout, patch API, extensions, settings, formatting.
  - [patcher-specific-release.md](patcher-specific-release.md): branches, PRs, releases.
  - [docs/patcher-specific-patches.md](docs/patcher-specific-patches.md): settings and keys, differences from ReVanced.
- A new patch or a behavior change goes to both repos. A difference between them is either a patcher limit, written down in `docs/patcher-specific-patches.md`, or a bug.

## Cloud sessions with both repos

A cloud session created with both repos starts in `/home/user`, above the clones, and runs neither repo's session-start hook. In such a session, before the first task, check whether `/opt/patch-tools` exists. If it doesn't, run both repos' hooks and set the JDK as "Two-repo sessions" in [patcher-specific-build.md](patcher-specific-build.md) says (the same steps in both repos), then tell the user what ran and any `session-start:` warning. A session on one repo alone runs its hook on start and needs none of this.

## Build

- The tools, the build command and its output: [patcher-specific-build.md](patcher-specific-build.md).
- A clean BaconReader Premium 6.1.4 APK to patch. In an AndroidDev cloud session, `tools/e2e/connect.sh` downloads it to `.e2e/com.onelouder.baconreader.premium-6.1.4-clean-base-<first 8 characters of E2E_APK_CHECKSUM>.apk` and exports that folder as `E2E_ARTIFACTS_DIR` ([patcher-specific-build.md](patcher-specific-build.md), "Cloud sessions"). Never commit it.
- One Gradle build at a time per machine when several agents share it. Use `--no-daemon`.
- A stale ignored `build/` folder of a removed module still makes Gradle configure it. Check commits in a clean worktree: `git worktree add --detach <dir> <commit>`.
- If Maven Central answers 429, point Gradle at `https://maven-central.storage-download.googleapis.com/maven2/` with an init script in `~/.gradle/init.d`. Don't commit it.

## Check a change

The commands are in [patcher-specific-build.md](patcher-specific-build.md).

1. **Build:** the bundle builds.
2. **List:** the patcher lists the patch with the right name, description, packages and options.
3. **Patch:** the patcher patches the clean APK, with the patch applied and none failed.
4. **Inspect the result:** disassemble the patched APK with apktool and read the changed methods.
   - When a ReVanced build of the same patch exists, compare the changed classes with it. Strip `.line`, `.local` and `.param` lines and comments, and treat `const-string/jumbo` as `const-string`.
5. **Extension calls:** every method an extension calls on app or library classes exists in the patched app's smali, with the same descriptor.
6. **Access:** every app class, method and field an extension uses is public in the patched app, or protected and inherited. Android checks this when the code runs, not when it's built.
7. **Formatting:** the formatter in [patcher-specific-code.md](patcher-specific-code.md) leaves the changed files unchanged.

Only a phone shows whether a patch works. Say in the PR what was tested on one and what only passed these checks.

## End-to-end tests

In the repos that have [tests/BaconReader.E2E](tests/BaconReader.E2E/README.md) (the Reseam repo; the Morphe repo doesn't yet):

- **When the user asks to test a patch, first write its Gherkins,** each in a ```` ```gherkin ```` code block, by [docs/given-when-then-test-rules.md](docs/given-when-then-test-rules.md) and [docs/given-when-then-patch-scenarios.md](docs/given-when-then-patch-scenarios.md), and agree them with the user before writing any C#. Copy every quoted text from the screen, never from the patch's code.
- The tests are C# (.NET 10, xUnit v3) and Appium, one Gherkin per scenario, written by their [E2E-TEST-CODE-RULES.md](tests/BaconReader.E2E/E2E-TEST-CODE-RULES.md) (binding). Each scenario patches the clean APK with only the patches it names.
- They need an emulator, reached through the environment their README lists ("The emulator"). In an AndroidDev cloud session, `source tools/e2e/connect.sh` provides it ([patcher-specific-build.md](patcher-specific-build.md), "Cloud sessions"), then run the tests in the same shell.
- A patch's scenarios go in the patch's PR. While working: `tools/e2e/record.sh --no-video <TestClass>`. Right before the push: `tools/e2e/record.sh --changed-since origin/<base branch>`. Right after it: `tools/e2e/push-gifs.sh`; the "E2E videos" workflow posts the GIFs on the PR ([docs/hosting.md](docs/hosting.md)).
- `dotnet build BaconReader.E2E.slnx` and `dotnet test BaconReader.E2E.slnx` pass with no warnings (without an emulator, the scenarios skip).

## Test APKs

- Name each APK built for the user `BaconReaderPremium_<patcher>_<n>.apk` (`reseam` or `morphe`), with `n` one more than the last one.
- Stamp its bundle with `build-<n>`, so the app shows which build is installed and it matches the file: [patcher-specific-build.md](patcher-specific-build.md).
- Sign it with a test key made in the session, the same one for every build of a session, so each build installs over the last.

## Pull requests

- Branch from, and open the PR against, the branch [patcher-specific-release.md](patcher-specific-release.md) names, unless the user asks for a stacked PR.
- Don't merge PRs; the user reviews and merges.

## Releases

[patcher-specific-release.md](patcher-specific-release.md).

## Porting a ReVanced patch

1. Read the ReVanced patch, its fingerprints and its extension at the newest commit that works.
2. Find each fingerprint's method in BaconReader 6.1.4 (jadx or apktool) and write the patcher's target for it ([patcher-specific-code.md](patcher-specific-code.md)).
3. Write the extension in the repo's extension language. Check that BaconReader reaches every branch you keep.
4. Map its settings to the patcher's settings ([patcher-specific-code.md](patcher-specific-code.md)).
5. Run the checks. Then add the patch's one-line row to the README, in Fixes, Features or Cleanups, its row to [docs/patches.md](docs/patches.md), and its settings, keys and differences from ReVanced to [docs/patcher-specific-patches.md](docs/patcher-specific-patches.md).
6. Port it to the other repo too, or say in the PR why not.
