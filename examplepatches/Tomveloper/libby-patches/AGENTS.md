# AGENTS.md

Instructions and context for anyone (human or AI) working in this repository.

---

## 1. Purpose

This repo is based on the **Morphe patches template**. It contains a working
font patch, `Custom reading font`, which adds a **Patch Settings** sheet to the
reader with a **Custom Font** section for uploading local fonts and choosing the
reading weight. It is opened from a **Fonts** item in the reader nav bar. Fonts
are stored in the app's private storage and served locally through a shared
request router.

- Target app: `com.overdrive.mobile.android.libby` ("Libby: Read Library Books")
- Tested version: **9.5.0** (versionCode 950000)
- APK type: universal APK (not APKM/XAPK)
- Device is **not rooted**; installation is a normal user install of a re-signed APK.

---

## 2. User profile and working style

The user is learning Android patching from scratch.

**Background**

- Strong: C#, Rust, web development (HTML/CSS/JS).
- None: Kotlin, Java, smali, Android, Gradle, or Morphe before this project.

**Preferences**

- Wants **every step explained**, including what a command does and why.
  Avoid unexplained jargon; define terms the first time they appear.
- Prefers **short messages** and small, incremental steps.
- Dislikes large auto-run scripts and long unattended operations.
- Frequently declines commands to ask what they do first. **Explain before
  running**, especially anything destructive (uninstall, install, deleting files).
- Wants to be able to repeat the process independently later, not just get a
  working artifact.
- Fonts must be **stored locally** and served from app storage. No remote font
  URL and no runtime network dependency.
- The runtime patch must use **no polling**. This is a reader app, so battery use
  matters: prefer event-driven hooks (load events, delegated clicks, short-lived
  observers that disconnect themselves) and avoid recurring timers.
- Script/language coverage is not a current constraint; it depends on the font
  the user uploads.
- Font selection happens in the in-app **Patch Settings** sheet, **Custom Font**
  section. The reader shows "No font selected" until one is uploaded. The picker
  uses Android's native document picker, not an HTML file input.

---

## 3. Environment (Windows)

| Item | Value |
|---|---|
| Repo | `<repo>` (this checkout) |
| Work APKs / decompiled app | `<work-dir>` |
| Stock input APK | `<work-dir>\libby-9.5.0.apk` (SHA-1 `3FDC25DA786FE17D2A9FA668E1DD978B4FB042E5`) |
| Patched output | `<work-dir>\libby-patched.apk` |
| Morphe CLI jar | `<tools>\morphe-desktop-1.19.0-all.jar` |
| JDK | JDK 21 |
| Android SDK | `%LOCALAPPDATA%\Android\Sdk` |
| Build tools | `%LOCALAPPDATA%\Android\Sdk\build-tools\36.0.0` |
| Test device | Android phone with USB debugging enabled |
| Shell | PowerShell (`pwsh`) |

Notes:

- `java` on PATH is JDK **21** (machine PATH lists JDK 21 first). The Morphe jar
  is compiled for Java 21 (class file version 65). If a shell still resolves
  JDK 11, its environment is stale — restart the shell; do not prefix every
  command.
- `ANDROID_HOME` and `JAVA_HOME` are set at user level.
- `local.properties` contains the machine-specific `sdk.dir`. **Do not commit it.**
- Gradle credentials for the Morphe registry, if needed, come from user-level
  Gradle properties or the CI environment. **Never print or commit them.**
- Toolchain: Morphe Desktop **1.19.0** (bundles Morphe Patcher **2.0.0**), Gradle
  plugin `app.morphe.patches` **2.0.0**. This repo is based on
  `MorpheApp/morphe-patches-template`. `upstream` points at the template and
  `origin` points at your own repository, so toolchain and boilerplate updates
  (`libs.versions.toml`, `settings.gradle.kts`, `PatchListGenerator.kt`, CI
  scripts) arrive as `git merge upstream/main`. Do not hand-edit those files;
  that creates drift the next merge has to fight.

---

## 4. Repository layout

```
patches/src/main/kotlin/app/libby/patches/
  Constants.kt        compatibility metadata (package, version, icon color)
  Fingerprints.kt     how to find WebViewClient methods without hardcoding jp1
  WebRoutesPatch.kt   installs the single /morphe/ interception hook
  FontPatch.kt        injects font bridge/hook calls; depends on WebRoutesPatch
  WebViewDebugPatch.kt optional chrome://inspect support

extensions/font/
  src/main/font-ui/
    section.html                          settings section markup
    section.css                           settings section styles
    controller.js                         runtime UI and chapter styling logic
  src/main/java/app/libby/font/
    FontHook.java                         injection entry point (runs on phone)
    FontBridge.java                       picker, storage, /morphe/font route
    FontUiData.java                       generated HTML/CSS/JS constants
  src/main/java/app/libby/web/
    MorpheWebRouter.java                  /morphe/ prefix, route registry, streaming

patches/build/libs/patches-1.0.0.mpp     built patch bundle (distributable)
extensions/libby.mpe                       built extension DEX container
```

The template sample packages (`example/` and `shared/`) and the
`ExamplePatch.java` extension sample have been removed from this repo.

---

## 5. Architecture: patch vs extension

Two separate programs:

| Part | Language | Runs | Job |
|---|---|---|---|
| Patch (`patches/`) | Kotlin | On the PC, at patch time | Find a method in Libby's DEX and insert a call |
| Extension (`extensions/`) | Java | On the phone, inside Libby | Inject CSS/JS at runtime |

Two patches share the runtime:

- `WebRoutesPatch` is internal and `default = false`. It installs one
  `shouldInterceptRequest` hook and merges the extension DEX.
- `FontPatch` is the user-facing patch. It declares
  `dependsOn(webRoutesPatch)` and only inserts the font-specific calls.

`WebRoutesPatch` inserts:

```smali
invoke-static {p1, p2}, Lapp/libby/web/MorpheWebRouter;->intercept(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;
```

at instruction index `0` of
`jp1.shouldInterceptRequest(WebView, WebResourceRequest)`.

Register mapping for an instance method:

```
p0 = this
p1 = WebView
p2 = WebResourceRequest
```

The hook returns `null` for paths that do not start with `/morphe/`, so Libby's
own request handler still runs. For `/morphe/<namespace>/<path>`, the router
dispatches to the handler registered for that namespace. Unmatched routes return
a local 404; handler exceptions return a local 500.

`FontPatch` inserts:

- `FontBridge.install(WebView)` after Libby's own `addJavascriptInterface` call
  in the reader WebView constructor.
- `FontHook.onPageFinished(WebView, String)` at index `0` of
  `onPageFinished`.
- `FontBridge.onActivityResult(int, int, Intent)` at index `0` of the base
  activity's `onActivityResult`.

The extension is merged into the APK by `extendWith("extensions/libby.mpe")` in
`WebRoutesPatch`. Because `FontPatch` depends on it, Morphe applies the shared
patch once even though it is not user-selectable.

### Why the reader needs JS at all

Libby is a WebView shell:

- Outer shell: `https://libbyapp.com`
- Reader container: `https://dewey-<hash>.read.libbyshelf.com/?d=...`
- Chapter XHTML lives in a **same-origin iframe** inside the reader container.

CSS cannot cross a document boundary, so the injected JS reaches into
`iframe.contentDocument` and appends a `<style>` element there.

---

## 6. Current status

Working:

- Patch build and apply cleanly.
- `jp1.shouldInterceptRequest` verified to begin with exactly one
  `MorpheWebRouter.intercept` call.
- APK signed with the Morphe key (`CN=Morphe`), installed on device.
- A **Fonts** item appears in the reader nav bar next to Appearance and opens
  the **Patch Settings** sheet.
- The sheet is our own overlay, not Libby's Appearance dialog: it is anchored to
  the visual viewport, takes 60% of the visible height, and scrolls internally.
- Default state is "No font selected" with the toggle and weight selector
  disabled.
- Local font upload works through a native document picker (verified).
- Fonts are copied atomically into private storage and streamed from
  `/morphe/font/<id>/<face>?v=...`; there is no fixed size limit.
- A 13.5 MB TTF was uploaded and applied successfully.
- The font library supports multiple families and faces, search, per-face weight
  ranges, and merging families.
- Font choice, reading weight, and on/off state persist across launches.
- The custom font applies to every same-origin chapter iframe.
- The custom font wins over Libby's OpenDyslexic book-design rule.
- Runtime behavior is event-driven: no `setInterval` and no recurring timers.

Next steps, in order of preference:

1. Optional: add patch options only if a behavior needs to be configurable at
   patch time; font choice is already handled in-app.
2. Housekeeping: optionally slim the extension DEX (it currently carries
   ~1,100 classes) and fill in the remaining `about { ... }` metadata.

---

## 7. Commands

### Build

```powershell
cd <repo>
.\gradlew.bat buildAndroid
```

Produces `patches\build\libs\patches-1.0.0.mpp`.

### List patches (sanity check)

```powershell
java -jar <tools>\morphe-desktop-1.19.0-all.jar `
  list-patches --patches patches\build\libs\patches-1.0.0.mpp -v -p
```

Note the CLI inconsistency: `list-patches` uses `--patches`, `patch` uses `-p`.

### Apply the patch

```powershell
java -jar <tools>\morphe-desktop-1.19.0-all.jar patch `
  -p <repo>\patches\build\libs\patches-1.0.0.mpp `
  -o <work-dir>\libby-patched.apk `
  <work-dir>\libby-9.5.0.apk
```

Flags: `patch` = subcommand, `-p` = patch bundle, `-o` = output APK,
last positional = input APK. `-e`/`-d` enable/disable patches by name,
`--options-file` supplies options, `--unsigned` skips signing, `-i` installs.

### Install

```powershell
# Same signing key as the installed build: updates in place, keeps app data.
adb install -r <work-dir>\libby-patched.apk

# Only if the signing key changed (first install of a patched build, or a new key):
adb uninstall com.overdrive.mobile.android.libby   # DESTRUCTIVE: deletes app data
adb install <work-dir>\libby-patched.apk
```

Morphe re-signs with the same key (`CN=Morphe`) every build, so patched builds
update over each other with `-r`; plain `adb install` fails with
`INSTALL_FAILED_ALREADY_EXISTS`. Warn the user before uninstalling. Loans remain
on the library account; local downloads/settings do not.

After installing, disable Play Store auto-update for Libby, or Play will replace
the patched app with the signed-by-Google version.

### Verify the output (read-only)

```powershell
# signature
& "$env:LOCALAPPDATA\Android\Sdk\build-tools\36.0.0\apksigner.bat" verify --print-certs <apk>

# show the injected calls (extract classes2.dex first)
& "$env:LOCALAPPDATA\Android\Sdk\build-tools\36.0.0\dexdump.exe" -d classes2.dex |
  Select-String -Pattern 'MorpheWebRouter|FontHook' -Context 2,1
```

Expected:

- `jp1.shouldInterceptRequest` starts with exactly one
  `invoke-static ..., MorpheWebRouter;.intercept(...)`.
- `jp1.onPageFinished` starts with
  `invoke-static ..., FontHook;.onPageFinished(...)V`.

The extension DEX should contain `MorpheWebRouter`, `FontBridge`, and
`FontHook`.

---

## 8. How fonts are stored and served

- The reader starts in the "No font selected" state with the toggle and the
  reading-weight selector disabled.
- Upload uses Android's native `ACTION_OPEN_DOCUMENT` picker. Libby's
  `WebChromeClient` does not implement `onShowFileChooser`, so an HTML file input
  would not work.
- `FontBridge` streams the chosen content URI into a temporary file in
  `filesDir/morphe-fonts`, checks the first four bytes to detect WOFF2, WOFF,
  TTF, or OTF, calls `fsync`, then renames the temp file to
  `<id>.<format>`; the id is generated per upload.
- `FontFileMeta` then reads the `name`/OS2 weight table so a face can carry a
  weight range. WOFF2 and collections cannot be parsed; they keep 400–400 and
  can be corrected in the in-app weight editor.
- Only after the rename succeeds does it update the `morphe_font` preferences:
  `enabled`, `selected`, `library` (the JSON index of families and faces), and
  `weight` (the reading weight).
- Each face is served at
  `/morphe/font/<id>/<face>?v=<version>` by `MorpheWebRouter.stream(...)`, which
  returns a `WebResourceResponse` backed by a `FileInputStream` and a
  `Content-Length` header.
- The response uses `Cache-Control: no-store`. `v` changes when the family is
  uploaded or edited so the WebView does not reuse an old font.
- The file is streamed directly. There is no full-file byte array and no fixed
  size cap; the practical limit is free space in the app's private storage.
- A new upload adds a family (or a face when started from a family's **Add
  face** action). Deleting a family removes its files after the index is
  updated. Merging moves every live face into the target family and deletes the
  now-empty source entry.
- The pre-multi-font keys `font_name`, `font_file`, `font_format`, and
  `font_version` are read once and migrated into the library index, then
  removed. Do not add new code that depends on them.

### Changing the font

Upload a different WOFF2, WOFF, TTF, or OTF file in **Patch Settings → Custom
Font**. No rebuild or re-patch is needed. Large fonts do not increase DEX size
because the font stays on disk.

---

## 9. Runtime UI and chapter styling

`FontHook.onPageFinished` injects `FontUiData.JS`, then calls:

```text
MorpheFont.init(fontCss, enabled, name, hasFont, libraryJson)
```

`fontCss` contains the `@font-face` rules for the active family's faces plus the
root rule, or an empty string when no font is stored. `libraryJson` is the full
library (`selected`, `enabled`, `weight`, `fonts[]`) so the sheet renders from
the first frame without a second bridge call.

Key points:

- The nav item is a **clone of Libby's Appearance item** (`ensureNavButton`).
  Cloning keeps the size, spacing, and halo styling without copying markup. The
  clone gets id `morphe-font-nav-item`, the label text `Fonts`, the `Aa` glyph,
  and its own direct `click` listener (`preventDefault` + `stopPropagation`)
  that opens the sheet. `ensureNavButton` runs on init and on every reader
  frame `load`, because Libby rebuilds the nav bar.
- The sheet is **our own overlay**, not Libby's Appearance dialog:
  `#morphe-font-overlay` contains a backdrop and `#morphe-font-panel` with the
  title `Patch Settings` and the `#morphe-font-settings` section whose category
  label is `Custom Font`. Further categories can be added inside the panel.
- The overlay is transparent; only the backdrop and panel paint. Setting a
  background on the overlay itself turns the whole reader black.
- `fitSheet()` pins the overlay to the **visual viewport**:
  `top = visualViewport.offsetTop`, `height = visualViewport.height`. The panel
  takes 60% of that height with a 200 px floor, and its body scrolls
  (`overflow-y:auto; min-height:0`). Libby's activity is `adjustPan`, so the
  keyboard does not resize the layout viewport; CSS `vh`/`innerHeight` stay
  unchanged while `visualViewport` shrinks and pans.
- `controller.js` gets the section HTML and CSS from
  `MorpheFontBridge.getHtml()` / `getCss()`. Markup is not concatenated into the
  injected JavaScript.
- `FontBridge.install` registers the `font` namespace with `MorpheWebRouter`
  before the WebView loads a page. It also registers the JavaScript bridge.
- `apply()` writes `<style id="morphe-font-dynamic">` into **every** same-origin
  iframe, not just the first one.
- `fontRuleCss()` sets `font-family: MorpheFont, serif` and the chosen reading
  weight on the root, body, and all descendants with `!important`; `b`/`strong`
  get `font-weight: bolder` so emphasis is not flattened. The family rule uses a
  repeated attribute selector
  (`html[data-morphe-font-root][data-morphe-font-root][data-morphe-font-root] ...`)
  so it outranks Libby's `html.RS-BIFOCAL * { font-family: ... !important }`
  OpenDyslexic rule.
- The reading weight is a user preference, not a face property, and is stored
  as `0` for "Default". A non-zero weight emits its own rule independently of
  the custom font, so it also restyles Libby's own font; `Default` emits no
  weight rule at all. `setWeight` re-applies and persists through
  `FontBridge.setWeight`. Browsers synthesize weights a static face does not
  cover; variable fonts and families with real faces render natively.
- UI events are listened to on `window` in the **capture** phase. The reader
  stops propagation above our sheet, so overlay-local bubble listeners never
  run (only native defaults such as the checkbox still worked). Capture on
  `window` runs before any reader handler can swallow the event.
- There is **no polling, no observer, and no recurring timer**. The controller
  uses capture listeners for `click`, `change`, `input`, `keydown`, `keyup`,
  pointer events, and `focusin`; a capture `load` listener on the reader
  document styles new/replaced chapter iframes, and `apply()` at init handles
  iframes that already exist.
- `visualViewport` `resize`/`scroll` listeners call `fitSheet`, so the sheet
  tracks the keyboard.
- Two one-shot timers remain and are not polling: a 50 ms defer in `onFocusIn`
  (bring a just-focused field into view after the keyboard settles) and a 300 ms
  helper-style refresh after the section is first inserted.
- `FontHook` returns early for the `libbyapp.com` shell and for `/chapter-`
  URLs.

---

## 10. Gotchas already encountered (do not repeat)

| Symptom | Cause | Fix |
|---|---|---|
| `SDK location not found` | No SDK path for Gradle | `local.properties` with `sdk.dir=...` |
| `Gradle requires JVM 17+ ... configured to use JVM 11` | Stale `JAVA_HOME`/PATH in that process | Use JDK 21; restart shell |
| `UnsupportedClassVersionError ... class file version 65` | Ran Morphe jar with Java 11 | Run with JDK 21 |
| `[7,83] Error for input ';': Invalid text` | `FontHook;;->` — extra `;` after a class descriptor | Descriptor is `L...;`; write `$EXTENSION_CLASS->method(...)` |
| Reader freezes after opening settings | `MutationObserver` loop from rewriting `textContent` every callback | Write text/checked state only when the value changes; disarm any short-lived observer after injecting |
| Battery drain / constant work while reading | `setInterval` polling for iframes and the dialog | Use capture-phase `load` events and capture-phase UI listeners; no recurring timers |
| Sheet buttons do nothing, but the checkbox still toggles | The reader stops propagation above the overlay, so overlay-local bubble listeners never run | Listen on `window` in the capture phase |
| Whole reader turns black when the sheet opens | The overlay itself had `background: Canvas` | Keep the overlay transparent; paint only the backdrop and panel |
| Build fails with a constant-pool/UTF-8 limit | `controller.js` exceeded 65,535 bytes as one string literal | `toJavaExpression()` emits a `StringBuilder` chain of ≤30,000-char literals |
| Sheet is hidden behind the keyboard | `adjustPan` keeps the layout viewport at full height | Anchor to `visualViewport` and re-fit on its `resize`/`scroll` |
| Fonts nav item disappears after navigation | Libby rebuilds the nav bar | Re-run `ensureNavButton` on init and on reader frame `load` |
| `<b>`/`<strong>` look the same as body text | The global `font-weight` rule flattened them | Add a `b`/`strong { font-weight: bolder !important }` rule |
| Font only applies to the first chapter | `querySelector('iframe')` picks the first frame | Apply to every same-origin iframe |
| OpenDyslexic overrides the custom font | Libby's `html.RS-BIFOCAL * { ... !important }` has higher specificity | Use the repeated `data-morphe-font-root` selector |
| `appIconColor` exception | Passed `0xFF1F1F1F` (ARGB) | Use `0x1F1F1F` (`0xRRGGBB`) |
| `INSTALL_FAILED_UPDATE_INCOMPATIBLE` | Different signing key | Uninstall the existing app first |
| Reader always says "No font selected" | No uploaded family, failed upload, or the selected entry has no live file | Upload a supported font and check the status text in the section |
| `/morphe/font/<id>/<face>` returns 404 | Route not registered, or that face's file is missing | Ensure `FontBridge.install` ran and the library index points at an existing file |
| Libby's normal requests break after the router hook | Scratch register collided with a parameter register | Use `v0`; `addFreeRegisters` returns a move count, not a register number |
| Build error about `extensions/libby.mpe` | Extension output still named `extensions/font.mpe` | Keep `extension { name = "extensions/libby.mpe" }` |
| Font does not change | Script not injected, route not registered, or CSS override | Enable WebView debugging and inspect with `chrome://inspect` |

PowerShell tip: `| Select-Object -Last 40` can hide the real error at the top of
a log. Capture the full output or use `Select-String` for the error line.

---

## 11. Coding conventions

- Kotlin patch files: `package app.libby.patches`.
- Java font extension: `package app.libby.font`.
- Java shared router: `package app.libby.web`.
- Use LF line endings in Kotlin/Java sources.
- Keep the patch's `execute` block minimal; logic belongs in the extension.
- Register a `/morphe/` route before the WebView loads, not from
  `onPageFinished`. `FontBridge.install` does this for the font route.
- Stream files with `WebResourceResponse` and a `FileInputStream`. Do not load
  fonts into a string or a full-file byte array in Java or JavaScript.
- Runtime code must not poll. Prefer event-driven hooks; disconnect observers and
  clear one-shot timers when their job is done.
- Runtime UI listens on the reader `window` in the capture phase; do not attach
  listeners to the overlay and expect them to fire.
- Anchor fixed UI to `window.visualViewport`, never to `innerHeight` or `vh`, so
  it survives the keyboard.
- Large generated strings (the UI script) must go through `toJavaExpression()` in
  `extensions/font/build.gradle.kts`; a single string constant caps at 65,535
  bytes.
- Fingerprints must avoid obfuscated names. Prefer framework method names,
  signatures, and stable string literals.
- A fingerprint that matches zero or multiple methods aborts the patch; that is
  intended. Update the fingerprint deliberately when the app changes.
- Do not commit `local.properties`, build outputs, or credentials.
- When adding a new Libby version, add it to `Constants.kt` and re-verify the
  fingerprint on that version before shipping.

---

## 12. Commit messages and releases

Releases are automated with **semantic-release**. `.releaserc` reads commit
headers, so the type you pick decides whether a release happens and how the
version moves. There is no commit linter: a wrong type silently produces the
wrong version instead of failing.

Use [Conventional Commits](https://www.conventionalcommits.org/):

```text
type(scope): lowercase imperative summary
```

- `type` is required and lowercase; `scope` is optional and lowercase.
- Keep the header under ~72 characters and explain the why in the body.
- One logical change per commit.
- The only scope the release rules match is `Needs bump`, and only with
  `build`.

| Type | Release | Changelog section | Use for |
|---|---|---|---|
| `feat` | minor | ✨ New Features | New user-visible behavior |
| `fix` | patch | 🐛 Bug Fixes | Incorrect behavior |
| `perf` | patch | 🔧 Improvements | Performance or battery work |
| `bump` | patch | 🚀 Updated App Support | Adding or updating an app version in `Constants.kt` |
| `build` | none | hidden | Build tooling; `build(Needs bump): ...` is a patch |
| `docs` | none | — | Documentation |
| `chore` | none | — | Housekeeping, dependencies, releases |
| `refactor` | none | — | No behavior change |
| `test` | none | — | Tests |

- `feat!:` / `fix!:` or a `BREAKING CHANGE:` footer still forces a major
  release. Do not use it for internal rewrites.
- Non-releasing commits still run the compile check, but publish no bundle.

Do not hand-edit release outputs: `CHANGELOG.md`, `gradle.properties`,
`patches-bundle.json`, `patches-list.json`, or the generated table in
`README.md`. semantic-release writes them in a
`chore: Release vX.Y.Z [skip ci]` commit; keep `[skip ci]` so that commit does
not start another run.

Flow:

1. Commit on `dev` with a conventional message.
2. A push to `dev` opens or updates the automated `dev` → `main` PR
   (`chore: Merge branch dev to main`).
3. Merging to `main` runs `.github/workflows/release.yml`: semantic-release
   derives the version from the commits since the last tag, publishes the
   bundle, updates the release outputs above, then backmerges `main` into
   `dev`.

---

## 13. Glossary

- **APK** — Android app package (a zip with DEX code, resources, manifest, signature).
- **DEX** — Android bytecode format, executed by ART.
- **smali** — human-readable assembly syntax for DEX.
- **Obfuscation (R8)** — renames classes/methods (e.g. `jp1`) to shrink the app.
- **Fingerprint** — a set of stable traits used to locate a method across versions.
- **Extension** — extra Java code compiled to DEX and merged into the app.
- **MPP** — Morphe patch bundle (compiled patches + extension DEX).
- **WebView** - Chromium-based browser component used by the app.
- **shouldInterceptRequest** - WebViewClient callback that can return a local
  response instead of making a network request.
- **Request router** - one interception hook that dispatches
  `/morphe/<namespace>/<path>` to a registered handler.
- **Route namespace** - the first path segment after `/morphe/`, such as `font`.
- **Streaming response** - a `WebResourceResponse` backed by a file
  `InputStream`; the file is not loaded into a string or byte array.
- **WOFF2** - compressed web font format supported by Chromium/WebView.
- **same-origin iframe** - child document reachable via `contentDocument`.
- **visual viewport** - the part of the page actually visible above the
  keyboard; `window.visualViewport` reports its offset and height.
- **reading weight** - the `font-weight` applied to chapter text, stored as one
  user preference rather than as a property of a specific face.
