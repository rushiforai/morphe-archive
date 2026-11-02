#!/usr/bin/env python3
"""Check concise bilingual app pages against patch metadata and original inputs.

Validate supported targets, patch names/defaults and download consistency. Public
pages describe user-visible effects; implementation and measurement reports do
not belong in the guide. No historical release is required for a source snapshot.
"""
import argparse
import json
from pathlib import Path
import re
import sys

from generate_docs_catalog import APP_PAGES, app_page

ROOT = Path(__file__).resolve().parents[1]
SITE = ROOT / 'docs/site'
LANG = {
    'en': {
        'meta': r'\*\*App version:\*\* (?P<version>\S+) · \*\*Build:\*\* (?P<build>\d+) · \*\*Original file:\*\* (?P<input>XAPK|APKS|APKM|APK)',
        'table': '| Patch | Default | What it does |',
        'states': {'On': True, 'Off': False},
    },
    'nl': {
        'meta': r'\*\*Appversie:\*\* (?P<version>\S+) · \*\*Build:\*\* (?P<build>\d+) · \*\*Origineel bestand:\*\* (?P<input>XAPK|APKS|APKM|APK)',
        'table': '| Patch | Standaard | Wat verandert er? |',
        'states': {'Aan': True, 'Uit': False},
    },
}
DOWNLOAD_ROW = re.compile(r'^\| \[[^\]]+\]\(\.\./apps/(?P<slug>[a-z0-9-]+)\.md\) \| (?P<version>\S+) / (?P<build>\d+) \| (?P<download>.+) \|$')
BUTTON = re.compile(r'\[[^\]]+\]\((?P<url>https://buzzheavier\.com/[a-z0-9]{12}|https://www\.apkmirror\.com/apk/[a-z0-9/_-]+/|\.\./guides/downloads\.md#local-original-inputs)\)(?:\{ \.md-button(?: \.md-button--primary)? \})?')
INTERNAL_DETAILS = re.compile(r'(?i)\b(?:smali|bytecode|opcode|method fingerprint|register allocation|payload dump|decompil(?:ed|ation)|packet capture|Frida|DEX|callback hook|runtime trace)\b|/patches/src/|/tests/|docs/privacy/|```')


def load_apps(paths):
    apps = {}
    for path in paths:
        for patch in json.loads(path.read_text())['patches']:
            for package in patch.get('compatiblePackages') or []:
                slug, _ = app_page(package)
                if slug is None:
                    if package['packageName'] in APP_PAGES and APP_PAGES[package['packageName']][0] is None:
                        continue  # Explicit catalogue-only add-ons have no full-app guide.
                    raise ValueError(f'No app page mapping for {package["packageName"]} ({package.get("formFactor")})')
                entry = apps.setdefault(slug, {}).setdefault(path, {
                    'targets': {}, 'package': package['packageName']})
                for target in package.get('targets', []):
                    # Some targets specify a version without restricting its build code.
                    for code in (target.get('versionCodes') or {}).values() or [None]:
                        key = (target['version'], str(code) if code is not None else None)
                        own = entry['targets'].setdefault(key, {'input': package.get('apkFileType'), 'controls': {}})
                        own['controls'][patch['name']] = patch.get('default', True)
    return apps


def downloads(lang):
    rows = {}
    for line in (SITE / lang / 'guides/downloads.md').read_text().splitlines():
        match = DOWNLOAD_ROW.match(line)
        if match:
            url = re.search(r'\]\(([^)]+)\)', match['download'])
            destination = url[1] if url else '../guides/downloads.md#local-original-inputs'
            if destination == '#local-original-inputs':
                destination = '../guides/downloads.md#local-original-inputs'
            rows[match['slug']] = {'url': destination, 'version': match['version'], 'build': match['build']}
    return rows


def check_page(path, lang, apps, download_rows):
    errors = []
    text = path.read_text()
    rules = LANG[lang]
    meta = re.search('^' + rules['meta'] + '$', text, flags=re.M)
    if not meta:
        return ['missing app version, build and original-file metadata']
    matches = []
    for entry in apps.get(path.stem, {}).values():
        targets = [target for (version, build), target in entry['targets'].items()
                   if version in (None, meta['version']) and build in (None, meta['build'])]
        if targets:
            # Include Any-version add-ons alongside controls for the page's version.
            matches.append({'input': targets[0]['input'], 'controls': {
                name: default for target in targets for name, default in target['controls'].items()}})
    if not matches:
        return [f'version {meta["version"]} build {meta["build"]} is not a metadata target']
    if not text.startswith('# ') or '\n## Patches\n' not in text or rules['table'] not in text:
        errors.append('page needs a title and user-facing patch table')
    listed = {}
    for match in re.finditer(r'^\| \*\*([^*]+)\*\* \| ([^|]+) \| ([^|]+) \|$', text, flags=re.M):
        name, state, effect = match.groups()
        if state.strip() not in rules['states']:
            errors.append(f'invalid default for {name}: {state}')
        elif name in listed:
            errors.append(f'duplicate patch: {name}')
        else:
            listed[name] = rules['states'][state.strip()]
        if not effect.strip():
            errors.append(f'missing user-facing effect for {name}')
    if not any(entry['controls'] == listed for entry in matches):
        errors.append('patch names/defaults differ from metadata: ' + repr(listed))
    if not any(entry['input'] == meta['input'] for entry in matches):
        errors.append('original file type differs from metadata')
    button = BUTTON.search(text)
    if not button:
        errors.append('missing original-file button')
    else:
        row = download_rows.get(path.stem)
        if row is None or row['url'] != button['url']:
            errors.append('original-file button does not match downloads guide row')
        elif (row['version'], row['build']) != (meta['version'], meta['build']):
            errors.append('target differs from downloads guide row')
    internal = INTERNAL_DETAILS.search(text)
    if internal:
        errors.append(f'implementation/measurement detail belongs outside the user guide: {internal[0]}')
    return errors


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--metadata', type=Path, default=ROOT / 'patches-list.json', help='patch metadata (default: checkout patches-list.json)')
    args = parser.parse_args()
    apps = load_apps([args.metadata])
    failures = []
    count = 0
    for lang in LANG:
        rows = downloads(lang)
        pages = {path.stem: path for path in (SITE / lang / 'apps').glob('*.md') if path.stem not in {'index', 'research'}}
        missing, extra = set(apps) - set(pages), set(pages) - set(apps)
        if missing or extra:
            failures.append(f'{lang}: missing app pages {sorted(missing)}; pages without metadata {sorted(extra)}')
        for slug in sorted(set(pages) & set(apps)):
            count += 1
            failures += [f'{pages[slug].relative_to(ROOT)}: {error}' for error in check_page(pages[slug], lang, apps, rows)]
    if failures:
        parser.exit(1, '\n'.join(failures) + '\n')
    print(f'PASS: {count} concise app pages; target/input/download and patch names/defaults match metadata')


if __name__ == '__main__':
    main()
