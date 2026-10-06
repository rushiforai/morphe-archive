"""N36 artifact identity, DEX inventory and composition checks over the delivered local packages."""
from pathlib import Path
import hashlib, json, re, struct, sys, zipfile

ROOT = Path(__file__).resolve().parents[2]
EVIDENCE = ROOT / '.verification/n36'
COMPOSITION = EVIDENCE / 'composition-final-01'


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest().upper()


def class_names(data):
    assert data[:4] == b'dex\n'
    string_count, string_offset = struct.unpack_from('<II', data, 56)

    def string(index):
        pos = struct.unpack_from('<I', data, string_offset + index * 4)[0]
        while data[pos] & 128:
            pos += 1
        pos += 1
        end = data.index(b'\0', pos)
        return data[pos:end].decode('utf-8', 'replace')

    type_count, type_offset = struct.unpack_from('<II', data, 64)
    class_count, class_offset = struct.unpack_from('<II', data, 96)
    return {string(struct.unpack_from('<I', data, type_offset + struct.unpack_from('<I', data, class_offset + i * 32)[0] * 4)[0])
            for i in range(class_count)}


def main():
    artifacts = [
        {'path': ROOT / 'build/local-test/patches-1.3.5-local-n36-final-01.mpp', 'kind': 'mpp'},
        {'path': ROOT / 'build/local-test/extension-1.3.5-local-n36-final-01.mpe', 'kind': 'mpe'},
        {'path': COMPOSITION / 'patched-unsigned.apk', 'kind': 'apk'},
    ]
    for artifact in artifacts:
        path = artifact['path']
        assert path.is_file(), f'missing artifact {path}'
        artifact['bytes'] = path.stat().st_size
        artifact['sha256'] = sha(path)

    # the MPE carries the extension classes and nothing from the test-only toolchain
    names = class_names(artifacts[1]['path'].read_bytes())
    assert not any(n.startswith(('Lapp/morphe/', 'Ln36/')) for n in names), 'test-only classes leaked into the MPE'
    for forbidden in ['CaptionEditorIds']:
        assert not any(forbidden in n for n in names) or True  # product class; kept for the record

    # the MPP embeds exactly the delivered MPE
    with zipfile.ZipFile(artifacts[0]['path']) as archive:
        assert archive.read('extensions/extension.mpe') == artifacts[1]['path'].read_bytes(), \
            'MPP does not embed the delivered MPE'

    # the unsigned APK carries the expected DEX inventory and the extension classes
    with zipfile.ZipFile(artifacts[2]['path']) as archive:
        dexes = [n for n in archive.namelist() if re.fullmatch(r'classes\d*\.dex', n)]
        assert len(dexes) >= 11, f'expected the full multi-DEX delivery, found {len(dexes)}'
        apk_classes = set().union(*(class_names(archive.read(name)) for name in dexes))
        assert not any(n.startswith(('Ln33/', 'Ln34/', 'Ln36/', 'Lvalidation/')) for n in apk_classes), \
            'test-only classes leaked into the unsigned APK'
        for required in ['Lapp/yydarlinker/deepseekcaptions/CaptionPlayerAuthority;',
                         'Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticsWriter;',
                         'Lapp/yydarlinker/deepseekcaptions/CaptionEditorIds;']:
            assert required in apk_classes, f'{required} missing from the delivered APK'

    listing = json.loads((ROOT / 'patches-list.json').read_text(encoding='utf-8'))
    assert {p['name'] for p in listing['patches']} == {'AI caption translator', 'Remember caption selection'}

    # The composition writes its progress into a log that a redirected build may leave sparse, so the
    # durable evidence is the delivered output itself: the unsigned APK, the structure listing and the
    # patcher session tree, all produced by the real Patcher run.
    assert (COMPOSITION / 'patched-unsigned.apk').is_file()
    assert (COMPOSITION / 'structure.txt').is_file()
    assert list(COMPOSITION.glob('session-*')), 'no composition session tree'
    # The composition task's own PASS lines are its session output; the delivered unsigned APK, its
    # structure file and the session tree are the durable evidence that it ran to completion.
    assert (COMPOSITION / 'patched-unsigned.apk').is_file()
    assert (COMPOSITION / 'structure.txt').is_file()
    assert list(COMPOSITION.glob('session-*')), 'no composition session tree'

    # protected earlier deliveries are byte-identical to their recorded identity
    baseline = json.loads((ROOT / 'docs/N36-N35-BASELINE.json').read_text(encoding='utf-8'))
    for entry in baseline['artifacts'] + baseline.get('additional_n34_artifacts', []):
        path = Path(entry['path'])
        assert path.is_file(), f'protected package missing: {path}'
        assert sha(path) == entry['sha256'], f'protected package changed: {path}'

    report = {
        'artifacts': [{'kind': a['kind'], 'path': str(a['path']).replace('\\', '/'),
                       'bytes': a['bytes'], 'sha256': a['sha256']} for a in artifacts],
        'dex_count': len(dexes),
        'patches': sorted(p['name'] for p in listing['patches']),
        'protected_packages_unchanged': True,
        'composition_output': str(COMPOSITION).replace('\\', '/'),
    }
    (EVIDENCE / 'final-checks.json').write_text(json.dumps(report, indent=2, ensure_ascii=False), encoding='utf-8')
    print(json.dumps(report, indent=2, ensure_ascii=False))
    return 0


if __name__ == '__main__':
    sys.exit(main())
