#!/usr/bin/env python3
"""Compare decoded original/output bytecode and original split native libraries."""
import io
from pathlib import Path
import re
import sys
import zipfile

original, patched, apkm, apk = map(Path, sys.argv[1:])


def classes(root):
    return {p.relative_to(root).parts[1:]: p for p in root.glob('smali*/**/*.smali')}


def normalized(path):
    lines = []
    for line in path.read_text().splitlines():
        line = line.strip()
        if not line or re.match(r'(\.line |\.source |#)', line):
            continue
        # Dex writers omit explicit default static values; this is semantically equivalent.
        if line.startswith('.field '):
            line = re.sub(r' = (null|false|0x0)$', '', line)
        lines.append(line)
    return '\n'.join(lines)


a, b = classes(original), classes(patched)
assert not a.keys() - b.keys(), 'Original classes were removed'
added = b.keys() - a.keys()
assert added and all('/'.join(key).startswith('nl/nlziet/pip/') for key in added)
changed = {'/'.join(key) for key in a if normalized(a[key]) != normalized(b[key])}
assert changed == {
    'nl/nlziet/mobile/app/di/mobile/InjectActivity.smali',
    'nl/nlziet/mobile/presentation/ui/player/PlayerFragment.smali',
}, changed
fragment = ('nl', 'nlziet', 'mobile', 'presentation', 'ui', 'player', 'PlayerFragment.smali')
methods = lambda text: dict(re.findall(r'(\.method[^\n]+)\n(.*?)\.end method', text, re.S))
old, new = methods(normalized(a[fragment])), methods(normalized(b[fragment]))
assert old.keys() == new.keys()
assert [name for name in old if old[name] != new[name]] == ['.method public final onPause()V']
old_pause = old['.method public final onPause()V']
expected_pause = old_pause.replace(
    'invoke-virtual {v0}, Lcom/bitmovin/player/PlayerView;->onPause()V',
    'invoke-static {v0}, Lnl/nlziet/pip/NativePip;->onPlayerPause(Ljava/lang/Object;)V',
)
assert new['.method public final onPause()V'] == expected_pause
libraries = {}
with zipfile.ZipFile(apkm) as archive:
    for name in archive.namelist():
        if name.endswith('.apk'):
            with zipfile.ZipFile(io.BytesIO(archive.read(name))) as split:
                for entry in split.namelist():
                    if entry.startswith('lib/') and not entry.endswith('/'):
                        libraries[entry] = split.read(entry)
with zipfile.ZipFile(apk) as output:
    assert set(libraries) == {n for n in output.namelist() if n.startswith('lib/') and not n.endswith('/')}
    for name, data in libraries.items():
        assert output.read(name) == data, name
print(f'Preserved {len(a)} original classes; only activity hooks and one fragment invoke changed; added {len(added)} extension classes.')
print(f'All {len(libraries)} native libraries byte-identical; original pause timers, stop, unload, destroy and authentication/DRM bytecode retained.')
