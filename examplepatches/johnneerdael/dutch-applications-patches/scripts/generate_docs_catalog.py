#!/usr/bin/env python3
"""Render both site catalogues from current release metadata, without changing it."""
import argparse
from html import escape
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]

# Editorial destinations only; app names, versions and patches come from metadata.
APP_PAGES = {
    'org.yoki.android.buienalarm': ('buienalarm', 'weather'),
    'com.supportware.Buienradar': ('buienradar', 'weather'),
    'com.xs2theworld.weeronline': ('weeronline', 'weather'),
    'nl.weerplaza.app': ('weerplaza', 'weather'),
    'nl.flitsmeister': ('flitsmeister', 'mobility'),
    'nl.dumpert': ('dumpert', 'entertainment'),
    'nl.ftm.ftmpulse': ('ftm', 'news'),
    'com.twipemobile.nrc': ('nrc', 'news'),
    'nl.sanomamedia.android.nu': ('nunl', 'news'),
    'nl.rtl.rtlnieuws': ('rtl-nieuws', 'news'),
    'nl.omroepbrabant.android': ('omroep-brabant', 'news'),
    'nl.vi': ('voetbal-international', 'news'),
    'com.eoffice.android': ('nos-teletekst', 'news'),
    **{f'be.persgroep.android.news.mobile{suffix}': (slug, 'news')
       for suffix, slug in [('ad', 'ad'), ('pa', 'parool'), ('tr', 'trouw'), ('vk', 'volkskrant')]},
}


def render_home_apps(data, language):
    """Render a progressively enhanced catalogue, usable without JavaScript."""
    if language not in {'en', 'nl'}:
        raise ValueError('Supported catalogue languages: en, nl')
    dutch = language == 'nl'
    categories = dict(zip(
        ('all', 'weather', 'news', 'mobility', 'entertainment', 'other'),
        ('Alle apps', 'Weer', 'Nieuws en lezen', 'Verkeer', 'Amusement', 'Overige') if dutch else
        ('All apps', 'Weather', 'News and reading', 'Traffic', 'Entertainment', 'Other')))
    groups = {}
    for patch in data['patches']:
        for package in patch.get('compatiblePackages') or []:
            key = (package['packageName'], package.get('formFactor'))
            groups.setdefault(key, {'package': package, 'patches': []})['patches'].append((patch, package))
    text = [
        '<!-- Generated from patches-list.json; run scripts/generate_docs_catalog.py. -->',
        '<div class="dap-catalogue" markdown>',
        '## Ondersteunde apps' if dutch else '## Supported apps', '',
        '<div class="dap-catalogue__tools" hidden>',
        '<label for="dap-app-search">' + ('Zoek een app, versie of patch' if dutch else 'Find an app, version or patch') + '</label>',
        '<input id="dap-app-search" type="search" autocomplete="off" placeholder="' +
        ('Bijvoorbeeld: Buienalarm' if dutch else 'For example: Buienalarm') + '">',
        '<div class="dap-filters" role="group" aria-label="' + ('Appcategorieën' if dutch else 'App categories') + '">',
    ]
    used = {APP_PAGES.get(g['package']['packageName'], (None, 'other'))[1] for g in groups.values()}
    for key, label in categories.items():
        if key == 'all' or key in used:
            text.append(f'<button type="button" data-category="{key}" aria-pressed="{"true" if key == "all" else "false"}">{label}</button>')
    text += ['</div>', '</div>',
             f'<p class="dap-catalogue__status"><span data-app-count aria-live="polite" aria-atomic="true">{len(groups)} apps</span> · '
             f'{"Patchbundel" if dutch else "Patch bundle"} <span class="dap-data">{escape(data["version"])}</span></p>',
             '<div class="dap-app-grid" markdown>']
    for group in sorted(groups.values(), key=lambda g: g['package']['name'].casefold()):
        package = group['package']
        slug, category = APP_PAGES.get(package['packageName'], (None, 'other'))
        name = package['name']
        if package.get('formFactor') not in (None, 'MOBILE'):
            name += f' ({package["formFactor"]})'
        anchor = re.sub(r'[^\w\- ]', '', package['name'].lower()).replace(' ', '-')
        destination = f'apps/{slug}.md' if slug else f'reference/catalogue.md#{anchor}'
        versions = list(dict.fromkeys(
            str(t['version']) + ((' · experimenteel' if dutch else ' · experimental') if t.get('isExperimental') else '')
            for _, p in group['patches'] for t in p.get('targets') or []))
        search = ' '.join([name, package['packageName'], *versions,
                           *(p['name'] for p, _ in group['patches'])]).lower()
        text += [f'<article class="dap-app-card" data-category="{category}" data-search="{escape(search, quote=True)}" markdown>',
                 f'<p class="dap-app-card__category">{categories[category]}</p>', '',
                 f'### [{escape(name)}]({destination})', '',
                 '<p class="dap-app-card__version">' + ('App-versies' if dutch else 'App versions') +
                 ': <span class="dap-data">' + escape(', '.join(versions) or ('Niet opgegeven' if dutch else 'Not specified')) + '</span></p>',
                 f'<p class="dap-app-card__package">{escape(package["packageName"])}</p>',
                 '<details class="dap-app-card__patches">',
                 f'<summary>{len(group["patches"])} {"patch" if len(group["patches"]) == 1 else "patches"}</summary>', '<ul>']
        for patch, own_package in group['patches']:
            targets = ', '.join(str(t['version']) +
                                ((' · experimenteel' if dutch else ' · experimental') if t.get('isExperimental') else '')
                                for t in own_package.get('targets') or [])
            target_label = targets or ('Geen specifieke versie opgegeven' if dutch else 'No specific version declared')
            off = (' · standaard uit' if dutch else ' · default off') if not patch.get('default', True) else ''
            text.append(f'<li>{escape(patch["name"])} <span class="dap-app-card__target">{escape(target_label + off)}</span></li>')
        text += ['</ul>', '</details>', '',
                 f'[{"Uitleg en downloads" if dutch else "Guide and downloads"}]({destination}){{ .dap-app-card__link }}',
                 '', '</article>', '']
    text += ['</div>', '<p class="dap-catalogue__empty" hidden>' +
             ('Geen apps gevonden. Pas je zoekopdracht of filter aan.' if dutch else 'No matching apps. Change your search or category filter.') + '</p>',
             '', ('Versies kunnen per patch verschillen. ' if dutch else 'Versions may differ by patch. ') +
             ('[Bekijk alle patchdetails](reference/catalogue.md).' if dutch else '[View all patch details](reference/catalogue.md).'),
             '', '</div>']
    return '\n'.join(text)


def render(data, language):
    if language not in {'en', 'nl'}:
        raise ValueError('Supported catalogue languages: en, nl')
    dutch = language == 'nl'
    title = 'Patchcatalogus' if dutch else 'Patch catalogue'
    bundle_label = 'Patchbundel' if dutch else 'Patch bundle'
    text = [f'# {title}', '', f'**{bundle_label}: {data["version"]}**', '']
    text += ([
        'Controleer per patch welke app-versies worden ondersteund en of de patch standaard aanstaat. Patches voor dezelfde app kunnen verschillende versies ondersteunen.',
        '', 'De Engelse beschrijvingen komen ongewijzigd uit het gepubliceerde `patches-list.json`. Op [de app-pagina’s](../apps/index.md) lees je in het Nederlands wat elke patch verandert en welke gegevens de app nog kan versturen.',
    ] if dutch else [
        'Check which app versions each patch supports and whether it is on by default. Patches for the same app can support different versions.',
        '', 'The descriptions match the published text in `patches-list.json`. [App pages](../apps/index.md) explain what each patch changes and what data the app can still send.',
    ])
    groups = {}
    for patch in data['patches']:
        for package in patch.get('compatiblePackages') or [None]:
            key = (package['packageName'], package.get('formFactor')) if package else (None, None)
            groups.setdefault(key, {'package': package, 'patches': []})['patches'].append((patch, package))
    for group in sorted(groups.values(), key=lambda g: g['package']['name'].casefold() if g['package'] else ''):
        package = group['package']
        text += ['', '## ' + (package['name'] if package else ('Universele patches' if dutch else 'Universal patches')), '']
        if package:
            text += [f'`{package["packageName"]}`', '']
        for patch, own_package in group['patches']:
            enabled = patch.get('default', True)
            state = ('Aan' if enabled else 'Uit') if dutch else ('On' if enabled else 'Off')
            text += [f'### {patch["name"]}', '', f'**{"Standaard" if dutch else "Default"}: {state}**', '',
                     patch['description'], '']
            if own_package:
                text += [('| App-versie | Build per architectuur | Min. SDK | Status |' if dutch else '| App version | Build by architecture | Min. SDK | Status |'),
                         '| --- | --- | --- | --- |']
                for target in own_package.get('targets', []):
                    codes = ', '.join(f'`{abi}`: {code}' for abi, code in sorted((target.get('versionCodes') or {}).items())) or '—'
                    status = ('Experimenteel' if dutch else 'Experimental') if target.get('isExperimental') else ('Ondersteund' if dutch else 'Supported')
                    text.append(f'| {target["version"]} | {codes} | {target.get("minSdk", "—")} | {status} |')
                if not own_package.get('targets'):
                    text += ['', 'Geen specifieke versiedoelen opgegeven.' if dutch else 'No specific version targets declared.']
            else:
                text += ['Geen specifieke pakketbeperking opgegeven.' if dutch else 'No specific package restriction declared.']
            if patch.get('options'):
                text += ['', 'Opties uit bronmetadata:' if dutch else 'Options from source metadata:', '',
                         '```json', json.dumps(patch['options'], indent=2, ensure_ascii=False), '```']
    text += ['', '[Metadata](https://github.com/johnneerdael/dutch-applications-patches/blob/main/patches-list.json) · '
             '[Releases](https://github.com/johnneerdael/dutch-applications-patches/releases)', '']
    return '\n'.join(text)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='Fail if committed catalogues differ from metadata')
    args = parser.parse_args()
    data = json.loads((ROOT / 'patches-list.json').read_text())
    stale = []
    for lang in ('nl', 'en'):
        home = ROOT / 'docs/site' / lang / 'index.md'
        home_text, count = re.subn(
            r'(?s)(<!-- HOME_APPS_START -->\n).*?(<!-- HOME_APPS_END -->)',
            lambda m: m[1] + render_home_apps(data, lang) + '\n' + m[2], home.read_text())
        if count != 1:
            raise ValueError(f'Expected one homepage app catalogue marker in {home}')
        for target, expected in [(ROOT / 'docs/site' / lang / 'reference/catalogue.md', render(data, lang)),
                                 (home, home_text)]:
            if args.check:
                if not target.exists() or target.read_text() != expected:
                    stale.append(str(target.relative_to(ROOT)))
            else:
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_text(expected)
    if stale:
        parser.exit(1, 'Regenerate site catalogue: ' + ', '.join(stale) + '\n')


if __name__ == '__main__':
    main()
