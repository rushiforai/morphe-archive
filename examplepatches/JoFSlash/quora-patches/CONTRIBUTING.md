# Contributing

Thanks for helping. These patches change a WebView app whose pages Quora updates often, so most
problems are a page patch that no longer finds what it hides. Good reports and small fixes are the
most useful contributions.

## Reporting a problem

Open a [bug report](https://github.com/JoFSlash/quora-patches/issues/new?template=bug_report.yml) with:

- the patch name as Morphe Manager shows it,
- what you expected and what happened, ideally with a screenshot of the page,
- the versions of Quora, the patches and Morphe Manager,
- for a crash, the log from `adb logcat | grep -E "AndroidRuntime|JoFSlashPatches"`.

## How the patches are built

- `patches/src/main/kotlin/app/jofslash/patches/quora/` holds the patches. Each one finds a method in
  the Quora app with a fingerprint and inserts a call or a few instructions.
- `extensions/extension/src/main/java/app/jofslash/extension/quora/` holds the code those calls run
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

`.github/scripts/check_quora_version.py` checks a new version in one go: it applies every patch with
the Morphe CLI, lists the patches that no longer apply and why, and says whether the version still
needs adding to `Constants.kt`. With `--install` it also installs the patched app over adb and looks
for a crash at start.

```bash
python .github/scripts/check_quora_version.py com.quora.android_X.Y.Z.apkm --cli morphe-cli.jar --install
```

The page patches depend on Quora's web pages, which can change without a new app version. The
Patch settings dialog (long-press Home) shows a page check: when the feed no longer has the class
names some patches rely on, it names those patches.

## Pull requests

- Target the `main` branch. Every merge into `main` with a `feat` or `fix` commit makes a release.
- Use [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:` and so
  on); the release notes and version numbers are generated from them.
- Describe what you tested and on which Quora version.
