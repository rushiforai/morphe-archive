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
    'be.persgroep.android.news.mobiledm': ('demorgen', 'news'),
    'be.humo.tvgids': ('humo', 'news'),
    'be.persgroep.android.news.mobilehln': ('hln', 'news'),
    'com.twipemobile.nbmobile': ('nieuwsblad', 'news'),
    'com.twipemobile.dsmobile': ('dsnieuws', 'news'),
    'com.talpa.kijk': ('kijk-android-tv', 'entertainment'),
    'nl.uitzendinggemist': ('npo-start-android-tv', 'entertainment'),
    'nl.tvgids': ('tvgids-nl', 'entertainment'),
    'nl.rtl.videoland.v2': ('videoland-android-tv', 'entertainment'),
    'nl.marktplaats.android': ('marktplaats', 'other'),
    'nl.negentwee': ('9292', 'mobility'),
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


def _app_groups(data):
    groups = {}
    for patch in (data or {}).get('patches', []):
        for package in patch.get('compatiblePackages') or []:
            key = (package['packageName'], package.get('formFactor'))
            groups.setdefault(key, {'package': package, 'patches': []})['patches'].append((patch, package))
    return groups


def _app_profile(group):
    # Compare controls/targets, not bundle versions or descriptive copy. Unchanged
    # apps keep their stable card even when included in a newer dev bundle.
    return sorted(json.dumps({
        'name': patch['name'], 'default': patch.get('default', True),
        'options': patch.get('options') or [],
        'targets': sorted((package.get('targets') or []), key=lambda t: json.dumps(t, sort_keys=True)),
    }, sort_keys=True) for patch, package in group['patches'])


def _app_versions(group, dutch):
    return list(dict.fromkeys(
        str(t['version']) + ((' · experimenteel' if dutch else ' · experimental') if t.get('isExperimental') else '')
        for _, package in group['patches'] for t in package.get('targets') or []))


def _patch_rows(group, dutch):
    rows = ['<ul>']
    for patch, package in group['patches']:
        versions = ', '.join(_app_versions({'patches': [(patch, package)]}, dutch))
        target = versions or ('Geen specifieke versie opgegeven' if dutch else 'No specific version declared')
        off = (' · standaard uit' if dutch else ' · default off') if not patch.get('default', True) else ''
        rows.append(f'<li>{escape(patch["name"])} <span class="dap-app-card__target">{escape(target + off)}</span></li>')
    return rows + ['</ul>']


def render_home_apps(data, language, prerelease=None):
    """List stable and published prerelease apps together, without changing metadata."""
    if language not in {'en', 'nl'}:
        raise ValueError('Supported catalogue languages: en, nl')
    def is_prerelease(metadata):
        return bool(re.match(r'^v?\d+\.\d+\.\d+-', str(metadata['version'])))
    stable = None if is_prerelease(data) else data
    preview = prerelease if prerelease is not None else (data if stable is None else None)
    if preview is not None and not is_prerelease(preview):
        raise ValueError('Expected prerelease metadata with a prerelease bundle version')
    groups = _app_groups(stable)
    for key, group in _app_groups(preview).items():
        if key not in groups:
            groups[key] = dict(group, prerelease_only=True)
        elif _app_profile(groups[key]) != _app_profile(group):
            groups[key]['prerelease'] = group
    dutch = language == 'nl'
    categories = dict(zip(
        ('all', 'weather', 'news', 'mobility', 'entertainment', 'other'),
        ('Alle apps', 'Weer', 'Nieuws en lezen', 'Verkeer', 'Amusement', 'Overige') if dutch else
        ('All apps', 'Weather', 'News and reading', 'Traffic', 'Entertainment', 'Other')))
    text = [
        '<!-- Generated from release metadata; run scripts/generate_docs_catalog.py. -->',
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
    channels = []
    if stable is not None:
        channels.append(('Stabiel' if dutch else 'Stable') + f' <span class="dap-data">{escape(stable["version"])}</span>')
    if preview is not None:
        channels.append(f'Pre-release <span class="dap-data">{escape(preview["version"])}</span>')
    bundle_label = ('Patchbundels' if dutch else 'Patch bundles') if len(channels) > 1 else ('Patchbundel' if dutch else 'Patch bundle')
    text += ['</div>', '</div>',
             f'<p class="dap-catalogue__status"><span data-app-count aria-live="polite" aria-atomic="true">{len(groups)} apps</span> · ' +
             bundle_label + ': ' + ' · '.join(f'<span class="dap-catalogue__channel">{channel}</span>' for channel in channels) +
             '</p>', '<div class="dap-app-grid" markdown>']
    for group in sorted(groups.values(), key=lambda g: g['package']['name'].casefold()):
        package = group['package']
        slug, category = APP_PAGES.get(package['packageName'], (None, 'other'))
        name = package['name']
        if package.get('formFactor') not in (None, 'MOBILE') and not name.endswith('Android TV'):
            name += f' ({package["formFactor"]})'
        only_preview = group.get('prerelease_only', False)
        extra = group.get('prerelease')
        has_preview = only_preview or extra is not None
        anchor = re.sub(r'[^\w\- ]', '', package['name'].lower()).replace(' ', '-')
        destination = f'apps/{slug}.md' if slug else f'reference/catalogue.md#{anchor}'
        if not slug and only_preview:
            destination = f'https://github.com/johnneerdael/dutch-applications-patches/blob/dev/docs/site/{language}/reference/catalogue.md#{anchor}'
        versions = _app_versions(group, dutch)
        extra_versions = [v for v in _app_versions(extra, dutch) if v not in versions] if extra else []
        all_patches = group['patches'] + (extra['patches'] if extra else [])
        search = ' '.join([name, package['packageName'], *versions, *extra_versions,
                           'pre-release prerelease' if has_preview else '',
                           *(patch['name'] for patch, _ in all_patches)]).lower()
        channel = 'prerelease' if only_preview else ('stable prerelease' if extra else 'stable')
        badge = ''
        if has_preview:
            label = 'Pre-release'
            badge = f'<span class="dap-app-card__badge">{label}</span>'
        text += [f'<article class="dap-app-card" data-category="{category}" data-channel="{channel}" data-search="{escape(search, quote=True)}" markdown>',
                 f'<div class="dap-app-card__meta"><p class="dap-app-card__category">{categories[category]}</p>{badge}</div>', '',
                 f'### [{escape(name)}]({destination})', '',
                 '<p class="dap-app-card__version">' + ('App-versies' if dutch else 'App versions') +
                 ': <span class="dap-data">' + escape(', '.join(versions) or ('Niet opgegeven' if dutch else 'Not specified')) + '</span></p>']
        if extra_versions:
            text.append('<p class="dap-app-card__version">Pre-release: <span class="dap-data">' + escape(', '.join(extra_versions)) + '</span></p>')
        text += [f'<p class="dap-app-card__package">{escape(package["packageName"])}</p>',
                 '<details class="dap-app-card__patches">']
        if extra:
            summary = f'{len(group["patches"])} {"stabiel" if dutch else "stable"} · {len(extra["patches"])} pre-release patches'
        elif only_preview:
            summary = f'{len(group["patches"])} pre-release patches'
        else:
            summary = f'{len(group["patches"])} {"patch" if len(group["patches"]) == 1 else "patches"}'
        text.append(f'<summary>{summary}</summary>')
        if extra:
            text.append('<p class="dap-app-card__channel">' + ('Stabiel' if dutch else 'Stable') + '</p>')
        text += _patch_rows(group, dutch)
        if extra:
            text.append('<p class="dap-app-card__channel">Pre-release</p>')
            text += _patch_rows(extra, dutch)
        text += ['</details>', '',
                 f'[{"Uitleg en downloads" if dutch else "Guide and downloads"}]({destination}){{ .dap-app-card__link }}',
                 '', '</article>', '']
    details_label = ('Stabiele patchcatalogus' if dutch else 'Stable patch catalogue') if stable is not None else ('Pre-release patchcatalogus' if dutch else 'Pre-release patch catalogue')
    text += ['</div>', '<p class="dap-catalogue__empty" hidden>' +
             ('Geen apps gevonden. Pas je zoekopdracht of filter aan.' if dutch else 'No matching apps. Change your search or category filter.') + '</p>',
             '', ('Versies kunnen per patch verschillen. ' if dutch else 'Versions may differ by patch. ') +
             f'[{details_label}](reference/catalogue.md).',
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
    parser.add_argument('--prerelease-metadata', type=Path,
                        help='Published prerelease patches-list.json to include on homepages only')
    args = parser.parse_args()
    data = json.loads((ROOT / 'patches-list.json').read_text())
    prerelease = json.loads(args.prerelease_metadata.read_text()) if args.prerelease_metadata else None
    stale = []
    for lang in ('nl', 'en'):
        home = ROOT / 'docs/site' / lang / 'index.md'
        home_text, count = re.subn(
            r'(?s)(<!-- HOME_APPS_START -->\n).*?(<!-- HOME_APPS_END -->)',
            lambda m: m[1] + render_home_apps(data, lang, prerelease=prerelease) + '\n' + m[2], home.read_text())
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
