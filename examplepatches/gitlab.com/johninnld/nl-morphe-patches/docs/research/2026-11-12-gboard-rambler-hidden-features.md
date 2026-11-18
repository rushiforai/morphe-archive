# Gboard 18.6.3 Rambler: hidden features inventory

Source: `com.google.android.inputmethod.latin_18.6.3.1002251336-release-arm64-v8a` (APKMirror bundle, versionCode
176071766), `base.apk` decompiled with jadx 1.5 (code lives in base; `split_dictation_feature_split` has no dex).
Static analysis only; nothing here was run on a device. Internally Rambler is "Jetson" / "agentic dictation"; its flag
holder is `muq` (obfuscated), the extension is `AgenticDictationExtension` (`ffh`).

## Already unlocked by our patches

| Flag | Default | Patch |
| --- | --- | --- |
| `enable_agentic_dictation`, `enable_rambler_al_toolbar`, `enable_rambler_toolbar_at_cursor_position`, `ad_activation_type=2` | off / 0 | Rambler voice typing |
| `enable_rambler_voice_correction_list_setting`, `..._import_export`, `show_rambler_dict_settings`, `show_clear_all_corrected_words_settings`, `enable_user_contact_biasing`, `enable_user_feature_cache` | off | Rambler personal dictionary |

Already on by default once Rambler runs: push-to-ramble (`push_to_ramble_debounce_interval_ms`), Rambler in the
toolbar (`enable_jetson_in_toolbar`), emoji skin-tone replacement, PCM caching for retry, the spoken commands below.

## Candidates worth opening

Status after phone tests (2026-11-12): custom instructions, cursor-aware editing and app context shipped and work.
The Dutch send command and automatic retry were removed: Gboard's own send command never fired, even in English in a
field with a Send action, and automatic retry hid the Retry button and lost the dictation.

1. **Custom instructions** (now the experimental patch "Rambler custom instructions") — `agentic_dictation_enable_custom_instruction` (off). When on, Gboard reads the string pref
   `pref_key_rambler_custom_instruction` and sends it as `<user_instruction>` inside the request's
   `user_preferences` bundle, wrapped in Google's own guard prompt (dictation style only: spelling, language
   conventions, vocabulary, formatting, punctuation, casing, tone; lowest priority; anti-jailbreak). **No settings
   screen writes this pref in 18.6.3** — `setting_rambler_voice_typing.xml` has no entry for it. Opening it needs the
   flag plus an `EditTextPreference` (class present, unused) added to that screen. Example use: "Schrijf Nederlands
   met Nederlandse aanhalingstekens; gebruik je, niet u."
2. **Cursor-aware editing** — `jetson_enable_cursor_awareness` (off): Rambler also receives text *after* the cursor
   (`muq.U` following paragraphs), so dictating or editing in the middle of a text works with full context.
   `jetson_send_only_selected_text_if_present` (off): with a selection, only the selection is sent, so "make this
   more formal" acts on the selection. `jetson_reselect_after_edit` (off): the edited range is re-selected afterwards
   for follow-up edits. Pure flags.
3. **App context** — `agentic_dictation_enable_app_info_context` (off): adds `<app_context>` with app label, package
   name, input type, IME action and field hint (≤100 chars), letting Rambler adapt (chat vs e-mail vs search). Sends
   the app's name to Google in addition to the text Rambler already sends. Pure flag; privacy trade-off to document.
4. **Dutch spoken commands** — `VoiceCommandClassifier` matches the whole utterance against `send_command_regex`
   `(?i)^[^a-z0-9]*sen[dt][^a-z0-9]*$`, `clear_command_regex`, `clear_all_command_regex`. Only SEND is acted on
   locally (fires IME_ACTION_SEND when the field's action is Send). English only; string-flag overrides could add
   "verstuur/verzend/stuur". Needs a phone check of what Rambler returns for a lone Dutch "verstuur".
5. **Auto parallel retry** — `agentic_dictation_enable_auto_parallel_retry` (off): starts a parallel standard
   recognizer when a Rambler request fails. Reliability only; behaviour under quota errors unverified.

Low value / not viable: `enable_rambler_al_toolbar_overflow_menu` (only a thumbs up/down feedback dropdown),
`enable_agentic_dictation_debug_ui` (latency/intent debug toasts), promo banner/onboarding flags,
`rambler_preserve_rewritten_text_on_revert` (undo detail), `enable_unified_feedback_button`.
`agentic_dictation_enable_seamless_fallback`, `..._proactive_parallel_asr`, `auto_cleanup_delay_ms`,
`min_word_count_for_auto_cleanup`, `enable_learn_name_biasing` have no Java consumer (dead in this build).
**Rambler Lite** (`agentic_dictation_backend_type` 3 = MUSE_LITE, `jetson_no_network_fallback_strategy` 3,
`JetsonLiteHandler`) runs on AICore Gemini Nano; AICore rejects a renamed Gboard (see 2026-11-11 finding), so not viable.
The developer screen (`setting_developer.xml`) no longer carries a Rambler backend list in 18.6.3.

## Correction mode (learning words you fix)

The Rambler settings footer says "Rambler learns from your contacts and from words you fix after dictating", and a
hidden toggle **Remember corrected words** exists (`OverrideFlagPreference` overriding `enable_user_contact_biasing`,
shown only when `show_personal_dict_biasing_settings_toggle` is true).

Data path:

- Store: UserFeatureCache feature `MUSE_STATS` (proto `keyboard.decoder.ufc.MuseStats`: `Word{spelling,
  pronunciation, lang_code, type}`, per-app conversation/punctuation/capitalisation preferences, `last_processed_text`).
  The store is registered by default in `enabled_user_feature_cache_features_v2`; it only exists once
  `enable_user_feature_cache` loads the module (our v1.67.2 fix).
- Sending: `NewS3Recognizer.getBiasingWords` reads `MuseStats` list 3 (`rwn.d`) and attaches the words to each Rambler
  request when `enable_user_contact_biasing` is true (our dictionary patch).
- Writers in Java: only Gboard's import (`VoiceCorrectionListFragment` import, our contacts seed) and delete paths.
  Nothing in Java records a correction.
- **Learning is native**: `InputActionsUserFeatureProcessor` registers native processors (`muse_stats_processor.cc`,
  `MuseStatsProcessor::ProcessInternal` in `libintegrated_shared_object.so`) that watch input actions. Which
  processors run comes from the proto flag `user_feature_cache_metric_processors_v2` (string list, **default empty**)
  plus `input_actions_processor_params` / `_v2`. A re-signed Gboard never receives that list, so **correction learning
  is off on our builds** even with the feature cache loaded. The v1 conversion also loads asset `postags-en.smfb`,
  which is absent from every split; Java only logs the miss, but the native processor may learn less (or nothing)
  without it.
- Enabling it needs an override of that proto flag. Proto flags are `byte[]` flags read through the same getter our
  flag-family hook patches, so the hook can return a serialized list containing `MuseStatsProcessor`. Sessions also
  depend on `enable_training_cache_metrics_processors`. Design and gate chain:
  [correction learning proof of concept](2026-11-12-rambler-correction-learning-poc.md).
- Not the same as `enhanced-voice-dictation-corrections` / `LearningController` / `PastCorrectionsSupplierImpl`
  (`enable_biasing_for_past_corrections`, default on): those feed on-device smart dictation (SODA speech
  enhancement), not Rambler.

Where corrections can be validated: Gboard settings → Voice typing → Rambler → **Voice correction list** shows the
union of MuseStats lists 1, 3 and 4 (`rwn.b`, `rwn.d`, `rwn.e`), so a learned word would appear there; export gives the
same set as text. `UserFeatureCache.dump` only prints feature ids, so `dumpsys` cannot show the words; the
`ModuleInitListener-ryi` line in `dumpsys activity service <pkg>/com.android.inputmethod.latin.LatinIME` confirms the
module is loaded. A phone test would be: enable the processor list, dictate with Rambler, correct a word by typing,
reopen the Voice correction list.
