"""Check embedded APK identity and every existing manifest node with the Android SDK."""
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import zipfile

root = Path(__file__).resolve().parents[1]
aapt = Path(os.environ['LOCALAPPDATA']) / 'Android/Sdk/build-tools/36.0.0/aapt2.exe'
def tree(apk):
    lines = subprocess.check_output([str(aapt), 'dump', 'xmltree', '--file', 'AndroidManifest.xml', str(apk)], text=True)
    nodes, stack = [], []
    for line in lines.splitlines():
        indent = len(line) - len(line.lstrip())
        value = line.strip()
        if value.startswith('E: '):
            while stack and stack[-1][0] >= indent: stack.pop()
            node = {'tag': re.sub(r' \(line=\d+\)$', '', value[3:]), 'attrs': [], 'children': []}
            (stack[-1][1]['children'] if stack else nodes).append(node)
            stack.append((indent, node))
        elif value.startswith('A: '): stack[-1][1]['attrs'].append(value[3:])
    return nodes

apk = root / 'dist/waze-5.24.5.0-themes-moods-badges-arm64.apk'
bundle = root / 'dist/waze-theme-selector-1.7.5.mpp'
companion = (root / 'dist/waze-aa-installer-1.0.0.apk').read_bytes()
assert hashlib.sha256(companion).hexdigest() == 'e5d442454418efd4ff438b3ed3f6bfa5a3aee78f52616625cb25ce0ec8855b48'
with zipfile.ZipFile(apk) as z:
    assert z.read('assets/morphe/installer/waze-aa-installer.apk') == companion
with zipfile.ZipFile(bundle) as z:
    assert z.read('installer/waze-aa-installer.apk') == companion
fixture = root / 'build/companion-check/input.apk'
with zipfile.ZipFile(fixture, 'w') as z:
    z.write(root / 'build/companion-check/input.bin', 'AndroidManifest.xml')
before, after = tree(fixture), tree(apk)
expected = {
    ('uses-permission', 'android.permission.REQUEST_INSTALL_PACKAGES'),
    ('package', 'local.waze.aainstaller'),
    ('activity', 'local.wazemaps.themes.CompanionSetupActivity'),
    ('provider', 'local.wazemaps.themes.CompanionApkProvider'),
}
removed = []
def normalise(nodes, prune=False):
    kept = []
    for node in nodes:
        name = next((a.split('="', 1)[1].split('"', 1)[0] for a in node['attrs'] if ':name(0x01010003)="' in a), '')
        key = (node['tag'], name)
        if prune and key in expected:
            if node['tag'] in ('provider', 'activity'):
                assert any(':exported(0x01010010)=false' in a for a in node['attrs'])
            removed.append(key)
            continue
        node['attrs'] = sorted(a for a in node['attrs'] if ':versionCode(0x0101021b)=' not in a)
        node['children'] = normalise(node['children'], prune)
        kept.append(node)
    return kept
assert normalise(before) == normalise(after, True), 'Existing manifest changed beyond the refresh version and companion additions'
assert set(removed) == expected and len(removed) == 4, removed
assert (root / 'build/companion-check/desktop.bin').read_bytes() == (root / 'build/companion-check/android.bin').read_bytes()
report = dict(embedded_apk_matches=True, existing_manifest_preserved=True,
              private_components=True, android_manager_runtime_manifest_check=True,
              desktop_android_manifest_bytes_identical=True, phone_first_launch_flow_tested=False,
              mpp_sha256=hashlib.sha256(bundle.read_bytes()).hexdigest())
(root / 'dist/validation-companion-bundle.json').write_text(json.dumps(report, indent=2))
print('PASS: embedded installer hashes, private components, every original manifest entry, and Android/desktop manifest parity.')
