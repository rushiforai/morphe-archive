"""Check catalog, Android XML and Morphe formatting without rewriting source."""
import json
import re
import xml.etree.ElementTree as ET
from pathlib import Path

root = Path(__file__).resolve().parents[1]
catalog = json.loads((root / 'localization/catalog.json').read_text(encoding='utf-8'))
languages = catalog['languages']
english = languages['en']
keys = set(english)
assert len(languages) == 14
assert set(catalog['keys']) <= keys
resources = root / 'patches/src/main/resources/captionlocales'

def placeholders(value):
    return re.findall(r'%(?:[0-9]+\$)?[A-Za-z]', value.replace('%%', ''))

for locale, values in languages.items():
    assert set(values) == keys, locale
    folder = 'values' if locale == 'en' else 'values-' + {'id': 'in'}.get(locale, locale)
    xml = ET.parse(resources / folder / 'caption_addon_strings.xml').getroot()
    assert len(xml) == len(keys), locale
    assert {node.attrib['name'] for node in xml} == {'cap_' + key for key in keys}, locale
    for node in xml:
        key = node.attrib['name'].removeprefix('cap_')
        value = values[key]
        assert isinstance(value, str) and value.strip(), (locale, key)
        formats = placeholders(english[key])
        expected = [
            f'%{index}${placeholder[-1]}' if len(formats) > 1 else f'%{placeholder[-1]}'
            for index, placeholder in enumerate(formats, 1)
        ]
        assert sorted(placeholders(value)) == sorted(expected), (locale, key)
        assert node.attrib.get('formatted') == 'false', (locale, key)
        assert node.text == '"' + value.replace('"', '\\"').replace("'", "\\'") + '"', (locale, key)

assert set(catalog['source_keys'].values()) <= keys
print(f'Localization: {len(keys)} keys in all {len(languages)} locales; XML, format and source map valid')
