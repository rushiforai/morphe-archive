# Hide sponsored content

## Scope

Add a separate patch for the sponsored Spotlight / featured-trailer card on
the Films home tab. Keep ordinary film trailers, Video Store, editorial news,
and the existing AdMob patch independent. Initial work was kept uncommitted;
on 2026-11-10 the user authorized a combined dev push and closure of issue #12.

## Implementation

- Add `patches/src/main/kotlin/app/template/patches/letterboxd/ads/HideSponsoredContentPatch.kt`.
  Match `PopularViewModel$UIState$MainView.getFeaturedTrailer()` by class,
  name, access flags, arguments and return type, and return null at its head.
  Letterboxd's home observer responds by setting `adComposeView` to GONE,
  bypassing the sponsored composable and its impression-tracking effects.
  Depends only on the patcher API and shared package compatibility constant.
- Update the hand-written patch notes in `README.md`; leave generated
  release metadata and patch tables alone.
- Update `extensions/extension/src/main/java/app/template/extension/settings/ModWelcome.java`
  with this update's sponsored-content note and increment its dialog build
  marker from 7 to 8. Depends on the Mod settings extension being included.
  Verify with `buildAndroid --offline` and an on-device update launch.

Proof command: `JAVA_HOME=/opt/homebrew/opt/openjdk@21 ./gradlew buildAndroid --offline`.

## Verification

- Build the patch bundle, then apply only the new patch to the local clean
  Letterboxd 3.5.4 and 3.5.6 APKs with Morphe Desktop CLI, using `--exclusive`
  and `--unsigned`. Keep verification output under `/tmp/letterboxd-sponsored`.
- Disassemble the output DEX and confirm that the getter returns null before
  its original field read. Inspect each version's caller to confirm null
  hides the complete sponsored container.
- Review the diff for scope, fingerprint accuracy, and register safety.
- Device UI verification requires a device displaying a sponsored card; do
  not claim on-device verification from successful patch application alone.

### Results

- `buildAndroid --offline`: passed with JDK 21.
- Morphe CLI exclusive application: passed on clean 3.5.4 and 3.5.6, with
  no failed patches. Reports: `/tmp/letterboxd-sponsored/result-3.5.4.json`
  and `/tmp/letterboxd-sponsored/result-3.5.6.json`.
- `apkanalyzer dex code` on both output APKs: the getter starts with
  `const/4 v0, 0x0; return-object v0`. Both methods have a separate local
  register, so `p0` is preserved. Both stock callers branch to GONE (8)
  for `adComposeView` when this getter returns null.
- Code review: no findings. Exact fingerprint, no optional failure swallowing,
  no extension dependency, and no edits to generated release metadata.
- No connected Android device; sponsored-card rendering has not been tested
  on-device. No commit or release created.

### Phone smoke test (2026-10-19)

- Connected Pixel 10a, Android SDK 37. No Letterboxd package was installed.
- Rebuilt the bundle and patched the clean 3.5.6 APKM with the six default
  patches, including Hide sponsored content. Patching and signing passed.
- Installed with `adb install -r`: Success. Package reports 3.5.6 (498).
- `am start -W` returned Status: ok; app process remained running and the
  inspected logcat contained no launch crash. The output APK's getter was
  checked with `apkanalyzer dex code` and returns null as intended.
- APK: `/Users/mvaishak/Developer/Morphe Patches/OG APKs/Letterboxd/2026-10-19_2237/Letterboxd-3.5.6-498-patched.apk`.
- Phone remained on its lock screen; requested user unlock/sign-in. Films
  feed and actual sponsored-card removal still require visual verification.

### Signed-in feed and changelog verification

- After user sign-in, inspected the Films feed at the top, after scrolling,
  and after a cold restart. Popular this week is followed by New from friends
  with no sponsored card or empty card-sized gap. Video Store and Popular
  with friends still render. No launch crash found in inspected logcat.
- This verifies the displayed patched feed; no unpatched control was run to
  prove a sponsored placement was being served to this account at that moment.
- Initial lock/login launch did not leave a visible welcome dialog. A cold
  restart showed the old Support notes. The first build had retained BODY
  and BUILD 7, so it also lacked an update-specific changelog.
- Updated BODY for sponsored-content hiding and BUILD to 8, rebuilt and
  installed over the signed-in app. Install succeeded and login persisted.
  Captured the visible What's new dialog with the new Home notes in
  `/tmp/letterboxd-sponsored/device-changelog.png` and UI XML. Left it open
  for the user. Feed screenshot: `/tmp/letterboxd-sponsored/device-top.png`.
- Final APK: `/Users/mvaishak/Developer/Morphe Patches/OG APKs/Letterboxd/2026-10-19_2241/Letterboxd-3.5.6-498-patched.apk`.
- Review: no additional findings; only the changelog text/build marker changed
  after the feed check. Generated release files remain unchanged. No commit.

## Combined dev release (2026-11-10)

- Review dependency PRs #16 (semantic-release action v8), #17 (Morphe
  changelog plugin f3d88b2), and #18 (setup-java 6.1.0). Files affected:
  `.github/workflows/release.yml` and `package-lock.json`. Dependencies:
  Node >=20.19 for the plugin and semantic-release >=20 for the action;
  the project already uses semantic-release 25 and the workflow uses Node LTS.
- Keep this patch, README notes, this evidence log, and the BUILD 8 welcome
  notes together. Merge the three exact Dependabot heads locally and push
  the combined history to dev once, so only one release build is triggered.
- Verify with `JAVA_HOME=/opt/homebrew/opt/openjdk@21 ./gradlew buildAndroid`,
  `npm ci`, a smoke test of the new changelog plugin in a temporary directory,
  and exclusive Morphe patch application to clean Letterboxd APKs.
- After successful CI publishes the dev prerelease, close issue #12 with
  the release link. Do not merge dev to main or publish a stable release.
- Preserve the test limitation: the earlier phone run did not establish that
  a sponsored card was served, so it is not an A/B confirmation of blocking.

### Pre-push verification

- Combined build passed with JDK 21. An initial offline attempt lacked the
  ARSCLib cache; the online build resolved it without source changes.
- `npm ci` passed. All configured semantic-release plugins imported, and
  the new ESM changelog plugin generated the expected version, download URL,
  empty signature URL, and changelog in an isolated temporary directory.
- Fresh exclusive patch application and bytecode inspection passed on clean
  3.5.4 and 3.5.6 APKs; both getters return null before the original field read.
- Dependency review found no compatibility blockers. npm audit also reports
  existing tooling vulnerabilities; affected high/critical package entries
  are unchanged by these three PRs. No unrelated dependency updates added.
- Formal approval reviews were attempted for all three exact PR heads;
  the GitHub connector returned 403 (review-write permission unavailable).
