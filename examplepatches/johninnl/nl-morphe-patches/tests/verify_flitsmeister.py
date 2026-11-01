"""Verify independently decoded Flitsmeister 14.17 local controls and retained contracts.

The digest oracle was derived from the publisher artifact before production edits.
It checks entire instruction bodies, including original branch destinations and all
R8 discriminator paths. No production patch tables are loaded by this verifier.
"""
import argparse
import copy
import hashlib
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET
from flitsmeister_contracts import METHOD_HASHES, RESOURCE_HASHES, PROBES, METHOD_SHAPES, ROW_CONTRACTS

NAMES = {'Unlock Pro', 'Hide Pro notices', 'Fix PairIP startup', 'Disable partner services', 'Hide ads', 'Disable tracking'}
A = '{http://schemas.android.com/apk/res/android}'
HELPER = 'Lmorphe/flitsmeister/FeatureEligibility;'


def source(root, cls):
    name = cls[1:-1] if cls.startswith('L') and cls.endswith(';') else cls
    paths = list(root.glob(f'smali*/{name}.smali')) + list(root.glob(f'smali/smali*/{name}.smali'))
    assert len(paths) == 1, f'Expected singleton class {cls}, found {len(paths)}'
    return paths[0].read_text()


def method(root, descriptor):
    cls, sig = descriptor.split('->')
    found = re.findall(r'^\.method[^\n]* ' + re.escape(sig) + r'\n.*?^\.end method', source(root, cls), re.M | re.S)
    assert len(found) == 1, f'Expected singleton method {descriptor}'
    return found[0]


def code(body):
    result, annotations, payload = [], 0, None
    for raw in body.splitlines():
        line = raw.strip().split('    #')[0]
        if line.startswith('.annotation'): annotations += 1
        if line.startswith('.end annotation'): annotations -= 1; continue
        if annotations or not line or line.startswith('#'): continue
        if line.startswith(('.packed-switch ', '.sparse-switch', '.array-data ')):
            payload = [line]; continue
        if payload is not None:
            if line.startswith('.end '): result.append('PAYLOAD ' + ' | '.join(payload)); payload = None
            else: payload.append(line)
            continue
        if line.startswith('.'): continue
        result.append(line)
    return result


def canonical(body):
    labels, instructions = {}, []
    lines = code(body)
    # DEX payload alignment may add/remove an unreachable NOP when a bounded
    # mutation changes code-unit widths. Preserve every payload and case target;
    # normalize only padding directly after a terminator and before data.
    for index in range(len(lines) - 1, -1, -1):
        if lines[index] != 'nop': continue
        before = next((line for line in reversed(lines[:index]) if not line.startswith(':')), '')
        after = next((line for line in lines[index + 1:] if not line.startswith(':')), '')
        if after.startswith('PAYLOAD ') and before.startswith(('return', 'throw', 'goto', 'PAYLOAD ')):
            lines.pop(index)
    for line in lines:
        if line.startswith(':'): labels[line] = len(instructions)
        else: instructions.append(line)
    local_match = re.search(r'\.locals (\d+)', body)
    locals_count = int(local_match[1]) if local_match else 0
    result = []
    for line in instructions:
        line = re.sub(r'(?<!\w)p(\d+)\b', lambda m: 'v' + str(locals_count + int(m[1])), line)
        line = re.sub(r'(?<![\w]):[\w]+', lambda m: '@' + str(labels[m[0]]), line)
        line = re.sub(r'^goto(?:/16|/32)? ', 'goto ', line)
        result.append(line.replace('const-string/jumbo ', 'const-string '))
    for handler in re.findall(r'^\s*(\.catch(?:all)?[^\n]+)', body, re.M):
        result.append('HANDLER ' + re.sub(r'(?<![\w]):[\w]+', lambda m: '@' + str(labels[m[0]]), handler))
    return result


def digest(body):
    return hashlib.sha256('\n'.join(canonical(body)).encode()).hexdigest()


def xml_digest(element, path=None):
    if element.tag == 'manifest':
        # APKS merging removes only split-install/source-stamp packaging data.
        # All permissions, services, host requirements and other metadata stay
        # in this whole-tree contract.
        element = copy.deepcopy(element)
        # APKTool 3 shortens these hex spellings; keep the same numeric feature
        # contract and historical digest without dropping any feature nodes.
        for feature in element.findall('uses-feature'):
            for attribute in (A + 'glEsVersion', A + 'version'):
                literal = feature.get(attribute, '')
                if re.fullmatch(r'0x[0-9a-fA-F]{1,8}', literal):
                    feature.set(attribute, f'0x{int(literal, 16):08x}')
        for name in ('requiredSplitTypes', 'splitTypes'): element.attrib.pop(A + name, None)
        packaging = {'com.android.vending.splits.required', 'com.android.vending.splits', 'com.android.vending.derived.apk.id', 'com.android.stamp.source', 'com.android.stamp.type'}
        for app in element.findall('application'):
            for child in list(app):
                if child.tag == 'meta-data' and child.get(A + 'name') in packaging: app.remove(child)
    if path == 'res/layout/view_settings_normal.xml':
        # Independently resolved from ORIGINAL base binary XML and density-split
        # ARSC: 0x7f080538=ic_phone, 0x7f0803c1=ic_bluetooth. Base-only apktool
        # renders these cross-split references as @null; APKS merging restores
        # their real names. Pin only these two exact nodes/identities.
        element = copy.deepcopy(element)
        for indexes, name, resource_id in [((0, 3, 9, 0), 'ic_phone', '0x7f080538'), ((0, 3, 9, 2), 'ic_bluetooth', '0x7f0803c1')]:
            node = element
            for index in indexes: node = node[index]
            assert node.tag == 'nl.flitsmeister.views.ColorFilterImageView'
            assert node.get(A + 'src') in ('@null', '@drawable/' + name)
            node.set(A + 'src', '@original-resource/' + resource_id)
    def value(k, v):
        if k in (A + 'layout_width', A + 'layout_height') and v == 'match_parent':
            return 'fill_parent'  # Both encode Android's parent dimension (-1).
        return re.sub(r'^(-?\d+)(?:\.0+)?(?:dip|dp)$', r'\1dp', v)
    def normalized(e):
        return [e.tag, sorted((k, value(k, v)) for k, v in e.attrib.items()), (e.text or '').strip(), [normalized(c) for c in e]]
    return hashlib.sha256(json.dumps(normalized(element), separators=(',', ':')).encode()).hexdigest()


def invoke_args(line):
    registers = line.split('{', 1)[1].split('}', 1)[0]
    if ' .. ' in registers:
        first, last = registers.split(' .. ')
        return [first[0] + str(i) for i in range(int(first[1:]), int(last[1:]) + 1)]
    return registers.split(', ') if registers else []


def run_fragment(instructions, start, registers, calls=None, stop=None, fields=None):
    """Execute actual emitted scalar/branch fragments at platform boundaries."""
    pc, result, seen = start, None, []
    for _ in range(3000):
        if stop is not None and stop(pc, instructions[pc], registers, seen):
            return registers, seen, pc
        line = instructions[pc]; pc += 1
        if line.startswith('const') and not line.startswith(('const-string', 'const-class')):
            reg, value = line.split(' ', 1)[1].split(', '); registers[reg] = int(value, 16)
        elif line == 'nop' or line.startswith('check-cast '): pass
        elif line.startswith('move-result'):
            registers[line.split()[1]] = result
        elif line.startswith(('move ', 'move-object ', 'move/from16 ', 'move-object/from16 ')):
            dest, src = line.split(' ', 1)[1].split(', '); registers[dest] = registers[src]
        elif line.startswith(('iget-boolean ', 'iget-object ', 'iget ')):
            dest, obj, ref = line.split(' ', 1)[1].split(', '); registers[dest] = registers[obj][ref]
        elif line.startswith('iput-object '):
            src, obj, ref = line.split(' ', 1)[1].split(', '); registers[obj][ref] = registers[src]
        elif line.startswith('new-instance '):
            dest, typ = line.split(' ', 1)[1].split(', '); registers[dest] = {'type': typ}
        elif line.startswith('const-class '):
            dest, typ = line.split(' ', 1)[1].split(', '); registers[dest] = typ
        elif line.startswith('const-string '):
            dest, text = line.split(' ', 1)[1].split(', ', 1); registers[dest] = json.loads(text)
        elif line.startswith(('sget-object ', 'sget ')):
            dest, ref = line.split(' ', 1)[1].split(', ')
            registers[dest] = {'Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;': True, 'Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;' : False}.get(ref, fields(ref) if fields else ref)
        elif line.startswith('instance-of '):
            dest, src, typ = line.split(' ', 1)[1].split(', '); registers[dest] = registers[src] == typ
        elif line.startswith('invoke-'):
            ref = line.split('}, ', 1)[1]
            vals = [registers.get(n) for n in invoke_args(line)]
            seen.append((ref, vals))
            if ref == 'Lijf;->b(Ljava/lang/Object;)V':
                if isinstance(vals[0], Exception): raise vals[0]
                result = None
            elif ref == 'Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;': result = bool(vals[0])
            elif ref == 'Ljava/lang/Boolean;->booleanValue()Z': result = bool(vals[0])
            elif calls is not None: result = calls(ref, vals)
            else: raise AssertionError(f'Unsupported fragment call {line}')
        elif line.startswith('if-'):
            op, args = line.split(' ', 1); args = args.split(', ')
            left = registers[args[0]]
            if op.endswith('z'): right, target = 0, args[1]; op = op[:-1]
            else: right, target = registers[args[1]], args[2]
            taken = {'if-eq': left == right, 'if-ne': left != right, 'if-lt': left < right if isinstance(left, (int, float)) and isinstance(right, (int, float)) else False, 'if-gt': left > right if isinstance(left, (int, float)) and isinstance(right, (int, float)) else False}.get(op)
            assert taken is not None, line
            if taken: pc = int(target[1:])
        elif line.startswith('shl-int/lit8 '):
            dest, src, value = line.split(' ', 1)[1].split(', '); registers[dest] = registers[src] << int(value, 16)
        elif line.startswith('and-int/lit8 '):
            dest, src, value = line.split(' ', 1)[1].split(', '); registers[dest] = registers[src] & int(value, 16)
        elif line.startswith('packed-switch '):
            reg, target = line.split(' ', 1)[1].split(', '); payload = instructions[int(target[1:])]
            entries = payload.split(' | '); base = int(entries[0].split()[-1], 16); offset = registers[reg] - base
            if 0 <= offset < len(entries) - 1: pc = int(entries[offset + 1][1:])
        elif line.startswith('goto '): pc = int(line.split('@')[1])
        elif line.startswith('return'):
            return registers.get(line.split()[1]) if line != 'return-void' else None
        else: raise AssertionError(f'Unsupported fragment instruction {line}')
    raise AssertionError('Fragment did not complete')


def behavior(root, unlock, hide, hide_ads=False):
    # Every mutated scalar/branch operation has an independent probe anchored in
    # the original invocation/continuation, plus full-body hash checks below.
    for desc, probes in PROBES.items():
        instructions = canonical(method(root, desc))
        if hide_ads and desc == 'Lgm8;->W(Landroid/content/Context;)Z':
            assert instructions == ['const/4 v0, 0x0', 'return v0']
            continue
        for probe in probes:
            enabled = {'unlock': unlock, 'hide': hide, 'either': unlock or hide}[probe['control']]
            if probe['type'] == 'scalar':
                anchors = [i for i, line in enumerate(instructions) if probe['ref'] in line and line.startswith('invoke-')]
                assert len(anchors) == probe['calls'], f'{desc}: exact original invocation cardinality'
                indexes = anchors if probe['which'] is None else [anchors[probe['which']]]
                for index in indexes:
                    result_reg = instructions[index + 1].split()[1]
                    for tier in (False, True):
                        regs = {result_reg: tier}
                        end = index + 2
                        while instructions[end].startswith('const/16 '):
                            dst, val = instructions[end].split(' ', 1)[1].split(', '); regs[dst] = int(val, 16); end += 1
                        assert regs[result_reg] == (probe['value'] if enabled else tier), f'{desc}: local scalar retains real provider and changes only eligibility'
            elif probe['type'] == 'state':
                refs = [line for line in instructions if ('Lrle;->b(' in line or HELPER + '->state(' in line)]
                assert len(refs) == 1 and refs[0].startswith('invoke-static '), f'{desc}: static State factory call kind'
                assert (HELPER in refs[0]) == enabled, f'{desc}: feature-scoped State replacement'
                index = instructions.index(refs[0]); assert instructions[index + 1].startswith('move-result-object ')
            elif probe['type'] == 'join':
                anchors = [i for i, line in enumerate(instructions) if 'Composer;->endDefaults()V' in line]
                assert len(anchors) == 1
                for explicit in (False, True):
                    for genuine in (False, True):
                        reg = probe['register']; value = explicit if probe['explicit'] else genuine
                        line = instructions[anchors[0] + 1]
                        if line.startswith('const/16 '):
                            dest, literal = line.split(' ', 1)[1].split(', ')
                            if dest == reg: value = int(literal, 16)
                        assert value == (1 if enabled else (explicit if probe['explicit'] else genuine)), f'{desc}: default and explicit false paths converge without changing selected options'
    # Run the complete six emitted Flow combination bodies: saved false remains
    # false, both original non-Pro defaults remain truthful without Unlock.
    for cls in ('am8', 'bm8', 'cm8', 'dm8', 'em8', 'fm8'):
        ins = canonical(method(root, 'L' + cls + ';->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'))
        locals_count = 1
        for tier in (False, True):
            for pref in (False, True):
                regs = {'v1': {'L' + cls + ';->a:Z': tier, 'L' + cls + ';->b:Z': pref}, 'v2': object()}
                expected = pref if unlock or tier else cls in ('bm8', 'em8')
                assert run_fragment(ins, 0, regs) == expected, f'{cls}: actual emitted saved-preference/tier flow'
        try: run_fragment(ins, 0, {'v1': {'L' + cls + ';->a:Z': False, 'L' + cls + ';->b:Z': False}, 'v2': ValueError('sentinel')})
        except ValueError: pass
        else: raise AssertionError(f'{cls}: coroutine failure propagation lost')


def setting_and_route_behavior(root, unlock, hide, hide_ads=False):
    settings = [desc for desc in PROBES if desc.startswith('Lgm8;->')]
    assert len(settings) == 48
    for desc in settings:
        body = method(root, desc); ins = canonical(body)
        locals_count = int(re.search(r'\.locals (\d+)', body)[1])
        enum = desc.endswith('Lnl/flitsmeister/fmcore/models/enums/AlertSignalTypes;')
        for tier in (False, True):
            for pref in (('SILENT', 'SELECTED_WARNING') if enum else (False, True)):
                def boundary(ref, vals):
                    if ref == 'Lsle;->b(Landroid/content/Context;)Z': return tier
                    if ref in ('Llph;->a(Landroid/content/Context;)Z', 'Lwc0;->a(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/preferences/AppPreference;)Ljava/lang/Boolean;'): return pref
                    if ref == 'Lta5;->b(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;': return pref
                    if 'SharedPreferences;->getString(' in ref: return pref
                    if 'getDefaultSharedPreferences(' in ref: return 'preferences'
                    if 'Gson;->toJson(' in ref: return 'default'
                    if ref.endswith('->getClass()Ljava/lang/Class;') or ref.endswith('Gson;-><init>()V'): return None
                    raise AssertionError(ref)
                def fields(ref):
                    if ref.startswith(('Lkph;', 'Lb38;')): return {'Llph;->a:Ljava/lang/String;': 'saved-key', 'Llph;->b:Ljava/lang/Object;': 'default'}
                    return ref
                value = run_fragment(ins, 0, {'v' + str(locals_count): {'Lgm8;->b:Lsle;': 'genuine-provider'}, 'v' + str(locals_count + 1): 'context'}, boundary, fields=fields)
                if hide_ads and desc == 'Lgm8;->W(Landroid/content/Context;)Z':
                    assert value == 0, 'General ads stay off for saved true/false and genuine Pro/non-Pro'
                elif unlock or tier:
                    assert value == pref, f'{desc}: real saved false/chosen enum must remain authoritative'
                elif enum:
                    assert value == 'Lnl/flitsmeister/fmcore/models/enums/AlertSignalTypes;->DEFAULT:Lnl/flitsmeister/fmcore/models/enums/AlertSignalTypes;'
                else:
                    fallback = next(line for line in reversed(ins) if line.startswith('const/4 '))
                    assert value == int(fallback.split(', ')[1], 16), f'{desc}: retained original non-Pro default'
    # Execute the actual Android Auto account/readiness/tier priority function.
    ins = canonical(method(root, 'Lea2;->j()V'))
    for account in (False, True):
        for obsolete in (False, True):
            for tier in (False, True):
                owner = {'Lea2;->K1:Lh68;': 'scope', 'Lea2;->a:Landroidx/car/app/CarContext;': 'context', 'Lea2;->Q1:Lsle;': 'genuine-provider', 'Lea2;->q:Z': obsolete, 'Lea2;->d:Lmdb;': 'old-state'}
                calls = []
                def auto_boundary(ref, vals):
                    calls.append((ref, vals))
                    if ref == 'Lib;->a()Lnl/flitsmeister/models/data/account/UserAccountFM;': return {'account': 'real'} if account else 0
                    if ref == 'Lsle;->b(Landroid/content/Context;)Z': return tier
                    return None
                run_fragment(ins, 0, {'v3': owner}, auto_boundary)
                expected = 'q' if obsolete else 'b' if not account else 'd' if unlock or tier else 'c'
                assert owner['Lea2;->d:Lmdb;'] == f'Lmdb;->{expected}:Lmdb;', 'Android Auto keeps account/version denial, changes only tier eligibility'
                assert sum('Lese;->a(' in ref for ref, _ in calls) == 1, 'Real state-change coroutine callback retained once'
    # Execute only the original invalid-state canvas fragment at the real
    # drawColor join. Notice-only never writes ALLOWED or changes ea2.d.
    ins = canonical(method(root, 'Lga2;->onDraw(Landroid/graphics/Canvas;)V'))
    start = next(i for i, line in enumerate(ins) if 'Canvas;->drawColor(I)V' in line) + 1
    loading = next(i for i in range(start, start + 8) if 'Lmdb;->a:Lmdb;' in ins[i])
    cleanup = int(ins[loading + 2].split('@')[1])
    renderer = int(ins[loading + 1].split('@')[1])
    for state in ('a', 'b', 'c', 'q'):
        owner = {'Lea2;->d:Lmdb;': f'Lmdb;->{state}:Lmdb;'}
        regs, seen, end = run_fragment(ins, start, {'v9': owner}, stop=lambda pc, line, regs, seen: pc in (cleanup, renderer))
        assert (end == cleanup) == (state == 'a' or (hide and state == 'c')), 'Suppress only NOT_PRO painting alongside existing loading cleanup'
        assert owner['Lea2;->d:Lmdb;'] == f'Lmdb;->{state}:Lmdb;', 'Canvas notices must preserve denied map state'
    # Real TripLogging activation/trial state selects the actual original route.
    ins = canonical(method(root, 'Lcnj;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;'))
    for tier in (False, True):
        for activated in (False, True):
            for trial in (False, True):
                def trip_boundary(ref, vals):
                    if ref == 'Lsle;->c(Landroid/content/Context;)Z': return tier
                    if ref == 'Lcsj;->c(Landroid/content/Context;)Z': return activated
                    if ref == 'Lcsj;->e(Landroid/content/Context;)Z': return trial
                    if ref == 'Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V': vals[0]['route'] = vals[2]
                    if 'Intent;->putExtra(' in ref: vals[0].setdefault('extras', {})[vals[1]] = vals[2]; return vals[0]
                    if 'Intent;->setFlags(' in ref: vals[0]['flags'] = vals[1]; return vals[0]
                    return None
                result = run_fragment(ins, 0, {'v2': 'context', 'v3': 'real-deeplink'}, trip_boundary)
                local_tier = unlock or tier
                expected = 'main/TripLoggingMainActivity' if (local_tier and activated) or trial else 'activation/TripLoggingActivateActivity' if local_tier else None
                assert result['route'] == ('Lnl/flitsmeister/features/triplogging/' + expected + ';' if expected else 'Lnl/flitsmeister/pro/presentation/ProPricingActivity;')
                assert result['flags'] == 0x10000000
                if expected and expected.startswith('main/'): assert result['extras']['trip_logging_deeplink'] == 'real-deeplink'
    # Menu route callbacks retain arguments and execute before the real menu close.
    for cls, route in (('bz5', 'k'), ('ryb', 'g'), ('nzb', 'l')):
        ins = canonical(method(root, 'L' + cls + ';->invoke()Ljava/lang/Object;'))
        local_count = {'bz5': 8, 'ryb': 6, 'nzb': 6}[cls]
        for tier in (False, True):
            emitted = []
            obj = {'L' + cls + ';->c:Landroidx/compose/runtime/State;': 'real-tier-state', 'L' + cls + ';->a:Lb49;': 'route-callback', 'L' + cls + ';->b:Lb0c;': 'menu-controller', 'Lbz5;->a:I': 1, 'Lbz5;->b:Lq49;': 'route-callback'}
            def menu_boundary(ref, vals):
                emitted.append((ref, vals))
                if 'State;->getValue()' in ref: return 'genuine-tier'
                if ref == 'Lljd;->b()Z': return tier
                if ref == 'Lljd;->a()Z': return False
                return None
            result = run_fragment(ins, 0, {'v' + str(local_count): obj}, menu_boundary)
            callbacks = [(ref, vals) for ref, vals in emitted if ref == 'Lb49;->invoke(Ljava/lang/Object;)Ljava/lang/Object;']
            assert len(callbacks) == 1 and callbacks[0][1][0] == 'route-callback'
            arg = callbacks[0][1][1]
            assert (arg == f'Lhtb${route};->a:Lhtb${route};') == (unlock or tier), f'{cls}: invoke real existing feature callback'
            if cls != 'bz5':
                close = next(i for i, (ref, _) in enumerate(emitted) if ref == 'Lb0c;->f(Ljava/lang/String;)V')
                invoke = next(i for i, (ref, _) in enumerate(emitted) if ref == 'Lb49;->invoke(Ljava/lang/Object;)Ljava/lang/Object;')
                assert invoke < close
            assert result == 'Ltvj;->a:Ltvj;'
    # Run the two actual selective avatar-badge paths for every tier. Avatar
    # rendering/real click paths around these fragments are whole-body pinned.
    for cls in ('cvb', 'eb0'):
        descriptor = next(desc for desc in METHOD_HASHES if desc.startswith('L' + cls + ';->' + ('b(' if cls == 'cvb' else 'invoke(')))
        ins = canonical(method(root, descriptor))
        badge = next(i for i, line in enumerate(ins) if 'Loy0;->a(' in line)
        join = next(i for i in range(badge, len(ins)) if ('Composer;->endNode()V' if cls == 'cvb' else 'Composer;->endReplaceGroup()V') in ins[i])
        start = badge - (4 if cls == 'cvb' else 7) if hide else badge
        for tier_class in ('Lpji$a;', 'Lpji$b;', 'Lpji$c;', 'Lpji$d;'):
            calls = []
            def badge_boundary(ref, vals):
                calls.append((ref, vals))
                if ref == 'Loy0;->a(Lpji;Landroidx/compose/runtime/Composer;)Lpy0;': return {'real-badge': vals[0]}
                if ref.startswith('Lcvb;->a('): return None
                raise AssertionError(ref)
            regs = {'v1': tier_class, 'v2': tier_class, 'v8': 'composer' if cls == 'eb0' else 'modifier', 'v11': 'composer', 'v12': 'real-badge-click'}
            regs, emitted, end = run_fragment(ins, start, regs, badge_boundary, stop=lambda pc, line, regs, seen: pc == join, fields=lambda ref: 0 if ref == 'Lpy0;->j:I' else ref)
            hidden = hide and tier_class in ('Lpji$b;', 'Lpji$c;')
            assert bool(calls) != hidden, 'Hide only Pro/Plus, preserve genuine Dash/Start badge mapping'
            if cls == 'cvb' and not hidden:
                leaf = next(vals for ref, vals in calls if ref.startswith('Lcvb;->a('))
                assert leaf[:2] == ['modifier', 'real-badge-click'] and leaf[2] == {'real-badge': tier_class}
            if cls == 'eb0': assert regs['v2'] == (0 if hidden else {'real-badge': tier_class}), 'Nullable py0 contract retains avatar and click continuation'
    if hide:
        ins = canonical(method(root, 'Lj6b;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'))
        writes = []
        def expired_boundary(ref, vals):
            if ref.endswith('->C()Lnl/flitsmeister/fmx/activities/main/k;'): return {'Lnl/flitsmeister/fmx/activities/main/k;->K3:Ljei;': 'ui-notice-state'}
            if ref == 'Ljei;->l(Ljava/lang/Object;Ljava/lang/Object;)Z': writes.append(vals); return True
            raise AssertionError('Expired notice must not construct/show a dialog: ' + ref)
        result = run_fragment(ins, 0, {'v7': {'Lj6b;->b:Lnl/flitsmeister/fmx/activities/main/MainActivity;': 'activity'}, 'v8': object()}, expired_boundary)
        assert result == 'Ltvj;->a:Ltvj;' and writes == [['ui-notice-state', 0, False]]
        try: run_fragment(ins, 0, {'v7': {}, 'v8': ValueError('coroutine failure')}, expired_boundary)
        except ValueError: pass
        else: raise AssertionError('Expired sink must check actual coroutine failure first')


def audit_emitted_calls(root, unlock, hide):
    state = source(root, 'Landroidx/compose/runtime/State;')
    header = next(line for line in state.splitlines() if line.startswith('.class '))
    assert 'interface' in header.split()
    assert re.search(r'^\.method public abstract getValue\(\)Ljava/lang/Object;', state, re.M), 'Actual Compose State interface contract'
    checked = 0
    for descriptor in METHOD_HASHES:
        for instruction in canonical(method(root, descriptor)):
            if not instruction.startswith('invoke-'): continue
            registers = invoke_args(instruction)
            numbers = [int(reg[1:]) for reg in registers]
            if '/range ' in instruction:
                assert len(numbers) <= 255 and numbers == list(range(numbers[0], numbers[-1] + 1)), 'Legal contiguous emitted invoke/range'
            else:
                assert len(numbers) <= 5 and all(0 <= reg < 16 for reg in numbers), 'Legal actual 35c call registers after parameter alias resolution'
            checked += 1
    assert checked > 2000, 'Audit full actual retained/emitted invocation corpus'
    if unlock:
        factory = method(root, HELPER + '->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;')
        constructor = method(root, HELPER + '-><init>()V')
        assert ' static ' in factory.splitlines()[0] and ' constructor ' in constructor.splitlines()[0] and ' static ' not in constructor.splitlines()[0]
        for descriptor, probes in PROBES.items():
            if not any(probe['type'] == 'state' for probe in probes): continue
            invocations = [line for line in canonical(method(root, descriptor)) if HELPER + '->state(' in line]
            assert len(invocations) == 1 and invocations[0].startswith('invoke-static ') and len(invoke_args(invocations[0])) == 1
    if hide:
        for descriptor, kind in [('Lijf;->b(Ljava/lang/Object;)V', 'static'), ('Lnl/flitsmeister/fmx/activities/main/MainActivity;->C()Lnl/flitsmeister/fmx/activities/main/k;', 'virtual'), ('Ljei;->l(Ljava/lang/Object;Ljava/lang/Object;)Z', 'virtual')]:
            target = method(root, descriptor).splitlines()[0]
            assert ('static' in target.split()) == (kind == 'static'), 'Actual expired-sink method call kinds'


def audit_consumer_inventory(root, unlock, hide_ads=False):
    references = {'sle': 'Lsle;->b(Landroid/content/Context;)Z', 'rle': 'Lrle;->b(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;', 'fmcore': 'Lt25;->j()Z', 'helper': HELPER + '->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;'}
    found = {name: set() for name in references}
    for directory in root.glob('smali*'):
        if not directory.is_dir(): continue
        for path in directory.rglob('*.smali'):
            text = path.read_text()
            if not any(reference in text for reference in references.values()): continue
            cls = re.search(r'^\.class[^\n]* (L\S+;)$', text, re.M)[1]
            for match in re.finditer(r'^\.method[^\n]* (\S+)\n(.*?)^\.end method', text, re.M | re.S):
                invocations = [line.strip() for line in match[2].splitlines() if line.strip().startswith('invoke-')]
                for name, reference in references.items():
                    if any(line.endswith('}, ' + reference) for line in invocations): found[name].add(cls + '->' + match[1])
    expected = {name: {desc for desc, row in ROW_CONTRACTS.items() if row[0] == name} for name in ('sle', 'rle', 'fmcore')}
    expected['sle'] |= {desc for desc in PROBES if desc.startswith('Lgm8;->')}
    if hide_ads:
        expected['sle'] -= {'Lgm8;->W(Landroid/content/Context;)Z', 'Lim8;->a(Landroid/content/Context;)Z'}
    lazy = {desc for desc, probes in PROBES.items() if any(probe['type'] == 'state' for probe in probes)}
    if unlock: expected['rle'] -= lazy
    expected['helper'] = lazy if unlock else set()
    for name in references:
        assert found[name] == expected[name], f'{name}: unknown/missing actual DEX consumer methods: extra={found[name] - expected[name]}, missing={expected[name] - found[name]}'


def pairip_class_digest(text, overrides=None):
    overrides = overrides or {}
    methods = {}
    for match in re.finditer(r'^\.method[^\n]* (\S+)\n.*?^\.end method', text, re.M | re.S):
        body = match[0]
        local = re.search(r'\.locals (\d+)', body)
        methods[match[1]] = [sorted(body.splitlines()[0].split()[1:-1]), int(local[1]) if local else None, overrides.get(match[1], canonical(body))]
    structure = [sorted(line.strip() for line in text.splitlines() if line.startswith(('.class ', '.super ', '.implements ', '.source ', '.field '))), methods]
    return hashlib.sha256(json.dumps(structure, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def verify_pairip(root, enabled):
    from flitsmeister_contracts import PAIRIP_CLASS_HASHES, PAIRIP_VM_CLASSES, PAIRIP_ASSET_HASHES, PAIRIP_NATIVE_HASHES
    from flitsmeister_runtime_contracts import class_overrides
    overrides = class_overrides(root, enabled, source, method, canonical)
    mismatches = [cls for cls, hashes in PAIRIP_CLASS_HASHES.items()
                  if pairip_class_digest(source(root, cls), overrides.get(cls)) != hashes[int(enabled)]]
    assert not mismatches, 'PairIP restoration: only guarded startup/signature/licensing and verified functional callback bodies, holders and merged helpers may differ; retained VM/caller/class contracts: ' + ', '.join(mismatches)
    for name, expected in PAIRIP_ASSET_HASHES.items():
        assert hashlib.sha256((root / name).read_bytes()).hexdigest() == expected, 'Preserve original asset bytes: ' + name
    actual_native = {str(path.relative_to(root)): hashlib.sha256(path.read_bytes()).hexdigest() for path in (root / 'lib').rglob('*.so')} if (root / 'lib').exists() else {}
    if enabled or actual_native:
        assert actual_native == PAIRIP_NATIVE_HASHES, 'Pin every native library; permit only exact stock MapLibre restoration'
    check = canonical(method(root, 'Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V'))
    if enabled:
        assert check == ['return-void'], 'Selected startup patch bypasses the public Java licensing entry'
        integrity = canonical(method(root, 'Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V'))
        helper = canonical(method(root, 'Lcom/pairip/SignatureCheck;->verifySignatureMatches(Ljava/lang/String;)Z'))
        initialize = canonical(method(root, 'Lcom/pairip/licensecheck/LicenseClient;->initializeLicenseCheck()V'))
        launch = canonical(method(root, 'Lcom/pairip/StartupLauncher;->launch()V'))
        assert integrity == ['return-void'] and initialize == ['return-void'] and launch == ['return-void']
        assert any('expectedSignature' in line for line in helper) and helper[-1] == 'return v1', 'Original signature helper retained; no global PackageManager spoof'
        holder = source(root, 'Lnl/flitsmeister/fmx/bottomsheets/wRJ/SHiKzGluDzF;')
        assert holder.count('sput-object') == 44
        assert 'NABmAPhZXVnGx:Ljava/lang/String;' in holder and 'const-string v0, "_npa"' in holder
        methods = source(root, 'Landroidx/credentials/exceptions/restorecredential/BgMS/zEkXceIdlHCjX;')
        assert methods.count('Ljava/lang/Class;->getDeclaredMethod(') == 4
        helpers = [
            'Landroidx/test/core/app/InstrumentationActivityInvoker$BootstrapActivity$c2020060317;',
            'Landroidx/test/core/app/InstrumentationActivityInvoker$BootstrapActivity$c2020060318;',
            'Landroidx/test/core/app/InstrumentationActivityInvoker$BootstrapActivity$c2020060319;',
            'Landroidx/test/core/app/InstrumentationActivityInvoker$EmptyActivity$c2020060317;',
            'Landroidx/test/core/app/InstrumentationActivityInvoker$EmptyActivity$c2020060318;',
            'Landroidx/test/core/app/InstrumentationActivityInvoker$EmptyActivity$c2020060319;',
            'Landroidx/test/core/app/InstrumentationActivityInvoker$EmptyFloatingActivity$c2020060317;',
            'Landroidx/test/core/app/InstrumentationActivityInvoker$EmptyFloatingActivity$c2020060318;',
            'Landroidx/test/core/app/InstrumentationActivityInvoker$EmptyFloatingActivity$c2020060319;',
            'Lcom/useinsider/insider/InsiderLoginActivity$c2020060317;',
            'Lnl/flitsmeister/FlitsmeisterApplication$c2020060317;',
            'Lnl/flitsmeister/app/MainComponentActivity$c2020060317;',
            'Lnl/flitsmeister/app/MainComponentActivity$c2020060318;',
            'Lnl/flitsmeister/features/overlay/FMOverlayService$c2020060317;',
            'Lnl/flitsmeister/launcher/presentation/LauncherActivity$c2020060317;',
            'Lnl/flitsmeister/launcher/presentation/LauncherActivity$c2020060318;',
            'Lnl/flitsmeister/services/car/BaseCarAppService$c2020060317;',
        ]
        assert all(source(root, helper).strip() for helper in helpers), 'Merge all 17 original embedded lifecycle classes'
    else:
        assert len(check) == 16 and any('LicenseClient$ImmediateTaskExecutor;->run(' in line for line in check)
    print(f'PASS: PairIP restoration={enabled}; {len(PAIRIP_CLASS_HASHES)} class contracts, {len(overrides)} verified functional callbacks, 22 original VM callers, 36 holders, 17 merged helpers, assets/native checked')


def verify(root: Path, selected: set[str]) -> None:
    assert selected <= NAMES, f'Unknown controls {selected - NAMES}'
    unlock, hide = 'Unlock Pro' in selected, 'Hide Pro notices' in selected
    verify_pairip(root, bool(selected))
    from verify_flitsmeister_parking import verify as verify_parking, FOOTER_ACTIVITY_HASHES, MAIN_ACTIVITY
    partners_disabled = 'Disable partner services' in selected
    verify_parking(root, partners_disabled, hide, 'Hide ads' in selected)
    from verify_flitsmeister_ads import verify as verify_ads
    hide_ads = 'Hide ads' in selected
    verify_ads(root, hide_ads, unlock, partners_disabled)
    from verify_flitsmeister_tracking import verify as verify_tracking
    from verify_flitsmeister_telemetry import verify as verify_telemetry
    tracking_disabled = 'Disable tracking' in selected
    verify_tracking(root, tracking_disabled)
    verify_telemetry(root, tracking_disabled)
    profile = int(unlock) + 2 * int(hide)
    # Coverage comes directly from the independent closed role tables, not
    # from production operation lists. Missing FEATURE rows cannot silently
    # become retained-hash expectations.
    families = {family: sum(row[0] == family for row in ROW_CONTRACTS.values()) for family in ('sle', 'rle', 'fmcore', 'routes')}
    assert families == {'sle': 64, 'rle': 46, 'fmcore': 17, 'routes': 4}
    for desc, (family, role, target) in ROW_CONTRACTS.items():
        hashes = METHOD_HASHES[desc]
        wanted = {'retain': [False, False, False], 'unlock': [True, False, True], 'hide': [False, True, True], 'either': [True, True, True]}[role]
        assert [h != hashes[0] for h in hashes[1:]] == wanted, f'{family}/{target}: independently classified control predicate/retained row'
    failures = []
    for desc, expected in METHOD_HASHES.items():
        body = method(root, desc)
        flags = sorted(body.splitlines()[0].split()[1:-1])
        local_match = re.search(r'\.locals (\d+)', body)
        assert [flags, int(local_match[1]) if local_match else None] == METHOD_SHAPES[desc], f'{desc}: original method flags/register layout'
        actual = digest(body)
        if hide_ads and desc in {'Lgm8;->W(Landroid/content/Context;)Z', 'Lim8;->a(Landroid/content/Context;)Z'}:
            assert canonical(body) == ['const/4 v0, 0x0', 'return v0'], desc + ': general ads must stay off'
        elif tracking_disabled and desc == 'Lz80;->j(Ljava/lang/String;Ljava/util/Map;)V':
            assert canonical(body) == ['return-void'], 'Insider event bridge must not collect events'
        elif partners_disabled and desc == MAIN_ACTIVITY:
            if actual != FOOTER_ACTIVITY_HASHES[int(hide)]: failures.append(desc)
        elif actual != expected[profile]: failures.append(desc)
    assert not failures, f'{len(failures)} entire-method contracts differ for selection {selected}; first: ' + ', '.join(failures[:5])
    for path, expected in RESOURCE_HASHES.items():
        doc = ET.parse(root / path).getroot()
        wanted = expected[int(hide)]
        if path == 'AndroidManifest.xml' and selected:
            wanted = ('51f42612fa08c69e387f6651e89235784e99d63979b3394caf447b0dc248da18'
                      if tracking_disabled else 'd43b9b34e37dc32d307180b8332d03e2114d38efd542706e6a0f36994ddd5c37')
        assert xml_digest(doc, path) == wanted, f'{path}: fixed nodes, IDs, unrelated geometry/content and manifest/host invariants'
        if selected and path == 'res/layout/view_settings_normal.xml':
            public = ET.parse(root / 'res/values/public.xml').getroot()
            for indexes, name, resource_id in [((0, 3, 9, 0), 'ic_phone', '0x7f080538'), ((0, 3, 9, 2), 'ic_bluetooth', '0x7f0803c1')]:
                node = doc
                for index in indexes: node = node[index]
                assert node.get(A + 'src') == '@drawable/' + name, 'Merged settings icons must retain real cross-split resources'
                entries = [entry for entry in public if entry.get('type') == 'drawable' and entry.get('name') == name]
                assert len(entries) == 1 and entries[0].get('id') == resource_id, 'Actual merged icon ID matches original binary XML/ARSC'

    helper_paths = list(root.glob('smali*/morphe/flitsmeister/FeatureEligibility.smali')) + list(root.glob('smali/smali*/morphe/flitsmeister/FeatureEligibility.smali'))
    assert len(helper_paths) == int(unlock), 'Exactly one immutable feature-local State helper only with Unlock'
    if unlock:
        helper = helper_paths[0].read_text()
        assert '.class public final ' + HELPER in helper and '.super Ljava/lang/Object;' in helper
        assert '.implements Landroidx/compose/runtime/State;' in helper and not re.search(r'^\.field ', helper, re.M)
        assert re.search(r'\.method public getValue\(\)Ljava/lang/Object;', helper)
        signatures = re.findall(r'^\.method[^\n]* (\S+)', helper, re.M)
        assert sorted(signatures) == sorted(['<init>()V', 'getValue()Ljava/lang/Object;', 'state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;'])
        assert re.search(r'\.method public static state\(', helper)
        assert canonical(method(root, HELPER + '->getValue()Ljava/lang/Object;')) == ['sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;', 'return-object v0']
        state = canonical(method(root, HELPER + '->state(Landroidx/compose/runtime/Composer;)Landroidx/compose/runtime/State;'))
        assert state == ['new-instance v0, ' + HELPER, 'invoke-direct {v0}, ' + HELPER + '-><init>()V', 'return-object v0'], 'Fresh immutable State, no global writes'
        uses = sum(HELPER + '->state(' in line for desc in METHOD_HASHES for line in canonical(method(root, desc)))
        assert uses == 10, 'Exactly the ten classified feature-local callsites'
    behavior(root, unlock, hide, hide_ads)
    setting_and_route_behavior(root, unlock, hide, hide_ads)
    audit_emitted_calls(root, unlock, hide)
    audit_consumer_inventory(root, unlock, hide_ads)
    print(f'PASS: Flitsmeister unlock={unlock}, notices={hide}; {len(METHOD_HASHES)} entire methods, resources/hosts, actual fragments and helper contracts')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('-e', '--enable', action='append', default=[], choices=sorted(NAMES))
    args = parser.parse_args()
    verify(args.decoded, set(args.enable))
