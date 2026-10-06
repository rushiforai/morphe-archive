# -*- coding: utf-8 -*-
"""Set the preview_hint display value in localization/catalog.json (N26 C section).

The hint under the style-preview canvas now says the preview is the full-screen one, in every interface
language the patch ships. Only this one key is touched: every other catalog entry, the key order, the
locale order, the source-string map and the file's line endings are left exactly as they were, so
re-running this script is idempotent and re-running the resource generator cannot restore the old text.

The Chinese source string that maps to this key (`样式预览`) is a translation source, not a value, so it
does not change and `source-keys.tsv` stays valid for `captionResourceTitle`.
"""
import json
import sys
from pathlib import Path

KEY = 'preview_hint'

# Card table, verbatim. English is also the runtime fallback in CaptionTranslationCatalog.
VALUES = {
    'en': 'Style preview (full screen)',
    'zh-rCN': '样式预览（全屏）',
    'zh-rTW': '樣式預覽（全螢幕）',
    'es': 'Vista previa de estilo (pantalla completa)',
    'fr': 'Aperçu du style (plein écran)',
    'de': 'Stilvorschau (Vollbild)',
    'pt': 'Prévia do estilo (tela cheia)',
    'ru': 'Предпросмотр стиля (полный экран)',
    'ja': 'スタイルプレビュー（全画面）',
    'ko': '스타일 미리보기(전체 화면)',
    'ar': 'معاينة النمط (ملء الشاشة)',
    'hi': 'शैली पूर्वावलोकन (पूर्ण स्क्रीन)',
    'id': 'Pratinjau gaya (layar penuh)',
    'vi': 'Xem trước kiểu (toàn màn hình)',
}

root = Path(__file__).resolve().parents[1]
path = root / 'localization/catalog.json'
raw = path.read_text(encoding='utf-8')
newline = '\r\n' if '\r\n' in raw else '\n'
data = json.loads(raw)

locales = list(data['languages'])
missing = [locale for locale in locales if locale not in VALUES]
extra = [locale for locale in VALUES if locale not in locales]
assert not missing, 'catalog has locales the N26 table does not cover: {}'.format(missing)
assert not extra, 'N26 table names locales the catalog does not have: {}'.format(extra)
assert KEY in data['languages']['en'], '{} is missing from the catalog'.format(KEY)

changed = []
for locale in locales:
    values = data['languages'][locale]
    assert KEY in values, (locale, KEY)
    if values[KEY] != VALUES[locale]:
        values[KEY] = VALUES[locale]
        changed.append(locale)

path.write_text(json.dumps(data, ensure_ascii=False, indent=2).replace('\n', newline),
                encoding='utf-8', newline='')
print('preview_hint: {} locales, {} changed ({})'.format(
    len(locales), len(changed), ', '.join(changed) if changed else 'already current'))
sys.exit(0)
