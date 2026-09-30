# Contributing

Bug reports, fixes for a new Threads build, new patches and pull requests are all welcome.

Not sure it's a bug, or just have a question? Start in [Discussions](https://github.com/SysAdminDoc/HushThreads/discussions). If it turns out to be a bug, it moves to an issue from there.

If you open an issue, include:

- the Threads version and variant you patched (APKMirror names the variant, for example arm64-v8a, Android 9+)
- the Morphe Manager version and the HushThreads version
- the patches you selected
- what you expected and what happened, with steps to get there
- a diagnostic report or screenshots if it's visual or a crash. Remove private messages and account details from screenshots first.

GitHub doesn't let the person who opened an issue reopen it once a maintainer closes it, so a closing comment always says how to get it reopened: comment there and we'll reopen it.

## When Threads updates

Threads ships a new version about once a week, and Meta's obfuscator renames most of its code each time. A patch that finds what it needs by a kept name, a string, a Pando field hash or a method's shape usually carries over. A patch that doesn't fails at patch time with a message saying what it couldn't find. Fixing it for the new build goes like this:

1. Get the new build's arm64-v8a bundle and put it in your fixture folder.
2. Run `scripts/verify-all-patches.ps1 -Apk <new bundle> -Force -DesktopJar <jar> -WorkDir <scratch>`. `-Force` lets the CLI patch a version the bundle doesn't declare yet, and the result names every patch that failed.
3. Find where the failing patch's anchor went (the tool below helps), change the patch to find it on both the new build and the ones already declared, and never write down a name the obfuscator gave one build: `ObfuscatedIdentityTest` fails on one.
4. Add the build to `AppCompatibilities.kt` with its arm64 version code, regenerate the patch list, and run the checks again on every retained build.

For a patch change, say which Threads build you tested against and what you checked.

### Finding where a method went

`scripts/fingerprint-candidates.ps1` ranks the methods of the new build by how much each one looks like the method the patch found on the old one. Give it the method as the old build names it and both builds, as a path or as a version your fixture folder has:

```powershell
scripts/fingerprint-candidates.ps1 -OldApk 449 -Method 'LX/8rc;->A00(LX/8rb;)Z' -NewApk <new bundle>
```

It only compares what survives a rebuild: the strings a method loads, its literals, the framework and kept-class calls it makes, an opcode sketch, its prototype, its class and who calls it. The report lists the five closest methods and sets each one beside the old method. The tool changes nothing. When one candidate is clearly ahead it says so and still leaves the patch to you. When two are close, or none scores well enough, it exits 1 and names no candidate.

## Building and checking

Read the README's build section first. Gradle needs `GITHUB_ACTOR` and `GITHUB_TOKEN` (a token with `read:packages`) to fetch the Morphe patcher. Run `:patches:generatePatchesList` before `:patches:buildAndroid`. A test run afterwards replaces the jar in `patches/build/libs`, which is why the release bundle is copied to `patches/build/release`.

The checks that matter before a release:

- `:patches:test` and `:extensions:threads:testDebugUnitTest`, with `HUSHTHREADS_FIXTURE_DIR` set so the tests that read real Threads builds run instead of skipping.
- `scripts/verify-all-patches.ps1` on every retained fixture. It merges the split bundle into one APK the way the CLI does, applies all patches to that merge in one run, checks the CLI's own report and holds the rebuilt resource table to the merge's.
- `scripts/build-release-receipt.ps1`, which writes the release receipt from those runs, and `scripts/validate-release-facts.ps1`, which holds the README, the CHANGELOG and the bug form to the generated patch list.
- The advisory check inside the receipt script. It reads the SBOM `buildAndroid` writes beside the bundle and asks [OSV](https://osv.dev) about every library in it, and a high or critical advisory stops the release. If one doesn't apply to what the bundle does with that library, accept it in `scripts/advisory-exceptions.txt` with the reason and a date at most 90 days out.

`scripts/install-hooks.ps1` installs a pre-push hook that runs the tests when a push changes `extensions/` or `patches/`, and the release check when it changes a published file. Set `HUSHTHREADS_SKIP_PRE_PUSH=1` to push without it.

## Settings for your machine

Nothing in the repository points at a folder or a phone on anybody's machine. These variables do that instead, and none of them has a default:

- `HUSHTHREADS_FIXTURE_DIR` is the folder holding the Threads builds the fixture tests and scripts read. They're over a hundred megabytes each, so they aren't in the repository.
- `HUSHTHREADS_DESKTOP_JAR` is the Morphe desktop CLI jar. `HUSHTHREADS_WORKDIR` or a jar under `build/morphe-tools` works too.
- `HUSHTHREADS_BUILD_WRAPPER` names a PowerShell script the pre-push hook runs Gradle through, called as `<wrapper> -ProjectDir <repository> -Tasks <task>...`. Unset, the hook runs `gradlew.bat` itself.
- `HUSHTHREADS_DEVICE_SERIAL` is the adb serial of a test phone for `scripts/patch-for-device.ps1`. Keep your own phone out of it: a re-signed Threads can't install over the Play Store copy without uninstalling it, which signs you out.

## Source notices

Keep every existing copyright, license, author credit and source-origin notice when you modify or move a file, and don't remove a notice unless the code it covers is gone from the file. Most of the code here came from Hushfacebook, and some of that from Andrew Liang's patches and FroggoMorphePatches, all GPL-3.0. In this ecosystem a missing notice has already ended in DMCA takedowns more than once.

New source written for this project may use:

```text
/*
 * Copyright <year> HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
```

Code taken from another project keeps its notices and gets a `Forked from` line naming the project and the commit it came from. Record it in `provenance.json` too. A rule naming a single file wins over the folder rule around it, which is how a file written here can sit among ported code. `ProvenanceTest` fails when a shipped file matches no rule or two, or when a rule names an upstream that NOTICE doesn't. It also holds every header to its rule. The header has to link a repository of that rule's chain, and each `Forked from` source has to be one of them. A file under a rule for code written here can't say it came from anywhere, however it words that, and every rule has to state its licence.

Code from outside the Hush family can only come from a source that `sources/threads-sources.json` lists as adopted. That takes the commit the code came from, a licence that works with GPL-3.0, the source in NOTICE, its rule in `provenance.json`, and a release receipt showing the Threads fixtures patched. `scripts/test-threads-sources.ps1` refuses the ledger without any of them. A source the ledger calls behavior-only is never copied from, only read for what it does. When you find a new source, run `scripts/audit-threads-sources.ps1`, which reports what moved and stamps the census once nothing has. A release won't go out on a census more than 14 days old.
