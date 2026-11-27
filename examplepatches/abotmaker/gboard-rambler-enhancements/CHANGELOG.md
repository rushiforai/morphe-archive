# Changelog

## [1.3.6](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.3.5...v1.3.6) (2026-11-27)

### ✨ Improvements

* **Auto-Learn From My Fixes is now opt-in (Beta):**
  * Defaults to **OFF** until explicitly enabled under **Voice actions, snippets & replace → Auto-learn from fixes (Beta)**.
  * Adds a **`BETA`** pill badge next to the **Auto-learn from my fixes** toggle and hides the sub-rows while OFF (unless you already have saved learned fixes to review or clear).

## [1.3.5](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.3.4...v1.3.5) (2026-11-27)

### ✨ New Features

* **Auto "Learn From My Fixes" (adapted from Hex by Anomaly, MIT):**
  * Silently watches each Rambler dictation locally in memory for 60s using 32-character before/after text anchors (never active in password or incognito/`IME_FLAG_NO_PERSONALIZED_LEARNING` fields).
  * Detects manual word fixes and quick delete-and-redictate corrections (within 20s, while cleanly ignoring apps clearing the box on Send).
  * After **2 consistent corrections** with zero contradictions, automatically promotes the 1–3 word pair into an active whole-word replacement rule (preserving casing and yielding to manual **Find & Replace** rules) and best-effort seeds the word into your `MUSE_STATS` voice dictionary when enabled.
  * Tracks contradictions on untouched dictations to automatically retire false rules.
  * **Auto-learn Toast notification (ON by default, toggleable):** Shows a brief `Rambler learned: "<heard>" → "<meant>"` toast whenever a new fix is automatically learned.
  * **Review & Manage UI:** Open **Voice actions, snippets & replace → Auto-learn from fixes → Learned fixes** to view active/paused rules, **Pause / Resume / Delete**, promote pending `1/2` tracked fixes with **Learn now**, or **Clear all**.
  * Included in portable `.json` Backup & Restore (toggles, learned/tracked records, and paused IDs).

### ✨ Improvements

* **Crisp Morphe patch cards:** Shortened all 7 patch descriptions so Morphe Manager displays clean, scannable cards without crowding.

## [1.3.4](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.3.3...v1.3.4) (2026-11-26)

### ✨ New Features

* **Smart Search Bars (Zero Extra Taps):**
  * **Auto-strip period in search bars (ON by default):** Automatically removes stray trailing periods in Search bars and browser address bars (while preserving abbreviations like `Dr.`, `U.S.`, `e.g.`, `...`).
  * **Auto-search on commit (opt-in, pick your own apps):** Dictate into Search bars or browser address bars (Chrome, YouTube, Play Store, Settings, etc.) and submit immediately without tapping Search or saying `"hit search"`. Strictly restricted to your selected apps and safe single-line Search / browser URI fields (never submits normal web forms, chats, or comment boxes).
  * **How to activate:** **Rambler toolbar icon** (or **Gboard Settings → Voice typing → Rambler voice typing**) → **Voice actions, snippets & replace → Search bars** → toggle **Auto-search on commit** ON and pick your apps.
  * Included in portable `.json` Backup & Restore.

## [1.3.3](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.3.2...v1.3.3) (2026-11-26)

### 🐛 Bug Fixes

* **Fix `VerifyError` crash on keyboard open when stacking with GboardWu `v4.5.0+` (`SoftKeyboardView.dispatchTouchEvent`):**
  * Restores all `v1.3.0`/`v1.3.1` features (Long-press Spacebar for Rambler with Cursor Trackpad compatibility, draggable Rambler Toolbar quick-access button, 1-Tap Fix & Learn, and private Dictation History card).
  * Upstream GboardWu `v4.5.0` added `GboardClipboardSelectAllPatch`, which wraps `SoftKeyboardView.dispatchTouchEvent(MotionEvent)Z` via `addInstructions` with an internal `:stock` branch label. Prepending a 3-code-unit `invoke-static` at index `0` shifted that branch from `0x4` to `0x7` while its un-rebound label stayed at `0x7`, producing `VerifyError: [0x7] branch offset of zero not allowed`.
  * `installSpacebarTriggerHooks` now wraps `SoftKeyboardView.dispatchTouchEvent` via a verbatim rename (`morpheRamblerStockDispatchTouch`) plus a branchless 4-instruction wrapper — shifting zero instructions inside any pre-existing wrapper so stacking with GboardWu `v4.5.0+` verifies cleanly in **both** patch orders.
  * Hardens `LanguagePickerExtension.getInitialKeyboardState`'s wrapper to use `addInstructionsWithLabels` so its internal label also survives any other patch prepending instructions to it.

## [1.3.2](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.3.1...v1.3.2) (2026-11-26)

### ⏪ Temporary Rollback

* **Temporarily rolled back to the `v1.2.2` patchset** (pausing the `v1.3.0`/`v1.3.1` Spacebar long-press, Toolbar quick-access button, and Fix & Learn changes) while investigating reports of the keyboard crashing on startup for some users when stacking `v1.3.0+` alongside GboardWu.
* Published as `v1.3.2` so Morphe Manager automatically updates users already on `v1.3.0` / `v1.3.1` back to the stable `v1.2.2` build without needing to remove and re-add the source.
* All `v1.3.1` work remains preserved on the `dev` branch and will be re-enabled once the root cause is identified and fixed.

## [1.3.1](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.3.0...v1.3.1) (2026-11-25)

### 🐛 Bug Fixes

* **Long-press Spacebar when Cursor Trackpad (`free_cursor`) is enabled:**
  * Gboard's Spacebar softkey XML switches stationary Spacebar long-press from `SHOW_SYSTEM_IME_PICKER (-10022, "space")` to `SWITCH_KEYBOARD (-10004, "free_cursor", LONG_PRESS)` whenever Cursor Trackpad (`free_cursor` + `enable_scrub_move` + default-on `enable_free_cursor_by_long_press_space`) is enabled (including via GboardWu's Cursor Trackpad patch).
  * `RamblerSpacebarTrigger` now intercepts **both** stock Spacebar long-press (`-10022, "space"`) and Cursor Trackpad Spacebar long-press (`-10004, "free_cursor", LONG_PRESS`), while keeping dedicated Trackpad button taps (`PRESS`) and swipe-on-Spacebar 2D Cursor Trackpad (`-10104`) completely working.
  * Guards active Spacebar holds in **Smart hybrid** and **Hold to talk** modes against accidental `-10104` `free_cursor` triggers from slight thumb drift while speaking.
  * Hardens `ModuleManager` fallback lookup to resolve `AgenticDictationExtension` via its registered module interfaces if constructor capture was not yet populated.

## [1.3.0](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.2.2...v1.3.0) (2026-11-25)

### ✨ New Features

* **Long-press Spacebar for Rambler (Zero Extra Height, Conflict-Free):**
  * Repurposes stationary Spacebar long-press (`-10022`, `"space"`) inside `LanguagePickerExtension` to start/stop Rambler dictation directly under your thumb — leaving normal Spacebar taps, Spacebar cursor-glide / Cursor Trackpad, Globe taps, floating globe long-presses, and the bottom-right keyboard switcher button completely untouched.
  * Automatically clears `NO_IME_PICKER` when enabled so single-language keyboards also dispatch Spacebar long-press cleanly.
  * **3 Configurable Trigger Modes** (in **Dictation & reliability → Quick access**, plus an ON/OFF switch):
    * **Smart hybrid (default, like Hex on macOS):** quick release (`< 0.6s` after trigger) stays hands-free; keep holding while speaking (`>= 0.6s`) and lift your thumb to immediately stop & transcribe.
    * **Hold to talk (Push-to-Talk):** hold Spacebar while speaking; lifting your thumb immediately stops listening & transcribes.
    * **Toggle (Hands-free):** hold to start, lift your thumb and talk freely; stop via auto-stop, mic button, or another Spacebar long-press.
  * Inspects `AgenticDictationExtension`'s live UI state (`LISTENING` / `WAITING`) before stopping on release so lifting your thumb never accidentally starts a new session if Rambler already auto-stopped or finished.
* **Draggable "Rambler" Toolbar Quick-Access Button:**
  * Adds a toggleable **"Rambler"** button in Gboard's 4-dots toolbar menu (pinable to the top strip) that opens **Rambler Enhancements** in 1 tap (dynamically fingerprinted for both Gboard 18.5.4 and 18.8.0+).
* **1-Tap "Fix & Learn" from Dictation History:**
  * Tap **Fix & Learn** on any saved dictation entry to pick a misheard word chip, type the right spelling, and simultaneously save a **Find & Replace** rule (global or scoped to that app) and add the word to your **MUSE_STATS** voice dictionary in one tap.
* **Private Dictation History Card:**
  * Keeps your recent dictated text tucked behind a **"View dictation history"** card inside **Dictation stats & history** instead of showing text immediately on screen.
* **Backup & Restore:** Includes `toolbarButtonEnabled`, `spacebarLongPressRamblerEnabled`, and `spacebarLongPressMode` in portable `.json` backups.

### 🐛 Bug Fixes

* **Gboard 18.8.0+ constructor register safety:** Moves `RamblerContactsRuntime.onRamblerStart(Context)` immediately after `super.<init>()` in `AgenticDictationExtension.<init>` so R8's parameter register reuse before `return-void` on Gboard 18.8.0+ cannot cause a DEX `VerifyError`.

## [1.2.2](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.2.1...v1.2.2) (2026-11-25)

### ✨ New Features

* **On-Device Dictation Stats:**
  * Adds a private, 100% local stats card at the top of the **Rambler Enhancements** hub and inside **Dictation stats & history**: tracks **total words dictated**, **completed sessions**, **weighted average speaking WPM**, **average cloud commit latency** (measured directly from `AgenticDictationExtension.onListeningStop` to commit, matching Gboard's own `fhv` latency measurement), **daily totals**, **peak WPM**, and **estimated time saved vs. typing** (honestly subtracting both speaking time and cloud wait time).
  * Includes a configurable **Typing speed baseline** (`30–60 WPM`, default `40 WPM` mobile average), a **Track local dictation stats** toggle (independent of text history so numeric stats can stay on without saving dictated text), and one-tap **Reset stats**.
  * **Privacy-first:** Stores only aggregate numeric counters on device and is intentionally excluded from `.json` settings backups.

## [1.2.1](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.2.0...v1.2.1) (2026-11-24)

### ✨ UX & Settings Refactor

* **Zero-Duplication 7-Category Settings Hierarchy:**
  * **Clean `Rambler voice typing` screen (17 rows → 7 focused entries):** Replaces duplicated inline toggles and overlapping `Custom instructions` / `Per-app custom instructions` rows with one clean **Instructions & app rules** row at the top and one **Rambler Enhancements** category (`Waveform animation (Hex)`, `Dictation & reliability`, `Voice actions, snippets & replace`, `Voice dictionary & contacts`, `Dictation history`, and `Backup & restore (.json)`).
  * **Compact `Rambler Enhancements` Dashboard Hub (36-card scroll wall → 7 live-status cards):** Opening **Rambler Enhancements** now shows 7 concise at-a-glance status cards that drill into the exact same focused subpages.
  * **Dictation & reliability subpage:** Brings **Strip trailing period** and **Max dictation duration** together with **Append-only**, **Cursor-aware editing**, **Re-select after edit**, **App context**, and **Auto parallel retry** in one logical place.
  * **Streamlined subpages:**
    * **Voice actions, snippets & replace:** Hides Send/Search trigger phrase editor rows when their toggle is OFF.
    * **Voice dictionary & contacts:** Merged into one screen (10 cards → 5 compact rows) with a tappable searchable **Stored words** browser/remover, compact **Import / Export / Clear** action bar, and inline contact sync status (hides **Reset sync history** when 0 contacts are synced).
    * **Dictation history:** Inline search bar, Clear all, and scrollable history list right on the page (1 tap to view, search, copy, or delete — no nested dialog).

## [1.2.0](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.1.8...v1.2.0) (2026-11-24)

### ✨ New Features

* **Rambler Productivity Tools** (new 7th patch, enabled by default):
  * **Hands-Free Voice Send & Search Suffixes (opt-in):** Say a customizable end phrase (default: `"hit send"` / `"send it"` or `"hit search"` / `"search it"`) in one breath to strip the trigger, commit the clean message, and immediately trigger the field's Send or Search IME action. Strictly gated on `EditorInfo.imeOptions` (never triggers or strips in Notes, composers, or fields with `IME_FLAG_NO_ENTER_ACTION`).
  * **Deterministic Voice Snippets:** Map spoken triggers (e.g. `"my email"`, `"calendar link"`) to exact literal expansions expanded client-side before commit so Rambler never misspells URLs, emails, handles, or templates.
  * **Post-Dictation Find & Replace + Strip Trailing Period:** Define plain-text or regex replacements (optional case-sensitive and per-app scope) plus an optional **Strip trailing period** toggle for casual chat (preserving ellipses `…` and abbreviations like `e.g.` / `Dr.`).
  * **Local Dictation History:** Private on-device ring buffer (last 50 committed Rambler dictations) with ON/OFF toggle, search filter, one-tap copy, single-entry delete, and Clear all.
  * **Auto Parallel Retry on Flaky Networks:** Live toggle enabling Gboard's `agentic_dictation_enable_auto_parallel_retry` + `enable_pcm_audio_caching_for_offline_fallback` + `jetson_defer_error_propagation_on_network_failure` so transient Wi-Fi/5G drops silently replay buffered audio in parallel.
  * **Longer Dictation Sessions:** Configurable `jetson_max_session_duration_seconds` (Default, 2–30 min presets, or custom 30–3600s) so long voice dumps aren't cut off early.
  * **One-Tap Settings Backup & Restore (`.json`):** Export and import all Rambler Enhancements config (Hex waveform, per-app rules, snippets, find/replace rules, voice actions, behavior toggles, and `MUSE_STATS` voice dictionary words) as a single JSON file (excluding private dictation history).
* **Per-App Behavior Overrides:** Extend Per-App rules with tri-state overrides (**Default / Force ON / Force OFF**) for **Append-only dictation**, **App context**, and **Strip trailing period** — refreshed live via `AgenticDictationExtension.onActivateInternal(EditorInfo)` before every dictation starts (supports behavior-only app rules without needing a custom prompt).

## [1.1.8](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.1.7...v1.1.8) (2026-11-23)

### 🐛 Bug Fixes

* **Gboard:** Fix **Per-app custom instructions** being skipped whenever **App context** is turned off and **Default custom instructions** is left empty (Setup A). Gboard's early-exit branch in `AgenticDictationExtension`'s session Bundle builder jumped directly to the `return-object` label, bypassing the hook inserted ahead of it; replacing `return-object` in place and appending the return after the hook ensures all branch paths resolve per-app rules.

## [1.1.7](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.1.6...v1.1.7) (2026-11-23)

### ✨ New Features

* **Gboard:** Add **Per-app custom instructions** in **Gboard Settings → Voice typing → Rambler voice typing** and **Rambler Enhancements**:
  * **Default instruction + Named app rules:** keep Gboard's Default empty to apply custom instructions **only in selected apps** (with a one-tap **Use only in selected apps** quick-setup shortcut to move an existing Default prompt into an app rule), or define multiple named style rules for different app groups (optionally combining with Default).
  * **Searchable installed-apps picker:** filter installed apps by name or package (plus manual package entry), backed by a zero-permission `<queries>` launcher manifest entry for Android 11–17.
  * **Disabled apps:** exclude specific apps so no `<custom_instruction>` is ever sent there while keeping `<app_context>` untouched.

## [1.1.6](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.1.5...v1.1.6) (2026-11-23)

### ✨ Improvements

* **Gboard:** Add a live **Re-select after edit** toggle (`jetson_reselect_after_edit`, **off by default**) in **Gboard Settings → Voice typing → Rambler voice typing → Dictation behavior** and **Rambler Enhancements**. Previously, editing highlighted text automatically kept the edited span selected, causing follow-up dictations to keep rewriting that selection instead of appending cleanly.

## [1.1.5](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.1.4...v1.1.5) (2026-11-23)

### 🐛 Bug Fixes

* **Gboard:** Read, write, and listen directly to Gboard's live `Preferences` (`qvt` Proto Preference v1) store for **Append-only dictation**, **App context**, **Cursor-aware editing**, and **Use dictionary words**. Previously, native `SwitchPreferenceCompat` rows in **Gboard Settings → Voice typing → Rambler voice typing** wrote into Gboard's Proto Preference store while runtime flag checks read Android's `<package>_preferences.xml` — causing **Append-only dictation** to stay at 2,000 surrounding chars (rewriting earlier sentences) and **App context** to keep sending `Input Type: CapSentences` (fighting lowercase Custom instructions) even after flipping those switches!

## [1.1.4](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.1.3...v1.1.4) (2026-11-23)

### ✨ Improvements

* **Gboard:** Show **Gboard Rambler Enhancements** directly inside Morphe Manager's **Need help finding the APK?** picker (`18.5.4.993608717-release-arm64-v8a` stable + `18.8.0.1022711984-beta-arm64-v8a` experimental).
* **Gboard:** Make the bundle a single-app Gboard source (`com.google.android.inputmethod.latin`) so Morphe Manager automatically shows the **Updated / Repatch** indicator and changelog on installed Gboard / GboardWu builds whenever a new release ships.

## [1.1.3](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.1.2...v1.1.3) (2026-11-23)

### 🐛 Bug Fixes

* **Apply Rambler flag overrides on initial flag creation (`oki.x()`):** Insert `RamblerFlagRuntime.applyResolvedFlag(...)` before the **first** post-loop `if-eqz vSnapshot` check (`if (okrVar != null)`) instead of matching a later `if-eqz` where R8 reused `v0` for `this.e`. Previously, default-only flags (`agentic_dictation_enable_custom_instruction`, `enable_user_feature_cache`, `show_rambler_dict_settings`, `jetson_enable_cursor_awareness`, `agentic_dictation_enable_app_info_context`) skipped the hook when initialized for the first time (`okrVar == null`), preventing Custom Instructions, MUSE_STATS Personal Dictionary / Contact Names, Cursor-Aware Editing, and App Context from activating at runtime.

## [1.1.2](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.1.1...v1.1.2) (2026-11-23)

### 🐛 Bug Fixes

* **Fix ART DEX `VerifyError` in `RamblerDynamicConfig.<clinit>()`:** D8 folded static constant defaults into DEX `static_values` with a 0-register `<clinit>`, so rewriting `<clinit>` in place left `registers = 0` while referencing `v0` (`register index out of range (0 >= 0)`), preventing all 6 Rambler features and the explicit Android 14–17 settings launcher from initializing at runtime. `rewriteDynamicConfigClinit` now replaces `<clinit>` with a fresh `MutableMethodImplementation(2)`.
* **Preserve `.catch` try/catch metadata on `ramblerEnhancementsAppendCommit`:** Copy `.catch` exception handlers onto `MutableMethodImplementation` in `addHelperMethodIfMissing` so ART's DEX verifier validates the `move-exception` handler block in `AgenticDictationExtension` cleanly.

## [1.1.1](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.1.0...v1.1.1) (2026-11-23)

### 🐛 Bug Fixes

* **Android 14–17 settings launch:** Fix *"No application found to handle the action"* when tapping **Waveform animation (Hex)**, **Manage voice dictionary**, **Contact names sync**, or **Rambler Enhancements** on Android 14+ (API 34–37) by converting the internal preference intent into an explicit `ComponentName(context.getPackageName(), RamblerEnhancementsActivity)` inside `Preference.performClick()` (fully compatible with GboardWu's `Package Rename` and `android:exported="false"`).
* **Edge-to-edge padding:** Enable `fitsSystemWindows` on `RamblerEnhancementsActivity` so content clears the status and navigation bars on Android 15–17.
* **Morphe source manifest:** Use `LocalDateTime` format (without trailing `Z`) in `patches-bundle.json` so Morphe Manager parses updates cleanly.

## [1.1.0](https://github.com/abotmaker/gboard-rambler-enhancements/compare/v1.0.0...v1.1.0) (2026-11-23)

### ✨ New Features

* **Rambler voice typing settings:** Expose every selected patch directly inside Gboard's native **Settings → Voice typing → Rambler voice typing** screen in Material You style:
  * **Custom instructions** — inline dialog editor.
  * **Waveform** → **Waveform animation (Hex)** — jumps directly to Listening/Processing animations, colors, and Hex tuning.
  * **Voice dictionary & contacts** → live **Use dictionary words** switch (`enable_user_contact_biasing`), **Manage voice dictionary** (`MUSE_STATS` Add / Import `.txt` / Export `.txt` / Remove / Clear), and **Contact names sync**.
  * **Dictation behavior** → live native switches right on the page for **Append-only dictation**, **Cursor-aware editing**, and **App context** (synced live with **Voice typing → Rambler Enhancements**).

## [1.0.0](https://github.com/abotmaker/gboard-rambler-enhancements/releases/tag/v1.0.0) (2026-11-23)

### ✨ New Features

* **Rambler Waveform Animation (Hex):** Ported from [Hex by Anomaly](https://github.com/anomalyco/hex) (MIT):
  * **Listening** *(while you speak)*: **Hex Dot Scope** (braided dual-trace dot oscilloscope with phosphor trails), **Hex Android Wave** (7-row scrolling dot sine wave), or **Gboard Default**.
  * **Processing** *(after you stop speaking, while transcribing)*: **Flow**, **Pulse**, or **Sweep**.
  * Independent **Listening** & **Processing** colors + minimal **Hex tuning** (**Strip trace** vs **iOS halo**, dot spacing, glow strength, voice response).
* **Rambler Custom Instructions:** Enables `agentic_dictation_enable_custom_instruction` and persistent custom style/formatting rules.
* **Rambler Personal Dictionary (`MUSE_STATS`):** Enables `UserFeatureCache` biasing words with add, `.txt` import/export, remove, and clear controls.
* **Rambler Contact Names:** Seeds up to 1,000 phone contact names into `MUSE_STATS` with manual sync and history reset.
* **Rambler Cursor-Aware Editing:** Enables cursor-aware editing, selected-text-only spoken edits, post-edit reselection, and a live **Append-only dictation** toggle with clean cursor-boundary spacing.
* **Rambler App Context:** Enables sharing active app/field metadata with a live toggle.
* **GboardWu coexistence:** Conflict-free hooks (`oki.x()` and `AgenticDictationExtension.<init>`) with dynamic bytecode fingerprinting — verified on Gboard `18.5.4.993608717-release-arm64-v8a`; newer versions are unverified.
