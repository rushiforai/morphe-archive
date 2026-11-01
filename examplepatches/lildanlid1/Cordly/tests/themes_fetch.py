#!/usr/bin/env python3
"""Download every theme listed on plugins-list.pages.dev/Themes into work/themes/ for tests/theme_compat.cjs.
    python3 tests/themes_fetch.py
Developer-only; themes are not committed (they belong to their authors)."""
import json, urllib.request, concurrent.futures, os, re, hashlib
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, 'work', 'themes'); os.makedirs(OUT, exist_ok=True)
UA = {'User-Agent': 'Mozilla/5.0'}
listing = json.load(urllib.request.urlopen(urllib.request.Request('https://plugins-list.pages.dev/themes-data.json', headers=UA), timeout=30))
def get(t):
    url = t.get('installUrl') or ''
    if not url: return None
    try: body = urllib.request.urlopen(urllib.request.Request(url, headers=UA), timeout=20).read()
    except Exception: return None
    name = re.sub(r'[^A-Za-z0-9]+', '_', t['name'])[:50] + '_' + hashlib.md5(url.encode()).hexdigest()[:6] + '.json'
    open(os.path.join(OUT, name), 'wb').write(body)
    return {'name': t['name'], 'file': os.path.join('work', 'themes', name), 'url': url, 'tags': t.get('tags')}
with concurrent.futures.ThreadPoolExecutor(16) as ex: got = [r for r in ex.map(get, listing) if r]
json.dump(got, open(os.path.join(OUT, 'index.json'), 'w'), indent=1)
print(f'{len(got)} of {len(listing)} themes downloaded to work/themes')
