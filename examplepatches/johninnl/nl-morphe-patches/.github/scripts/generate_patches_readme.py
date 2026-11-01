#!/usr/bin/env python3
"""Render one compact README catalogue from the production patch metadata."""
import argparse
import json
from pathlib import Path
import re
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / 'scripts'))
from generate_docs_catalog import _app_groups, _app_versions, app_page, bundle_label

CATEGORIES = {
    'weather': 'Weather', 'news': 'News and reading', 'mobility': 'Traffic and navigation',
    'entertainment': 'Entertainment', 'other': 'Other apps',
}


def render(data, repository):
    groups = _app_groups(data)
    total = sum(len(group['patches']) for group in groups.values())
    bundle_label(data, False)  # Require a production version, or the initial snapshot.
    version = str(data['version']).lstrip('v')
    if version == '0.0.0':
        status = '**Unreleased source snapshot**'
    else:
        status = f'**Patch bundle [v{version}](https://github.com/{repository}/releases/tag/v{version})**'
    lines = [f'{status} · {len(groups)} apps · {total} patches']
    site = 'https://johninnl.github.io/nl-morphe-patches'
    for category, title in CATEGORIES.items():
        entries = [group for group in groups.values() if app_page(group['package'])[1] == category]
        if not entries:
            continue
        lines += ['', f'### {title}', '', '| App | Changes | Target app versions | Input | Patches |',
                  '| --- | --- | --- | --- | --- |']
        for group in sorted(entries, key=lambda g: g['package']['name'].casefold()):
            package = group['package']
            slug, _ = app_page(package)
            link = f'{site}/apps/{slug}/' if slug else f'{site}/reference/catalogue/#{package["name"].lower()}'
            versions = sorted(set(_app_versions(group, False)))
            formats = ', '.join(sorted({own.get('apkFileType', '—') for _, own in group['patches']}))
            names = {patch['name'] for patch, _ in group['patches']}
            changes = [label for label, present in [
                ('Ads', 'Hide ads' in names),
                ('Tracking', any('tracking' in name.lower() for name in names)),
                ('Prompts', any(name in names for name in ('Skip consent screens', 'Hide Premium banner', 'Hide Pro notices', 'Hide native promotions'))),
                ('Articles', any(name.startswith('Read full articles') for name in names)),
                ('Plus/Pro', any(name.startswith('Unlock ') for name in names)),
                ('Compatibility', any(name.startswith('Fix ') for name in names)),
                ('Partner services', 'Disable partner services' in names),
                ('Newspaper tab', 'Hide newspaper tab' in names),
                ('Navigation', 'Hide newspaper navigation' in names),
                ('Home audio', 'YT Music Morphe in Waze' in names),
            ] if present]
            lines.append(f'| [{package["name"]}]({link}) | {" · ".join(changes) or "See guide"} | {", ".join(versions)} | {formats} | {len(group["patches"])} |')
    lines += ['', f'[Patch defaults and supported versions]({site}/reference/catalogue/) · '
              f'[English]({site}/en/reference/catalogue/)', '',
              'Targets and defaults vary by patch; the bundle version is separate from each app version.']
    return '\n'.join(lines)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('repository', help='GitHub owner/repository')
    parser.add_argument('metadata', type=Path, nargs='?', default=Path('patches-list.json'))
    parser.add_argument('readme', type=Path, nargs='?', default=Path('README.md'))
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+', args.repository):
        parser.error('repository must use owner/repository format')
    data = json.loads(args.metadata.read_text())
    readme = args.readme.read_text()
    pattern = r'(?s)(<!-- PATCHES_START(?: SUMMARY)? -->\n).*?(<!-- PATCHES_END -->)'
    updated, count = re.subn(pattern, lambda match: match[1] + render(data, args.repository) + '\n' + match[2], readme)
    if count != 1:
        parser.error('README must contain exactly one PATCHES_START / PATCHES_END block')
    args.readme.write_text(updated)
    print(f'Updated {args.readme} from {args.metadata}')


if __name__ == '__main__':
    main()
