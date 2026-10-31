#!/usr/bin/env python3
"""Require every app page to follow the approved app-page template.

The template is the Trouw page; docs/site/_meta/app-page-template.md spells it
out. Each page is checked against patch metadata (version, build, input type,
package and control names) and against the original-file row in the downloads
guide, in both languages.

Pre-release flags are checked too. A page (and its downloads row) must carry the
pre-release marker exactly when its target is missing from the stable metadata.
For a change that lands on main, pass the checkout metadata as stable: the
release that follows publishes it, so a leftover marker blocks the merge.
"""
from pathlib import Path
import argparse
import json
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
SITE = ROOT / 'docs/site'
NOT_APP_PAGES = {'index.md', 'research.md'}

LANG = {
    'en': {
        'meta': r'\*\*Supported app:\*\* (?P<version>\S+) · \*\*Build:\*\* (?P<build>\d+) · \*\*Input:\*\* (?P<input>APKS|APKM|APK)(?: · \*\*Channel:\*\* (?P<channel>Pre-release))?',
        'button': r'\[Download the original (?P<input>APKS|APKM|APK)\]\((?P<url>https://buzzheavier\.com/[a-z0-9]{12})\)\{ \.md-button \.md-button--primary \}',
        'local_button': r'\[Use your own (?P<input>APKS|APKM|APK)\]\((?P<url>\.\./guides/downloads\.md#local-original-inputs)\)\{ \.md-button \}',
        'select': 'Select this file in Morphe Manager to apply the patches.',
        'headings': ['What did we find in the app?', 'What remains and what is still unknown',
                     'Available controls', 'Evidence'],
        'table': '| Activity / service | What our evidence shows | What changes |',
        'links': '[Read what each patch changes](../reference/catalogue.md). See [installation](../guides/install.md) for original files and signing, and [choosing patches](../guides/choose-patches.md) for which patches depend on others.',
        'method': '[How to read the evidence](../reference/methodology.md).',
    },
    'nl': {
        'meta': r'\*\*Ondersteunde app:\*\* (?P<version>\S+) · \*\*Build:\*\* (?P<build>\d+) · \*\*Invoer:\*\* (?P<input>APKS|APKM|APK)(?: · \*\*Kanaal:\*\* (?P<channel>Pre-release))?',
        'button': r'\[Download de originele (?P<input>APKS|APKM|APK)\]\((?P<url>https://buzzheavier\.com/[a-z0-9]{12})\)\{ \.md-button \.md-button--primary \}',
        'local_button': r'\[Gebruik je eigen (?P<input>APKS|APKM|APK)\]\((?P<url>\.\./guides/downloads\.md#local-original-inputs)\)\{ \.md-button \}',
        'select': 'Selecteer dit bestand in Morphe Manager om de patches toe te passen.',
        'headings': ['Wat vonden we in de app?', 'Wat blijft bestaan en wat weten we nog niet?',
                     'Beschikbare opties', 'Bewijs'],
        'table': '| Activiteit / dienst | Wat ons bewijs laat zien | Wat verandert |',
        'links': '[Bekijk wat elke patch aanpast](../reference/catalogue.md). Lees [installeren](../guides/install.md) voor uitleg over originele bestanden en ondertekening, en [patches kiezen](../guides/choose-patches.md) om te zien welke patches elkaar nodig hebben.',
        'method': '[Zo lees je het bewijs](../reference/methodology.md).',
    },
}
# Wording that only belongs on pages for pre-release targets.
PRERELEASE_WORDS = re.compile(r'pre-?release|dev[ -]only|alleen dev|dev(?:elopment)? (?:bundle|build|target|candidate|branch)|ontwikkel(?:versie|doel|kandidaat|bundel|tak)', re.I)
DOWNLOAD_ROW = re.compile(r'^\| \[[^\]]+\]\(\.\./apps/(?P<slug>[a-z0-9-]+)\.md\)<br>(?P<label>[^|]*)\| \[[^\]]+\]\((?P<url>https://buzzheavier\.com/[a-z0-9]{12}|#local-original-inputs)\) \|$')


def load_apps(paths):
    """Map package name to its targets, input type and control names per metadata file."""
    apps = {}
    for path in paths:
        for patch in json.loads(path.read_text())['patches']:
            for package in patch.get('compatiblePackages') or []:
                entry = apps.setdefault(package['packageName'], {}).setdefault(path, {
                    'input': package.get('apkFileType'), 'targets': set(), 'controls': set(),
                    'controls_by_target': {}, 'input_by_target': {}})
                entry['controls'].add(patch['name'])
                for target in package['targets']:
                    for code in (target.get('versionCodes') or {}).values():
                        key = (target['version'], str(code))
                        entry['targets'].add(key)
                        entry['controls_by_target'].setdefault(key, set()).add(patch['name'])
                        entry['input_by_target'].setdefault(key, package.get('apkFileType'))
    return apps


def downloads(lang):
    rows = {}
    for line in (SITE / lang / 'guides/downloads.md').read_text().splitlines():
        match = DOWNLOAD_ROW.match(line)
        if match:
            url = match['url']
            if url == '#local-original-inputs':
                url = '../guides/downloads.md#local-original-inputs'
            rows[match['slug']] = (url, '**Pre-release**' in match['label'])
    return rows


def stable_targets(path):
    if path is None:
        return None
    return {(package, *target) for package, entries in load_apps([path]).items()
            for entry in entries.values() for target in entry['targets']}


def blocks(text):
    return [block.strip() for block in re.split(r'\n\s*\n', text.strip()) if block.strip()]


def check_page(path, lang, apps, download_rows, stable, stable_path):
    rules = LANG[lang]
    errors = []
    text = path.read_text()
    head, *sections = re.split(r'^## ', text, flags=re.M)
    head = blocks(head)

    # Header: title, metadata, package, download button, Manager hint, intro.
    if len(head) < 6 or not head[0].startswith('# '):
        return [f'header needs title, metadata line, package, download button, Manager hint and an introduction (found {len(head)} blocks)']
    meta = re.fullmatch(rules['meta'], head[1])
    package = re.fullmatch(r'`([A-Za-z0-9_.]+)`', head[2])
    button = re.fullmatch(rules['button'], head[3]) or re.fullmatch(rules['local_button'], head[3])
    if not meta:
        errors.append(f'metadata line must match the template, found: {head[1]!r}')
    if not package:
        errors.append(f'package line must be the package name in backticks, found: {head[2]!r}')
    if not button:
        errors.append(f'download button must link the original file or local-original input instructions, found: {head[3]!r}')
    if head[4] != rules['select']:
        errors.append(f'line after the download button must be {rules["select"]!r}')
    if any(block.startswith(('**', '|', '-', '*', '#', '!!!')) for block in head[5:]):
        errors.append('introduction must be plain prose (no tables, lists, notices or bold status lines)')

    if meta and button and meta['input'] != button['input']:
        errors.append('metadata input type and download button disagree')
    row_url, row_prerelease = download_rows.get(path.stem, (None, False))
    if button and row_url != button['url']:
        errors.append(f'download button {button["url"]} does not match the downloads guide row ({row_url})')
    prerelease = None  # unknown without stable metadata
    if meta and package and stable is not None:
        prerelease = (package[1], meta['version'], meta['build']) not in stable
        if prerelease and not meta['channel']:
            errors.append('target is not in the stable bundle: end the metadata line with the pre-release channel marker')
        if not prerelease and meta['channel']:
            errors.append('target is in the stable bundle: remove the pre-release channel marker')
        if not prerelease and PRERELEASE_WORDS.search('\n'.join(head[1:])):
            errors.append(f'target is in the stable bundle, but the header or introduction still calls it pre-release: {PRERELEASE_WORDS.search(chr(10).join(head[1:]))[0]!r}')
        if row_url and prerelease != row_prerelease:
            errors.append(f'downloads guide row must {"" if prerelease else "not "}carry **Pre-release**')

    if package and meta:
        known = apps.get(package[1])
        if not known:
            errors.append(f'package {package[1]} is not in the patch metadata')
        else:
            target = (meta['version'], meta['build'])
            matches = {source: dict(entry,
                       controls=entry.get('controls_by_target', {}).get(target, entry['controls']),
                       input=entry.get('input_by_target', {}).get(target, entry['input']))
                       for source, entry in known.items() if target in entry['targets']}
            # Stable pages describe the stable bundle and pre-release pages the
            # prerelease bundle, even when both bundles share the target.
            if prerelease is False and stable_path in matches:
                matches = {stable_path: matches[stable_path]}
            elif prerelease:
                matches = {source: entry for source, entry in matches.items() if source != stable_path} or matches
            if not matches:
                targets = sorted(t for entry in known.values() for t in entry['targets'])
                errors.append(f'version {meta["version"]} build {meta["build"]} is not a metadata target {targets}')
            else:
                controls = sections_by_title(sections).get(rules['headings'][2])
                listed = blocks(controls)[0].rstrip('.') if controls and blocks(controls) else ''
                names = {name.strip() for name in listed.split(', ')}
                entry = next((entry for entry in matches.values() if entry['controls'] == names), next(iter(matches.values())))
                if entry['input'] and entry['input'] != meta['input']:
                    errors.append(f'input {meta["input"]} differs from metadata {entry["input"]}')
                if controls is not None and names != entry['controls']:
                    errors.append(f'first paragraph of {rules["headings"][2]!r} must list exactly {sorted(entry["controls"])}, found {sorted(names)}')

    # Body: exactly the four template sections, in order, without subsections.
    titles = [re.sub(r'\s*\{#[^}]+\}$', '', section.splitlines()[0]).strip() for section in sections]
    if titles != rules['headings']:
        errors.append(f'sections must be exactly {rules["headings"]}, found {titles}')
    if re.search(r'^#{3,} ', text, flags=re.M):
        errors.append('subsections (### and deeper) are not part of the template')
    if re.search(r'^\s*([-*]|\d+\.) ', text, flags=re.M):
        errors.append('bullet and numbered lists are not part of the template; write prose')
    if re.search(r'^(!!!|\?\?\?)', text, flags=re.M):
        errors.append('admonitions are not part of the template')
    found = sections_by_title(sections)
    finding = found.get(rules['headings'][0])
    if finding is not None and (not blocks(finding) or blocks(finding)[0].splitlines()[0] != rules['table']):
        errors.append(f'{rules["headings"][0]!r} must open with the table header {rules["table"]!r}')
    controls = found.get(rules['headings'][2])
    if controls is not None and (not blocks(controls) or blocks(controls)[-1] != rules['links']):
        errors.append(f'{rules["headings"][2]!r} must end with the standard catalogue/installation links paragraph')
    evidence = found.get(rules['headings'][3])
    if evidence is not None and rules['method'] not in evidence:
        errors.append(f'{rules["headings"][3]!r} must link the methodology page as {rules["method"]!r}')
    return errors


def sections_by_title(sections):
    result = {}
    for section in sections:
        title, _, body = section.partition('\n')
        result[re.sub(r'\s*\{#[^}]+\}$', '', title).strip()] = body
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--metadata', type=Path, action='append',
                        help='patches-list.json files to accept (default: checkout metadata plus build/prerelease-patches-list.json if present)')
    parser.add_argument('--stable-metadata', type=Path,
                        help='metadata that counts as stable for pre-release flags (default: checkout metadata when its version is a stable '
                             'version, otherwise build/stable-patches-list.json if present)')
    args = parser.parse_args()
    checkout = ROOT / 'patches-list.json'
    metadata = args.metadata or [path for path in (checkout, ROOT / 'build/prerelease-patches-list.json') if path.exists()]
    stable_path = args.stable_metadata
    if stable_path is None:
        fallback = ROOT / 'build/stable-patches-list.json'
        if '-' not in json.loads(checkout.read_text())['version']:
            stable_path = checkout
        elif fallback.exists():
            stable_path = fallback
        else:
            print('WARNING: no stable metadata; pre-release flags are not checked', file=sys.stderr)
    if stable_path is not None and stable_path not in metadata:
        metadata.append(stable_path)
    apps = load_apps(metadata)
    stable = stable_targets(stable_path)
    failures = []
    count = 0
    for lang in LANG:
        rows = downloads(lang)
        for path in sorted((SITE / lang / 'apps').glob('*.md')):
            if path.name in NOT_APP_PAGES:
                continue
            count += 1
            failures += [f'{path.relative_to(ROOT)}: {error}' for error in check_page(path, lang, apps, rows, stable, stable_path)]
    if failures:
        print('App pages must follow docs/site/_meta/app-page-template.md:', file=sys.stderr)
        print('\n'.join(failures), file=sys.stderr)
        sys.exit(1)
    print(f'PASS: {count} app pages follow the app-page template')


if __name__ == '__main__':
    main()
