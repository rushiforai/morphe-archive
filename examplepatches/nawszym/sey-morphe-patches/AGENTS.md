# AGENTS.md — Sey Morphe Patches

Context file for AI coding agents (opencode, Codex, Cursor, Claude Code, Copilot,
Jules, …). Read this **before** touching the repository. `README.md` is the
human/user documentation; this file is the engineering contract.

If you are an agent and something here contradicts the code, the code wins —
then update this file in the same change.

---

## 1. What this repository is

A single **Morphe patch bundle** (`.mpp`) that patches two Android TV apps:

| App | Package | Supported version | versionCode | Tile colour |
| --- | --- | --- | --- | --- |
| KICK: Live Streaming | `com.kick.mobile` | `1.9.0` | `208` | `#53FC18` green |
| Twitch (Android TV) | `tv.twitch.android.app` | `13.0.0.2` | `1100000018` | `#9146FF` purple |

There is **no Gradle project, no test suite, no CI**. The build is a set of
Windows PowerShell scripts that invoke `kotlinc`, `javac`, Android `d8` and the
Morphe CLI. "It works" means: the bundle builds and the behaviour was verified
on a real Android TV device.

Distribution chain (important):

1. `patches-list.json` — patch metadata read by Morphe Manager.
2. `patches-bundle.json` — manifest with the `.mpp` download URL.
3. `SeyMorphe-<version>.mpp` — the actual bundle.
4. `patches-bundle.png` — source icon, must sit **next to** the manifest.
5. `CHANGELOG.md` — release notes Morphe Manager parses.

Two runtimes are shipped in the same bundle:

- **Patch classes** (Kotlin, `patches/`) — run at *patch time* on the desktop/
  manager; they locate methods via fingerprints and inject smali.
- **Extension code** (Java + generated JavaScript, `extension/`) — runs at
  *app runtime* inside the patched APK, merged as a feature `.mpe` DEX.

---

## 2. Non-negotiable rules

1. **Never hand-edit generated output.** Do not edit:
   `patches-list.json`, `extension/generated/**`, `extension/classes/**`,
   `extension/dex/**`, `patch-classes/**`, `patch-dex/**`, `build/**`,
   `dist/**`, `remote/**`. Change the generator (`scripts/*.ps1`,
   `extension/src/**`, `extension/js/**`) and rebuild.
2. **Every feature patch must** call `compatibleWith(KICK_TV|TWITCH_TV)`,
   `dependsOn(settingsPatch)` and `extendWith("extensions/<App><Feature>.mpe")`.
   SEYTTINGS is the base of both apps.
3. **Never rename a patch `name =` value** (`SEYTTINGS`, `EMOTES`, `CHAT SIZE`,
   `CHAT TEXT SIZE`, `EXPAND CHAT`, `HIDE PINNED`, `SKIP 18+ WARNING`,
   `AMOLED`, `AD BLOCK`). Names are user-visible, used in `patches-list.json`
   and matched by changelog scopes.
4. **Descriptions must end with the dependency sentence**:
   `"Requires the SEYTTINGS patch."` Keep them byte-identical between the
   Kotlin patch and `scripts/generate-patches-list.ps1`.
5. **Fingerprints are version-locked.** The obfuscated class/method names are
   valid only for the exact APK versions in the table above. Never guess or
   "improve" a fingerprint; derive it from the APK (`tools/jadx`, `apktool.jar`,
   `tools/morphe-data/`) and re-verify all patches against the same build.
6. **Keep third-party attribution.** `extension/js/twitch-adblock.js` is
   adapted from CeladonTV/TwitchAdSolutions (MIT). The header must stay; see
   `README.md` § Third-party notices and `LICENSE` (GPLv3).
7. **Extension Java must stay Java 8 compatible.** `build-extension.ps1` uses
   `javac --release 8`. No `var`, records, text blocks, switch expressions.
8. **Generated JSON is ASCII.** Scripts use `-Encoding ASCII` on purpose to
   avoid a UTF-8 BOM (PowerShell 5 writes one by default) that breaks consumers.
   Emoji/Unicode belongs in `README.md` / `CHANGELOG.md` only.
9. **Do not commit binaries.** `*.apk`, `*.apkm`, `*.keystore`, `dist/`,
   `tools/`, `remote/`, `build/` are git-ignored. The versioned
   `SeyMorphe-<version>.mpp` at the repo root and the two root JSON files are
   intentionally tracked.
10. **Never inject code that can throw into the app.** Every runtime entry
    point (`attach`, `inject`, section builders, preference reads) must catch
    `Throwable` and fail silently — a patched app must never crash because a
    tweak is unavailable.

---

## 3. How the pieces fit together

### Build pipeline

```
patches/src/main/kotlin/**/*.kt
        │ kotlinc (classpath: tools/morphe-desktop.jar, jvm-target 17)
        ▼
patch-classes/**/*.class ──d8──► patch-dex/all/classes.dex
                                        │
extension/js/*.js ──(New-JsSource)──► extension/generated/**/*.java
extension/src/**/*.java ─────────────► javac (release 8, classpath android.jar
                                        + kotlin-stdlib + base classes)
                                        │ d8 --min-api 26
                                        ▼
                             extension/dex/<module>/classes.dex
                                        │
                                        ▼
        dist/SeyMorphe-<version>.mpp  =  META-INF/MANIFEST.MF
                                       + META-INF/main.kotlin_module
                                       + classes.dex                (manager)
                                       + extensions/<App><Feature>.mpe (runtime)
                                       + every .class file           (desktop)
```

The `.mpp` carries both JVM classes (Desktop/CLI patcher) and a `classes.dex`
(Morphe Manager on Android). The manifest must be the **first** ZIP entry.

### Bundle structure

- KICK: 9 entries — `SEYTTINGS`, `EMOTES`, `CHAT SIZE`, `CHAT TEXT SIZE`,
  `EXPAND CHAT`, `HIDE PINNED`, `SKIP 18+ WARNING`, `STOP ON MINIMIZE`,
  `DEFAULT HOME DESTINATION`.
- Twitch: 8 entries — `SEYTTINGS`, `AMOLED`, `AD BLOCK`, `EMOTES`,
  `EXPAND CHAT`, `HIDE PINNED`, `SKIP 18+ WARNING`, `DEFAULT HOME TAB`.

### SEYTTINGS runtime model

Both apps build the tweak dialog from **plain Android views** (never the app's
obfuscated Compose/React UI) using a shared `MorpheTheme` palette:

- `COLOR_BG 0xFF140C0C`, `COLOR_ACCENT 0xFFE53935`, `COLOR_FOCUS 0xFF4B1717`,
  `COLOR_TEXT 0xFFF6F0F0`, `COLOR_MUTED 0xFFB79B9B`.

Feature sections are **discovered by reflection**: the base dialog iterates a
hard-coded `SECTION_CLASSES` string array and instantiates whatever exists.
That is why a feature patch works without compiling against the base and why a
section silently disappears when its `.mpe` was not merged.

- KICK: `extension/src/.../kicktv/base/MorpheSettings.java`
  (interface `MorpheSection`, section package `kicktv/<feature>/`).
- Twitch: `extension/src/.../twitch/base/Seyttings.java`
  (interface `SeyttingsSection`, section package `twitch/<feature>/`).

Persistent switches live in `SharedPreferences`:

| App | Preference file | Example keys |
| --- | --- | --- |
| KICK | `morphe_kicktv` | `emotes_enabled`, `chat_resize_enabled`, `chat_size_percent`, `chat_text_size_sp`, `chat_expand_enabled`, `hide_pinned_enabled`, `mature_auto_accept_enabled` |
| Twitch | `morphe_twitchtv` | `emotes_enabled`, `amoled_enabled`, `adblock_enabled`, `expand_chat_enabled`, `hide_pinned_enabled`, `mature_auto_accept_enabled` |

### Twitch is a WebView app

All Twitch features are JavaScript injected into the remote Next.js ("Starshot")
UI. Each feature follows the same shape:

- `SeyttingsInjector.attach(WebView)` → `addJavascriptInterface(bridge, "seyttingsX")`
  **from the WebView client constructor** (before the first page load).
- `SeyttingsInjector.inject(WebView)` → `evaluateJavascript(...)` from
  `onPageStarted` and/or `onPageFinished`.
- JS bridge globals: `seyttingsNative`, `seyttingsAmoled`, `seyttingsAds`,
  `seyttingsEmotes`, `seyttingsChatExpand`, `seyttingsPinned`,
  `seyttingsMature`.
- JS must be idempotent: guard with a `window.__seyttings*Booted` flag,
  re-apply on `popstate` / interval, and swallow all errors.
- The Twitch settings row is hijacked: the existing
  `a[href*="cookie-preferences"]` row ("Cookies and Advertising Choices") is
  relabelled **SEYTTINGS** and its click is routed through the bridge. This
  avoids injecting a DOM node into a virtualised React list that the D-pad
  could not reach.

---

## 4. Directory reference

```
patches/src/main/kotlin/app/morphe/patches/
  kicktv/Target.kt                 KICK compatibility (package/version/colour)
  kicktv/settings/                 SEYTTINGS base patch (KICK)
  kicktv/emotes/                   EMOTES
  kicktv/chatsize/                 CHAT SIZE
  kicktv/chattext/                 CHAT TEXT SIZE
  kicktv/chatexpand/               EXPAND CHAT
  kicktv/hidepinned/               HIDE PINNED
  kicktv/maturewarning/            SKIP 18+ WARNING
  twitch/Target.kt                 Twitch compatibility
  twitch/settings/                 SEYTTINGS base patch (Twitch)
  twitch/emotes/                   EMOTES
  twitch/expandchat/               EXPAND CHAT
  twitch/adblock/                  AD BLOCK
  twitch/amoled/                   AMOLED
  twitch/hidepinned/               HIDE PINNED
  twitch/maturewarning/            SKIP 18+ WARNING

extension/js/                      readable JS sources (generated into Java)
  twitch-adblock.js                HLS stitched-ad filter (~40 KB, MIT-derived)
  twitch-amoled.js                 #000 surfaces
  twitch-maturewarning.js          18+ overlay auto-accept
  twitch-hidepinned.js             pinned-card hider

extension/src/app/morphe/extension/
  kicktv/base/                     dialog, theme, context, bridge, OpenSettings
  kicktv/chat/                     CHAT SIZE prefs/section (folder name is "chat")
  kicktv/chattext/  kicktv/chatexpand/  kicktv/emotes/
  kicktv/hidepinned/  kicktv/maturewarning/
  twitch/base/                     dialog, theme, bridge, injector, section iface
  twitch/amoled/  twitch/adblock/  twitch/emotes/  twitch/expandchat/
  twitch/hidepinned/  twitch/maturewarning/

scripts/
  _common.ps1                      SDK/JDK/kotlinc discovery (dot-source it)
  build-extension.ps1              Java+JS -> per-feature DEX
  build-patch.ps1                  Kotlin -> .class/.dex -> .mpp  (entry point)
  build-kick-apk.ps1               bundle + patch KICK APKM + sign/verify
  build-twitch-apk.ps1             bundle + patch Twitch APKM + sign/verify
  generate-patches-list.ps1        writes root patches-list.json
  prepare-remote.ps1               writes remote/ staging folder
  publish-remote.ps1               uploads files via GitHub REST API
  publish-release.ps1              creates/updates GitHub release + .mpp asset

tools/                             JAR/JDK/jadx/apktool (git-ignored)
tools/morphe-data/                 CLI state (patched-apps.json, temp .mpp)
```

Note: the KICK CHAT SIZE code lives in `kicktv/chat/` in the extension but in
`kicktv/chatsize/` in the patches. That inconsistency is real; don't "fix" it
without updating `build-extension.ps1`.

---

## 5. Fingerprint anchors (1.9.0 / 13.0.0.2 only)

### Twitch (`tv.twitch.android.app` 13.0.0.2)

| Purpose | Fingerprint |
| --- | --- |
| WebView client constructor | `Ls4/k;` → `<init>(J, Landroid/webkit/WebView;, Ls4/d;, Lio/sentry/android/replay/capture/h;)V` — **WebView is `p3`** because `J` occupies `p1`/`p2` |
| Early page hook | `Ls4/k;` → `onPageStarted(WebView, String, Bitmap)V` — WebView is `p1` |
| Late page hook | `Ls4/k;` → `onPageFinished(WebView, String)V` — WebView is `p1` |

Every Twitch patch reuses this constructor; the page hooks are chosen per
feature (`onPageStarted` for early/first-paint work, `onPageFinished` as the
universal fallback and for re-applying after navigation). `attach` goes at
index 0 of `<init>`; `inject` at index 0 of the page callbacks.

### KICK (`com.kick.mobile` 1.9.0)

| Purpose | Fingerprint |
| --- | --- |
| Activity handoff | `Lcom/kick/tv/MainActivity;` → `onCreate(Landroid/os/Bundle;)V` |
| Early context/prefs | `Lcom/kick/tv/KickApplication;` → `onCreate()V` |
| Settings row | `Lhh7;` → `f(LL;LL;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;L;I)V` filtered by `tv_settings_open_source_licenses` + `tv_settings_licensing_information` |
| Chat panel | `La79;` → `a(...)` (pinned card) / `b(...)` (message LazyColumn) / `c()V` (panel width) |
| Player sidebar | `Lbn2;` (openSidebar, literal `0.7f`) and `Lmb;` (toggle, `0.7f`) |
| Emote text pipeline | `Lvz3;` → `d(String)` and `a(...)`; URL builder `Lj40;` → `i(...)` with `chat_emotes_url` |
| TextStyle | `Lvi4;` → `<clinit>` writing field `m`; sizes via `Ldh7;` → `m(I)J` |
| Mature dialog | `Lsz6;` → `i(...)` |
| Splash start route | `Ldn0;` → `invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;` filtered by `const-string "home"` + `Lxs5;->b(String, Function1)` (last frame of the "VideoSplashScreen" effect) |

### Smali injection rules learned from this codebase

- Prefer `addInstructions(0, ...)`: prepending avoids shifting the original
  instruction indexes.
- When replacing one instruction, **preserve the register and the call format**
  (`invoke-static` vs `invoke-static/range`). See
  `kicktv/chattext/ChatTextPatch.kt::replaceSpCall`.
- `p0` is `this` only in instance methods; in `KickApplication.onCreate()` the
  instance is `v(registerCount - 1)` — see the `BuilderInstruction3rc` usage.
- Methods with many locals (e.g. `vz3.a`, 24 locals) cannot address `pN` with a
  35c invoke: use `invoke-static/range {p0 .. p0}`.
- `instructionMatches[i].index` follows **filter order** (`filters[0]` →
  `instructionMatches[0]`), not source order. Read the fingerprint KDoc.
- KICK settings row: label replacement removes 3 instructions
  (`const` + `ai7.i(...)` + `move-result-object`) and must run **subtitle →
  title** (highest index first) because indexes shift after removal.
- Injected helper calls must be `invoke-static` on a class that exists in the
  merged extension DEX; typos fail at runtime, not at build time.

---

## 6. Recipe: add a new Twitch feature patch

Order matters; each step is small.

1. **JS source** — `extension/js/twitch-<feature>.js`
   IIFE, `'use strict'`, idempotent boot guard, read state via
   `window.seyttings<Feature>.isEnabled()`, optional
   `.report(message)` logging, re-apply on interval/`popstate`, never throw.
2. **Bridge** — `extension/src/.../twitch/<feature>/Seyttings<Feature>Bridge.java`
   `@JavascriptInterface isEnabled()`, `setEnabled(boolean)`, optional
   `report(String)`; UI-thread hop via `Handler(Looper.getMainLooper())` when it
   opens native UI.
3. **Prefs** — `<Feature>Prefs.java`
   `PREFS_NAME = "morphe_twitchtv"`, key `<feature>_enabled`, `DEFAULT_ENABLED`,
   `init(Context)`, cached read/write.
4. **Injector** — `<Feature>Injector.java`
   `BRIDGE_NAME = "seyttings<Feature>"`, `attach(WebView)` (register interface
   once), `inject(WebView)` (`evaluateJavascript(<Feature>Script.get())`),
   `setEnabled(boolean)` pushes the new state into the page.
5. **Section** — `<Feature>Section.java implements SeyttingsSection`
   plain views, `MorpheTheme`, focusable checkbox, status + hint text.
6. **Register the section** — add the fully-qualified class name to
   `twitch/base/Seyttings.java::SECTION_CLASSES`.
7. **Build script** — in `build-extension.ps1` add a `New-JsSource` call
   (package `app.morphe.extension.twitch.<feature>`, class
   `<Feature>Script`) and a `Build-Module` call with
   `-SourceDir @($twitchFeatureSrc, $featureGeneratedRoot)`,
   `-DexDir (Join-Path $dexRoot 'twitch-<feature>')`,
   `-BaseClasses $twitchBaseClasses`.
8. **Bundle** — add
   `@{ Name = 'extensions/Twitch<Feature>.mpe'; Source = ...\twitch-<feature>\classes.dex }`
   to `$extensions` in `build-patch.ps1`.
9. **Patch** — `patches/src/.../twitch/<feature>/<Feature>Patch.kt`
   fingerprints (`<init>` + `onPageStarted`/`onPageFinished` as needed),
   `compatibleWith(TWITCH_TV)`, `dependsOn(settingsPatch)`,
   `extendWith("extensions/Twitch<Feature>.mpe")`, `execute { ... }`.
10. **Patch list** — add the entry to `generate-patches-list.ps1`
    (`name`/`description` identical to the patch; `compatiblePackages = @($twitchTv)`).
11. **Docs** — `README.md` Twitch table + project layout;
    `CHANGELOG.md` new version section.
12. **Build and verify** (§8).

## 7. Recipe: add a new KICK feature patch

Same idea, native instead of JS:

1. `extension/src/.../kicktv/<feature>/<Feature>Prefs.java` — prefs file
   `morphe_kicktv`.
2. `<Feature>Section.java implements MorpheSection` (package
   `app.morphe.extension.kicktv.<feature>`).
3. Optional helper/injector Java class for the runtime logic.
4. Register the section class in
   `kicktv/base/MorpheSettings.java::SECTION_CLASSES`.
5. `build-extension.ps1`: `Build-Module ... -DexDir $dexRoot\kick-<feature>
   -BaseClasses $kickBaseClasses` (add `-SourceDir` array only if you add JS).
6. `build-patch.ps1`: add the `extensions/Kick<Feature>.mpe` entry.
7. Kotlin patch under `patches/src/.../kicktv/<feature>/` with
   `KICK_TV`, `dependsOn(settingsPatch)`, `extendWith(...)`, fingerprints.
8. Ensure prefs have a `Context`: call `<Feature>Prefs.init(...)` from
   `MainActivity.onCreate` or `KickApplication.onCreate` inside the patch.
9. `generate-patches-list.ps1`, `README.md`, `CHANGELOG.md`.
10. Build and verify.

## 8. Build, release and verification

Prerequisites (see `scripts/_common.ps1`):

- JDK 21 in `tools/jdk21/` **or** `java` on `PATH` (only the CLI/keytool use it).
- `javac` on `PATH` (the script calls bare `javac`; it does **not** use
  `Get-ToolJava`).
- Android SDK with `platforms/*/android.jar` and `build-tools/*` (`d8`,
  `apksigner`, `zipalign`); discovered via `ANDROID_HOME`,
  `ANDROID_SDK_ROOT`, then `%LOCALAPPDATA%\Android\Sdk`.
- `kotlinc` from Android Studio or `PATH`, plus `kotlin-stdlib.jar`.
- `tools/morphe-desktop.jar` (local copy reports **v2.1.1**).
- `git` on `PATH` for the publish scripts (reads a token via
  `git credential fill`; never printed).

Commands (run from the repo root):

```powershell
# bundle only (also builds every extension first)
powershell -ExecutionPolicy Bypass -File scripts\build-patch.ps1

# bundle with a custom version
powershell -ExecutionPolicy Bypass -File scripts\build-patch.ps1 -Version 1.2.5

# patched APKs (also rebuild the bundle)
powershell -ExecutionPolicy Bypass -File scripts\build-kick-apk.ps1
powershell -ExecutionPolicy Bypass -File scripts\build-twitch-apk.ps1

# regenerate metadata + staging folder
powershell -ExecutionPolicy Bypass -File scripts\generate-patches-list.ps1 -Version 1.2.5
powershell -ExecutionPolicy Bypass -File scripts\prepare-remote.ps1 `
    -Owner seythegamer -Repo sey-morphe-patches -Version 1.2.5

# publish (needs network + git credentials)
powershell -ExecutionPolicy Bypass -File scripts\publish-remote.ps1 `
    -Owner seythegamer -Repo sey-morphe-patches -Version 1.2.5
powershell -ExecutionPolicy Bypass -File scripts\publish-release.ps1 `
    -Owner seythegamer -Repo sey-morphe-patches -Version 1.2.5
```

APK builders sign with `build/kick-morphe.keystore` /
`build/twitch-morphe.keystore` (auto-created, alias `morphe`, password
`morphe123`), then assert `apksigner verify --print-certs` and
`zipalign -c -p 4`. A patched APK cannot be updated from the store; the original
must be uninstalled first.

**Definition of done for a code change**

1. `build-patch.ps1` exits 0 and prints the bundle size.
2. The `.mpp` contains exactly the expected entries (no missing `.mpe`, no
   stale extra one).
3. If runtime code changed, the user confirms the behaviour on a real Android
   TV device (Android 11 was the reference). An agent cannot verify this alone —
   say so explicitly instead of claiming success.
4. `patches-list.json`, `patches-bundle.json`, root `.mpp`, `CHANGELOG.md` and
   `README.md` agree on the version and feature set.

### Version bump checklist (six scripts + five tracked artefacts)

The version `1.2.5` is hard-coded as a default in **six** scripts:

- `scripts/build-patch.ps1`
- `scripts/build-kick-apk.ps1`
- `scripts/build-twitch-apk.ps1`
- `scripts/generate-patches-list.ps1`
- `scripts/prepare-remote.ps1`
- `scripts/publish-remote.ps1` (`publish-release.ps1` takes `-Version` as a
  mandatory parameter)

Then update, in order:

1. `CHANGELOG.md` — new `## <version> (YYYY-MM-DD)` section at the top.
2. `README.md` — all `1.2.5`/`SeyMorphe-1.2.5.mpp` references (tables, build
   output, project layout, import instructions).
3. Build → `dist/SeyMorphe-<version>.mpp`.
4. **Copy the new bundle to the repo root** as `SeyMorphe-<version>.mpp` and
   remove the old root `.mpp`. Root `.mpp` is tracked; `dist/` is not.
5. **Update root `patches-bundle.json` by hand** (`version`, `download_url`,
   `created_at`, `description`). `prepare-remote.ps1` writes only
   `remote/patches-bundle.json`, so the root manifest drifts silently
   otherwise. Keep it ASCII and 4-space JSON style.
6. `generate-patches-list.ps1` → root `patches-list.json`.
7. `prepare-remote.ps1` → `remote/`.
8. Commit root `CHANGELOG.md`, `README.md`, `patches-list.json`,
   `patches-bundle.json`, `SeyMorphe-<version>.mpp`.
9. Publish (`publish-remote.ps1`, then `publish-release.ps1`).
10. Verify
    `https://raw.githubusercontent.com/seythegamer/sey-morphe-patches/main/CHANGELOG.md`
    returns the new heading (Morphe only shows notes for repository sources).

### Changelog format (Morphe parses this)

- One heading per release, newest first: `## 1.2.5 (2026-11-14)` — date is
  **required**.
- Section headings: `### ✨ New Features`, `### 🐛 Bug Fixes`,
  `### ⚡ Performance`, `### 📝 Other`.
- One bullet per change, scoped with the exact app name and an **ASCII
  hyphen**: `* **KICK: Live Streaming - HIDE PINNED:** ...` and
  `* **Twitch - AMOLED:** ...`.
- Match the app names from `Target.kt` (`KICK: Live Streaming`,
  `Twitch (Android TV)`) / the bundle (`Twitch`, `Mobile`).

---

## 9. Consistency traps found in this repo

Read these before "fixing" anything:

1. **No automation.** `patches-list.json`'s `NOTE` claims semantic-release /
   `release.yml` maintains it. There is **no `.github/` directory** in this
   checkout. Everything is manual PowerShell. Ignore the NOTE text; keep it as
   is for schema compatibility.
2. **Root manifest is not generated.** See §8 step 5. Only `remote/` gets a
   manifest from a script.
3. **Root bundle copy is manual.** `publish-release.ps1` prefers
   `./SeyMorphe-<v>.mpp`, then `dist/…`. `publish-remote.ps1` reads only
   `remote/…`, which `prepare-remote.ps1` fills from `dist/`.
4. **Patcher version mismatch.** `build-patch.ps1` writes
   `Patcher-Version: 2.3.0` into `MANIFEST.MF`, while the checked-in
   `tools/morphe-desktop.jar` reports **v2.1.1**. Verify which one is correct
   before publishing; do not silently change it.
5. **Two extension build orders.** `build-patch.ps1` always calls
   `build-extension.ps1` first, so any extension error blocks bundle builds even
   when only Kotlin changed.
6. **`javac` is assumed on `PATH`.** Only `java`/`keytool` resolve through
   `tools/jdk21`; `javac`, `kotlinc` and `d8` are looked up differently. A
   machine with only the bundled JDK cannot build.
7. **`d8` command-line limit.** >32 KB of class paths is why
   `patch-dex/d8-classes.txt` exists and is passed as `@file`. Keep paths
   relative to the repo root.
8. **`remote/` and `dist/` are git-ignored** even though the README's release
   checklist talks about committing those artefacts — it means the **root**
   copies. Don't `git add -f` ignored folders.
9. **`tools/` contents are not in the repo.** A fresh clone has no
   `morphe-desktop.jar`, JDK, jadx, APKM inputs or keystores. Missing input APKs
   are a setup problem, not a bug.
10. **The APKMs at the repo root are test inputs.** They are git-ignored and
    must match the exact supported versions; a newer APKM needs fresh
    fingerprints.

---

## 10. Style guide (match the surrounding code)

### Kotlin patches

- `private const val EXTENSION_CLASS = "Lapp/morphe/extension/<app>/<feature>/"`.
- Fingerprints are `private object <Purpose>Fingerprint : Fingerprint(...)` with
  KDoc explaining *why* that method, especially for non-obvious literals.
- Patch value: `@Suppress("unused") val <feature>Patch = patch(...)`, `name`
  in caps, sentence-style `description`, `default = true`.
- 4-space indent, trailing commas, named arguments, no wildcard imports.
- Comments explain the app internals, not the Kotlin syntax.

### Java extensions

- Java 8, 4-space indent, `final` locals where the file already does it.
- Anonymous `Runnable` / `View.OnClickListener` (not lambdas) — keep the style.
- KDoc on every public class; `try/catch (Throwable ignored)` around anything
  touching the app or WebView.
- UI: `MorpheTheme` helpers, `MorpheTheme.dp(...)`, `matchWidth()`,
  `makeFocusable(...)`; text sizes 12–24; `Close` button pinned below a
  `ScrollView` capped at 90% screen height.
- A section must never assume another feature's classes exist.

### JavaScript

- Header comment states origin/attribution when adapted.
- IIFE + `'use strict'`; one `window.__seyttings<Feature>Booted` guard; all
  DOM work inside `try { } catch (e) {}`.
- Prefer feature detection over localized text where possible; re-apply on
  interval and navigation.
- Never `eval`, never block the page, never throw uncaught errors.

### PowerShell

- `$ErrorActionPreference = 'Stop'`, dot-source `_common.ps1`,
  `Set-Location $script:RepoRoot`, `Write-Host` progress, `throw` with the
  failing step, check `$LASTEXITCODE` after every external tool.
- Keep file output ASCII unless the file is documentation.

### Documentation

- `README.md` — user-facing, tables of patches, exact commands.
- `AGENTS.md` (this file) — engineering rules; update when architecture changes.
- `CHANGELOG.md` — per-release, app-scoped bullets (see format above).

---

## 11. If you change X, also change Y

| You changed | Also update |
| --- | --- |
| a patch `name`/`description` | `generate-patches-list.ps1`, `README.md`, changelog scope |
| added/removed a feature | `build-extension.ps1` module list, `build-patch.ps1` `.mpe` list, `SECTION_CLASSES`, `generate-patches-list.ps1`, `README.md`, `CHANGELOG.md` |
| a preference key/default | its `*Prefs.java`, `*Section.java` status text, README notes if user-visible |
| a bridge name / window global | matching `*.js`, `*Injector.java`, `*Bridge.java` |
| supported app version | `Target.kt` for that app, `generate-patches-list.ps1` targets, README table, all fingerprints re-derived |
| tier/tile colour | `Target.kt` (`appIconColor`) and `generate-patches-list.ps1` (`appIconColor`) |
| bundle version | §8 checklist (6 scripts + 4 files + root `.mpp`) |
| `MorpheTheme` palette | both apps' dialogs visually (shared idea, separate copies) |
| `.gitignore` entries | README "Project layout" / release checklist wording |

---

## 12. Troubleshooting

| Symptom | Likely cause |
| --- | --- |
| `Android SDK not found` | set `ANDROID_HOME`/`ANDROID_SDK_ROOT`; ensure `platforms/` and `build-tools/` exist |
| `No android.jar found` | SDK has no platform installed |
| `kotlinc not found` | install Android Studio or put `kotlinc` on `PATH` |
| `javac` not recognized | JDK `bin` not on `PATH` (bundled JDK is not used for `javac`) |
| `kotlin-stdlib.jar not found` | no Android Studio and no Gradle cache |
| `d8 failed …` with class paths | check `patch-dex/d8-classes.txt` entries are repo-relative |
| `Extension DEX not found` | `build-extension.ps1` did not run or a module name mismatch |
| Patched app crashes at start | injected call points at a class missing from the merged `.mpe`, or a bad register |
| Feature missing in SEYTTINGS | class absent from `SECTION_CLASSES`, wrong package, or `.mpe` not merged |
| Toggle flips but nothing happens | prefs `init(Context)` never called, or bridge attached after first page load |
| Twitch tweak lost after navigation | not re-injected from `onPageFinished` / no `popstate` handler |
| `apksigner`/`zipalign` verification fails | wrong build-tools, or APK modified after signing |
| Morphe shows patches for the wrong app | `compatiblePackages`/`Target.kt` package or version mismatch |
| Changelog not shown in Morphe | source added as raw JSON (no changelog) or heading/date format wrong |

---

*Last full scan: repository state at bundle version 1.2.5, Morphe Desktop
2.1.1, no Git binary on the host PATH, no Android SDK on the host PATH.*
