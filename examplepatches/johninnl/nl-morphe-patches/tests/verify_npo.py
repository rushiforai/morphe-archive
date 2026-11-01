"""Complete host-side NPO phone/TV verification, including startup and native payloads."""
import argparse
import copy
import hashlib
import json
from pathlib import Path
import re
import subprocess
import tempfile
import xml.etree.ElementTree as ET
import zipfile

from atv_smali import classes
from media_inputs import verify_payload
from npo_manifest import A, AD_PERMISSIONS, FLAGS, PERFORMANCE_PROVIDER, load_manifest
from verify_npo_atv import verify as verify_methods
from verify_videoland_atv import declaration_shape, digest, MERGE_METADATA

ROOT = Path(__file__).resolve().parents[1]
STARTUP = 'Fix PairIP startup'


def startup_constants(phone):
    """Read the immutable publisher capture already checked into the repository."""
    source = ROOT / 'patches/src/main/kotlin/patches/npostarttv' / ('PhoneStartupRestoreData.kt' if phone else 'StartupRestoreData.kt')
    expected = ('52a8d3456055fce390a8f1703a6d2f111a18ede856d732ce0659c9cc005588f5' if phone else
                '3fb1d87f8975a10c186474eb58fe65bbceeadf28e3d399073cca491e7095f3ce')
    assert hashlib.sha256(source.read_bytes()).hexdigest() == expected, 'Changed NPO immutable publisher startup capture'
    text = source.read_text()
    quoted = r'"(?:\\.|[^"\\])*"'
    def decode(literal):
        return json.loads(literal.replace('\\$', '$'))
    strings, methods, owner = {}, {}, None
    strings_source, methods_source = re.split(r'val methods\b[^=]*=', text, maxsplit=1)
    for line in strings_source.splitlines():
        tokens = re.findall(quoted, line)
        if len(tokens) == 1 and 'to mapOf(' in line:
            owner = decode(tokens[0])
            strings[owner] = {}
        elif len(tokens) == 2 and ' to ' in line:
            assert owner is not None
            strings[owner][decode(tokens[0])] = decode(tokens[1])
    def name(descriptor):
        primitives = dict(Z='boolean', B='byte', C='char', S='short', I='int', J='long', F='float', D='double')
        if descriptor in primitives:
            return primitives[descriptor]
        return descriptor[1:-1].replace('/', '.') if descriptor.startswith('L') else descriptor.replace('/', '.')
    for line in methods_source.splitlines():
        if 'to MethodRestore(' not in line:
            continue
        field, helper, method, *parameters = map(decode, re.findall(quoted, line))
        methods[field] = {'helper': name(helper), 'name': method, 'parameters': list(map(name, parameters))}
    assert len(strings) == 32 and sum(map(len, strings.values())) == (1494 if phone else 1437)
    assert len(methods) == (10 if phone else 9)
    return {'strings': strings, 'methods': methods}


def embedded_helpers(original, out, phone):
    name, offset, size, expected = (
        ('koMIKlhio0icA0mv', 244836, 17472, '5a219dd911eb6bfc7123943b9f575d8f5a576f8a3e87243965c4f6ef82a5c44c') if phone else
        ('jAAULfkL9PCc9aKk', 356690, 12064, 'bdd57282142aaba6972e50c36246e53a33b5656f532405b0ca36027e96260184'))
    asset = (Path(original) / 'assets' / name).read_bytes()
    data = asset[offset:offset + size]
    assert hashlib.sha256(data).hexdigest() == expected, 'Changed NPO original embedded lifecycle helpers'
    apk = out / 'embedded.apk'
    with zipfile.ZipFile(apk, 'w') as archive:
        archive.writestr('classes.dex', data)
    destination = out / 'embedded-original'
    subprocess.run(['apktool', 'd', '-r', '-f', '-o', str(destination), str(apk)], check=True,
                   stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    return destination


def verify_manifest(before, after, tracking, original=None, patched=None):
    expected = copy.deepcopy(before)
    for name in ('requiredSplitTypes', 'splitTypes'):
        expected.attrib.pop(A + name, None)
    app = expected.find('application')
    for parent in expected.iter():
        for node in list(parent):
            if node.tag == 'meta-data' and node.get(A + 'name') in MERGE_METADATA:
                parent.remove(node)
    if tracking:
        permissions = [node for node in expected.findall('uses-permission') if node.get(A + 'name') in AD_PERMISSIONS]
        assert len(permissions) == 4, 'NPO original advertising permission inventory changed'
        for node in permissions:
            expected.remove(node)
        providers = [node for node in app.findall('provider') if node.get(A + 'name') == PERFORMANCE_PROVIDER]
        assert len(providers) == 1, 'NPO original Sentry performance provider changed'
        app.remove(providers[0])
        metadata = {node.get(A + 'name'): node for node in app.findall('meta-data')}
        for name, value in FLAGS.items():
            if name not in metadata:
                metadata[name] = ET.SubElement(app, 'meta-data', {A + 'name': name})
            metadata[name].set(A + 'value', value)
    actual = copy.deepcopy(after)
    for manifest, root in [(expected, original), (actual, patched)]:
        if root is None:
            continue
        public = ET.parse(Path(root) / 'res/values/public.xml').getroot()
        ids = {'@' + node.get('type') + '/' + node.get('name'): node.get('id') for node in public}
        for node in manifest.iter():
            for name, value in node.attrib.items():
                if value in ids:
                    node.set(name, ids[value])
    assert digest(expected) == digest(actual), 'NPO manifest changed outside selected merge/privacy edits'


def verify(original, patched, selected, phone=False):
    original, patched = Path(original), Path(patched)
    before, after = classes(original), classes(patched)
    for owner, path in before.items():
        assert owner in after, 'NPO original class removed: ' + owner
        assert declaration_shape(path.read_text()) == declaration_shape(after[owner].read_text()), 'NPO original class declaration changed: ' + owner
    verify_manifest(load_manifest(original), load_manifest(patched), 'Disable tracking' in selected, original, patched)
    with tempfile.TemporaryDirectory(prefix='npo-output-contract-') as scratch:
        out = Path(scratch)
        data, embedded = None, None
        if STARTUP in selected:
            data = out / 'startup.json'
            data.write_text(json.dumps(startup_constants(phone)))
            embedded = embedded_helpers(original, out, phone)
            for owner, path in classes(embedded).items():
                assert owner in after, 'NPO embedded helper missing: ' + owner
                assert declaration_shape(path.read_text()) == declaration_shape(after[owner].read_text()), 'NPO embedded helper declaration changed: ' + owner
        return verify_methods(original, patched, 'Hide ads' in selected, 'Disable tracking' in selected, data, embedded, phone)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original')
    parser.add_argument('patched')
    parser.add_argument('--phone', action='store_true')
    parser.add_argument('-e', '--enable', action='append', choices=[STARTUP, 'Hide ads', 'Disable tracking'], default=[])
    parser.add_argument('--original-apks')
    parser.add_argument('--patched-apk')
    args = parser.parse_args()
    selected = set(args.enable)
    assert not selected & {'Hide ads', 'Disable tracking'} or STARTUP in selected, 'NPO controls require startup restoration'
    print(f'PASS: {verify(args.original, args.patched, selected, args.phone)} NPO original methods and exact selected effects')
    if args.original_apks or args.patched_apk:
        assert args.original_apks and args.patched_apk
        print(f'PASS: {verify_payload(args.original_apks, args.patched_apk)} complete NPO payload entries')
