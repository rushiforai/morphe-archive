#!/usr/bin/env python3
"""Check Lurk icon's launcher entries in a decoded patched APK against the decoded stock APK.

    python3 tests/verify_launcher_entries.py <patched apktool dir> <stock apktool dir>

Decode the patched APK with `java -jar tools/apktool_*.jar d -f -s -p "$MORPHE_WORK/apktool-framework" -o <dir>
<patched.apk>`; `bin/decompile <app>` writes the stock one to $MORPHE_WORK/<app>/<version>/apktool. Any app, and
a Clone app build too (the aliases and their target keep their names).

Lurk icon moves the launcher activity's MAIN/LAUNCHER intent filter to two activity-aliases of it, one with
Lurk's icon (enabled) and one with the app's own (disabled), which the App icon choice in Lurk settings
switches between (extensions/shared settings/AppIcon.java). Checks:

- the stock launcher activity keeps its name and every other intent filter, and is no launcher entry any more;
- the two aliases are the only launcher entries: after the activity, exported, without a label (so they show
  the app's), each with the stock launcher filter and the activity's fully qualified name as targetActivity;
  Lurk's enabled, the original disabled;
- the original alias's icon is the stock icon: each stock file of it is in the patched APK unchanged, or as a
  lurk_original_ copy (its XML pointing at copies of the layers, which are checked the same way);
- every icon an alias names exists in the patched resources.
"""
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

A = '{http://schemas.android.com/apk/res/android}'
PREFIX = 'io.github.jordanwoodson.extension.shared.settings.'
LURK, ORIGINAL = PREFIX + 'LurkIcon', PREFIX + 'OriginalIcon'
COPY = 'lurk_original_'
REFERENCE = re.compile(r'^@([a-z]+)/([A-Za-z0-9_.]+)$')


def is_launcher(intent_filter):
    actions = [e.get(A + 'name') for e in intent_filter.findall('action')]
    categories = [e.get(A + 'name') for e in intent_filter.findall('category')]
    return 'android.intent.action.MAIN' in actions and 'android.intent.category.LAUNCHER' in categories


def shape(element):
    """An element as a comparable value: tag, attributes and children, without whitespace."""
    return element.tag, sorted(element.attrib.items()), [shape(child) for child in element]


def qualified(name, package):
    return package + name if name.startswith('.') else name if '.' in name else f'{package}.{name}'


def files(root, reference):
    """The files of a resource reference (`@mipmap/ic_launcher`), by path under res/."""
    match = REFERENCE.match(reference or '')
    assert match, f'not a resource reference: {reference!r}'
    kind, name = match.groups()
    found = {}
    for directory in (root / 'res').iterdir():
        if directory.name == kind or directory.name.startswith(kind + '-'):
            for file in directory.iterdir():
                if file.name.split('.')[0] == name:
                    found[f'{directory.name}/{file.name}'] = file
    return found


def same_icon(patched_root, stock_root, patched_ref, stock_ref, seen=None):
    """Asserts that patched_ref shows what stock_ref shows in the stock APK, down to the adaptive icon's layers."""
    top = seen is None
    seen = set() if top else seen
    if (patched_ref, stock_ref) in seen:
        return
    seen.add((patched_ref, stock_ref))
    stock = files(stock_root, stock_ref)
    patched = files(patched_root, patched_ref)
    # A layer can live only in a density split, which the stock decode of the base APK doesn't have.
    assert stock or not top, f'{stock_ref} has no files in the stock APK'
    for path, stock_file in stock.items():
        directory, name = path.split('/')
        copy = patched.get(f'{directory}/{name}' if patched_ref == stock_ref else f'{directory}/{COPY}{name}')
        assert copy is not None, f'{path}: no copy for {patched_ref}'
        if not name.endswith('.xml'):
            assert copy.read_bytes() == stock_file.read_bytes(), f'{copy} differs from the stock {path}'
            continue
        before, after = ET.parse(stock_file).getroot(), ET.parse(copy).getroot()
        layers = []

        def strip(element, other):
            # A copy's references to copied layers name the copy of the stock layer; the others are the stock's.
            for key, value in list(element.attrib.items()):
                match = REFERENCE.match(value)
                if not match or match.group(1) not in ('drawable', 'mipmap'):
                    continue
                stock_value = value.replace(COPY, '', 1) if match.group(2).startswith(COPY) else value
                element.set(key, stock_value)
                layers.append((value, stock_value))
            for child, other_child in zip(element, other):
                strip(child, other_child)

        strip(after, before)
        assert shape(after) == shape(before), f'{copy} differs from the stock {path} beyond the copied references'
        for patched_layer, stock_layer in layers:
            same_icon(patched_root, stock_root, patched_layer, stock_layer, seen)


def verify(patched_root, stock_root):
    manifest = ET.parse(patched_root / 'AndroidManifest.xml').getroot()
    stock_manifest = ET.parse(stock_root / 'AndroidManifest.xml').getroot()
    app, stock_app = manifest.find('application'), stock_manifest.find('application')
    stock_package = stock_manifest.get('package')

    stock_launchers = [e for e in stock_app if e.tag in ('activity', 'activity-alias')
                       and any(is_launcher(f) for f in e.findall('intent-filter'))]
    assert len(stock_launchers) == 1 and stock_launchers[0].tag == 'activity', 'stock: not one launcher activity'
    stock_activity = stock_launchers[0]
    name = stock_activity.get(A + 'name')
    target = qualified(name, stock_package)
    activities = [e for e in app.findall('activity') if qualified(e.get(A + 'name'), stock_package) == target]
    assert len(activities) == 1, f'{target} is not declared once'
    activity = activities[0]
    assert not any(is_launcher(f) for f in activity.findall('intent-filter')), f'{name} is still a launcher entry'
    kept = [shape(f) for f in stock_activity.findall('intent-filter') if not is_launcher(f)]
    assert [shape(f) for f in activity.findall('intent-filter')] == kept, f'{name} lost or changed a link filter'
    launcher_filters = [shape(f) for f in stock_activity.findall('intent-filter') if is_launcher(f)]

    launchers = [e for e in app if any(is_launcher(f) for f in e.findall('intent-filter'))]
    assert sorted(e.get(A + 'name') for e in launchers) == [LURK, ORIGINAL], \
        f'launcher entries: {[e.get(A + "name") for e in launchers]}'
    children = list(app)
    aliases = {e.get(A + 'name'): e for e in launchers}
    for alias in aliases.values():
        assert alias.tag == 'activity-alias', f'{alias.get(A + "name")} is not an alias'
        assert alias.get(A + 'targetActivity') == target, f'targetActivity {alias.get(A + "targetActivity")}'
        assert alias.get(A + 'exported') == 'true' and alias.get(A + 'label') is None
        assert children.index(alias) > children.index(activity), 'an alias comes before its activity'
        assert [shape(f) for f in alias.findall('intent-filter')] == launcher_filters, 'not the stock launcher filter'
        for attribute in ('icon', 'roundIcon'):
            if alias.get(A + attribute) is not None:
                assert files(patched_root, alias.get(A + attribute)), f'{alias.get(A + attribute)} has no files'
    assert aliases[LURK].get(A + 'enabled') == 'true' and aliases[ORIGINAL].get(A + 'enabled') == 'false'

    owner = stock_activity if stock_activity.get(A + 'icon') else stock_app
    own = aliases[ORIGINAL]
    same_icon(patched_root, stock_root, own.get(A + 'icon'), owner.get(A + 'icon'))
    if owner.get(A + 'roundIcon'):
        same_icon(patched_root, stock_root, own.get(A + 'roundIcon'), owner.get(A + 'roundIcon'))
    else:
        assert own.get(A + 'roundIcon') is None, 'a round icon the stock app has not'
    print(f'PASS launcher entries: {LURK.rsplit(".", 1)[1]} (enabled) and {ORIGINAL.rsplit(".", 1)[1]} '
          f'({own.get(A + "icon")}) for {name}, {len(kept)} link filters kept')


if __name__ == '__main__':
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    verify(Path(sys.argv[1]), Path(sys.argv[2]))
