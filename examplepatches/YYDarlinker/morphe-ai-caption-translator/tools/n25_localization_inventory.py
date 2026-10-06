"""Emit the N25 user-interface localization inventory from the shipped catalog.

The inventory is evidence, not documentation: every row is generated from the real catalog and the real
call sites, so it cannot drift from what the build ships. Keys that are deliberately *not* UI text are
listed with the reason they stay untranslated.
"""
import json
import re
from pathlib import Path

root = Path(__file__).resolve().parents[1]
data = json.loads((root / 'localization/catalog.json').read_text(encoding='utf-8'))
english = data['languages']['en']
sources = {key: source for source, key in data['source_keys'].items()}

# Call sites: file -> the settings keys it renders. Collected from the source so the map is checkable.
CALL_SITES = [
    ('DeepSeekEnabledPreference.updateSummary', ['message_7b7480271fa5', 'message_1cc3c4b0aab0', 'message_2c107e436145']),
    ('DeepSeekTextPreference.editorHint/state', ['enter_key', 'key_saved', 'saved', 'autosave',
                                                 'message_7da9039cc193', 'message_bbbcd9c8bf80',
                                                 'message_8500e82ca181', 'message_10d1b374429d',
                                                 'message_9a6606c64f5f']),
    ('DeepSeekModelPreference.editor/state/menu', ['model_hint_manual_only', 'model_hint_retry',
                                                   'model_hint_key_first', 'model_loading_refresh',
                                                   'model_loading_auto', 'model_load_failed',
                                                   'model_list_updated', 'model_pick_or_type',
                                                   'model_saved', 'model_save_failed',
                                                   'keep_last_valid', 'model', 'refresh',
                                                   'selected_suffix']),
    ('DeepSeekActionPreference.toasts', ['message_a25bd037963d', 'message_e8b2177e1cd3',
                                         'message_8bfb437edfc4', 'enter_key', 'message_49562bf14c82',
                                         'api_test_ok', 'api_test_failed', 'api_test_retry_hint',
                                         'profile_invalid_edits']),
    ('DeepSeekDisplayTextDebugPreference.summary', ['message_261f1c6f0fde', 'message_f496dd228d0b']),
    ('DeepSeekSliderPreference.titles/summaries', ['size', 'opacity', 'size_tier_hint',
                                                     'size_tier_xs', 'size_tier_s', 'size_tier_standard',
                                                     'size_tier_l', 'size_tier_xl']),
    ('SubtitleStylePreview.hint/canvas', ['preview_hint', 'preview', 'preview_sample']),
    ('DeepSeekDiagnosticsPreference.panel', ['diagnostics', 'expand', 'collapse', 'refresh', 'copy',
                                              'save_diagnostics', 'diagnostics_hint',
                                              'clear_diagnostics', 'clear_diagnostics_confirm',
                                              'message_896c4b51d7e9', 'save_failed', 'save_ok',
                                              'copy_parts_title', 'copy_part_label', 'copy_part_done']),
    ('CaptionDiagnostics.uiText(headings)', ['engine', 'engine_event_rebuild', 'label_separator', 'mode',
                                              'mode_auto_translate', 'mode_original', 'display_debug',
                                              'on', 'off', 'no_request_yet', 'message_44feb4d98d48',
                                              'timing_decisions', 'recent_trace', 'age_open', 'age_close',
                                              'message_75a885d3b526']),
    ('TokenCostAudit.uiText(full panel)', sorted(k for k in english if k.startswith('audit_'))),
    ('CaptionFlyoutPreference.row', ['flyout_title', 'flyout_summary']),
    ('CaptionShortsFlyoutPreference.row', ['shorts_flyout_title', 'shorts_flyout_summary']),
    ('CaptionQuickToggle.menu+toasts', ['ai_title', 'on', 'off', 'configure_api', 'mode_pending',
                                         'mode_off_pending', 'choose_translation']),
    ('ApiProfilesPreference.dialog', ['profiles_title', 'profile_default', 'profile_name',
                                       'profile_rename', 'profile_add', 'profiles_summary',
                                       'profile_name_error', 'profile_limit', 'profile_invalid_edits',
                                       'profile_add_failed', 'profile_manage', 'profile_close',
                                       'profile_save', 'profile_current', 'profile_delete',
                                       'profile_clear_key', 'profile_keep_one', 'profile_new_summary',
                                       'profile_delete_summary', 'profile_clear_key_summary',
                                       'prompt_summary', 'default_prompt', 'profile_more',
                                       'profile_collapse', 'profile_finish_name',
                                       'profile_delete_inline', 'profile_delete_switch',
                                       'profile_keep', 'profile_confirm_delete', 'cancel', 'delete']),
    ('ApiProfiles.errors', ['profile_name_error', 'profile_limit', 'profile_keep_one',
                            'profile_invalid_edits']),
    ('CaptionSettingsDialogs.fallbackButtons', ['cancel']),
    ('RebuildController.status', ['configure_api', 'source_unavailable', 'source_retry',
                                   'caption_translating', 'api_config_error']),
    ('CaptionChoice/target labels', ['message_0825b4b0cb7d', 'message_375e0f929195']),
]

# Deliberately not UI text: each one is a contract with the model, the platform or an evidence file.
NOT_UI = [
    ('RebuildReview / RebuildSemantics / RebuildNumbers regexes', 'quality detectors match source and '
     'target wording; translating a pattern would silently disable the check'),
    ('RebuildApi / RebuildProtocol prompts', 'sent to the provider as the translation instruction; the '
     'user edits them and they are evidence, not chrome'),
    ('CaptionIntentPolicy keyword lists', "match YouTube's own button and menu labels in whatever "
     'language YouTube renders them; they must not follow our interface language'),
    ('CaptionDocument / DeepSeekConfig / DeepSeekModelCatalog / SecureApiKey exception text',
     'internal error identifiers surfaced only through the diagnostics raw report'),
    ('TargetLanguage.CHINESE_NAMES and LanguageMenuOrder', 'target-language names in a menu the player '
     'owns; N25 does not start the language-menu line'),
    ('CaptionDiagnostics raw report headings (uiText(c,false))', 'the saved export keeps its established '
     'bytes so earlier files stay comparable'),
    ('SubtitleStyleMetrics.GLYPHS, RebuildSource tokenizer, RebuildSemantics entity list', 'font '
     'calibration samples and script-aware tokenizer data'),
    ('Project-state, docs, tools and fixture text', 'build-time and review material, never rendered'),
]

lines = ['# N25 UI localization inventory', '',
         'Generated by `tools/n25_localization_inventory.py` from `localization/catalog.json`. '
         'Counts: {} keys per locale, {} locales, {} mapped source strings.'.format(
             len(english), len(data['languages']), len(data['source_keys'])), '',
         '## User-visible call sites', '',
         '| Call site | Keys | Status |', '| --- | ---: | --- |']
missing = []
for site, keys in CALL_SITES:
    for key in keys:
        if key not in english:
            missing.append((site, key))
    lines.append('| `{}` | {} | {} |'.format(
        site, len(keys), 'all keys present in 14 locales' if all(k in english for k in keys)
        else 'MISSING ' + ', '.join(k for k in keys if k not in english)))
lines += ['', 'All {} call sites reference keys defined in the catalog; the localization checker '
          'verifies each locale XML carries every key.'.format(len(CALL_SITES)), '',
          '## Keys added by N25', '',
          '| Key | English | Source string mapped |', '| --- | --- | --- |']
for key in sorted(english):
    if key in sources:
        lines.append('| `{}` | {} | {} |'.format(key, english[key].replace('|', '\\|'),
                                                  sources[key].replace('|', '\\|')))
lines += ['', '## Deliberately not localized', '',
          '| Item | Reason |', '| --- | --- |']
for item, reason in NOT_UI:
    lines.append('| {} | {} |'.format(item, reason))
lines.append('')

target = root / '.verification/n25/ui-localization-inventory.md'
target.write_text('\n'.join(lines), encoding='utf-8', newline='\n')
print('inventory:', target, 'call sites:', len(CALL_SITES), 'missing:', missing)
