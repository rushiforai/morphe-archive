"""Verify injected instructions against original APKs, independently of patch success logs."""
import pathlib, re, subprocess, json, os
ROOT = pathlib.Path(__file__).resolve().parents[1]
CP = str(ROOT/'tools') + ';' + os.environ['MORPHE_DESKTOP_JAR']
def inspect(apk, cls):
    text = subprocess.check_output(['java', '-cp', CP, 'Inspect', str(apk), cls], text=True, encoding='utf-8')
    methods = {}
    current = None
    for line in text.splitlines():
        if line.startswith('METHOD '):
            current = line
            methods[current] = []
        elif current and re.match(r'^\d+ ', line):
            methods[current].append(line.split(' ', 1)[1])
    return methods
results = []
for version in ['4.71', '4.72', '4.73']:
    original = next((ROOT/'downloads').glob(f'ProjectivyLauncher-{version}-*.apk'))
    patched = ROOT/f'build/Projectivy-{version}-patched-unsigned.apk'
    changes = []
    has_byte_state = False
    for cls in ['PTApplication', 'ProjectivyAccessibilityService']:
        before, after = inspect(original, cls), inspect(patched, cls)
        if cls == "ProjectivyAccessibilityService":
            has_byte_state = any(op.startswith("SPUT_BYTE ") for m, ops in before.items() if "<clinit>()V" in m for op in ops)
        assert before.keys() == after.keys(), f'{version}: method set changed'
        for method, old in before.items():
            new = after[method]
            if old == new:
                continue
            if new[:2] == ['CONST_4 v0 #1', 'RETURN v0'] and new[2:] == old:
                changes.append('premium')
            elif new[1:] == old and re.fullmatch(r'CONST_16 v\d+ #0', new[0]):
                changes.append('trial')
            elif '<clinit>()V' in method:
                candidates = [i for i, op in enumerate(new) if op.startswith('SPUT_BYTE ')]
                assert len(candidates) == 1
                index = candidates[0]
                reg = new[index].split()[1]
                assert new[index-1] == f'CONST_16 {reg} #0'
                assert new[:index-1] + new[index:] == old
                changes.append('accessibility')
            else:
                raise AssertionError(f'{version}: unexpected change: {method}')
    expected = ['accessibility', 'premium', 'trial'] if has_byte_state else ['premium', 'trial']
    assert sorted(changes) == expected, (version, changes)
    results.append({'version': version, 'instructionVerification': 'PASS', 'changes': changes})
    print(f'PASS {version}: {len(changes)} intended method changes; other inspected methods unchanged')
(ROOT/'dist/instruction-verification.json').write_text(json.dumps(results, indent=2)+'\n')


