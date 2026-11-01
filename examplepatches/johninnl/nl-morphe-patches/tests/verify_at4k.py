"""Compare AT4K's decoded original and output; allow only the premium startup write."""
import argparse
from pathlib import Path
import re
import zipfile
import xml.etree.ElementTree as ET

from verify_targets import classes

ACTIVITY = 'Lcom/overdevs/at4k/MainActivity;'
HEADER = '.method public final onCreate(Landroid/os/Bundle;)V'
WRITE = 'invoke-static {p1, v5, v2}, LQ3/T4;->r(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V'
READ = 'invoke-interface {p1, v5, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z'


def normalized(text):
    # Preserve field/method declarations and distinct control-flow targets.
    # Only debug information and label spelling may differ after re-emission.
    lines = []
    for section in re.split(r'(?=^\.method )', text, flags=re.M):
        labels = {name: f':label{index}' for index, name in enumerate(
            re.findall(r'^\s*(:\w+)\s*$', section, re.M))}
        for line in section.splitlines():
            line = line.strip()
            if not line or line.startswith(('#', '.source', '.line', '.local ', '.end local',
                                            '.restart local', '.prologue', '.epilogue')):
                continue
            # Omitted initializers have the VM's default value.
            if line.startswith('.field '):
                line = re.sub(r'(:(?:L[^;]+;|\[\S+)) = null$', r'\1', line)
                line = re.sub(r'(:Z) = false$', r'\1', line)
            lines.append(re.sub(r':\w+', lambda match: labels.get(match[0], match[0]), line))
    return '\n'.join(lines)


def resource_xml(root, relative):
    public = ET.parse(root / 'res/values/public.xml').getroot()
    names = {entry.get('name'): entry.get('id') for entry in public if entry.get('type') == 'id'}
    doc = ET.parse(root / relative).getroot()
    # The resource compiler renames case-colliding IDs on macOS, preserving
    # their numeric IDs. Resolve both spellings before comparing all values.
    for element in doc.iter():
        for key, value in element.attrib.items():
            if value.startswith('@id/') and value[4:] in names:
                element.set(key, '@id/' + names[value[4:]])
        if element.tag in {'flag', 'id'} or element.get('type') == 'id':
            name = element.get('name')
            if name in names:
                element.set('name', names[name])
    return ET.canonicalize(ET.tostring(doc, encoding='unicode'))


def verify(original, output, enabled, original_apk=None, patched_apk=None):
    before, after = classes(original), classes(output)
    assert before.keys() == after.keys(), 'Class inventory changed'
    assert not any(name.startswith('Lcom/pairip/') for name in before), 'Unexpected PairIP input'
    expected_write = WRITE if enabled else ''
    for name, text in before.items():
        if name != ACTIVITY:
            assert normalized(text) == normalized(after[name]), f'Unrelated class changed: {name}'
            continue
        methods = lambda source: dict(re.findall(r'(\.method [^\n]+)\n(.*?)\.end method', source, re.S))
        old, new = methods(text), methods(after[name])
        assert old.keys() == new.keys(), 'Activity method inventory changed'
        for header, body in old.items():
            if header == HEADER:
                assert body.count(READ) == 1 and WRITE not in body, 'Unexpected original premium read'
                # v2 is true before either SEND/VIEW branch; neither branch writes it.
                prefix = body.split('const/4 v2, 0x1', 1)
                assert len(prefix) == 2
                window = prefix[1].split(READ, 1)[0]
                assert not re.search(r'^\s*(?:const\S*|move\S*|[ais]get\S*) v2[,\s]', window, re.M)
                expected = body.replace(READ, expected_write + '\n' + READ)
                assert normalized(expected) == normalized(new[header]), 'Unexpected premium edit'
            else:
                assert normalized(body) == normalized(new[header]), f'Activity method changed: {header}'
    # Confirm that the existing writer persists its boolean argument, rather than
    # merely changing the UI or using the value as a preference default.
    writer = before['LQ3/T4;'].split('.method public static r(', 1)[1].split('.end method', 1)[0]
    assert '->putBoolean(Ljava/lang/String;Z)' in writer and '->apply()V' in writer
    assert '{p0, p1, p2}' in writer
    assert resource_xml(original, 'AndroidManifest.xml') == resource_xml(output, 'AndroidManifest.xml')
    for path in original.glob('res/**/*.xml'):
        relative = path.relative_to(original)
        assert resource_xml(original, relative) == resource_xml(output, relative), f'Resource values changed: {relative}'
    if patched_apk:
        with zipfile.ZipFile(original_apk) as old, zipfile.ZipFile(patched_apk) as new:
            payloads = {name for name in old.namelist() if name.startswith(('lib/', 'assets/', 'res/'))}
            assert payloads <= set(new.namelist()), 'Original payload missing'
            for name in payloads:
                assert old.read(name) == new.read(name), f'Original payload changed: {name}'
    print(f'PASS: AT4K premium={enabled}; all {len(before)} classes, startup and original payloads checked')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original', type=Path)
    parser.add_argument('output', type=Path)
    parser.add_argument('-e', action='append', default=[])
    parser.add_argument('--original-apk', type=Path)
    parser.add_argument('--patched-apk', type=Path)
    args = parser.parse_args()
    assert set(args.e) <= {'Unlock Premium'}
    assert not args.patched_apk or args.original_apk
    verify(args.original, args.output, bool(args.e), args.original_apk, args.patched_apk)


if __name__ == '__main__':
    main()
