"""Verify decoded Dumpert 5.8.0 against independently pinned original contracts."""
import argparse
from functools import lru_cache
import hashlib
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from dex_declarations import ClassDeclaration, DexDeclarations, MethodDeclaration
from dumpert_contracts import CONTRACTS, METADATA, AD_PERMISSIONS, RETAINED_COMPONENTS, EXECUTABLE_ASSETS
from verify_parool import sdk_classes
from dumpert_ui_contracts import UI_CONTRACTS
from verify_dumpert_ui import restore_ui, verify_ui_flows, verify_ui_resources

CONTRACTS = CONTRACTS + UI_CONTRACTS

NAMES = {'Hide ads', 'Disable tracking', 'Skip consent screens'}
A = '{http://schemas.android.com/apk/res/android}'
APP = 'Lnl/livewall/dumpert/'
CCT = 'Lcom/google/android/datatransport/cct/CctTransportBackend;'
BACKEND_REQUEST = 'Lcom/google/android/datatransport/runtime/backends/BackendRequest;'
BACKEND_RESPONSE = 'Lcom/google/android/datatransport/runtime/backends/BackendResponse;'
CCT_HELPER = 'morpheMeasurementBatch(' + BACKEND_REQUEST + ')' + BACKEND_REQUEST
MEASUREMENT_TRANSPORTS = {'FIREBASE_CRASHLYTICS_REPORT', 'FIREBASE_APPQUALITY_SESSION',
                          'FCM_CLIENT_EVENT_LOGGING', 'GDT_CLIENT_METRICS'}


def xml_digest(node):
    """Hash manifest meaning, excluding attribute order and indentation/tails."""
    import json
    def value(element):
        return [element.tag, sorted(element.attrib.items()), (element.text or '').strip(),
                [value(child) for child in element]]
    return hashlib.sha256(json.dumps(value(node), separators=(',', ':')).encode()).hexdigest()


def canonicalize(body, skip=0):
    labels, instructions, annotations = {}, [], 0
    for raw in body.splitlines():
        line = raw.strip()
        if line.startswith('.annotation'):
            annotations += 1
        if line.startswith('.end annotation'):
            annotations -= 1
            continue
        if annotations or not line or line.startswith(('.', '#')):
            continue
        if line.startswith(':'):
            labels[line] = len(instructions)
        else:
            instructions.append(line.split('    #')[0].replace('const-string/jumbo ', 'const-string '))
    return [re.sub(r'(?<!\S):[a-zA-Z0-9_]+', lambda m: '@' + str(labels[m[0]] - skip), line)
            for line in instructions[skip:]]


def absolute_registers(line, locals_):
    # Register operands have whitespace/brace/comma delimiters. Names such as
    # ->p0:field, ->p1(method) and :p0 labels are not parameter registers.
    operands, separator, literal = line.partition('"')
    return re.sub(r'(?<=[\s{,])p(\d+)(?=[,\s}]|$)', lambda m: 'v' + str(locals_ + int(m[1])), operands) + separator + literal


class Smali:
    def __init__(self, root):
        self.root = root

    @lru_cache(maxsize=None)
    def text(self, owner):
        cls = owner[1:-1]
        files = list(self.root.glob('smali*/' + cls + '.smali')) + list(self.root.glob('smali/smali*/' + cls + '.smali'))
        assert len(files) == 1, f'Expected one decoded {owner}, found {len(files)}'
        return files[0].read_text()

    def body(self, owner, signature):
        hits = re.findall(r'^\.method[^\n]* ' + re.escape(signature) + r'\n(.*?)^\.end method', self.text(owner), re.M | re.S)
        assert len(hits) == 1, f'Missing/ambiguous {owner}->{signature}'
        return hits[0]


def audit_call(line, caller, declarations, sdk_read=None):
    match = re.search(r'invoke-(static|virtual|interface|direct|super)(?:/range)?\s+\{[^}]*\},\s+(L[^;]+;)->(\S+)', line)
    if not match:
        assert not line.startswith('invoke-'), 'Unrecognized emitted invocation: ' + line
        return
    kind, owner, signature = match.groups()
    target_class = declarations.classes.get(owner)
    if target_class:
        method = declarations.resolve_method(owner, signature)
        assert method, 'Missing invoked method: ' + line
        flags, interface = method.access_flags, target_class.is_interface
    else:
        target = sdk_read(owner) if sdk_read else None
        assert target, 'Missing invoked class: ' + owner
        interface = target[0]
        while signature not in target[2] and target[1]:
            target = sdk_read(target[1])
            assert target, 'Missing invoked SDK parent: ' + line
        assert signature in target[2], 'Missing invoked SDK method: ' + line
        flags = target[2][signature]
    assert (kind == 'static') == bool(flags & 8), 'DEX static/instance mismatch: ' + line
    if not flags & 8:
        direct = bool(flags & 2) or signature.startswith('<init>(')
        assert (kind == 'direct') == direct, 'DEX direct/private mismatch: ' + line
        if flags & 2:
            assert caller == owner, 'Private callback belongs to another class: ' + line
    if kind in {'virtual', 'interface'}:
        assert (kind == 'interface') == interface, 'DEX class/interface mismatch: ' + line


def smali_declarations(root):
    """Strict slower fallback for manual use without an APK; no unknown-type skip."""
    flags = {'public': 1, 'private': 2, 'protected': 4, 'static': 8, 'final': 16, 'synchronized': 32,
             'bridge': 64, 'varargs': 128, 'native': 256, 'interface': 512, 'abstract': 1024,
             'strictfp': 2048, 'synthetic': 4096, 'annotation': 8192, 'enum': 16384,
             'constructor': 65536, 'declared-synchronized': 131072}
    classes = {}
    for folder in (root, root / 'smali'):
        for base in folder.glob('smali*'):
            if not base.is_dir():
                continue
            for path in base.rglob('*.smali'):
                text = path.read_text()
                header = re.search(r'^\.class (.+) (L[^;]+;)$', text, re.M)
                assert header, 'Missing class header: ' + str(path)
                owner = header[2]
                assert owner not in classes, 'Duplicate class: ' + owner
                access = sum(flags[x] for x in header[1].split())
                parent = re.search(r'^\.super (L[^;]+;)$', text, re.M)
                methods = {}
                for match in re.finditer(r'^\.method (.+) (\S+)\n', text, re.M):
                    signature, values = match[2], match[1].split()
                    assert signature not in methods, 'Duplicate method: ' + owner + signature
                    method_flags = sum(flags[x] for x in values)
                    kind = 'direct' if method_flags & 10 or signature.startswith(('<init>(', '<clinit>(')) else 'virtual'
                    methods[signature] = MethodDeclaration(owner, signature, method_flags, kind, 0)
                interfaces = tuple(re.findall(r'^\.implements (L[^;]+;)$', text, re.M))
                classes[owner] = ClassDeclaration(owner, access, parent[1] if parent else None, interfaces, methods, str(path))
    assert classes, 'No decoded DEX declarations'
    return DexDeclarations(classes, 'decoded-smali-fallback')


def prefix_for(policy):
    simple = {
        'STOP': ['return-void'], 'FALSE': ['const/4 v0, 0x0', 'return v0'],
        'TRUE': ['const/4 v0, 0x1', 'return v0'], 'NULL': ['const/4 v0, 0x0', 'return-object v0'],
        'UNIT': ['sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;', 'return-object v0'],
        'STRING': ['const-string v0, ""', 'return-object v0'],
        'MAP': ['invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;', 'move-result-object v0', 'return-object v0'],
        'LIST': ['invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;', 'move-result-object v0', 'return-object v0'],
        'PARAM_FALSE': ['const/4 p1, 0x0'], 'STATIC_FALSE': ['const/4 p0, 0x0'],
        'BOXED_FALSE': ['sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;'],
        'CALLBACK': ['const/4 v0, 0x0', 'invoke-direct {p0, p1, v0}, Lio/piano/android/cxense/SendTask;->notifyCallback(Ljava/util/List;Ljava/lang/Exception;)Lkotlin/Unit;', 'return-void'],
        'UUID': ['invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;', 'move-result-object v0',
                 'invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;', 'move-result-object v0',
                 'move-object/from16 v1, p0', 'iput-object v0, v1, Lnl/livewall/dumpert/piano/CxenseManager;->lastRndValue:Ljava/lang/String;', 'return-object v0'],
        'ADID': ['new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;',
                 'const-string v1, "00000000-0000-0000-0000-000000000000"', 'const/4 v2, 0x1',
                 'invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V', 'return-object v0'],
        'CCT': ['invoke-static {p1}, ' + CCT + '->' + CCT_HELPER, 'move-result-object p1',
                'if-nez p1, @6', 'invoke-static {}, ' + BACKEND_RESPONSE + '->fatalError()' + BACKEND_RESPONSE,
                'move-result-object v0', 'return-object v0'],
    }
    return simple[policy.split('_', 1)[1]]


def run_injector(code, items):
    """Execute the emitted interval<=0 branch; use actual Function1 slot mapping."""
    mapped, registers, result, pc = [], {'p0': {'adInterval': 100}, 'p1': items}, None, 0
    wrapper = lambda item: {'content': item, 'slot': 'editorial'}
    for _ in range(10000):
        line = code[pc]
        pc += 1
        if line.startswith('const-string '):
            registers[line.split()[1].rstrip(',')] = line.split(', ', 1)[1]
        elif line.startswith(('const/4 ', 'const/16 ')):
            reg, value = line.split(' ', 1)[1].split(', ')
            registers[reg] = int(value, 0)
        elif line.startswith('iget '):
            reg, obj, field = line.split(' ', 1)[1].split(', ')
            registers[reg] = registers[obj][field.split('->')[1].split(':')[0]]
        elif line.startswith('if-gtz '):
            reg, target = line.split(' ', 1)[1].split(', ')
            if registers[reg] > 0:
                pc = int(target[1:])
        elif line.startswith('if-eqz '):
            reg, target = line.split(' ', 1)[1].split(', ')
            if not registers[reg]:
                pc = int(target[1:])
        elif line.startswith('goto '):
            pc = int(line.split('@')[1])
        elif line.startswith('check-cast '):
            pass
        elif line.startswith('new-instance '):
            registers[line.split()[1].rstrip(',')] = []
        elif line.startswith('iget-object ') and '->createItemSlot:' in line:
            registers[line.split()[1].rstrip(',')] = wrapper
        elif line.startswith('move-result'):
            registers[line.split()[1]] = result
        elif line.startswith('invoke-'):
            args = [registers[r] for r in re.search(r'\{([^}]*)\}', line)[1].split(', ') if r]
            if '->checkNotNullParameter(' in line or 'ArrayList;-><init>(' in line:
                pass
            elif '->collectionSizeOrDefault(' in line:
                result = len(args[0])
            elif '->iterator()' in line:
                result = {'items': args[0], 'position': 0}
            elif '->hasNext()' in line:
                result = int(args[0]['position'] < len(args[0]['items']))
            elif '->next()' in line:
                result = args[0]['items'][args[0]['position']]
                args[0]['position'] += 1
            elif 'Function1;->invoke(' in line:
                result = args[0](args[1])
                mapped.append(result)
            elif '->add(' in line:
                args[0].append(args[1])
                result = 1
            else:
                raise AssertionError('Unsupported injector invocation: ' + line)
        elif line.startswith('return-object '):
            output = registers[line.split()[1]]
            assert output is not items and output == mapped, 'Return original mapped slots, never raw input'
            assert len(output) == len(items) and all(slot['content'] is item for slot, item in zip(output, items)), 'Preserve editorial identity/order'
            return output
        else:
            raise AssertionError('Unsupported injector instruction: ' + line)
    raise AssertionError('Injector did not terminate')


def execute(code, registers, invoke, start=0):
    """Small strict executor for actual fallback/cleanup graphs, not Android itself."""
    import json
    result, pc = None, start
    for _ in range(10000):
        line = code[pc]
        pc += 1
        op, _, operands = line.partition(' ')
        args = operands.split(', ')
        if op.startswith('const-string'):
            registers[args[0]] = json.loads(operands.split(', ', 1)[1])
        elif op.startswith('const'):
            registers[args[0]] = int(args[1], 0)
            if op.startswith('const-wide'):
                registers[args[0][0] + str(int(args[0][1:]) + 1)] = 0
        elif op.startswith('move-result'):
            registers[args[0]] = result
            if op == 'move-result-wide':
                registers[args[0][0] + str(int(args[0][1:]) + 1)] = 0
        elif op.startswith('move'):
            registers[args[0]] = registers[args[1]]
        elif op.startswith('iget'):
            field = args[2].split('->')[1].split(':')[0]
            registers[args[0]] = registers[args[1]][field]
        elif op.startswith('iput'):
            field = args[2].split('->')[1].split(':')[0]
            registers[args[1]][field] = registers[args[0]]
        elif op.startswith('sget'):
            registers[args[0]] = operands.split(', ', 1)[1]
        elif op == 'check-cast':
            pass
        elif op == 'new-instance':
            registers[args[0]] = [] if args[1] == 'Ljava/util/ArrayList;' else {'type': args[1]}
        elif op == 'new-array':
            registers[args[0]] = [None] * registers[args[1]]
        elif op == 'cmp-long':
            a, b = registers[args[1]], registers[args[2]]
            registers[args[0]] = (a > b) - (a < b)
        elif op == 'sub-long/2addr':
            registers[args[0]] -= registers[args[1]]
        elif op == 'add-int/2addr':
            registers[args[0]] += registers[args[1]]
        elif op == 'xor-int/lit8':
            registers[args[0]] = registers[args[1]] ^ int(args[2], 0)
        elif op.startswith('if-'):
            values = [registers[a] for a in args[:-1]]
            a, b = values[0], values[1] if len(values) == 2 else 0
            # DEX const/4 zero represents null as well as primitive false.
            equal = a == b or (not a and not b)
            if op in {'if-eqz', 'if-eq'}:
                take = equal
            elif op in {'if-nez', 'if-ne'}:
                take = not equal
            elif op == 'if-gtz':
                take = a > 0
            elif op == 'if-lez':
                take = a <= 0
            elif op == 'if-ge':
                take = a >= b
            else:
                raise AssertionError('Unsupported execution branch: ' + line)
            if take:
                pc = int(args[-1][1:])
        elif op.startswith('goto'):
            pc = int(operands[1:])
        elif op.startswith('invoke-'):
            match = re.search(r'\{([^}]*)\}, (.+)', operands)
            regs, target = match.groups()
            if ' .. ' in regs:
                first, last = regs.split(' .. ')
                regs = [first[0] + str(i) for i in range(int(first[1:]), int(last[1:]) + 1)]
            else:
                regs = regs.split(', ') if regs else []
            result = invoke(target, [registers[r] for r in regs])
        elif op == 'return-void':
            return None
        elif op.startswith('return'):
            return registers[operands]
        else:
            raise AssertionError('Unsupported execution instruction: ' + line)
    raise AssertionError('Execution did not terminate')


def verify_player_contracts(source):
    def body(cls, name):
        row = next(row for row in CONTRACTS if row[0] == APP + cls + ';' and row[1].startswith(name + '('))
        return canonicalize(source.body(row[0], row[1]))

    # Detail nullable ad configuration must still reach the ordinary builder.
    detail = body('screens/content_detail/detail/meda_views/RetainedMediaPlayer', 'createMediaItem')
    builder = {'uri': 'fixture://content', 'mime': 'video/mp4', 'metadata': object()}
    calls = []
    def detail_call(target, args):
        calls.append(target)
        if '->build()Landroidx/media3/common/MediaItem;' in target:
            return args[0]
        if '->checkNotNullExpressionValue(' in target:
            return None
        raise AssertionError('Unexpected detail fallback call: ' + target)
    assert execute(detail, {'p1': 0, 'p3': builder}, detail_call, start=99) is builder
    assert len([c for c in calls if '->build(' in c]) == 1 and not any('->setAdsConfiguration(' in c for c in calls)

    # Shorts' real null-ad path prepares URI content and restores repeat mode.
    prepare = body('screens/shorts/ShortsPlayerPool', 'preparePrerollOn')
    helper = body('screens/shorts/ShortsPlayerPool', 'createMediaItemWithPreroll')
    assert execute(helper, {}, lambda *_: None) == 0, 'Actual preroll helper must return null'
    for loader in (0, {'real': 'loader'}):
        state, player = {'repeat': 0, 'prepared': 0}, {'real': 'player'}
        def prepare_call(target, args):
            if '->getMedia(' in target:
                return []
            if '->firstOrNull(' in target:
                return 0
            if '->getItemUri(' in target:
                return 'fixture://content'
            if '->createMediaItemWithPreroll(' in target:
                return execute(helper, {}, lambda *_: None)
            if '->getPlayer()' in target:
                return player
            if '->setRepeatMode(' in target:
                state['repeat'] = args[1]
                return None
            if 'MediaItem;->fromUri(' in target:
                return {'uri': args[0]}
            if '->setMediaItem(' in target:
                state['media'] = args[1]
                return None
            if '->prepare()' in target:
                state['prepared'] += 1
                return None
            if 'StringBuilder;->' in target:
                return args[0] if '->toString(' not in target else 'log'
            if 'Timber$Forest;->w(' in target:
                return None
            raise AssertionError('Unexpected Shorts fallback call: ' + target)
        result = execute(prepare, {'p0': {'adsLoader': loader}, 'p1': {'player': player}, 'p2': {'post': True}}, prepare_call)
        assert result == 0 and state == {'repeat': 1, 'prepared': 1, 'media': {'uri': 'fixture://content'}}, 'Prepare plain Shorts content before reporting no preroll'

    # A genuine old/ad-error break clears its latch, loading, observer and job.
    end = body('screens/shorts/DefaultShortsPlayerCoordinator', 'endAdBreak')
    for did_start in (0, 1):
        state = {'adBreakLatched': 1, 'breakCommittedAtMs': 0, 'breakFetchFailed': 1,
                 'adDidStart': did_start, 'adStartWatchdogJob': {'active': 1},
                 '_isPlayingAd': {'value': 1}, '_isAdLoading': {'value': 1}, 'playerPool': {'pool': 1}}
        effects = []
        def cleanup_call(target, args):
            if '->getValue(' in target:
                return args[0]['value']
            if '->booleanValue(' in target:
                return int(args[0])
            if 'Boolean;->valueOf(' in target:
                return int(args[0])
            if '->compareAndSet(' in target:
                assert args[0]['value'] == args[1]
                args[0]['value'] = args[2]
                return 1
            if '->getAdPlaybackStateObserver(' in target or '->getWatchTimeTracker(' in target:
                return {'observer': 1}
            if any(x in target for x in ('->restoreLoopingOnActive(', '->reset(', '->cancel$default(', '->prerollShown(', '->prerollFailed(')):
                effects.append(target.split('->')[1].split('(')[0])
                return None
            if 'StringBuilder;->' in target:
                return args[0] if '->toString(' not in target else 'log'
            if 'Timber$Forest;->w(' in target:
                return None
            raise AssertionError('Unexpected break cleanup call: ' + target)
        execute(end, {'p0': state, 'p1': 'fixture'}, cleanup_call)
        assert state['adBreakLatched'] == state['adDidStart'] == state['_isPlayingAd']['value'] == state['_isAdLoading']['value'] == 0
        assert not state['adStartWatchdogJob'] and effects == ['cancel$default', 'restoreLoopingOnActive', 'reset', 'prerollShown' if did_start else 'prerollFailed'], 'Preserve real ad result and clear all player locks'


def verify_tracking_contracts(source):
    import uuid
    unit = 'Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;'
    false_box = 'Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;'
    true_box = 'Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;'
    observed = []
    analytics = {'zzb': {'real': 'measurement'}}
    crashlytics = {'core': {'real': 'crash-core'}}
    def run(owner, signature, args):
        return execute(canonicalize(source.body(owner, signature)), {'p' + str(i): arg for i, arg in enumerate(args)}, setting_call)
    def setting_call(target, args):
        if target == 'Lcom/google/firebase/analytics/AnalyticsKt;->getAnalytics(Lcom/google/firebase/Firebase;)Lcom/google/firebase/analytics/FirebaseAnalytics;':
            return analytics
        if target.startswith('Lcom/google/firebase/analytics/FirebaseAnalytics;->setAnalyticsCollectionEnabled('):
            return run('Lcom/google/firebase/analytics/FirebaseAnalytics;', target.split('->')[1], args)
        if target == 'Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;':
            return true_box if args[0] else false_box
        if target in {'Lcom/google/android/gms/internal/measurement/zzfb;->zzq(Ljava/lang/Boolean;)V',
                      'Lcom/google/firebase/crashlytics/internal/common/CrashlyticsCore;->setCrashlyticsCollectionEnabled(Ljava/lang/Boolean;)V'}:
            observed.append(args[1])
            return None
        raise AssertionError('Unexpected collection re-enable path: ' + target)
    for enabled in (0, 1):
        observed.clear()
        run(APP + 'consent/DidomiConsentManagerImpl;', 'setAnalyticsAnonymization(Z)V', [{}, enabled])
        run('Lcom/google/firebase/crashlytics/FirebaseCrashlytics;', 'setCrashlyticsCollectionEnabled(Z)V', [crashlytics, enabled])
        for boxed in (0, false_box, true_box):
            run('Lcom/google/firebase/crashlytics/FirebaseCrashlytics;', 'setCrashlyticsCollectionEnabled(Ljava/lang/Boolean;)V', [crashlytics, boxed])
        assert observed == [false_box] * 5, 'Real consent/startup re-enable must delegate nonnull Boolean.FALSE'
    for owner, signature, _, locals_, _, _, policy in CONTRACTS:
        if policy not in {'TRACK_UUID', 'TRACK_UNIT', 'TRACK_NULL', 'TRACK_STRING', 'TRACK_LIST', 'TRACK_MAP', 'TRACK_TRUE', 'TRACK_ADID'}:
            continue
        state = {'lastRndValue': 'cached'}
        def call(target, args):
            if target == 'Ljava/util/UUID;->randomUUID()Ljava/util/UUID;':
                return uuid.uuid4()
            if target == 'Ljava/util/UUID;->toString()Ljava/lang/String;':
                return str(args[0])
            if target == 'Ljava/util/Collections;->emptyList()Ljava/util/List;':
                return []
            if target == 'Ljava/util/Collections;->emptyMap()Ljava/util/Map;':
                return {}
            if target == 'Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;-><init>(Ljava/lang/String;Z)V':
                args[0].update(id=args[1], limit=args[2])
                return None
            raise AssertionError('Neutral typed completion reached optional SDK/network: ' + target)
        code = [absolute_registers(line, locals_) for line in canonicalize(source.body(owner, signature))]
        result = execute(code, {'v' + str(locals_): state}, call)
        if policy == 'TRACK_UUID':
            assert isinstance(result, str) and str(uuid.UUID(result)) == result and state['lastRndValue'] == result, 'Pageview fallback String and stored correlation must match'
        else:
            expected = {'TRACK_UNIT': unit, 'TRACK_NULL': 0, 'TRACK_STRING': '', 'TRACK_LIST': [], 'TRACK_MAP': {}, 'TRACK_TRUE': 1}
            if policy == 'TRACK_ADID':
                assert result['id'] == '00000000-0000-0000-0000-000000000000' and result['limit'] == 1
            else:
                assert type(result) is type(expected[policy]) and result == expected[policy], 'Actual synchronous completion type: ' + owner + signature

    # Execute all four actual send prefixes, private conversion helpers and the
    # actual callback dispatch for absent/present callbacks and sent/unsent data.
    send = 'Lio/piano/android/cxense/SendTask;'
    def invoke_method(signature, args, callback):
        code = canonicalize(source.body(send, signature))
        return execute(code, {'p' + str(i): arg for i, arg in enumerate(args)}, callback)
    for has_callback in (False, True):
        for records in ([], [{'customId': 'first', 'isSent': 0}, {'customId': 'second', 'isSent': 1}]):
            for _, signature, *_, policy in [row for row in CONTRACTS if row[0] == send and row[-1] == 'TRACK_CALLBACK']:
                delivered = []
                state = {'sendCallback': {'real': 1} if has_callback else 0}
                def dispatch(target, args):
                    if target.startswith(send + '->notifyCallback(') or target.startswith(send + '->toEventStatus('):
                        return invoke_method(target.split('->', 1)[1], args, dispatch)
                    if '->collectionSizeOrDefault(' in target:
                        return len(args[0])
                    if 'ArrayList;-><init>(' in target:
                        return None
                    if '->iterator()' in target:
                        return {'items': args[0], 'index': 0}
                    if '->hasNext()' in target:
                        return int(args[0]['index'] < len(args[0]['items']))
                    if '->next()' in target:
                        item = args[0]['items'][args[0]['index']]
                        args[0]['index'] += 1
                        return item
                    if 'EventRecord;->getCustomId(' in target:
                        return args[0]['customId']
                    if 'EventRecord;->isSent(' in target:
                        return args[0]['isSent']
                    if 'EventStatus;-><init>(' in target:
                        args[0].update(customId=args[1], isSent=args[2], exception=args[3])
                        return None
                    if 'Collection;->add(' in target:
                        args[0].append(args[1])
                        return 1
                    if 'DispatchEventsCallback;->onDispatch(' in target:
                        delivered.append([(item['customId'], item['isSent'], item['exception']) for item in args[1]])
                        return None
                    raise AssertionError('Suppressed queued send reached transport or invented completion: ' + target)
                assert invoke_method(signature, [state, records], dispatch) is None
                assert delivered == ([[(r['customId'], r['isSent'], 0) for r in records]] if has_callback else []), 'Preserve real callback/customId/isSent without inventing delivery'


def verify(root: Path, selected: set[str], apk: Path | None = None):
    assert selected <= NAMES, 'Unknown Dumpert selection'
    tracking = bool(selected & {'Disable tracking', 'Skip consent screens'})
    ads = tracking or 'Hide ads' in selected
    consent = 'Skip consent screens' in selected
    source = Smali(root)
    declarations = DexDeclarations.from_apk(apk) if apk else smali_declarations(root)
    assert (CCT_HELPER in declarations.classes[CCT].methods) == tracking, 'Install selective persisted-measurement gate only with Disable tracking'
    sdk_read, sdk_archive = sdk_classes()
    try:
        owned = {(row[0], row[1]) for row in CONTRACTS}
        if tracking:
            owned.add((CCT, CCT_HELPER))
            helper = declarations.classes[CCT].methods[CCT_HELPER]
            assert helper.access_flags == 0x9, 'CCT filter is a concrete public static helper'
            helper_body = source.body(CCT, CCT_HELPER)
            assert re.search(r'\.locals 6\b', helper_body), 'CCT filter register contract'
            for line in canonicalize(helper_body):
                audit_call(line, CCT, declarations, sdk_read)
        for owner, signature, flags, locals_, count, digest, policy in CONTRACTS:
            declaration = declarations.classes[owner].methods.get(signature)
            assert declaration and declaration.access_flags == flags, 'Preserve exact DEX flags: ' + owner + signature
            body = source.body(owner, signature)
            if not flags & (0x100 | 0x400):
                local_match = re.search(r'\.locals (\d+)', body)
                assert local_match and int(local_match[1]) == locals_, 'Preserve register contract: ' + owner + signature
            code, skip = canonicalize(body), 0
            enabled = ads if policy.startswith('AD_') else tracking if policy.startswith('TRACK_') else consent if policy.startswith('CONSENT_') else False
            if enabled and policy.startswith('AD_UI_'):
                code = restore_ui(code, policy, locals_, absolute_registers)
            elif enabled and policy in {'AD_INTERVAL', 'AD_SHORTS'}:
                position = 2 if policy == 'AD_INTERVAL' else 25
                assert code[position] == 'const/4 v0, 0x0', 'Missing no-ad decision: ' + owner + signature
                if policy == 'AD_INTERVAL':
                    for items in ([], [object() for _ in range(21)]):
                        run_injector(code, items)
                    code[position] = 'iget v0, p0, Lnl/livewall/dumpert/ads/GenericAdInjector;->adInterval:I'
                else:
                    code[position] = 'const/4 v0, 0x1'
            elif enabled:
                expected = prefix_for(policy)
                assert [absolute_registers(x, locals_) for x in code[:len(expected)]] == [absolute_registers(x, locals_) for x in expected], 'Missing ' + policy + ': ' + owner + signature
                for line in code[:len(expected)]:
                    audit_call(line, owner, declarations, sdk_read)
                skip = len(expected)
                code = canonicalize(body, skip)
            assert len(code) == count and hashlib.sha256('\n'.join(code).encode()).hexdigest() == digest, 'Preserve original body: ' + owner + signature + ' (' + policy + ')'
        for owner, cls in declarations.classes.items():
            for signature in cls.methods:
                if signature.startswith('morphe'):
                    assert (owner, signature) in owned, 'Unexpected Dumpert helper needs explicit behavioral coverage: ' + owner + signature
    finally:
        sdk_archive.close()
    if ads:
        verify_player_contracts(source)
        verify_ui_resources(source)
        verify_ui_flows(source, canonicalize, execute)
    if tracking:
        verify_tracking_contracts(source)
        from verify_dumpert_queue import verify_queue
        verify_queue(source, canonicalize, execute)
    manifest = ET.parse(root / 'AndroidManifest.xml').getroot()
    assert manifest.get('package') == 'nl.dumpert', 'Dumpert package identity'
    app = manifest.find('application')
    for tag, name, digest in RETAINED_COMPONENTS:
        nodes = [node for node in app.findall(tag) if node.get(A + 'name') == name]
        assert len(nodes) == 1 and xml_digest(nodes[0]) == digest, 'Preserve functional manifest component: ' + str(name)
    for name in ('com.google.android.gms.ads.MobileAdsInitProvider', 'com.google.android.gms.ads.AdService'):
        nodes = [node for node in app if node.get(A + 'name') == name]
        assert len(nodes) == 1, name
        assert (nodes[0].get(A + 'enabled') == 'false') == ads, 'Ad startup component: ' + name
    if tracking:
        for name, value in METADATA.items():
            nodes = [node for node in app.findall('meta-data') if node.get(A + 'name') == name]
            assert len(nodes) == 1 and nodes[0].get(A + 'value') == str(value).lower(), 'Permanent measurement flag: ' + name
    permissions = {node.get(A + 'name') for node in manifest.findall('uses-permission')}
    for name in AD_PERMISSIONS:
        assert (name not in permissions) == tracking, 'Advertising permission: ' + name
    for filename, digest in EXECUTABLE_ASSETS:
        assert hashlib.sha256((root / filename).read_bytes()).hexdigest() == digest, 'Preserve functional embed/consent asset: ' + filename
    print('PASS Dumpert:', ', '.join(sorted(selected)) or 'original', f'({len(CONTRACTS)} method contracts)')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('root', type=Path)
    parser.add_argument('--apk', type=Path)
    parser.add_argument('-e', action='append', default=[], choices=sorted(NAMES))
    args = parser.parse_args()
    verify(args.root, set(args.e), args.apk)
