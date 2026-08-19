# Morphe Patches

A shared Morphe patch repository maintained by **Alastor Kaneki**. New Morphe
patches are added to this project and built together into one `.mpp` bundle.

## Included patches

<!-- PATCHES_START EXPANDED -->
> **[v1.13.4](https://github.com/Alastor-Kaneki/Morphe-Patches/releases/tag/v1.13.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Suno&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Customize Suno branding](#customize-suno-branding) | Clones Suno to a different package name, with optional app-name and launcher-icon customization. Accepts Morphe's adaptive custom-icon folder layout or a simple icon.png folder. | • App name<br>• Package name<br>• Custom icon |
| [Download timestamped lyrics](#download-timestamped-lyrics) | Adds an in-app Lyrics button and share target that exports Suno timing data as LRC, enhanced LRC, SRT, WebVTT, or JSON. |  |

</details>

<details open>
<summary>📦 Opera GX&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Download GX mods as files](#download-gx-mods-as-files) | Adds a visible Download Mod button in Opera GX, with URL auto-detection and a Share fallback. |  |
| [GX icon pack](#gx-icon-pack) | Adds a separate native selector for all 56 Opera GX launcher icons. Open it from the GX Icon Pack long-press shortcut. |  |

</details>

<details open>
<summary>📦 Google Chrome&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [MonkeyScript userscript manager](#monkeyscript-userscript-manager) | Adds a Chrome 150 Material You userscript manager using a Violentmonkey-derived parser, native app-menu integration, guaranteed Fork-page installation, Greasy Fork/Sleazy Fork support, publishing, and configurable app/package cloning. |  |

</details>

<details open>
<summary>📦 Pixilart&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.9.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove ads](#remove-ads) | Hard-disables Pixilart native/Cordova ads, drawing-editor web ads, and promoted/feed ad cards. |  |

</details>

<!-- PATCHES_END -->

### Opera GX — Download GX mods as files

Targets Opera GX Android (`com.opera.gx`). It adds a visible, theme-aware
**Download Mod** button and an Android share-sheet fallback. Both resolve the GX
Store's official raw `mod.crx` package and save it to **Downloads** without
installing or activating it.

### Chrome Android — MonkeyScript userscript manager

Targets Google Chrome Android (`com.android.chrome`). The patch adds a native
userscript manager that adapts portable behavior from Violentmonkey for Chrome
Android, where the normal desktop WebExtension runtime is unavailable.

#### Chrome Material You interface

The manager, editor, and installation-review screens inherit Chrome's own app
theme and resolve Chrome/Material You colors at runtime. Surfaces, primary and
secondary accents, text, outlines, controls, ripples, status bars, and navigation
bars follow the patched Chrome build's current light, dark, and dynamic-color
palette.

#### Process-aware startup and guaranteed access

Chrome can place its browser activities in a process different from the
application's default process. MonkeyScript registers an initializer in every
process that hosts a Chrome activity, so the menu binder, page runtime, install
interceptor, and userscript engine start in the process where Chrome's UI is
actually running.

The normal entry is **Userscripts** in Chrome's app menu. Android 7.1 and newer
also receive a dynamic **Userscripts** shortcut: long-press the patched Chrome
launcher icon to open the manager even when a particular Chrome release hides
or replaces its internal app-menu model.

#### Safe Chrome app-menu integration

The patch never scans Android popup windows or modifies arbitrary menu-view
hierarchies. It therefore does not touch text-selection, link, image, or other
context menus.

MonkeyScript first checks Chrome's `AppMenuHandler`. For obfuscated releases it
performs a bounded search through the Chrome Activity's non-view object graph and
accepts a `Menu` only after it matches Chrome app-menu signatures such as
Settings, History, Downloads, Bookmarks, recent tabs, and their resource-entry
names. It then adds:

- **Userscripts** — opens the complete userscript manager.
- **Install userscript** — appears for supported Fork pages and direct
  `.user.js` / `.user.css` URLs.

Both menu rows carry explicit Activity intents as well as click listeners, which
supports Chrome menu implementations that bypass ordinary item listeners.

#### Violentmonkey-derived compatibility core

Portable userscript behavior is adapted from Violentmonkey's MIT-licensed
metadata parser and installer logic. The adaptation includes:

- Userscript and userstyle metadata-block validation.
- Localized metadata such as `@name:en` and `@description:en`.
- Normalized hyphenated and underscored metadata keys.
- Trusted install URL families used by Greasy Fork, Sleazy Fork, GitHub,
  OpenUserJS, raw GitHub content, and GitHub releases.
- Greasy Fork and Sleazy Fork script-page detection.
- Correct Fork fallback URLs that preserve both the script ID and script slug.
- Install-link interception for `.user.js` and `.user.css` links on Fork pages.

The complete desktop Violentmonkey extension is not embedded because stock
Chrome Android does not provide its required WebExtension APIs. Chrome tab
access, script injection, storage, and the native manager are supplied by the
Morphe Android bridge instead. Attribution and the upstream MIT license are in
[`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md).

#### Greasy Fork and Sleazy Fork

The manager has first-class **Greasy Fork** and **Sleazy Fork** catalogue
buttons. On either Fork, tapping a userscript install link is intercepted before
Chrome handles it as a normal file navigation. The patch then opens a full-screen
review showing the parsed metadata and complete source before installation.

MonkeyScript can recognize Fork script pages, resolve official install and
update URLs, install direct `.user.js` and `.user.css` URLs, review source and
metadata, and retain the original URL for update checks.

#### Publishing userscripts

The editor includes **Publish → Greasy Fork / Sleazy Fork**. MonkeyScript stages
the current JavaScript userscript in Chrome's private storage, opens the selected
Fork in the same Chrome app, and submits the source to that site's authenticated
prefill form. The site displays its normal publish/update page for final review.

Publishing uses the Fork account already logged into Chrome. MonkeyScript does
not request or store the account password or session cookie. Existing scripts
use the version-prefill route when their Fork script ID is available; new scripts
use the new-script prefill route. CSS userstyles remain installable and
exportable, but direct Fork publishing currently targets JavaScript userscripts.

#### Patch-time app cloning

The Morphe patch exposes two editable options:

- **App name** — defaults to `Chrome MonkeyScript`.
- **Package name** — defaults to `com.android.chrome.morphe`.

The package ID must differ from stock Chrome. The resource patch qualifies
relative components before changing the manifest package, renames launcher
labels, removes shared-UID metadata, and rewrites app-scoped permissions,
processes, task affinities, provider authorities, authority string resources,
and the injected providers. This is intended to let the patched build install
beside `com.android.chrome`.

Changing Chrome's package and signing certificate can break Google-account
sign-in, Chrome Sync, Play Integrity relationships, trusted WebAPK relationships,
or other Google services that authorize the official package/signature pair.

#### Manager and editor

- Searchable Material You dashboard with enable/disable switches and JS/CSS
  badges.
- Source editor with parsed-metadata inspection and URL-rule testing.
- Installation from Fork pages, `.user.js`, `.user.css`, local files, clipboard
  text, or a direct URL.
- JavaScript userscript and CSS userstyle templates.
- `@updateURL` and `@downloadURL` update checks.
- Individual script export and complete JSON backup/restore.
- Global pause and per-site disable rules.

#### Metadata and runtime compatibility

MonkeyScript supports common metadata including localized names,
`@namespace`, `@version`, `@description`, `@author`, match/include/exclude rules,
`@run-at`, `@noframes`, `@grant`, `@require`, `@resource`, update/download URLs,
icons, tags, `@connect`, `@antifeature`, and `@compatible`.

Matching scripts are injected into the active Chromium `WebContents`. The
compatibility layer provides `GM_info`, synchronous and Promise-style value
storage, style and logging APIs, registered commands, tab opening, clipboard,
notifications, downloads, a best-effort `GM_xmlhttpRequest`, and `unsafeWindow`.
`@require` dependencies are cached, and CSS userstyles are injected directly.

#### Important limitations

MonkeyScript is a userscript engine, not Chrome's desktop extension runtime.
Extension service workers, `chrome.tabs`, extension popups, native messaging,
and other desktop extension APIs are not provided.

Chrome's internal Java APIs vary between releases. The process-aware initializer
and long-press shortcut guarantee access to the manager, but exact placement of
the **Userscripts** row in Chrome's overflow menu still depends on the menu model
used by the specific Chrome APK. `document-start` is best effort, page-origin
networking restrictions can affect `GM_xmlhttpRequest`, value storage is scoped
by script and page origin, and scripts are not injected in Incognito.

#### Security behavior

Userscripts execute code in pages you visit. Install only scripts you trust.
MonkeyScript stores its database, cached dependencies, and temporary publishing
source in the patched app's private storage. It does not upload the script
library, browser history, credentials, or page contents. Files without a valid
userscript metadata block are rejected or disabled until reviewed.

## Build

Requirements:

- JDK 21
- Gradle 9.6.1
- GitHub credentials with read access to Morphe's GitHub Packages registry

Run:

```bash
bash tools/test-parser.sh
bash tools/test-chrome-userscripts.sh
gradle buildAndroid --stacktrace
```

The bundle is generated under `patches/build/libs/` as an `.mpp`. Every push to
`main` also runs GitHub Actions and uploads the bundle as a workflow artifact.

## Repository structure

- `patches/` — Morphe patch definitions.
- `extensions/extension/` — Android code injected by patches.
- `tools/` — local parser, matcher, installer, and payload tests.
- `.github/workflows/` — CI and controlled GitHub Release publishing.

## License

GPL-3.0. See [`LICENSE`](LICENSE). Third-party notices are in
[`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md).