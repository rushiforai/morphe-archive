"""Audit Monet premium/displayed-cards/Nuvio outputs; only the expected hooks may differ."""
import argparse
from pathlib import Path
import re
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from verify_at4k import normalized

CARDS = 'Lnl/johninnl/monetcards/'
NUVIO = 'Lnl/johninnl/monetnuvio/'
WUPLAY = 'Lnl/johninnl/monetwuplay/'
# (patch, class descriptor, method signature fragment, required markers)
MARKERS = {
    'cards': [
        ('a/j63', '.method public static final j(I)I', ['Ljava/lang/Math;->max(II)I']),
        ('a/ht6', '.method public static w(', ['CardLimit;->schemaMaximum(Ljava/lang/String;I)I']),
        ('a/b33', '.method public static final E0(I', ['DisplayedCards;->properties']),
        ('a/x22', '.method public static final a(J', ['DisplayedCards;->text']),
        ('a/u40', '.method public final f(', ['CardLimit;->summary(I)Ljava/lang/String;']),
        ('a/bv3', '.method public final f(', ['CardLimit;->summary(I)Ljava/lang/String;']),
        ('a/b33', '.method public static final x0(', ['CardLimit;->summary(I)Ljava/lang/String;']),
        ('a/b33', '.method public static final v0(', ['CardLimit;->pickerMaximum(II)I',
         'DisplayedCards;->buttons(', 'CardLimit;->number(III)Ljava/lang/String;',
         'DisplayedCards;->footer110(']),
    ],
}


def classes(root: Path) -> dict:
    found = {}
    for path in root.glob('smali*/**/*.smali'):
        text = path.read_text()
        name = re.match(r'\.class[^\n]* (L[^\n]+;)\n', text)
        if name:
            found[name[1]] = text
    return found


def body(text: str, signature: str) -> str:
    methods = dict(re.findall(r'(\.method [^\n]+)\n(.*?)\.end method', text, re.S))
    for header, code in methods.items():
        if header.startswith(signature):
            return code
    raise AssertionError(f'method not found: {signature} in {text[:80]}...')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original', type=Path)
    parser.add_argument('patched', type=Path)
    parser.add_argument('-e', action='append', default=[])
    args = parser.parse_args()
    assert set(args.e) <= {'premium', 'cards', 'wuplay', 'nuvio'}, args.e
    enabled = set(args.e)
    before, after = classes(args.original), classes(args.patched)
    expected_added = {CARDS: 'cards', NUVIO: 'nuvio', WUPLAY: 'wuplay'}
    owned_prefixes = tuple(prefix for prefix, patch in expected_added.items() if patch in enabled)
    added = [name for name in after if name not in before]
    removed = [name for name in before if name not in after]
    assert not removed, f'Removed classes: {removed[:4]}'
    for name in added:
        assert name.startswith(owned_prefixes), f'Unexpected added class {name}'
    extension_added = len(added)
    for prefix, patch in expected_added.items():
        if patch in enabled:
            assert any(name.startswith(prefix) for name in added), f'{patch}: extension classes missing'
    touched = {}
    for patch, entries in MARKERS.items():
        if patch not in enabled:
            continue
        for folder, signature, markers in entries:
            descriptor = f'L{folder};'
            patched_text = after[descriptor]
            code = body(patched_text, signature)
            for marker in markers:
                full = marker if marker.startswith(('DisplayedCards', 'CardLimit')) else marker
                needle = CARDS + marker if marker.startswith(('Displayed', 'CardLimit')) else marker
                assert needle in code or marker in code, f'{patch}: missing {marker} in {descriptor} {signature[:40]}'
            touched[descriptor] = touched.get(descriptor, set()) | {signature.split('(')[0] + signature.split(')')[-1]}
    if 'nuvio' in enabled:
        for descriptor, signature, marker in [
            ('La/b42;', '.method public static final k(', 'sources(Ljava/util/List;'),
            ('La/nx0;', '.method public final i()Ljava/lang/String;', NUVIO),
            ('Lcom/klevico/monet/MainActivity;', '.method public final onResume()V', NUVIO)]:
            assert marker in body(after[descriptor], signature), f'nuvio: missing hook in {descriptor}'
    if 'wuplay' in enabled:
        for descriptor, signature, marker in [
            ('La/b42;', '.method public static final k(', WUPLAY),
            ('Lcom/klevico/monet/MainActivity;', '.method public final onResume()V', WUPLAY)]:
            assert marker in body(after[descriptor], signature), f'wuplay: missing hook in {descriptor}'
    if 'premium' in enabled:
        norm = lambda code: re.sub(r'\s+', ' ', re.sub(r':\w+', ':L', re.sub(r'\.line \d+', '', re.sub(r'\.locals \d+', '', re.sub(r'\b[vp]\d+\b', 'rN', code.strip()))))).strip()
        orig = norm(body(before['La/ov5;'], '.method public a()Z'))
        patched = norm(body(after['La/ov5;'], '.method public a()Z'))
        assert 'const/4 rN, 0x0' in orig and orig.count('const/4 rN, 0x1') == 1, 'premium: unexpected original shape'
        expected = orig.replace('const/4 rN, 0x0', 'const/4 rN, 0x1')
        assert patched == expected, 'premium: evaluator changed beyond the false return'
    # Every class without a patch-specific edit must normalize identically.
    allowed = set()
    if 'premium' in enabled:
        allowed.add('La/ov5;')
    if 'cards' in enabled:
        allowed.update(('La/j63;', 'La/ht6;', 'La/b33;', 'La/x22;', 'La/u40;', 'La/bv3;'))
    if 'wuplay' in enabled or 'nuvio' in enabled:
        allowed.update(('La/b42;', 'La/nx0;', 'La/m42;', 'La/b84;', 'La/qc4;', 'La/s46;', 'La/bv3;',
                        'Lcom/klevico/monet/MainActivity;'))
    for name, text in before.items():
        if name in allowed:
            continue
        assert normalized(text) == normalized(after[name]), f'Unrelated class changed: {name}'
    print(f'PASS: Monet extra patches [{", ".join(sorted(enabled))}]; '
          f'{len(before)} original classes, {extension_added} owned extension classes; only expected hooks differ')


if __name__ == '__main__':
    main()
