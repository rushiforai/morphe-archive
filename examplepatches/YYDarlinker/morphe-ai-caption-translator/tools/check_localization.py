"""Check the authored translation catalog and generated Android XML without rewriting source."""
import json,xml.etree.ElementTree as ET
from pathlib import Path
root=Path(__file__).resolve().parents[1]
x=json.loads((root/'localization/catalog.json').read_text(encoding='utf-8'))
keys=set(x['languages']['en'])
assert len(x['languages'])>=14
for locale,values in x['languages'].items():
 assert set(values)==keys,locale
 assert all(isinstance(v,str) and v.strip() for v in values.values()),locale
 folder='values' if locale=='en' else 'values-'+({'id':'in'}.get(locale,locale))
 xml=ET.parse(root/'patches/src/main/resources/captionlocales'/folder/'caption_addon_strings.xml').getroot()
 names=[n.attrib['name'] for n in xml]
 assert len(names)==len(set(names))==len(keys),locale
 assert set(names)=={'cap_'+k for k in keys},locale
 assert all(n.attrib.get('formatted')=='false' for n in xml),locale
assert set(x['source_keys'].values())<=keys
print(f'Localization: {len(keys)} keys in all {len(x["languages"])} locales; XML and source map valid')
