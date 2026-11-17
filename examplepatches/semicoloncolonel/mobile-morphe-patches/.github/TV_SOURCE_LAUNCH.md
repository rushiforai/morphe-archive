# Launching the Android TV patch source

The Android TV patches ship as their own patch source, `tv-morphe-patches`. Morphe Manager keeps one recommended version for each package and does not look at the form factor. While the phone and TV patches share one bundle, phones are offered the Android TV versions of apps that use one package for both, such as Apple TV 17.0.3 instead of 3.0.0.

The rollout has two phases, each turned on by a repository variable:

1. **TV source live.** `TV_SOURCE` set to `semicoloncolonel/tv-morphe-patches`. Each release also publishes the Android TV bundle there. This repository keeps releasing the combined bundle, so TV users can move over gradually.
2. **Phone-only bundle.** Dev releases have built the phone-only bundle since 1.1.0-dev.28. Main releases do too once `PHONE_ONLY_BUNDLE` is set to `true`, which happens with the 1.1 release. This repository's bundle then drops the Android TV apps, and phones stop being offered TV versions.

## How it works

- `-Pflavor=all|phone|tv` in `patches/build.gradle.kts` selects the bundle. The default, `all`, is the combined bundle. `shared/misc/BundleFlavor.kt` explains the helpers.
- With `TV_SOURCE` set, `release.yml` builds the TV bundle after this repository's release, attests it, and runs `.github/scripts/publish_tv_bundle.py`.
- The script releases the TV `.mpp` in the TV repository and updates its `patches-bundle.json`: on `main` for a stable release, and on `dev` for a pre-release. Until the TV repository has a stable release, `main` offers the latest dev pre-release too, so the stable channel works from the start. The first stable release replaces it.
- The TV release takes this repository's version number. It is published only when a file the TV bundle is built from changed since the last TV release on that branch. Adding or removing a phone app in a shared patch does not count. The TV version numbers therefore skip the phone-only releases.
- The TV release notes list the commits that touch a TV app or name one. Changes to the shared code are summarized in one line.
- Every publish also copies `.github/tv-repo` to the TV repository's `main` branch and syncs its labels from `.github/labels.json`. Its workflows, in `.github/tv-repo/.github/workflows`, triage issues with this repository's `issue_triage.py` and close stale reports. `.github/scripts/build_tv_repo.py` writes the issue forms, security policy, notice, and license in `.github/tv-repo` from this repository's copies. The TV README there is written by hand. CI fails if the generated files are out of date.

## Phase 1: TV source live

Done on 2026-11-16. The release workflow publishes with `TV_SOURCE_TOKEN`, or with `RELEASE_TOKEN` when that secret is not set. That token needs the `repo` scope, and the `workflow` scope when `.github/tv-repo/.github/workflows` changes. The repository variable `TV_SOURCE` is set to `semicoloncolonel/tv-morphe-patches`.

To set up the TV repository's files without a release, run:

```bash
python3 .github/scripts/publish_tv_bundle.py --repo semicoloncolonel/tv-morphe-patches --branch dev --setup-only
```

## Phase 2: Phone-only bundle

1. Dev releases already build the phone-only bundle. The steps below are for main, before the 1.1 release.
2. Build the three flavors, and check that they split cleanly:

   ```bash
   for f in all phone tv; do ./gradlew :extensions:extension:clean :patches:clean :patches:build -Pflavor=$f && cp patches/build/libs/patches-*[0-9].mpp /tmp/$f.mpp; done
   python3 .github/scripts/check_bundle_flavors.py --cli tools/latest/morphe-desktop-2.1.1-all.jar --all /tmp/all.mpp --phone /tmp/phone.mpp --tv /tmp/tv.mpp
   ```

   The versions both split bundles offer should be only the apps whose phone and TV builds share a version name: Disney+, Plex, Pluto TV, and Starz.
3. Update the documentation in the same change:
   - `README.md` and `docs/android-tv.md`: TV users use the TV source. Remove the notes that only matter while the phone and TV targets share a bundle.
   - `.github/tv-repo/README.md`: remove the preview note.
   - The release notes: tell TV users who have not moved yet to add the TV source.
4. Set the repository variable `PHONE_ONLY_BUNDLE` to `true`, then release 1.1 on main.

Deleting `TV_SOURCE` stops the TV publish, and deleting `PHONE_ONLY_BUNDLE` returns main to the combined bundle, at the next release. Dev releases stay phone-only unless `release.yml` changes.

## Keeping the split working

- A new Android TV app goes in `tvBundleApps` in `patches/build.gradle.kts` and in `docs/android-tv.md`.
- An app whose phone and TV builds share one compatibility entry uses `splitByBundle()` or `byBundle()`, so each split bundle lists only its own targets.
- A shared patch that lists a TV app filters its list with `forBundle()`. A shared patch with no TV app goes in the TV flavor's excludes.
- A patch that applies only to one build goes in a `tv/` folder, or in the TV flavor's excludes.
- CI compiles both split flavors on every push. Run `check_bundle_flavors.py` before a release that changes any of the above.
