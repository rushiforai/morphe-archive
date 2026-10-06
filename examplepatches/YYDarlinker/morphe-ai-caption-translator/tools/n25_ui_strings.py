# -*- coding: utf-8 -*-
"""N25 authored UI strings: English source of truth, per-locale values and placeholder expectations.

Kept as a build-time authoring table for `tools/apply_n25_catalog.py`; it is not shipped or read at
runtime. `PLACEHOLDERS[key]` lists the positional argument types the value must keep, and the checker
verifies every locale preserves them.
"""

# key -> English (also the fallback in CaptionTranslationCatalog.ENGLISH)
EN = {
 # A/C: landscape preview
 'preview_sample': "A big world. Let's explore!",

 # D: diagnostics panel
 'api_test_ok': "API available: %1$s",
 'api_test_failed': "API test failed: %1$s",
 'api_test_retry_hint': "Test the connection using the saved configuration",
 'diagnostics_hint': "Enable caption text debugging for long tests; Save full diagnostics exports the last 24 hours (16 MiB cap). The summary below is recent activity only.",
 'save_diagnostics': "Save full diagnostics",
 'save_failed': "Save failed: %1$s",
 'save_ok': "Saved to Download/%1$s",
 'clear_diagnostics_confirm': "Clear the local diagnostic records? API settings and the translation cache are not cleared.",
 'copy_parts_title': "Android 9 and below: copy full diagnostics in parts",
 'copy_part_label': "Copy part %1$s / %2$s",
 'copy_part_done': "Copied part %1$s / %2$s; tap Save again for the remaining parts",
 'copy_part_failed': "Could not copy part %1$s",
 'selected_suffix': "selected",
 'model_hint_manual_only': "Select from the list below or type a model ID",
 'model_hint_retry': "Tap Refresh to retry, or type a model ID directly",
 'model_hint_key_first': "Enter the API Key first; the model can also be typed",
 'model_loading_refresh': "Refreshing the model list…",
 'model_loading_auto': "Loading the model list…",
 'model_load_failed': "Could not load models; enter one manually: %1$s",
 'model_list_updated': "Model list updated",
 'model_pick_or_type': "Pick a model or type its ID",
 'model_saved': "Model saved automatically",
 'model_save_failed': "Could not save the model",
 'keep_last_valid': "; keeping the last valid value",
 'api_config_error': "Caption API configuration error: %1$s",

 # D: player flyout rows
 'flyout_summary': "Show the shortcut in the player flyout menu. Hiding it does not disable AI captions; applies when the menu is reopened.",
 'shorts_flyout_summary': "Show the shortcut in the Shorts flyout menu. Hiding it does not disable AI captions; applies when the menu is reopened.",

 # D: diagnostics summary headings
 # The labels are bare: the line is "label + value", and the separator that joins them is its own
 # template, because CJK sets a full-width colon with no trailing space and Latin sets a half-width one
 # with a space.
 'engine': "Engine",
 'engine_event_rebuild': "Event rebuild",
 'label_separator': "%1$s: ",
 'mode': "Mode",
 'mode_auto_translate': "Auto-translate",
 'mode_original': "Original captions (no translation API)",
 'no_request_yet': "No translation request yet. Configure the API, select an Auto-translate language in the player, then refresh diagnostics.",
 'timing_decisions': "Timing references and failures (timestamped): ",
 'recent_trace': "Recent events: ",
 # The header line is one authored template rather than label + colon + value, because the localized
 # "On"/"Off" words are lowercase in some languages and cannot simply follow a colon.
 'display_debug': "Display text debugging: %1$s",
 'age_open': "(about %1$s",
 'age_close': " seconds ago)",

 # D: token cost audit
 'audit_title': "Token cost audit (since last reset)",
 'audit_no_usage': "Token cost audit: no API usage yet. Play AI captions to see usage, cache hits, request purposes, and cost per viewing minute.",
 'audit_current_model': "Current model: %1$s",
 'audit_current_engine': "Current engine: %1$s",
 'audit_legacy_engine': "Legacy compatibility engine",
 'audit_api': "API: %1$s attempts · %2$s successful (2xx) · %3$s failures · internal retries %4$s",
 'audit_structural': "Structural and deterministic checks: accepted / rejected (not semantic acceptance): %1$s / %2$s (%3$s)",
 'audit_tokens': "Tokens: %1$s = input %2$s + output %3$s",
 'audit_cache_known': "Input cache: hit %1$s / miss %2$s · hit rate %3$s",
 'audit_cache_unknown': "Input cache: provider did not report recognizable hit/miss details",
 'audit_estimate': "V4 Flash current provider estimate: %1$s",
 'audit_by_purpose': "Requests by purpose:",
 'audit_bucket_progress': "Page merge progress: %1$s fixed blocks completed by %2$s page requests (%3$s blocks/request; <1.0 means repeated requests without progress)",
 'audit_boundary': "Boundary recheck: triggered %1$s times (at most once/page) · sent %2$s requests · recovered %3$s atoms",
 'audit_page_fallback': "Page fallback: %1$s cached pages exceeded the failure threshold; falling back to block requests",
 'audit_sunk': "Sent but unread requests: %1$s requests · %2$s bytes. Provider processing and billing are unknown; the token and cost totals exclude this usage, so the actual spend cannot be determined.",
 'audit_display_local': "Display slicing: local zero-token successes %1$s times",
 'audit_display_whole': "kept whole sentences %1$s times",
 'audit_display_handoff': "handed off to AI %1$s times (AI calls %2$s · with usage %3$s · failures %4$s)",
 'audit_video': "Current video: viewed %1$s s · %2$s tokens",
 'audit_per_minute': "%1$s tokens/viewing minute",
 'audit_semantic_window': "Semantic window: core %1$s atoms · exposed %2$s atoms · context exposure ratio %3$s",
 'audit_request_blocks': "Request blocks: target %1$s blocks · read-only context %2$s sections · context sections/block %3$s",
 'audit_char_ratio': "character exposure ratio %1$s",
 'audit_disk_cache': "Request-block disk cache: lookups %1$s · hit blocks %2$s · missed units %3$s",
 'audit_request_body': "Request body: total %1$s bytes · average %2$s bytes/API attempt",
 'audit_no_usage_note': "Note: %1$s 2xx responses lacked usage; only request counts, not exact tokens, are known for these.",
 'audit_viewed': "viewed %1$s s · %2$s tok",
 'audit_tok_per_minute': "%1$s tok/viewing minute",
 'audit_failure_breakdown': "Failure breakdown: 429 %1$s · 5xx %2$s · other 4xx %3$s · timeout %4$s · network %5$s · cancelled/interrupted %6$s · other %7$s",
 'audit_efficiency': "%1$s efficiency: added %2$s core atoms · input per atom %3$s tok · cache-miss input per atom %4$s tok",
 'audit_priced_subset': "(only responses priced by built-in V4 Flash rates)",
 'audit_focus_misses': "focus misses %1$s",
 'audit_circuit_breakers': "local circuit breakers %1$s",
 'audit_logical_request_one': "%1$s logical request / ",
 'audit_logical_request_many': "%1$s logical requests / ",
 'audit_api_call_one': "%1$s API call · ",
 'audit_api_call_many': "%1$s API calls · ",
 'audit_tok': "%1$s tok",
 'audit_bucket_priority': "Current priority",
 'audit_bucket_priority_current': "Current anchor",
 'audit_bucket_priority_gap_rescue': "Gap rescue",
 'audit_bucket_background': "Background prefetch",
 'audit_bucket_background_page': "Page merge",
 'audit_bucket_background_block': "Block (fallback)",
 'audit_bucket_background_alt': "Boundary recheck",
 'audit_bucket_unit_realtime': "Time anchor / current batch",
 'audit_bucket_unit_background': "Time anchor / background batch",
 'audit_core_semantic_ledger': "Core: Semantic Ledger v2",
 'audit_core_contextual_unit': "Core: Contextual Unit v1",
 'audit_bucket_display': "Display slicing",
 'audit_core_event_rebuild': "Core: Event rebuild / %1$s",
}

# key -> ordered list of placeholder argument kinds, e.g. ['s','s']
PLACEHOLDERS = {
 'save_failed': ['s'], 'save_ok': ['s'],
 'api_test_ok': ['s'], 'api_test_failed': ['s'],
 'label_separator': ['s'],
 'display_debug': ['s'],
 'model_load_failed': ['s'], 'api_config_error': ['s'],
 'copy_part_label': ['s', 's'], 'copy_part_done': ['s', 's'], 'copy_part_failed': ['s'],
 'age_open': ['s'],
 'audit_current_model': ['s'], 'audit_current_engine': ['s'],
 'audit_api': ['s', 's', 's', 's'],
 'audit_structural': ['s', 's', 's'],
 'audit_tokens': ['s', 's', 's'],
 'audit_cache_known': ['s', 's', 's'],
 'audit_estimate': ['s'],
 'audit_bucket_progress': ['s', 's', 's'],
 'audit_boundary': ['s', 's', 's'],
 'audit_page_fallback': ['s'],
 'audit_sunk': ['s', 's'],
 'audit_display_local': ['s'],
 'audit_display_whole': ['s'],
 'audit_display_handoff': ['s', 's', 's', 's'],
 'audit_video': ['s', 's'],
 'audit_per_minute': ['s'],
 'audit_semantic_window': ['s', 's', 's'],
 'audit_request_blocks': ['s', 's', 's'],
 'audit_char_ratio': ['s'],
 'audit_disk_cache': ['s', 's', 's'],
 'audit_request_body': ['s', 's'],
 'audit_no_usage_note': ['s'],
 'audit_viewed': ['s', 's'],
 'audit_tok_per_minute': ['s'],
 'audit_failure_breakdown': ['s', 's', 's', 's', 's', 's', 's'],
 'audit_efficiency': ['s', 's', 's', 's'],
 'audit_focus_misses': ['s'],
 'audit_circuit_breakers': ['s'],
 'audit_logical_request_one': ['s'], 'audit_logical_request_many': ['s'],
 'audit_api_call_one': ['s'], 'audit_api_call_many': ['s'],
 'audit_tok': ['s'],
 'audit_core_event_rebuild': ['s'],
}

# Values that are not new: reuse the already translated existing catalog key verbatim. An empty target
# means the value already exists under this very key (the flyout summary predates this card).
REUSE = {
 'flyout_summary': '',
 'engine': 'message_dd0fb9f395bc',
 'mode': 'message_8736a99d18f2',
 'mode_auto_translate': 'message_0825b4b0cb7d',
 'mode_original': 'message_375e0f929195',
 'no_request_yet': 'message_7e7bfd29c71d',
 'timing_decisions': 'message_dedc85cbb813',
 'recent_trace': 'message_30070c30d85c',
 'age_close': 'message_33cc168ccb4e',
}
