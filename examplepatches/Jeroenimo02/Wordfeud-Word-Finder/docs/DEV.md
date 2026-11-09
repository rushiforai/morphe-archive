# Development

New Wordfeud version? See `docs/UPDATING.md` (check script `tools/check-apk/check_apk.py`, device test list and
where to change what). Every package of the extension has a `package-info.java` describing what it does and which
part of Wordfeud it relies on.

The extension requires **Android 7.0 (API 24) or newer** (it uses `java.util.function`, `Comparator.comparing`,
`List.sort`, `URLConnection.getContentLengthLong`, `Math.addExact`). Do not use APIs above 24 without a version check.

## Commit messages and releases

Releases are made by semantic-release from the commit messages (Conventional Commits: `feat:` → minor, `fix:` →
patch). The commit subjects become `CHANGELOG.md` and the release notes that Morphe Manager shows, so **write commit
messages in English**. The word list workflows already do (`fix(wordlists): nl: removed X (rejected by the server)`).

Branches: work on a feature branch, pull request to `dev` (pre-releases), then the automatic pull request `dev` →
`main` (stable release). Merge one pull request at a time and wait for its release run to finish.

## Commands (CI and machines with the Android SDK)

```sh
./gradlew :extensions:extension:testDebugUnitTest   # JVM unit tests of the extension
./gradlew buildAndroid                              # builds patches/build/libs/patches-*.mpp
```

The Morphe Gradle plugin (`app.morphe.patches` 2.1.0) comes from GitHub Packages
(`maven.pkg.github.com/MorpheApp/registry`) and needs a token (`gpr.user`/`gpr.key` in `~/.gradle/gradle.properties`,
or `GITHUB_ACTOR`/`GITHUB_TOKEN`).

## Tests without the Android SDK

`tools/jvm-tests/` is a standalone Gradle build (plain `java` plugin, Java 17, Maven Central). It compiles
`extensions/extension/src/main/java` and runs `extensions/extension/src/test/java` (+ `src/test/resources`) with
JUnit 4.13.2 and `org.json`.

```sh
gradle -p tools/jvm-tests test
tools/jvm-tests/android-compile-check.sh
```

- Classes that use `android.*` cannot compile on the plain JVM; they are listed in `androidOnly` in
  `tools/jvm-tests/build.gradle.kts`.
- `android-compile-check.sh` compiles all extension sources and the unit tests against `android.jar` (platform 34;
  downloaded once to `tools/jvm-tests/.cache/`). This catches Android-only differences, for example that
  `org.json.JSONException` is a checked exception on Android. It only checks that the code compiles.

## Generated sources

- `core/BuildInfo.java`: written by the `generateBuildInfo` task (`extensions/extension/build.gradle.kts`) with
  `PATCH_VERSION = project.version` (semantic-release sets it in `gradle.properties` before building). "Copy details"
  shows it. The JVM test build uses `tools/jvm-tests/src/buildinfo/java/.../BuildInfo.java` with `"dev"`.
- `words/WordListManifest.java`: written from `wordlists/manifest.json` by `gradle/wordlist-manifest.gradle.kts`,
  with the repository (`GITHUB_REPOSITORY` in CI, else `wordlistRepository` in `gradle.properties`), the commit the
  lists are downloaded from (`GITHUB_SHA` in CI, else `git rev-parse HEAD`; a locally built patch therefore only
  downloads lists when that commit is pushed) and the report address (`wordReportUrl`).

## Patching locally

With Morphe Desktop (`MorpheApp/morphe-cli`, Java 21+):

```sh
java -jar morphe-desktop-*-all.jar patch -p patches/build/libs/patches-*.mpp \
  -o wordfeud-patched.apk Wordfeud_5.8.0_APKPure.xapk
# Install directly over ADB: add -i. Skip only the version check: -f
```

The GUI loads the same `.mpp` (local source) and accepts `.apk`, `.apkm`, `.xapk` and `.apks`.

## Refreshing the board after a move

After a successful move from the Play button, the overlay calls `Refresher.refresh(gameId)`. The strategy in use is
`LifecycleBounce` (`Refresher.ORDER`): it sends the app lifecycle states `inactive`, `hidden`, `paused` and, 300 ms
later, `hidden`, `inactive`, `resumed` on `flutter/lifecycle`, which makes Wordfeud reload the game. Messages are sent
through `FlutterJNI.dispatchPlatformMessage` on the instance remembered by `platformTapPatch` (`play/JniDispatch`);
the Flutter engine path (`getFlutterEngine()`) does not exist in Wordfeud.

Tried on 2026-11-02 and not used: `ForegroundSignal` (pigeon `onForegroundStateChanged`, no refresh), `RouteBounce`
(navigation to `/` and back, pushed an extra page) and `FcmNudge` (fake push message, untested). They stay in
`play/` in case a Wordfeud update breaks `LifecycleBounce`. The `refresh=` line of "Copy details" shows each step.

### Debug file

`files/wfwf/debug_refresh_order.txt` in the app's data replaces `ORDER` (strategy names separated by commas or lines,
`#` starts a comment) and turns on logging under the tag `WFWF-Refresh` (names only, never message contents). Without
the file nothing is logged. The external copy
`/sdcard/Android/data/com.hbwares.wordfeud.free/files/wfwf/debug_refresh_order.txt` is only read on Android 11 and
newer, because older versions let any app with storage permission write there.

```sh
adb shell mkdir -p /sdcard/Android/data/com.hbwares.wordfeud.free/files/wfwf
adb shell "echo RouteBounce > /sdcard/Android/data/com.hbwares.wordfeud.free/files/wfwf/debug_refresh_order.txt"
adb shell am force-stop com.hbwares.wordfeud.free
adb logcat -s WFWF-Refresh
adb shell rm /sdcard/Android/data/com.hbwares.wordfeud.free/files/wfwf/debug_refresh_order.txt   # afterwards
```

## Word lists

The lists live in `wordlists/` and are built with `python3 tools/wordlists/build.py` (Python standard library only);
see `wordlists/README.md`. After changing `sources.json`, `remove.txt` or `add.txt`, run the script and commit
`wordlists/`; the `Word lists` workflow checks this with `--check`. Reports from the patch update `remove.txt` and
`add.txt` automatically (`tools/report-worker/README.md`).
