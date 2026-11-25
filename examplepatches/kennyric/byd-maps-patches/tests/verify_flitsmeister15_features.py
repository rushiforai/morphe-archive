"""Independent15.0 feature behavior probes over the emitted decoded DEX.

The publisher contracts are frozen separately. No production patch tables or
source mutation indexes are imported. This executes actual scalar/preference
fragments at mocked Android/provider boundaries; it is not a device test.
"""
import argparse
from pathlib import Path
import re

from flitsmeister15_features_contracts import ORIGINAL_METHOD_HASHES, METHOD_CONTROLS, METHOD_HEADERS, RETAINED_METHODS, SEMANTIC_PROBES, SETTINGS_DEFAULTS
from verify_flitsmeister import canonical, digest, invoke_args, method, run_fragment

PROVIDER = 'Laqe;->b(Landroid/content/Context;)Z'
LOCAL_PRO = 'Llp0;->k()Z'
ENUM = 'Lnl/flitsmeister/fmcore/models/enums/AlertSignalTypes;'


def verify(root: Path, unlock: bool, notices: bool, hide_ads: bool = False):
    checked = 0
    from verify_flitsmeister15_profile_badge import verify as verify_profile_badge
    checked += verify_profile_badge(root, unlock, notices)['profile_badge_cases']
    for desc, (body_hash, header) in RETAINED_METHODS.items():
        body = method(root, desc)
        assert body.splitlines()[0] == header and digest(body) == body_hash, f'{desc}: genuine provider/preference/badge contract changed'
        checked += 1
    # An absent selection must leave complete independent original bodies and
    # method flags intact, not merely omit this verifier's behavioral overrides.
    for desc, original in ORIGINAL_METHOD_HASHES.items():
        body = method(root, desc)
        assert body.splitlines()[0] == METHOD_HEADERS[desc], f'{desc}: method flags changed'
        enabled = {'unlock': unlock, 'notices': notices, 'either': unlock or notices}[METHOD_CONTROLS[desc]]
        if hide_ads and desc == 'Lgm8;->W(Landroid/content/Context;)Z':
            continue
        if not enabled:
            assert digest(body) == original, f'{desc}: unselected feature body changed'
        checked += 1

    for desc, probes in SEMANTIC_PROBES.items():
        ins = canonical(method(root, desc))
        if hide_ads and desc == 'Lgm8;->W(Landroid/content/Context;)Z':
            assert ins == ['const/4 v0, 0x0', 'return v0']
            continue
        for probe in probes:
            enabled = {'unlock': unlock, 'hide': notices, 'either': unlock or notices}[probe['control']]
            if probe['type'] == 'scalar':
                anchors = [i for i, line in enumerate(ins) if probe['ref'] in line and line.startswith('invoke-')]
                assert len(anchors) == probe['calls'], f'{desc}: real provider invocation cardinality'
                indices = anchors if probe['which'] is None else [anchors[probe['which']]]
                for anchor in indices:
                    result = ins[anchor + 1].split()[1]
                    for tier in (False, True):
                        registers = {result: tier}
                        cursor = anchor + 2
                        while ins[cursor].startswith('const/16 '):
                            destination, value = ins[cursor].split(' ', 1)[1].split(', ')
                            registers[destination] = int(value, 16)
                            cursor += 1
                        assert registers[result] == (probe['value'] if enabled else tier), f'{desc}: local eligibility scalar'
                        checked += 1
            elif probe['type'] == 'state':
                factories = [line for line in ins if 'Lzpe;->b(' in line or 'Lmorphe/flitsmeister/FeatureEligibility;->state(' in line]
                assert len(factories) == 1 and factories[0].startswith('invoke-static ')
                assert ('Lmorphe/flitsmeister/FeatureEligibility;' in factories[0]) == enabled, f'{desc}: scoped State factory'
                checked += 1
            elif probe['type'] == 'join':
                anchors = [i for i, line in enumerate(ins) if 'Composer;->endDefaults()V' in line]
                assert len(anchors) == 1
                for explicit in (False, True):
                    for genuine in (False, True):
                        value = explicit if probe['explicit'] else genuine
                        line = ins[anchors[0] + 1]
                        if line.startswith('const/16 '):
                            destination, literal = line.split(' ', 1)[1].split(', ')
                            if destination == probe['register']:
                                value = int(literal, 16)
                        assert value == (1 if enabled else (explicit if probe['explicit'] else genuine)), f'{desc}: explicit/default eligibility join'
                        checked += 1

    for desc, default in SETTINGS_DEFAULTS.items():
        body = method(root, desc)
        ins = canonical(body)
        locals_count = int(re.search(r'\.locals (\d+)', body)[1])
        enum = desc.endswith(')' + ENUM)
        for tier in (False, True):
            for pref in (('SILENT', 'SELECTED_WARNING') if enum else (False, True)):
                calls = []
                def boundary(ref, values):
                    calls.append(ref)
                    if ref == PROVIDER:
                        return tier
                    if ref in ('Ltuh;->a(Landroid/content/Context;)Z',
                               'Lxc0;->a(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/preferences/AppPreference;)Ljava/lang/Boolean;'):
                        return pref
                    if ref == 'Lb2;->a(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;':
                        return pref
                    if 'SharedPreferences;->getString(' in ref:
                        return pref
                    if 'getDefaultSharedPreferences(' in ref:
                        return 'preferences'
                    if 'Gson;->toJson(' in ref:
                        return 'default'
                    if ref.endswith('->getClass()Ljava/lang/Class;') or ref.endswith('Gson;-><init>()V'):
                        return None
                    raise AssertionError(ref)
                def fields(ref):
                    if ref.startswith(('Lsuh;', 'Lt28;')):
                        return {'Ltuh;->a:Ljava/lang/String;': 'saved-key', 'Ltuh;->b:Ljava/lang/Object;': 'default'}
                    return ref
                value = run_fragment(ins, 0, {
                    'v' + str(locals_count): {'Lgm8;->b:Laqe;': 'genuine-provider'},
                    'v' + str(locals_count + 1): 'context',
                }, boundary, fields=fields)
                if hide_ads and desc == 'Lgm8;->W(Landroid/content/Context;)Z':
                    assert value == 0, 'General ads must remain disabled for every saved preference and tier'
                else:
                    assert calls.count(PROVIDER) == 1, f'{desc}: genuine provider read must remain'
                    assert value == (pref if unlock or tier else default), f'{desc}: saved preference/tier semantics'
                checked += 1

    for cls in ('am8', 'bm8', 'cm8', 'dm8', 'em8', 'fm8'):
        ins = canonical(method(root, 'L' + cls + ';->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'))
        def continuation(ref, values):
            if ref == 'Lhof;->b(Ljava/lang/Object;)V':
                if isinstance(values[0], Exception):
                    raise values[0]
                return None
            raise AssertionError(ref)
        for tier in (False, True):
            for pref in (False, True):
                regs = {'v1': {'L' + cls + ';->a:Z': tier, 'L' + cls + ';->b:Z': pref}, 'v2': object()}
                value = run_fragment(ins, 0, regs, continuation)
                assert value == (pref if unlock or tier else cls in ('bm8', 'em8')), f'{cls}: actual Flow keeps saved false'
                checked += 1
        try:
            run_fragment(ins, 0, {'v1': {'L' + cls + ';->a:Z': False, 'L' + cls + ';->b:Z': False},
                                  'v2': ValueError('continuation-sentinel')}, continuation)
        except ValueError:
            pass
        else:
            raise AssertionError(f'{cls}: coroutine failure propagation lost')

    # The consolidated15 report filter replaced TrafficJam/SpeedTrap/SpeedCam/
    # PoliceHotspot/AvgSpeed task eligibility gates. Verify its actual constructor
    # inputs and each actual saved-preference closure rather than old task names.
    report = canonical(method(root, 'Lka1;->k(Ljava/util/Collection;Landroid/content/Context;)Ljava/util/ArrayList;'))
    callbacks = tuple('L' + c + 'a1;' for c in 'bcdefghij')
    for tier in (False, True):
        captures = []
        def filter_boundary(ref, values):
            if ref == LOCAL_PRO:
                return tier
            if ref.endswith('->getClass()Ljava/lang/Class;'):
                return None
            if any(ref == c + '-><init>(Landroid/content/Context;Z)V' for c in callbacks):
                captures.append((ref, values[1], bool(values[2])))
                return None
            if ref == 'Lfti;-><init>(Ls39;)V':
                return None
            if ref == 'Laa1;-><init>(Ljava/lang/Object;I)V':
                assert values[1:] == ['context', 0], 'Traffic-camera preference closure stays genuine'
                return None
            if ref == 'Ljava/util/ArrayList;-><init>()V':
                return None
            raise AssertionError(ref)
        run_fragment(report, 0, {'v17': 'reports', 'v18': 'context'}, filter_boundary,
                     stop=lambda pc, line, regs, seen: 'Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;' in line)
        assert len(captures) == len(callbacks), 'All report-category preference closures must remain constructed'
        assert all(context == 'context' and pro == (unlock or tier) for _, context, pro in captures), 'Consolidated report eligibility scalar'
        checked += 1

    # Named report-to-closure bindings and saved keys are fixed independently.
    categories = {'ba1': 'a', 'ca1': 'z', 'da1': 'A', 'ea1': 'x', 'fa1': 'P', 'ga1': 'B', 'ha1': 'N', 'ia1': 'K'}
    for cls, preference in categories.items():
        ins = canonical(method(root, 'L' + cls + ';->invoke()Ljava/lang/Object;'))
        assert sum('Lsuh;->' + preference + ':Ltuh;' in line for line in ins) == 1
        for tier in (False, True):
            for saved in (False, True):
                seen = []
                def saved_boundary(ref, values):
                    assert ref == 'Ltuh;->a(Landroid/content/Context;)Z', ref
                    seen.append(values)
                    return saved
                owner = {'L' + cls + ';->a:Z': tier,
                         'L' + cls + ';->b:Landroid/content/Context;': 'context'}
                register = 'v1'
                if cls == 'ga1':
                    register = 'v3'
                    owner = {'Lga1;->a:I': 0, 'Lga1;->b:Z': tier, 'Lga1;->c:Ljava/lang/Object;': 'context'}
                result = run_fragment(ins, 0, {register: owner}, saved_boundary)
                assert result == (saved if tier else cls != 'fa1'), f'{cls}: preserve saved alert selection'
                assert len(seen) == int(tier), f'{cls}: original conditional preference read'
                checked += 1

    # Android Auto must preserve real account/version denial and its real
    # callback, even when the local Pro scalar becomes eligible.
    auto = canonical(method(root, 'Laa2;->l()V'))
    for account in (False, True):
        for obsolete in (False, True):
            for tier in (False, True):
                owner = {'Laa2;->F1:Le68;': 'genuine-entrypoint',
                         'Laa2;->a:Landroidx/car/app/CarContext;': 'context',
                         'Laa2;->L1:Laqe;': 'genuine-provider',
                         'Laa2;->q:Z': obsolete, 'Laa2;->d:Lkeb;': 'old-state'}
                seen = []
                def auto_boundary(ref, values):
                    seen.append(ref)
                    if ref == 'Lgb;->a()Lnl/flitsmeister/models/data/account/UserAccountFM;':
                        return {'real-account': True} if account else 0
                    if ref == PROVIDER:
                        return tier
                    return None
                run_fragment(auto, 0, {'v3': owner}, auto_boundary)
                expected = 'q' if obsolete else 'b' if not account else 'd' if unlock or tier else 'c'
                assert owner['Laa2;->d:Lkeb;'] == 'Lkeb;->' + expected + ':Lkeb;', 'Android Auto retains account/version priority'
                assert seen.count('Lhv0;->e(Lb45;Li49;)Lyhi;') == 1, 'Actual Auto state callback retained'
                checked += 1

    # Hiding the NOT_PRO canvas preserves denied states and existing loading
    # cleanup. It must never write ALLOWED or admit a car host/account itself.
    canvas = canonical(method(root, 'Lca2;->onDraw(Landroid/graphics/Canvas;)V'))
    start = next(i for i, line in enumerate(canvas) if 'Canvas;->drawColor(I)V' in line) + 1
    loading = next(i for i in range(start, start + 8) if 'Lkeb;->a:Lkeb;' in canvas[i])
    cleanup = int(canvas[loading + 2].split('@')[1])
    renderer = int(canvas[loading + 1].split('@')[1])
    for state in ('a', 'b', 'c', 'q'):
        owner = {'Laa2;->d:Lkeb;': 'Lkeb;->' + state + ':Lkeb;'}
        _, _, end = run_fragment(canvas, start, {'v9': owner},
                                 stop=lambda pc, line, regs, seen: pc in (cleanup, renderer))
        assert (end == cleanup) == (state == 'a' or (notices and state == 'c')), 'Only NOT_PRO painting suppressed'
        assert owner['Laa2;->d:Lkeb;'] == 'Lkeb;->' + state + ':Lkeb;', 'Actual denied Auto state preserved'
        checked += 1

    # Trip Logging still follows real backend activation/trial state and carries
    # the original deep link to the genuine screen rather than faking a service.
    trip = canonical(method(root, 'Lnsj;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;'))
    for tier in (False, True):
        for activated in (False, True):
            for trial in (False, True):
                def trip_boundary(ref, values):
                    if ref == 'Laqe;->c(Landroid/content/Context;)Z':
                        return tier
                    if ref == 'Lnxj;->c(Landroid/content/Context;)Z':
                        return activated
                    if ref == 'Lnxj;->e(Landroid/content/Context;)Z':
                        return trial
                    if ref == 'Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V':
                        values[0]['route'] = values[2]
                    if 'Intent;->putExtra(' in ref:
                        values[0].setdefault('extras', {})[values[1]] = values[2]
                        return values[0]
                    if 'Intent;->setFlags(' in ref:
                        values[0]['flags'] = values[1]
                        return values[0]
                    return None
                result = run_fragment(trip, 0, {'v2': 'context', 'v3': 'actual-deeplink'}, trip_boundary)
                local_tier = unlock or tier
                expected = 'main/TripLoggingMainActivity' if (local_tier and activated) or trial else 'activation/TripLoggingActivateActivity' if local_tier else None
                assert result['route'] == ('Lnl/flitsmeister/features/triplogging/' + expected + ';' if expected else 'Lnl/flitsmeister/pro/presentation/ProPricingActivity;'), 'Trip Logging actual activation route'
                assert result['flags'] == 0x10000000
                if expected and expected.startswith('main/'):
                    assert result['extras']['trip_logging_deeplink'] == 'actual-deeplink'
                checked += 1

    # Badge factories keep genuine Dash/Start variants; only Pro/Plus disappear.
    badge_methods = (
        ('Lwwb;->b(ZLjava/lang/String;Landroid/graphics/Bitmap;Landroidx/compose/ui/graphics/painter/Painter;Ls39;Ljava/lang/String;Ls39;Ljava/lang/String;ZLandroidx/compose/runtime/Composer;I)V', 'Composer;->endNode()V'),
        ('Lfb0;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;', 'Composer;->endReplaceGroup()V'),
    )
    factory = 'Lxy0;->a(Lfoi;Landroidx/compose/runtime/Composer;)Lyy0;'
    for desc, join_reference in badge_methods:
        if unlock and desc.startswith('Lwwb;->b('):
            # The independently checked menu-only cosmetic PRO badge has its
            # own explicit composition with notice filtering above.
            continue
        ins = canonical(method(root, desc))
        badge = next(i for i, line in enumerate(ins) if factory in line)
        arguments = invoke_args(ins[badge])
        join = next(i for i in range(badge, len(ins)) if join_reference in ins[i])
        start = badge
        if notices:
            starts = [i for i in range(max(0, badge - 18), badge) if ins[i].startswith('instance-of ') and 'Lfoi$b;' in ins[i]]
            assert len(starts) == 1, 'Selective tier filter must retain the real factory continuation'
            start = starts[0]
        for variant in ('a', 'b', 'c', 'd'):
            tier_class = 'Lfoi$' + variant + ';'
            calls = []
            def badge_boundary(ref, values):
                calls.append((ref, values))
                if ref == factory:
                    return {'real-badge': values[0]}
                if ref.startswith('Lwwb;->a('):
                    return None
                raise AssertionError(ref)
            registers = {'v' + str(n): 'original-value-' + str(n) for n in range(80)}
            registers[arguments[0]] = tier_class
            registers[arguments[1]] = 'composer'
            run_fragment(ins, start, registers, badge_boundary,
                         stop=lambda pc, line, regs, seen: pc == join,
                         fields=lambda ref: 0 if ref == 'Lyy0;->j:I' else ref)
            hidden = notices and variant in ('b', 'c')
            assert any(ref == factory for ref, _ in calls) != hidden, 'Only Pro/Plus badges hidden'
            checked += 1

    if notices:
        ins = canonical(method(root, 'Lx6b;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'))
        writes = []
        def expired_boundary(ref, values):
            if ref == 'Lhof;->b(Ljava/lang/Object;)V':
                if isinstance(values[0], Exception):
                    raise values[0]
                return None
            if ref.endswith('->C()Lnl/flitsmeister/fmx/activities/main/k;'):
                return {'Lnl/flitsmeister/fmx/activities/main/k;->F3:Liji;': 'actual-notice-state'}
            if ref == 'Liji;->l(Ljava/lang/Object;Ljava/lang/Object;)Z':
                writes.append(values)
                return True
            raise AssertionError('Expired-notice completion must not construct/show a dialog: ' + ref)
        value = run_fragment(ins, 0, {'v6': {'Lx6b;->b:Lnl/flitsmeister/fmx/activities/main/MainActivity;': 'activity'}, 'v7': object()}, expired_boundary)
        assert value == 'Ll1k;->a:Ll1k;' and writes == [['actual-notice-state', 0, False]], 'Actual expired-notice state completes'
        try:
            run_fragment(ins, 0, {'v6': {}, 'v7': ValueError('continuation-sentinel')}, expired_boundary)
        except ValueError:
            pass
        else:
            raise AssertionError('Expired-notice completion lost coroutine failure validation')
        checked += 1
    return {'feature_methods': len(ORIGINAL_METHOD_HASHES), 'checks': checked}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('--unlock', action='store_true')
    parser.add_argument('--notices', action='store_true')
    parser.add_argument('--hide-ads', action='store_true')
    args = parser.parse_args()
    print(verify(args.root, args.unlock, args.notices, args.hide_ads))
