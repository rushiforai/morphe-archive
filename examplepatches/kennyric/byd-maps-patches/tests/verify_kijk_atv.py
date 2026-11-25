"""Verify emitted KIJK effects and retain every original method outside the owned edits."""
import argparse
from atv_smali import methods, instructions, without_prefix


def verify(original, patched, ads, tracking, debug=False):
    before, after = methods(original), methods(patched)
    activity = 'Ltv/mauna/app/MainActivity;->t0()V'
    id_method = 'Ltv/mauna/app/MainActivity$d;->getAdvertisingId()Ljava/lang/String;'
    limit_method = 'Ltv/mauna/app/MainActivity$d;->shouldLimitAdTracking()Z'
    owned = {activity} | ({id_method, limit_method} if tracking else set())
    for key, body in before.items():
        assert key in after, 'Original method removed: ' + key
        if key not in owned:
            assert body == after[key], 'Unrelated method changed: ' + key
    setup = instructions(after[activity])
    expected = 'Lpatches/atv/KijkWebClient;'
    assert sum(expected + '->wrap(' in line for line in setup) == 1, 'Missing original-client wrapper'
    assert sum(expected + '->ads:Z' in line for line in setup) == int(ads), 'Incorrect ads selection'
    assert sum(expected + '->tracking:Z' in line for line in setup) == int(tracking), 'Incorrect tracking selection'
    # Remove only the known inserted statements, then compare the complete original setup.
    restored = setup[:]
    setter = 'Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V'
    if debug:
        index = next(i for i, line in enumerate(restored) if setter in line)
        assert restored[index] == 'invoke-static {v3}, ' + setter, 'Debugging was not explicitly enabled'
        restored[index] = 'invoke-static {v1}, ' + setter
    for field, selected in [('ads', ads), ('tracking', tracking)]:
        if selected:
            index = next(i for i, line in enumerate(restored) if expected + '->' + field + ':Z' in line)
            assert restored[index - 1] == 'const/4 v0, 0x1'
            del restored[index - 1:index + 1]
    index = next(i for i, line in enumerate(restored) if expected + '->wrap(' in line)
    assert restored[index + 1] == 'move-result-object v2'
    del restored[index:index + 2]
    assert restored == instructions(before[activity]), 'Original WebView setup changed'
    for key, value in [(id_method, '0x0'), (limit_method, '0x1')]:
        if tracking:
            current = instructions(after[key])
            assert current[:2] == ['const/4 v0, ' + value, 'return-object v0' if key == id_method else 'return v0']
            assert without_prefix(after[key], 2) == before[key], 'Original ID fallback was corrupted'
    assert 'Lpatches/atv/KijkPolicy;->bootstrap(ZZ)Ljava/lang/String;' in after, 'Extension absent'
    return len(before)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('original')
    parser.add_argument('patched')
    parser.add_argument('--ads', action='store_true')
    parser.add_argument('--tracking', action='store_true')
    parser.add_argument('--debug', action='store_true')
    args = parser.parse_args()
    count = verify(args.original, args.patched, args.ads, args.tracking, args.debug)
    print(f'PASS: KIJK effects and {count} original method contracts')
