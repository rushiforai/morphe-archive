# Changelog

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
