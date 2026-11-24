# Contributing

Thanks for helping. These patches change a WebView app whose pages Quora updates often, so most
problems are a page patch that no longer finds what it hides. Good reports and small fixes are the
most useful contributions. Please follow the [code of conduct](../../CODE_OF_CONDUCT.md), and report
security problems privately as described in [SECURITY.md](../../SECURITY.md).

## Reporting a problem

The quickest way is **Report a problem** in Patch settings (long-press Home): it copies the app
details and opens the form. Otherwise open a
[bug report](https://github.com/JoFSlash/morphe-patches/issues/new?template=bug_report.yml) with:

- the patch name as Morphe Manager shows it,
- what you expected and what happened, ideally with a screenshot of the page,
- the versions of Quora, the patches and Morphe Manager,
- for a crash, the log from `adb logcat | grep -E "AndroidRuntime|JoFSlashPatches"`.

## How the patches are built

- `patches/src/main/kotlin/app/jofslash/patches/quora/` holds the patches. Each one finds a method in
  the Quora app with a fingerprint and inserts a call or a few instructions.
- `extensions/quora/src/main/java/app/jofslash/extension/quora/` holds the code those calls run
  inside the app.
- Most visual patches inject CSS or a small script into Quora's pages when a page finishes loading
  (`QWebViewClient.onPageFinished`). They rely on Quora's stable class names, `dom_annotate_*` and
  `puppeteer_test_*`; generated class names change with every Quora deployment and must not be used.
- Network patches answer requests in `QWebViewClient.shouldInterceptRequest` or drop app API calls in
  `QNetworkCalls.callApi`.

## Building and testing

Requires JDK 21 and a GitHub token with `read:packages`:

```bash
GITHUB_ACTOR=<you> GITHUB_TOKEN=<token> ./gradlew buildAndroid
```

The bundle is written to `patches/build/libs/patches-*.mpp`. Load it in Morphe Manager as a local
bundle, or patch an APKM from APKMirror with the Morphe CLI, and check every supported Quora version
listed in `patches/src/main/kotlin/app/jofslash/patches/quora/shared/Constants.kt`.

### A new Quora version

`.github/scripts/check_app.py quora` checks a new version in one go: it applies every patch with
the Morphe CLI, lists the patches that no longer apply and why, and says whether the version still
needs adding to `Constants.kt`. With `--install` it also installs the patched app over adb and looks
for a crash at start.

```bash
python .github/scripts/check_app.py quora com.quora.android_X.Y.Z.apkm --cli morphe-cli.jar --install
```

This mostly runs on its own. `.github/workflows/quora-version.yml` (with the shared
`app-version.yml` and the settings in `.github/apps/quora.json`) checks APKMirror and Google Play
every day. For a new version it downloads the APKM, checks that every split is signed by Quora,
keeps it as a release in the private repository `JoFSlash/morphe-apks`, patches it, starts it on an
emulator and opens a pull request that adds the version to `Constants.kt`. When something fails it
opens an issue that says what. A maintainer still tries the page patches on a phone before merging.

The page patches depend on Quora's web pages, which can change without a new app version. The
Patch settings dialog (long-press Home) shows a page check for the feed and answer pages: when a
page no longer has the class names some patches rely on, it names those patches.

### Tests

- `.github/page-scripts/run.sh` writes every script the page patches inject, checks that each one
  parses, and runs the DOM checks in `dom-test.js` on trimmed copies of Quora's markup. Add a check
  there when you change what a script hides.
- `emulator.yml` patches the newest supported version on every pull request, installs it on an
  emulator and checks that it starts and loads the sign-in page.
- `feed-test.yml` signs in with a test account and checks the page patches on the real feed and on
  an answer (`.github/scripts/feed-test.mjs`). It leaves out "Start tab", so the app opens on the
  Home feed.
- `release.yml` makes the Wednesday pre-release from `dev` and the Saturday stable release from `main`
  (it merges the newest pre-release into `main` first, and `main` is merged back into `dev` after
  the release). It runs the emulator test and the feed test first and releases only when both pass;
  a skipped feed test doesn't count as passed. When a run doesn't pass, the issues "Weekly release
  stopped" (or "Weekly pre-release stopped") and "Feed test needs attention" say why, and the next passing run closes them. An urgent
  fix can be released by hand with "Skip the feed test" while the feed test can't run.
- The workflows use the Morphe CLI release in `.github/morphe-cli-version`. `morphe-cli.yml` looks
  for a newer stable one every Sunday, runs the emulator test with it and opens a pull request.
- Feed test sign-in: Quora asks every new
  device for a code sent by email, and each run is a new emulator, so the test uses a saved session
  from the `QUORA_TEST_COOKIES` secret and only falls back to `QUORA_TEST_EMAIL` and
  `QUORA_TEST_PASSWORD`. It skips itself with a warning when Quora clearly asks for a captcha or a
  code, and fails on any other failed sign-in. To save a session: install a test build with WebView
  debugging as a clone, sign in to the test account there (never your own), then
  `adb forward tcp:9222 localabstract:webview_devtools_remote_$(adb shell pidof <package>)` and
  `node .github/scripts/export-quora-session.mjs | gh secret set QUORA_TEST_COOKIES`. The session
  lasts about a year, or until that app signs out.
- `.github/scripts/check_texts.py` fails when a settings language misses a text the app shows.
  Add a new text to every `Texts<Lang>.java`; the Build workflow runs the check.

## Pull requests

- Target the `dev` branch. Every Wednesday the `feat` and `fix` commits merged into `dev` that week go
  out as a pre-release (`vX.Y.Z-dev.N`) for people who turn on "Pre-release patches" in Morphe
  Manager. On Saturday that pre-release becomes the stable release on `main`, unless an open issue
  is labelled `release blocker`. Both need the emulator and feed tests to pass; urgent fixes are
  released right away by hand (see below).
- GitHub closes the issues a pull request names with "Closes #N" only when it is merged into
  `main`. For pull requests into `dev`, close them by hand once the stable release has them.

### Urgent fixes

A crash at start or a broken sign-in shouldn't wait for Saturday:

1. Branch from `main` and open the pull request against `main`. Label the issue `release blocker`
   if the current pre-release has the bug too, so Saturday doesn't make it stable.
2. After merging, run the Release workflow by hand on `main` (Actions > Release > Run workflow).
   It releases a patch version once the emulator and feed tests pass. "Skip the feed test" is only
   for when the feed test itself can't run.
3. The release merges `main` back into `dev`, so the next pre-release has the fix. If that merge
   fails, merge `main` into `dev` by hand. On Saturday, conflicts in the files the releases
   generate (`CHANGELOG.md`, `gradle.properties`, `patches-bundle.json`, `patches-list.json`,
   `README.md`) are resolved by the workflow; any other conflict stops the stable release.
- Use [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:` and so
  on); the release notes and version numbers are generated from them.
- Describe what you tested and on which Quora version.
