# Modular captions (1.2.0)

> Historical 1.2.0 behavior. For the direct toggle, shared menu divider and multilingual timing changes, see `CAPTIONS-1.2.1.md`.

## Three public patches

All three roots are opt-in (`default=false`). Shared initialization, resource installation and structural bindings are internal dependencies, not extra user-facing choices.

| Patch | Owns | Requires AI enabled? |
|---|---|---|
| AI caption translator | API translation, semantic grouping, timing calibration, overlay/style/preview, diagnostics and the player engine selector | AI processing uses the saved switch; other patches are not prerequisites |
| Add Simplified Chinese to auto-translate | Missing `zh-Hans` menu entry plus locale-aware insertion | No; native YouTube translation remains available |
| Remember caption selection | Per-process language, source/translation mode, ASR preference and On/Off restoration | No; native-only and AI-disabled use are supported |

### Upgrade

To retain the former combined feature set, select **all three** on your next APK build. Selecting only AI no longer silently enables the language insertion or cross-video memory features. Merely updating the source does not modify an already-built APK.

The AI patch uses the official Morphe settings and player-flyout infrastructure. The verified combination is the official compatible default patch set (including Captions and player-flyout components) plus any selected addon roots. Minimal or customized official selections must retain that infrastructure; no floating-button or CC-gesture fallback is silently installed. The two non-AI roots can be built without the AI root or the official bundle's selected patches on the verified target.

Do not select another patch implementing the same language insertion/remapping or language memory behavior in the same build. Keeping its source installed is fine; overlapping selected hooks are the concern.

## Language ordering

No fixed "Chinese last" rule and no fixed Simplified-before/after-Traditional rule remain. Only the Simplified Chinese entry is inserted/repositioned. Other native entries retain their relative order.

The insertion uses the current **YouTube application locale**, native display labels where available, and that locale's collation. Compatibility normalization removes width/spacing differences before comparison. In an English UI this follows localized alphabetical names; in a Simplified Chinese UI it uses Chinese collation rather than an English code sort. Existing Simplified entries are deduplicated. The same rule applies to the shared metadata and concrete track list. The added label uses Android's localized Simplified Chinese language name.

## Independent selection memory

Memory has its own state, separate from the AI current-video choice and API configuration. It is not gated by the AI enabled preference. Explicit native user selections update memory, not incidental automatic/default selections. New-video restoration resolves a fresh native track from that video's list; old track objects/URLs are not used for cross-video memory. When an exact ASR/manual flavor is unavailable, a same-language native candidate may be used. With no language match, the native default selector remains the fallback. Off is remembered without deleting the last language.

Scope is unchanged: **this application process only**. A full process restart begins without an addon-imposed language. This release does not introduce permanent language storage or account synchronization.

## Player engine selector

The AI root adds a localized `AI caption translation · On/Off` entry through the official native flyout inflater, not an Activity-wide overlay. Normal video uses the recognized top player settings menu. Shorts uses the recognized overflow menu containing its caption action. Nested caption/quality menus and unrelated sheets are excluded. Unknown menu variants retain native behavior instead of receiving a guessed injection.

The entry opens a native single-choice dialog: **Use YouTube / Use AI**. It controls the same saved switch as the settings page. A decrypted configured API key is required before enabling AI. Switching engines reselects the current native track, including the native selector's original origin/reason parameters, without rewriting independent language memory. Disabling AI cancels its current session and releases native rendering; native caption requests bypass the AI rewrite path. Off captions stay off; choosing AI while viewing source-only captions does not invent a target language. Missing/stale native selection state produces a visible failure instead of claiming an immediate successful switch.

The captured manager/track are weak, current-video references for **in-video switching only**, separate from cross-video memory.

## Localization

Android resource bundles cover 88 authored UI keys in each of 14 locales:

- English
- Simplified Chinese, Traditional Chinese
- Spanish, French, German, Portuguese, Russian
- Japanese, Korean
- Arabic, Hindi, Indonesian, Vietnamese

Titles, actions, explanations, save/error states, preview labels and the engine dialog use localized resources. Settings strings use the official public Morphe resource lookup when available, following its context/language override; native player entries use the player Activity's resources. Unavailable languages fall back to English, not fixed Simplified Chinese. Indonesian uses Android's legacy `values-in` qualifier, verified by resource-loading tests.

Native language labels are localized by Android, so the non-AI language patch is not limited to the above UI translation table. The memory patch has no extra settings screen. Stable English patch names in MPP/Manager metadata remain canonical identifiers; they cannot be switched by the target YouTube app's runtime locale. Existing user-provided prompts, model IDs, URLs, source/translated caption evidence and provider/technical log payloads are not translated or modified by UI localization. Technical identifiers remain stable.

`localization/catalog.json` is the translation source. `tools/generate_localization.py` generates bundled XML and the legacy-label migration table. `tools/check_localization.py` checks complete, unique key coverage. This is broad initial coverage, not a claim to include every language translated by the official project or professional linguistic review of all locales.

## Validation and publication boundary

- Regression tests cover standalone memory, AI-disabled/enabled memory decisions, mode switching without clearing language or forcing CC On, locale insertion and actual Android resource lookup in all 14 languages.
- Real Patcher runs exercise all seven nonempty addon-root combinations. Native-only selections do not select official patches. AI selections use official compatible defaults.
- Structural audits check selected feature flags, absence/presence of menu/memory/AI hooks and exactly one shared initializer.
- The full combination is compiled to an unsigned APK. DEX audit checks duplicate classes, bound flyout helpers, public native selector access and exact invocation register-word counts. An initial selector-arity defect was caught before release and corrected; build success alone was not accepted as proof of call validity.
- Release validation requires the three public patch names, complete locale resources and absence of test harnesses from the MPP. The existing Morphe semantic-release publisher, automatic tag/manifest/assets and dev backmerge are retained; only validation expectations are expanded for a multi-patch bundle.

The tested original APK is YouTube 21.07.247, SHA-256 `afed0724c7cbdec08626573f5e0c405db76e11fe9bfdafbc3884690a766666db`, with official patches 1.43.0 for AI combinations. This is not a compatibility guarantee for every YouTube version/menu experiment. No real-phone installation, native-menu tap-through, paid translation call or playback acceptance is claimed. Those remain phone acceptance steps after refreshing the source and rebuilding.
