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
    'com.klevico.monet': ('monet', 'other'),
    'com.overdevs.at4k': ('at4k', 'other'),
    'com.spocky.projengmenu': ('projectivy', 'other'),
    'app.wuplay.androidtv': ('wuplay', 'entertainment'),
    'com.waze': ('waze', 'mobility'),
    'app.seb3thehacker.gearslip': ('gearslip', 'mobility'),
    'com.google.android.apps.youtube.music': ('youtube-music', 'entertainment'),
    'app.morphe.android.apps.youtube.music': ('youtube-music', 'entertainment'),
    'app.vela': ('vela', 'mobility'),
    'com.google.android.apps.maps': ('google-maps', 'mobility'),
    'com.podimo': ('podimo', 'entertainment'),
    'com.medium.reader': ('medium', 'news'),
    'nl.bright.pro': ('bright', 'news'),
    'mobi.inthepocket.mediafin.detijd': ('detijd', 'news'),
    'be.persgroep.android.news.mobiledm': ('demorgen', 'news'),
    'be.humo.tvgids': ('humo', 'news'),
    'be.persgroep.android.news.mobilehln': ('hln', 'news'),
    'com.twipemobile.nbmobile': ('nieuwsblad', 'news'),
    'com.twipemobile.dsmobile': ('dsnieuws', 'news'),
    'be.concentra.hbvl.MediaApp': ('hbvl', 'news'),
    'be.concentra.gva.MediaApp': ('gva', 'news'),
    'com.mecom.ed.nl': ('ed', 'news'),
    'com.mecom.tctubantia.nl': ('tubantia', 'news'),
    'com.talpa.kijk': ('kijk-android-tv', 'entertainment'),
    'nl.sbs.kijk': ('kijk', 'entertainment'),
    'nl.uitzendinggemist': ('npo-start-android-tv', 'entertainment'),
    'nl.tvgids': ('tvgids-nl', 'entertainment'),
    'nl.rtl.videoland.v2': ('videoland-android-tv', 'entertainment'),
    'nl.marktplaats.android': ('marktplaats', 'other'),
    'be.tweedehands.m': ('2dehands', 'other'),
    'nl.negentwee': ('9292', 'mobility'),
    'org.yoki.android.buienalarm': ('buienalarm', 'weather'),
    'com.supportware.Buienradar': ('buienradar', 'weather'),
    'com.lucky_apps.RainViewer': ('rainviewer', 'weather'),
    'com.xs2theworld.weeronline': ('weeronline', 'weather'),
    'nl.weerplaza.app': ('weerplaza', 'weather'),
    'nl.flitsmeister': ('flitsmeister', 'mobility'),
    'com.dennisk.rollerbank': ('rollerbank', 'mobility'),
    'nl.dumpert': ('dumpert', 'entertainment'),
    'nl.ftm.ftmpulse': ('ftm', 'news'),
    'com.twipemobile.nrc': ('nrc', 'news'),
    'nl.sanomamedia.android.nu': ('nunl', 'news'),
    'nl.rtl.rtlnieuws': ('rtl-nieuws', 'news'),
    'nl.omroepbrabant.android': ('omroep-brabant', 'news'),
    'nl.omroepwest.android': ('omroep-west', 'news'),
    'nl.vi': ('voetbal-international', 'news'),
    'com.eoffice.android': ('nos-teletekst', 'news'),
    **{f'be.persgroep.android.news.mobile{suffix}': (slug, 'news')
       for suffix, slug in [('ad', 'ad'), ('pa', 'parool'), ('tr', 'trouw'), ('vk', 'volkskrant')]},
}


def app_page(package):
    mobile = {'nl.uitzendinggemist': 'npo-start', 'nl.rtl.videoland.v2': 'videoland'}
    if package.get('formFactor') == 'MOBILE' and package['packageName'] in mobile:
        return mobile[package['packageName']], 'entertainment'
    return APP_PAGES.get(package['packageName'], (None, 'other'))


def _app_groups(data):
    groups = {}
    for patch in (data or {}).get('patches', []):
        for package in patch.get('compatiblePackages') or []:
            # YT Music Morphe is the patched installation, not a second original app.
            if package['packageName'] == 'app.morphe.android.apps.youtube.music':
                continue
            key = (package['packageName'], package.get('formFactor'))
            groups.setdefault(key, {'package': package, 'patches': []})['patches'].append((patch, package))
    return groups


def _app_versions(group, dutch):
    return list(dict.fromkeys(
        str(t['version']) if t.get('version') is not None else ('Alle versies' if dutch else 'Any')
        for _, package in group['patches'] for t in package.get('targets') or []))


def _patch_rows(group, dutch):
    rows = ['<ul>']
    for patch, package in group['patches']:
        versions = ', '.join(_app_versions({'patches': [(patch, package)]}, dutch))
        target = versions or ('Geen specifieke versie opgegeven' if dutch else 'No specific version declared')
        off = (' · standaard uit' if dutch else ' · default off') if not patch.get('default', True) else ''
        rows.append(f'<li>{escape(patch["name"])} <span class="dap-app-card__target">{escape(target + off)}</span></li>')
    return rows + ['</ul>']


def bundle_label(data, dutch):
    version = str(data['version']).lstrip('v')
    if not re.fullmatch(r'\d+\.\d+\.\d+(?:-dev\.\d+)?', version):
        raise ValueError('Bundle version must use major.minor.patch with an optional dev prerelease')
    if version == '0.0.0':
        return 'Bronmomentopname · nog niet uitgebracht' if dutch else 'Source snapshot · unreleased'
    if '-dev.' in version:
        return ('Ontwikkelbundel: ' if dutch else 'Development patch bundle: ') + version
    return ('Patchbundel: ' if dutch else 'Patch bundle: ') + version


def render_home_apps(data, language):
    """List the apps in the single production catalogue without changing metadata."""
    if language not in {'en', 'nl'}:
        raise ValueError('Supported catalogue languages: en, nl')
    groups = _app_groups(data)
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
    used = {app_page(g['package'])[1] for g in groups.values()}
    for key, label in categories.items():
        if key == 'all' or key in used:
            text.append(f'<button type="button" data-category="{key}" aria-pressed="{"true" if key == "all" else "false"}">{label}</button>')
    text += ['</div>', '</div>',
             f'<p class="dap-catalogue__status"><span data-app-count aria-live="polite" aria-atomic="true">{len(groups)} apps</span> · ' +
             escape(bundle_label(data, dutch)) + '</p>', '<div class="dap-app-grid" markdown>']
    for group in sorted(groups.values(), key=lambda g: g['package']['name'].casefold()):
        package = group['package']
        slug, category = app_page(package)
        name = package['name']
        if package.get('formFactor') not in (None, 'MOBILE') and not name.endswith('Android TV'):
            name += f' ({package["formFactor"]})'
        anchor = re.sub(r'[^\w\- ]', '', package['name'].lower()).replace(' ', '-')
        destination = f'apps/{slug}.md' if slug else f'reference/catalogue.md#{anchor}'
        versions = _app_versions(group, dutch)
        search = ' '.join([name, package['packageName'], *versions,
                           *(patch['name'] for patch, _ in group['patches'])]).lower()
        text += [f'<article class="dap-app-card" data-category="{category}" data-search="{escape(search, quote=True)}" markdown>',
                 f'<p class="dap-app-card__category">{categories[category]}</p>', '',
                 f'### [{escape(name)}]({destination})', '',
                 '<p class="dap-app-card__version">' + ('App-versies' if dutch else 'App versions') +
                 ': <span class="dap-data">' + escape(', '.join(versions) or ('Niet opgegeven' if dutch else 'Not specified')) + '</span></p>',
                 f'<p class="dap-app-card__package">{escape(package["packageName"])}</p>',
                 '<details class="dap-app-card__patches">',
                 f'<summary>{len(group["patches"])} {"patch" if len(group["patches"]) == 1 else "patches"}</summary>']
        text += _patch_rows(group, dutch)
        text += ['</details>', '',
                 f'[{"Uitleg en downloads" if dutch else "Guide and downloads"}]({destination}){{ .dap-app-card__link }}',
                 '', '</article>', '']
    details_label = 'Patchcatalogus' if dutch else 'Patch catalogue'
    text += ['</div>', '<p class="dap-catalogue__empty" hidden>' +
             ('Geen apps gevonden. Pas je zoekopdracht of filter aan.' if dutch else 'No matching apps. Change your search or category filter.') + '</p>',
             '', ('Versies kunnen per patch verschillen. ' if dutch else 'Versions may differ by patch. ') +
             f'[{details_label}](reference/catalogue.md).', '', '</div>']
    return '\n'.join(text)


def render(data, language):
    """Render compatibility and defaults without publishing implementation descriptions."""
    if language not in {'en', 'nl'}:
        raise ValueError('Supported catalogue languages: en, nl')
    dutch = language == 'nl'
    title = 'Patchcatalogus' if dutch else 'Patch catalogue'
    label = bundle_label(data, dutch)
    text = [f'# {title}', '', f'**{label}**', '',
            ('Controleer per patch de ondersteunde app-versies en de standaardinstelling. '
             'De app-pagina legt uit wat de patch voor het gebruik verandert.' if dutch else
             'Check the supported app versions and default setting for each patch. '
             'The app page explains what each patch changes when using the app.')]
    for group in sorted(_app_groups(data).values(), key=lambda g: g['package']['name'].casefold()):
        package = group['package']
        slug, _ = app_page(package)
        text += ['', '## ' + package['name'], '']
        if slug:
            text += [f'[{"Wat veranderen de patches?" if dutch else "What do the patches change?"}](../apps/{slug}.md)', '']
        text += [f'`{package["packageName"]}`', '',
                 '| Patch | ' + ('Standaard | App-versies |' if dutch else 'Default | App versions |'),
                 '| --- | --- | --- |']
        for patch, own_package in group['patches']:
            enabled = patch.get('default', True)
            state = ('Aan' if enabled else 'Uit') if dutch else ('On' if enabled else 'Off')
            versions = ', '.join(_app_versions({'patches': [(patch, own_package)]}, dutch)) or \
                       ('Niet opgegeven' if dutch else 'Not specified')
            text.append(f'| {patch["name"]} | {state} | {versions} |')
    text += ['', '[Releases](https://github.com/johninnl/nl-morphe-patches/releases)', '']
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
