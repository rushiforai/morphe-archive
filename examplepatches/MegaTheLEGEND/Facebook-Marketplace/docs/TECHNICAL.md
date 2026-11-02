# Technical reference (Facebook "Marketplace only" patch)

Full bytecode notes, fingerprints, build flags and test commands. Moved here from the README; the README is the short human version.


Turns the Facebook Android app into a Marketplace-only app. It is a [Morphe](https://github.com/MorpheApp) patch: you don't decompile or recompile anything, Morphe patches the APK directly.

**Target:** `com.facebook.katana` **582.0.0.50.54** (plain APK, arm64). The patch is anchored on Redex-obfuscated class names, so it is tied to this exact version.

Not affiliated with Meta. For personal use; don't commit or redistribute Facebook's APK.

## What it does

| Feature | Option (default) | How |
|---|---|---|
| Opens on Marketplace | always on | Hooks the end of `X.2GO.A06(Z)V` (the tab bar controller's "determine starting tab"), finds the Marketplace tab by ID (`1606854132932955`, not list position) and selects it. |
| Hides the bottom tab bar | `hideTabBar` (on) | Same hook sets the tab bar view to `GONE`. |
| Locks navigation | `lockNavigation` (on) | No swiping between tabs (`X.25n`, the main tab ViewPager, never intercepts or handles touches); no left-hand Facebook menu (`X.24g` SlidingPanelScrollView: no edge swipe, "snap to panel" is a no-op, so the hamburger does nothing). |

| Links open in the system browser | `externalLinks` (on) | `X.dBh.A00` (the link launcher's WEBVIEW/EXTERNAL/CUSTOM_TABS decision) always returns EXTERNAL, same as Facebook's own "links open externally" setting. |
| Blocks Reels / fullscreen video viewer | `blockReels` (on) | The launch chain `X.7rP.A01` -> `X.4Ok.A0C` -> `X.4Ok.A0B` -> `X.4Ok.A03` -> `ImmersiveActivity` (traced from a real logcat of tapping a profile reel) is cut: `7rP.A01`/`4Ok.A0A`/`4Ok.A03` return immediately, `4Ok.A0B` claims "handled" so callers don't fall back to the legacy player. `ImmersiveActivity` itself is NOT blocked, it hosts every full-screen surface incl. Marketplace item pages. |
| Search stays in Marketplace | `blockFacebookSearch` (on) | Keeps search inside Marketplace. Layer 0, **checked in the dex**: `X.hQ5.A01(Context, Bundle, FbUserSession, GraphSearchQuery, int)V`, the single launcher of Facebook's search screen, returns immediately when the call comes from the profile handlers (`X.P9y`, `X.P9Y`, `X.P8e`, `com.facebook.timeline.*`); everything else, Marketplace's own search included, is allowed (an allow-list broke the Marketplace search button on device). That closes profile > More options > Search (`X.P9y` / `X.P9Y` -> `hQ5`), the nav-bar search, and Meta AI result cards. Two more layers for "Search in all of Facebook" / "Search with Meta AI" rows inside Marketplace search, both **unverified on a real APK**: (1) rows whose text / content description is one of those labels are hidden by a layout listener (`SearchScope.install()`, activity lifecycle callbacks; RN draws real views; English strings only); (2) a second MobileConfig filter chained after the group one (`SearchScope.filterBoolByName/BySpec`) forces matching Marketplace search flags to false and logs every candidate under tag `MarketplaceOnly`. |
| Reclaims the tab bar's space | part of `hideTabBar` | After hiding the bar the extension keeps it 0 high, hides full-width filler views on the bottom edge and clears bottom padding/margin equal to the bar's old height (a few passes over the first 3 s). Logs the view tree under tag `MarketplaceOnly`. |
| Back leaves the app | `marketplaceIsHome` (on) | In `onBackPressedInternal` the "home tab id" read from `X.1Hz.A02()` is replaced with Marketplace's id, so with nothing left to pop, back exits instead of switching to the Feed. |
| Returning after a while stays on Marketplace | `returnToMarketplace` (on) | Every tab switch goes through `X.2FU.A06(..., int index)`, including Facebook's "reset to feed in background" routine (`X.2Nb.A03` -> `X.23K.A0T`). The patch replaces the requested index with Marketplace's (looked up by tab id), so the reset lands on Marketplace instead of the Feed. |
| Always dark mode | `forceDarkMode` (on) | Facebook's own Dark mode setting is `X.1Mi.A00` (`ThemePreferences$State`: ON / OFF / SYSTEM), read by `X.1Mi.A05()` ("is dark?", called by every activity's theme setup). The patch loads `State.ON` before each store to `A00` in the `X.1Mi` constructor and replaces the argument of the setter `X.1Mi.A04(State)`, i.e. the same as choosing "On" in Facebook's settings, so the system theme is ignored. Because that alone wasn't enough on a device, the three decision points are also made unconditional: `X.1Mi.A05()` ("is dark?") returns true, `X.1Mi.A03(theme, isDark)` always applies the dark style, and the FDS/Litho resolver `X.25R.A02(Context)` returns true. |
| About page in the account menu | `aboutPage` (on) | The top-right button ("Tap to view your Marketplace account", `X.2BS`) opens a native menu built by `X.CNM.buildMarketplaceSurfaceMenuItems` (`X.D5M.onClick`, case "tab_bar_you", shows it with `X.OXT.A00`). The patch calls `AboutMenu.addAboutItem(list, context)` right before the builder's `X.0s1.A1j(list)`; the extension appends an `X.OlL` row (icon `INFO_CIRCLE` found by `Enum.name()`, label "About", id `marketplace_about`, a reflective `Function0` proxy) whose click opens `AboutDialog`, a full-screen dark About page (flat sections on a near-black surface, blue-to-purple accent on the title rule and the GitHub button; about text, developer info, "not affiliated with Meta"). It is a full-screen `Dialog` built in code, not an Activity: a new Activity needs a manifest entry, which an extension can't add. If the flag behind that menu is off, the button opens the React Native "You" page instead and no row can be added. |
| Renamed app (separate patch) | `Marketplace rename` (on in the build scripts; `-KeepOriginalPackage` / `KEEP_ORIGINAL_PACKAGE=1` opts out). Options: `newPackageName` = `io.focalpoint.prism`, `appName` = `Marketplace` | Depends on Morphe's own `Clone app` patch and hands it the package name via `setOrGetFallbackPackageName` (same hook GmsCore support uses). Clone app's finalize step sets the manifest `package` and renames custom permissions and provider authorities starting with `com.facebook.katana.`. The display name is a literal `android:label` written on `<application>` and on every LAUNCHER `<activity>` / `<activity-alias>` (literal, because resource names are stripped in this build and a literal can't be overridden by `values-xx`). Option `changeIcon` (on) also replaces the launcher icon with a bundled adaptive storefront icon (`patches/src/main/resources/marketplace-icon/`, generated from `tools/icon/preview.webp` by `tools/icon/make_icon.py`): `android:icon` is pointed at `@mipmap/marketplace_launcher` on `<application>` and every launcher entry and `android:roundIcon` is removed. Installs next to the stock Facebook app. |

If Marketplace isn't in the account's tab list, or a lookup fails, the extension does nothing and Facebook opens normally.

See [TODO.md](TODO.md) for what's next.

## Status

| Piece | State |
|---|---|
| Opens on Marketplace, tab bar hidden | Works on device |
| Launch crash (`VerifyError`, register `v27` type `Conflict`) | Fixed. `A06` reuses its `this` register as scratch, so the patch captures `this` at method entry and the return hooks take no registers |
| External links | **Works on device** (links open in the default browser) |
| Block Reels | **Works on device** (reels don't start, no audio) |
| Back leaves the app | Written from the dex (exactly one `1Hz.A02()` call in the method, same-size swap), **not yet tested on device** |
| Blank strip where the tab bar was | Reclaim logic written, unit-tested on a JVM with fake views, **not yet tested on device** |
| Return to Marketplace after a long absence | Written from the dex (`X.2FU.A06` index redirect, unit-tested on a JVM), **not yet tested on device** |
| Always dark mode | Written from the dex (pins Facebook's own `ThemePreferences$State` to ON), **not yet tested on device** |
| Remove group suggestions ("Recommended groups" on search, "Related groups" on a listing) | Written from the dex + the APK's MobileConfig metadata (React Native screens, so the group modules are switched off through their flags, `GroupSuggestions.java`), unit-tested on a JVM, **not yet tested on device** |
| Search stays in Marketplace ("Search in all of Facebook", "Search with Meta AI") | Written without the APK (text matching + flag-name pattern), unit-tested on a JVM with fake views, **not yet tested on device** |
| Navigation lock | **Works on device**: app launches, swipe and the side menu are blocked. The hamburger icon is still drawn (see TODO) |
| About row in the account menu | Written from the dex (injection point and `X.OlL` shape checked in `classes7.dex`), extension logic unit-tested on a JVM, **not yet tested on device** |
| Extension logic | Unit-tested on a plain JVM (`tests/`) |
| Rename to `io.focalpoint.prism` / "Marketplace" + storefront icon | **Works on device** (builds, installs next to stock Facebook, launches) |

Known limits:
- The hamburger icon is still drawn; tapping it does nothing (planned: turn it into a refresh button). The blank strip fix is untested; if a strip remains, send `adb logcat -s MarketplaceOnly`.
- Occasionally returning to the app lands on the Facebook Home feed instead of Marketplace (not investigated yet, see TODO).
- Notification taps and deep links can still open other screens (a `fb://reel/...` link may land on a blank loading screen instead of a reel).
- Blocking the Reels viewer blocks Facebook's fullscreen video viewer generally, so a Marketplace listing video can't be opened full-screen either (inline playback is untouched).
- No `compatibleWith` (the signing-cert hash isn't in the dex), so Morphe treats it as a universal patch; the fingerprints stop it patching the wrong thing.

## Document the bytecode for future agents

This patch only works because of reverse-engineered facts about Facebook's obfuscated bytecode, and those names change every build. **Whenever you find or rely on a piece of bytecode, write it down** so the next person or agent doesn't have to re-derive it from a 150 MB APK. Put it next to the code that uses it, in the KDoc above the fingerprint in `Fingerprints.kt` (and in a code comment where the patch edits it), and summarise the behaviour in the table above and in `TODO.md`.

For each class or method you touch, record:

- **Where:** the obfuscated name (`X.1Mi.A05()Z`) and, where known, what it really is (theme manager, "is dark mode?").
- **What it does and why it matters:** the behaviour in one or two sentences, including the values that matter (enum constants and their ints, tab ids, pref keys, log strings).
- **Register layout at the edit point:** how many registers, which are parameters (`p0 = v16`), which are free locals, and which are reused as scratch (the `A06` `v27` `VerifyError` came from skipping this).
- **How it was found and checked:** the log line, string or caller chain that led to it, and how you confirmed it (for example "only caller", "occurs exactly once in all 21 dex files", "only reads of this pref key").
- **What the patch changes and what it deliberately leaves alone,** plus anything unverified.
- **Version:** these notes are for `582.0.0.50.54`; say so, so they can be re-checked on a new build.

Prefer anchoring fingerprints on strings and signatures over obfuscated names where possible, and write down the string you used. Use `tools/dexscan.py` (see below) to produce the facts, then commit the notes with the patch, not afterwards.

## Build

Needs Java 21+ (Eclipse Temurin; Oracle JDK breaks Morphe's signing step), git, internet, and a GitHub **classic** token with only `read:packages` (the Morphe Gradle plugin lives on GitHub Packages).

Windows (cmd):
```
set GITHUB_ACTOR=your-username
set GITHUB_TOKEN=ghp_...
powershell -ExecutionPolicy Bypass -File .\build.ps1 -Apk "C:\path\to\com.facebook.katana_582.0.0.50.54-....apk" -JavaExe "C:\Program Files\Eclipse Adoptium\jdk-21...\bin\java.exe"
```
Flags: `-KeepTabBar` (leave the bottom bar), `-KeepNavigation` (don't lock swiping / left menu), `-KeepInAppBrowser` (keep the in-app WebView), `-KeepReels` (don't block Reels / fullscreen video), `-KeepAboutPage` (no About row in the account menu), `-KeepHomeBack` (back goes to Facebook Home), `-KeepOriginalPackage` (don't rename: keep `com.facebook.katana` and the name "Facebook").

Linux/macOS:
```
export GITHUB_ACTOR=your-username GITHUB_TOKEN=ghp_...
./build.sh /path/to/com.facebook.katana_582.0.0.50.54-....apk      # KEEP_TAB_BAR=1 / KEEP_NAVIGATION=1 / KEEP_IN_APP_BROWSER=1 / KEEP_REELS=1 / KEEP_HOME_BACK=1 / KEEP_ORIGINAL_PACKAGE=1 to opt out
```

The scripts clone `MorpheApp/morphe-patches` into `work/`, copy `extensions/` and `patches/` in, build the bundle, download Morphe Desktop's CLI and patch a **copy** of your APK. Result: `work/facebook-patched.apk`. With the rename (default) the app installs as `io.focalpoint.prism` next to the stock Facebook app, so nothing needs uninstalling; you sign in again. With `-KeepOriginalPackage` it keeps `com.facebook.katana`, so uninstall the Play Store version first (it's re-signed).

Test it:
```
adb shell am force-stop io.focalpoint.prism & adb logcat -c
adb shell monkey -p io.focalpoint.prism -c android.intent.category.LAUNCHER 1
adb logcat | findstr /i "AndroidRuntime VerifyError katana prism"
```
(Use `com.facebook.katana` instead of `io.focalpoint.prism` if you built with `-KeepOriginalPackage`.) Check the launcher shows the name "Marketplace" and the storefront icon and `adb shell pm list packages | findstr prism` lists the new package.

## Layout

```
patches/     Kotlin: fingerprints + the "Marketplace only" patch + the "Marketplace rename" patch
extensions/  Java: runtime logic injected into the app (MarketplaceOnly, GroupSuggestions, SearchScope)
docs/        TECHNICAL.md (bytecode notes), TODO.md, AGENT-TOOLS.md
dist/        marketplace-patches.mpp after build (ignored by git)
tests/       Plain-JVM unit tests for the extension (mock class shapes)
tools/       dexscan.py - find strings, callers, classes in the app's dex files
tools/icon/  preview.webp (source icon) + make_icon.py, which regenerates patches/src/main/resources/marketplace-icon/
agent-tools/ Dex.java (dexlib2-based class/disassembly/strref/callers) + arsc.py (resource ids); see agent-tools/README.md
build.ps1 / build.sh
```

### Unit tests
```
cd tests && javac -d out $(find src -name '*.java') ../extensions/facebook/src/main/java/app/morphe/extension/facebook/marketplace/*.java && java -cp out Test && java -cp out GroupSuggestionsTest && java -cp out AboutMenuTest
```

### Finding things in a new build (`tools/dexscan.py`)
Unzip the APK's `classes*.dex` into a folder, then:
```
python tools/dexscan.py dexdir strings "(?i)reels"          # regex over all strings
python tools/dexscan.py dexdir strref SomeExactString        # methods that reference it
python tools/dexscan.py dexdir callers "LX/24g;" A0E         # who calls a method
python tools/dexscan.py dexdir class "LX/25n;"               # fields + methods
python tools/dexscan.py dexdir dis "LX/24g;" A0E             # registers, refs; check free registers BEFORE injecting smali
python tools/dexscan.py dexdir subclasses "Landroidx/viewpager/widget/ViewPager;"
```
Rule learned the hard way: before injecting smali, check the method's register count and never read `p0` at a `return-void`; compilers reuse parameter registers.

## Exporting the .mpp
`build.ps1 -ExportMpp` (Windows) or `./build.sh --export-mpp` builds only the patch bundle and copies it to `dist/marketplace-patches.mpp`. A normal build (with an APK) also writes it there.


## Standalone Gradle project
The repo builds on its own (`settings.gradle.kts`, `gradle/`, `gradlew`, `patches/`, `extensions/`); nothing is cloned or deleted per build. Build files follow `MorpheApp/morphe-patches`. `patches/.../all/misc/clone/CloneAppPatch.kt` is a verbatim copy of Morphe's "Clone app" patch (GPLv3, notice preserved) that the rename patch depends on; re-sync it, `gradle/libs.versions.toml` and the `app.morphe.patches` plugin version in `settings.gradle.kts` when Morphe's tooling changes. Build: `./gradlew :patches:buildAndroid` -> `patches/build/libs/patches-*.mpp`.
