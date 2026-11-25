"""Verify current-main host, managed-audio and silent-start additions on14/15.

The publisher body/metadata goldens are frozen independently in the adjacent
contract module. No production Kotlin/Java tables are read at validation time.
"""
import copy
import hashlib
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from verify_flitsmeister import canonical, invoke_args, xml_digest
from verify_flitsmeister15 import shape
from flitsmeister_release_contracts import AUDIO, AUDIO_FIELDS, AUDIO_CALLS, HOST_PACKAGES, HOST_VALIDATOR, MANIFESTS

A = '{http://schemas.android.com/apk/res/android}'
AUDIO_OWNER = 'Lnl/johninnl/navigation/startup/ProviderAudio;'
NATIVE_LISTENER = 'Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I'
MANAGED_LISTENER = AUDIO_OWNER + '->setListener(Landroid/speech/tts/TextToSpeech;Landroid/speech/tts/UtteranceProgressListener;)I'
DESTROY = 'Lnl/flitsmeister/services/base/FlitsmeisterBaseService;->onDestroy()V'
SUPPORT = 'Support Gearslip and DriveDeck'
BROADCAST = 'Broadcast navigation data'
METHOD = re.compile(r'^\.method[^\n]* (\S+)\n.*?^\.end method', re.M | re.S)


def source(root, cls):
    paths = list(root.glob('smali*/' + cls[1:-1] + '.smali'))
    assert len(paths) == 1, f'Expected singleton release class {cls}, found {len(paths)}'
    return paths[0].read_text()


def method(root, descriptor):
    cls, signature = descriptor.split('->')
    matches = [m[0] for m in METHOD.finditer(source(root, cls)) if m[1] == signature]
    assert len(matches) == 1, 'Expected singleton release method ' + descriptor
    return matches[0]


def digest(body):
    return hashlib.sha256('\n'.join(canonical(body)).encode()).hexdigest()


def assert_profile(body, profile, label):
    assert shape(body) == profile[1], label + ': exact registers/instructions/handlers/catchall/payloads'
    assert digest(body) == profile[0], label + ': full publisher flow plus only reviewed additions'


def normalize_destroy(body, selected):
    """Restore only the one reviewed TTS ABI in the genuine teardown body."""
    pattern = re.compile(r'^(\s*)invoke-static(/range)? (\{[^}]*\}), ' + re.escape(MANAGED_LISTENER) + r'\s*$', re.M)
    matches = list(pattern.finditer(body))
    assert len(matches) == int(selected), 'Exactly one managed teardown listener replacement iff navigation selected'
    assert body.count(AUDIO_OWNER + '->') == int(selected), 'No other teardown managed-audio calls'
    if not selected:
        return body
    assert len(invoke_args(matches[0][0].strip())) == 2, 'Retain native TTS/listener register operands'
    return pattern.sub(lambda m: m[1] + 'invoke-virtual' + (m[2] or '') + ' ' + m[3] + ', ' + NATIVE_LISTENER, body)


def normalize_destroy_class(text, selected):
    found = []
    def replace(match):
        if match[1] != 'onDestroy()V':
            return match[0]
        found.append(match[0])
        return normalize_destroy(match[0], selected)
    result = METHOD.sub(replace, text)
    assert len(found) == 1, 'Singleton BaseService teardown for exact normalization'
    return result


def verify_focus_behavior(body):
    """Execute real emitted muted/unmuted focus flow at the Android boundary."""
    from verify_flitsmeister import run_fragment
    instructions = canonical(body)
    local = int(re.search(r'\.locals (\d+)', body)[1])
    owner = {'Lorg/maplibre/navigation/android/navigation/ui/v5/voice/Api26AudioFocusDelegate;->audioManager:Landroid/media/AudioManager;': 'audio-manager',
             'Lorg/maplibre/navigation/android/navigation/ui/v5/voice/Api26AudioFocusDelegate;->audioFocusRequest:Landroid/media/AudioFocusRequest;': 'focus-request'}
    for muted in (False, True):
        tracked, native = [], []
        def boundary(reference, values):
            if reference == AUDIO_OWNER + '->trackMapFocus(Ljava/lang/Object;)V':
                tracked.append(values); return None
            if reference == AUDIO_OWNER + '->muted()Z': return muted
            if reference == 'Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioFocusRequest;)I':
                native.append(values); return 1
            raise AssertionError('Unexpected managed focus boundary: ' + reference)
        result = run_fragment(instructions, 0, {f'v{local}': owner}, boundary)
        assert result is None and tracked == [[owner]], 'Track exact initialized focus owner once in both modes'
        assert native == ([] if muted else [['audio-manager', 'focus-request']]), 'Unmuted focus reaches native Android once; muted focus returns without a native request'


def verify_audio(root, selected, version):
    expected_calls = {}
    for descriptor, record in AUDIO[version].items():
        body = method(root, descriptor)
        assert sorted(body.splitlines()[0].split()[1:-1]) == record['flags'], descriptor + ': native access/ABI'
        assert_profile(body, record['managed' if selected else 'original'], descriptor)
        if selected and record['role'] == 'focus':
            verify_focus_behavior(body)
        calls = [line.split('}, ', 1)[1] for line in canonical(body) if AUDIO_OWNER + '->' in line]
        assert calls == (AUDIO_CALLS[version][descriptor] if selected else []), descriptor + ': exact audio binder calls'
        if calls:
            expected_calls[descriptor] = calls
    for cls, expected in AUDIO_FIELDS[version].items():
        actual = sorted(line.strip() for line in source(root, cls).splitlines() if line.startswith('.field '))
        assert actual == expected, cls + ': original public queue/holder/callback field ABI'
    destroy = method(root, DESTROY)
    normalize_destroy(destroy, selected)
    if selected:
        expected_calls[DESTROY] = [MANAGED_LISTENER]
    # Native callsite closure excludes only the implementation namespace. Every
    # managed call from a publisher class must belong to this exact cohort.
    actual_calls = {}
    for path in root.glob('smali*/**/*.smali'):
        if '/nl/johninnl/' in str(path):
            continue
        text = path.read_text()
        if AUDIO_OWNER + '->' not in text:
            continue
        cls = re.search(r'^\.class[^\n]* (L[^;]+;)', text, re.M)[1]
        for match in METHOD.finditer(text):
            calls = [line.split('}, ', 1)[1] for line in canonical(match[0]) if AUDIO_OWNER + '->' in line]
            if calls:
                actual_calls[cls + '->' + match[1]] = calls
    assert actual_calls == expected_calls, 'Closed native managed-audio cohort; no extra calls elsewhere'
    return len(AUDIO[version])


def verify_hosts(root, selected, version):
    cls = 'Landroidx/car/app/validation/HostValidator;'
    for signature, record in HOST_VALIDATOR[version].items():
        body = method(root, cls + '->' + signature)
        assert sorted(body.splitlines()[0].split()[1:-1]) == record['flags'], signature + ': host validator access'
        assert_profile(body, record['selected' if selected else 'original'], 'HostValidator.' + signature)
    actual_methods = {match[1] for match in METHOD.finditer(source(root, cls))}
    assert actual_methods == set(HOST_VALIDATOR[version]), 'Complete host validator method inventory'
    # The entire original fallback and validateHost UID/package relationship
    # stay hashed; accepting four explicit package names cannot bypass that path.
    return len(HOST_PACKAGES) if selected else 0


def normalize_manifest(manifest, selected, version):
    doc = copy.deepcopy(manifest)
    nav, hosts = BROADCAST in selected, SUPPORT in selected
    app = doc.find('application')
    assert app is not None
    expected = {
        'nl.johninnl.flitsmeister.NavigationControlService': {A + 'name': 'nl.johninnl.flitsmeister.NavigationControlService', A + 'exported': 'true'},
        'nl.johninnl.flitsmeister.NavigationEngineService': {A + 'name': 'nl.johninnl.flitsmeister.NavigationEngineService', A + 'exported': 'false', A + 'foregroundServiceType': 'location'},
    }
    for name, attributes in expected.items():
        nodes = [node for node in app.findall('service') if node.get(A + 'name') == name]
        assert len(nodes) == int(nav), name + ': selected-only startup service'
        if nodes:
            assert nodes[0].attrib == attributes and len(nodes[0]) == 0, name + ': exact export/foreground/permission contract'
            app.remove(nodes[0])
    recovery = 'nl.johninnl.flitsmeister.WarningRecoveryActivity'
    activities = [node for node in app.findall('activity') if node.get(A + 'name') == recovery]
    assert len(activities) == int(nav), recovery + ': selected-only recovery Activity'
    if activities:
        assert activities[0].attrib == {A + 'name': recovery, A + 'exported': 'false'} and len(activities[0]) == 0, recovery + ': exact private recovery Activity declaration'
        app.remove(activities[0])
    queries = doc.findall('queries')
    assert len(queries) == MANIFESTS[version]['queries_count'], 'Preserve all native package-query containers'
    for name in HOST_PACKAGES:
        nodes = [node for node in queries[0].findall('package') if node.get(A + 'name') == name]
        assert len(nodes) == int(hosts), name + ': exact selected-only package visibility'
        if nodes:
            assert nodes[0].attrib == {A + 'name': name} and not len(nodes[0]), name + ': exact host query'
            queries[0].remove(nodes[0])
    if not MANIFESTS[version]['has_queries']:
        assert not len(queries[0])
        doc.remove(queries[0])
    # Both foreground permissions already exist in both publisher profiles;
    # no permission is dropped while normalizing the explicit services and private recovery Activity.
    return doc


def verify_manifest(root, selected, version):
    raw = ET.parse(root / 'AndroidManifest.xml').getroot()
    clean = normalize_manifest(raw, selected, version)
    key = f'{int(bool(selected))}-{int("Disable tracking" in selected)}'
    assert xml_digest(clean, 'AndroidManifest.xml') == MANIFESTS[version]['hashes'][key], 'Complete publisher manifest/native exports/component permissions preserved after exact additions'
    return clean


def run_scalar(body, arguments, callback=None):
    """Execute emitted allowlist scalar/array control flow, including null paths."""
    instructions = canonical(body)
    local = int(re.search(r'\.locals (\d+)', body)[1])
    registers = {f'v{local + index}': value for index, value in enumerate(arguments)}
    pc, result = 0, None
    for _ in range(500):
        line = instructions[pc]; pc += 1
        opcode, _, args = line.partition(' ')
        if opcode.startswith('const-string'):
            import json
            dest, literal = args.split(', ', 1); registers[dest] = json.loads(literal)
        elif opcode.startswith('const'):
            dest, literal = args.split(', '); registers[dest] = int(literal, 16)
        elif opcode == 'array-length':
            dest, value = args.split(', '); registers[dest] = len(registers[value])
        elif opcode == 'aget-object':
            dest, array, index = args.split(', '); registers[dest] = registers[array][registers[index]]
        elif opcode.startswith('move-result'):
            registers[args] = result
        elif opcode.startswith('move'):
            dest, origin = args.split(', '); registers[dest] = registers[origin]
        elif opcode.startswith('add-int/lit'):
            dest, origin, literal = args.split(', '); registers[dest] = registers[origin] + int(literal, 16)
        elif opcode.startswith('invoke-'):
            values = [registers[name] for name in invoke_args(line)]
            ref = line.split('}, ', 1)[1]
            if callback is not None: result = callback(ref, values)
            elif ref == 'Ljava/lang/String;->equals(Ljava/lang/Object;)Z': result = values[0] == values[1]
            elif ref == 'Ljava/lang/String;->isEmpty()Z': result = not values[0]
            else: raise AssertionError('Unexpected startup allowlist call: ' + ref)
        elif opcode.startswith('if-'):
            values = args.split(', '); left = registers[values[0]]
            if opcode.endswith('z'):
                right, target, opcode = 0, values[1], opcode[:-1]
                if left is None: left = 0
            else: right, target = registers[values[1]], values[2]
            taken = {'if-eq': lambda: left == right, 'if-ne': lambda: left != right,
                     'if-ge': lambda: left >= right, 'if-lt': lambda: left < right,
                     'if-gt': lambda: left > right, 'if-le': lambda: left <= right}[opcode]()
            if taken: pc = int(target[1:])
        elif opcode.startswith('goto'):
            pc = int(args[1:])
        elif opcode == 'return':
            return bool(registers[args])
        elif opcode in ('nop', 'check-cast'):
            pass
        else: raise AssertionError('Unsupported emitted startup allowlist instruction: ' + line)
    raise AssertionError('Startup allowlist did not terminate')


def run_allowed(body, owned, configured):
    return run_scalar(body, [owned, configured])


def verify_audio_helper(root):
    text = source(root, AUDIO_OWNER)
    for forbidden in ('->setStreamVolume(', '->adjustStreamVolume(', '->setStreamMute(', '->setRingerMode(',
                      'Landroid/provider/Settings$Global;->put', 'Landroid/provider/Settings$System;->put',
                      'Landroid/content/SharedPreferences$Editor;->'):
        assert forbidden not in text, 'Provider-local audio must not change global or saved sound settings'
    skip = method(root, AUDIO_OWNER + '->skip(Ljava/lang/Object;)Z')
    items = method(root, AUDIO_OWNER + '->skipItems(Ljava/lang/Object;)Z')
    for muted in (False, True):
        completed = []
        def boundary(reference, values):
            if reference == AUDIO_OWNER + '->muted()Z': return muted
            if reference == AUDIO_OWNER + '->invoke(Ljava/lang/Object;Ljava/lang/String;)V':
                assert values[1] == 'invoke'
                completed.append(values[0]); return None
            if reference == 'Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I': return len(values[0])
            if reference == 'Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;': return values[0][values[1]]
            if reference == 'Ljava/lang/Object;->getClass()Ljava/lang/Class;': return 'item-class'
            if reference == 'Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;':
                assert values[1] == 'f'; return 'completion-field'
            if reference == 'Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;':
                assert values[0] == 'completion-field'; return values[1]['f']
            raise AssertionError('Unexpected emitted muted-callback behavior: ' + reference)
        assert run_scalar(skip, ['one-completion'], boundary) == muted
        assert completed == (['one-completion'] if muted else []), 'Request suppression completes once only while muted'
        completed.clear()
        assert run_scalar(items, [[{'f': 'first'}, {'f': 'second'}]], boundary) == muted
        assert completed == (['first', 'second'] if muted else []), 'Batch suppression completes every item once, in order'
        completed.clear()
        assert run_scalar(items, [[]], boundary) == muted and not completed, 'Empty batch completes without invented callbacks'
    focus = method(root, AUDIO_OWNER + '->trackMapFocus(Ljava/lang/Object;)V')
    assert '"abandonFocus"' in focus and '->trackFocus(Ljava/lang/Object;Ljava/lang/String;)V' in focus
    silence = method(root, AUDIO_OWNER + '->silenceQueue(Ljava/lang/Object;)Z')
    literals = set(re.findall(r'const-string(?:/jumbo)? \w+, "([^"\n]*)"', silence))
    assert {'f', 'g', 'e', 'b', 'k', 'invoke'} <= literals, 'Queue cleanup preserves reviewed queue/holder/callback ABI'
    assert '->cancelSpeech(Landroid/speech/tts/TextToSpeech;)V' in silence, 'Native speech cancellation preserves terminal callback path'
    listener = method(root, AUDIO_OWNER + '->setListener(Landroid/speech/tts/TextToSpeech;Landroid/speech/tts/UtteranceProgressListener;)I')
    assert listener.count(NATIVE_LISTENER) == 1 and '->pending:Ljava/util/Map;' in listener, 'Listener wrapping retains real SDK setter and clears prior callback records'


def verify_schema_source(root):
    protocol = source(root, 'Lnl/johninnl/navigation/NavigationProtocol;')
    bodies = [match[0] for match in METHOD.finditer(protocol) if match[1].startswith('snapshot(')]
    assert len(bodies) == 1, 'Singleton shared schema snapshot'
    body = bodies[0]
    local = int(re.search(r'\.locals (\d+)', body)[1])
    values = {f'v{local + 1}': ('source-parameter', None)}
    found = set()
    for line in canonical(body):
        opcode, _, args = line.partition(' ')
        if opcode == 'const-string':
            import json
            dest, literal = args.split(', ', 1); values[dest] = ('literal', json.loads(literal))
        elif opcode.startswith('const'):
            dest, literal = args.split(', '); values[dest] = ('literal', int(literal.rstrip('L'), 16))
        elif opcode.startswith('move-result'):
            values[args] = None
        elif opcode.startswith('move'):
            dest, origin = args.split(', '); values[dest] = values.get(origin)
        elif opcode == 'new-instance':
            values[args.split(', ', 1)[0]] = None
        elif opcode.startswith('invoke-') and 'Landroid/content/Intent;->putExtra(' in line:
            operands = invoke_args(line)
            key = values.get(operands[1])
            if key == ('literal', 'schema_version'):
                assert values.get(operands[2]) == ('literal', 1) and 'putExtra(Ljava/lang/String;I)' in line, 'Schema1 numeric version retained'
                found.add('schema')
            elif key == ('literal', 'source_package'):
                assert values.get(operands[2]) == ('source-parameter', None) and 'putExtra(Ljava/lang/String;Ljava/lang/String;)' in line, 'Source package comes from supplied real provider package'
                found.add('source')
        if found == {'schema', 'source'}:
            break
    assert found == {'schema', 'source'}, 'Retain shared navigation source/schema fields'
    publish = canonical(method(root, 'Lnl/johninnl/flitsmeister/NavigationBroadcasts;->publish(Z)V'))
    source_at = [index for index, line in enumerate(publish) if 'Landroid/content/Context;->getPackageName()Ljava/lang/String;' in line]
    snapshot_at = [index for index, line in enumerate(publish) if 'Lnl/johninnl/navigation/NavigationProtocol;->snapshot(' in line]
    assert len(source_at) == len(snapshot_at) == 1 and source_at[0] < snapshot_at[0], 'Authenticate schema source with actual provider Context package'
    result = publish[source_at[0] + 1]
    assert result.startswith('move-result-object ')
    aliases = {result.split()[1]}
    for line in publish[source_at[0] + 2:snapshot_at[0]]:
        if line.startswith(('move-object ', 'move-object/from16 ', 'move-object/16 ')):
            dest, origin = line.split(' ', 1)[1].split(', ')
            if origin in aliases: aliases.add(dest)
            else: aliases.discard(dest)
    assert invoke_args(publish[snapshot_at[0]])[1] in aliases, 'Actual package name passed as snapshot source'


def verify_pending_intent_source(root):
    text = source(root, 'Lnl/johninnl/navigation/startup/NavigationClient;')
    bodies = [match[0] for match in METHOD.finditer(text) if 'Landroid/app/PendingIntent;->getCreatorPackage()' in match[0]]
    assert len(bodies) == 1, 'Singleton startup capability acceptance path'
    instructions = canonical(bodies[0])
    refs = ('Landroid/app/PendingIntent;->getCreatorPackage()Ljava/lang/String;',
            'Landroid/app/PendingIntent;->getCreatorUid()I',
            'Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;',
            'Landroid/app/PendingIntent;->isForegroundService()Z',
            'Lnl/johninnl/navigation/startup/NavigationClient;->sendStart(Landroid/app/PendingIntent;)V')
    positions = []
    for ref in refs:
        matches = [index for index, line in enumerate(instructions) if ref in line]
        assert len(matches) == 1, 'Exact capability authorization operation before sender helper: ' + ref
        positions.append(matches[0])
    assert positions == sorted(positions), 'Check capability creator package/UID and foreground type before sender helper'
    start = positions[0] - 1
    assert instructions[start].startswith('if-eqz '), 'Reject absent startup capability'
    incompatible = [line.split(' ', 1)[1].split(', ')[0] for line in instructions if re.match(r'const-string \w+, "incompatible"$', line)]
    assert len(incompatible) == 1
    rejected = next(index for index in range(positions[0], len(instructions)) if instructions[index].startswith('iput-object ' + incompatible[0] + ', ') and '->state:Ljava/lang/String;' in instructions[index])
    accepted = next(index for index in range(positions[3], positions[4]) if '->attempted(J)V' in instructions[index]) - 1
    assert instructions[rejected + 1] == 'return-void', 'Invalid capability returns incompatible without sending'
    token_reg = invoke_args(instructions[positions[0]])[0]
    selected_reg = invoke_args(instructions[positions[0] + 2])[0]
    app_line = next(line for line in instructions[positions[1]:positions[2]] if '->app:Landroid/app/Application;' in line)
    client_reg = app_line.split(' ', 1)[1].split(', ')[1]
    flag_reg = invoke_args(instructions[positions[2]])[-1]
    assert invoke_args(instructions[positions[4]]) == [client_reg, token_reg], 'Send only the same creator/UID/foreground-authenticated capability through its client helper'
    assert not any('Landroid/app/PendingIntent;->send(' in line for line in instructions), 'Authorization callback cannot bypass the guarded sender helper'
    from verify_flitsmeister import run_fragment
    for package, uid, foreground, sdk, present, valid in (
        ('provider.name', 777, True, 31, True, True),
        ('forged', 777, True, 31, True, False),
        ('provider.name', 778, True, 31, True, False),
        ('provider.name', 777, False, 31, True, False),
        ('provider.name', 777, False, 30, True, True),
        ('provider.name', 777, True, 31, False, False),
    ):
        def boundary(reference, values):
            if reference == refs[0]: return package
            if reference == refs[1]: return uid
            if reference.endswith('->getPackageManager()Landroid/content/pm/PackageManager;'): return 'packages'
            if reference == refs[2]:
                assert values == ['packages', 'provider.name', 0]
                return {'Landroid/content/pm/ApplicationInfo;->uid:I': 777}
            if reference == refs[3]: return foreground
            if reference == 'Ljava/lang/String;->equals(Ljava/lang/Object;)Z': return values[0] == values[1]
            raise AssertionError('Unexpected startup capability acceptance operation: ' + reference)
        client = {'Lnl/johninnl/navigation/startup/NavigationClient;->app:Landroid/app/Application;': 'application'}
        registers = {token_reg: 'capability' if present else 0, selected_reg: 'provider.name', client_reg: client, flag_reg: 0}
        _, _, stopped = run_fragment(instructions, start, registers, boundary,
                                     stop=lambda pc, line, regs, calls: pc in (accepted, rejected),
                                     fields=lambda ref: sdk if ref == 'Landroid/os/Build$VERSION;->SDK_INT:I' else ref)
        assert stopped == (accepted if valid else rejected), 'Capability package/UID/API31 foreground rejection flow'

    sender = method(root, 'Lnl/johninnl/navigation/startup/NavigationClient;->sendStart(Landroid/app/PendingIntent;)V')
    verify_sender_options(sender)
    verify_binding_capabilities(method(root, 'Lnl/johninnl/navigation/startup/NavigationClient;->connect(J)V'))
    direct = [match[1] for match in METHOD.finditer(text) if 'Landroid/app/PendingIntent;->send(' in match[0]]
    assert direct == ['sendStart(Landroid/app/PendingIntent;)V'], 'Closed capability-send cohort; no unguarded send elsewhere'


def verify_sender_options(body):
    """Execute actual emitted sender modes at visible/background Android boundaries."""
    from verify_flitsmeister import run_fragment
    assert body.splitlines()[0] == '.method private sendStart(Landroid/app/PendingIntent;)V', 'Private guarded sender helper ABI'
    code = canonical(body)
    local = int(re.search(r'\.locals (\d+)', body)[1])
    basic = 'Landroid/app/ActivityOptions;->makeBasic()Landroid/app/ActivityOptions;'
    mode = 'Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;'
    bundle = 'Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;'
    empty = 'Ljava/util/Set;->isEmpty()Z'
    plain = 'Landroid/app/PendingIntent;->send()V'
    options = 'Landroid/app/PendingIntent;->send(Landroid/content/Context;ILandroid/content/Intent;Landroid/app/PendingIntent$OnFinished;Landroid/os/Handler;Ljava/lang/String;Landroid/os/Bundle;)V'
    refs = [line.split('}, ', 1)[1] for line in code if line.startswith('invoke-')]
    assert sorted(refs) == sorted((basic, mode, bundle, empty, plain, options)), 'Exact sender platform-call cohort'
    for sdk in (29, 30, 33, 34, 35, 36, 37):
        for visible in (False, True):
            modes, sent, made = [], [], []
            def boundary(reference, values):
                if reference == empty:
                    assert values == ['resumed-activities'], 'Inspect only the actual resumed Activity set'
                    return not visible
                if reference == basic:
                    assert not values
                    made.append(True)
                    return 'activity-options'
                if reference == mode:
                    assert values[0] == 'activity-options'
                    modes.append(values[1])
                    return 'activity-options'
                if reference == bundle:
                    assert values == ['activity-options']
                    return 'sender-options'
                if reference == plain:
                    assert values == ['authenticated-capability'], 'Background plain-send preserves the same capability'
                    sent.append('plain')
                    return None
                if reference == options:
                    assert values == ['authenticated-capability', 'application', 0, 0, 0, 0, 0, 'sender-options'], 'Only sender options are added; native capability/context/arguments stay exact'
                    sent.append('options')
                    return None
                raise AssertionError('Unexpected sender platform operation: ' + reference)
            client = {'Lnl/johninnl/navigation/startup/NavigationClient;->visible:Ljava/util/Set;': 'resumed-activities',
                      'Lnl/johninnl/navigation/startup/NavigationClient;->app:Landroid/app/Application;': 'application'}
            run_fragment(code, 0, {f'v{local}': client, f'v{local + 1}': 'authenticated-capability'}, boundary,
                         fields=lambda ref: sdk if ref == 'Landroid/os/Build$VERSION;->SDK_INT:I' else ref)
            modern = sdk >= 34 and visible
            assert sent == (['options'] if modern else ['plain']), 'Visible-only modern sender opt-in; background always stays plain'
            # Android36 SDK constants: ALLOWED=1 and ALLOW_IF_VISIBLE=4, never ALLOW_ALWAYS=3.
            assert modes == ([4 if sdk >= 36 else 1] if modern else []), 'Exact API34/35 allowed versus API36 visible-only sender mode'
            assert len(made) == int(modern), 'No sender options created for background/older clients'


def verify_binding_capabilities(body):
    """The min-API29 extension folds its SDK guard to AUTO_CREATE|INCLUDE_CAPABILITIES."""
    code = canonical(body)
    calls = [index for index, line in enumerate(code) if 'Landroid/app/Application;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z' in line]
    assert len(calls) == 1, 'Singleton original startup binding boundary'
    at = calls[0]
    args = invoke_args(code[at])
    assert len(args) == 4, 'Exact Context/Intent/connection/flags binding ABI'
    flags = re.fullmatch(r'const(?:/\w+)? ' + re.escape(args[-1]) + r', (0x[0-9a-f]+)', code[at - 1])
    assert flags and int(flags[1], 16) == 0x1001, 'API29 binding uses exactly AUTO_CREATE plus INCLUDE_CAPABILITIES'


def verify_startup_api(root, selected):
    control = 'Lnl/johninnl/flitsmeister/NavigationControlService;'
    engine = 'Lnl/johninnl/flitsmeister/NavigationEngineService;'
    for cls, parent in ((control, 'ProviderControlService'), (engine, 'ProviderEngineService')):
        paths = list(root.glob('smali*/' + cls[1:-1] + '.smali'))
        assert len(paths) == int(selected), cls + ': selected-only startup implementation'
        if paths:
            assert '.super Lnl/johninnl/navigation/startup/' + parent + ';' in paths[0].read_text()
    if not selected:
        return
    verify_audio_helper(root)
    verify_schema_source(root)
    verify_pending_intent_source(root)
    target = canonical(method(root, control + '->engineService()Ljava/lang/Class;'))
    assert target == ['const-class v0, ' + engine, 'return-object v0'], 'PendingIntent explicitly targets the private provider engine'
    allowed = method(root, 'Lnl/johninnl/navigation/startup/StartupProtocol;->allowed([Ljava/lang/String;Ljava/lang/String;)Z')
    defaults = ('app.vela', 'com.google.android.apps.maps', 'org.ungoogled.android.apps.maps', 'org.ungoogled.android.apps.maps.microg')
    literals = set(re.findall(r'const-string(?:/jumbo)? \w+, "([^"\n]*)"', allowed))
    assert literals == set(defaults), 'Exact default receiving-map packages'
    for owned, configured, expected in [(None, '', False), ([], '', False), (['forged'], '', False),
                                         (['app.vela'], 'configured.only', False), (['configured.only'], 'configured.only', True),
                                         (['forged', 'configured.only'], 'configured.only', True)]:
        assert run_allowed(allowed, owned, configured) == expected, 'UID-owned package/configured receiver relationship'
    for package in defaults:
        assert run_allowed(allowed, [package], None) and run_allowed(allowed, ['forged', package], ''), package
    api_body = method(root, 'Lnl/johninnl/navigation/startup/ProviderControlService$1;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z')
    api = canonical(api_body)
    required = ('Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V', 'Landroid/os/Binder;->getCallingUid()I',
                'Landroid/os/Process;->myUid()I', 'Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;',
                'Lnl/johninnl/navigation/startup/StartupProtocol;->allowed([Ljava/lang/String;Ljava/lang/String;)Z',
                'Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V',
                'Landroid/app/PendingIntent;->getForegroundService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;')
    positions = [next(i for i, line in enumerate(api) if reference in line) for reference in required]
    assert positions == sorted(positions), 'Validate interface/calling UID/owned packages before issuing startup PendingIntent'
    reject, capability = positions[5], positions[6]
    denied = next(index for index, line in enumerate(api[:capability]) if line.startswith('new-instance ') and 'Ljava/lang/SecurityException;' in line)
    accepted = next(index for index, line in enumerate(api[:capability]) if line.startswith('new-instance ') and 'Landroid/os/Bundle;' in line)
    assert any(line.startswith('throw ') for line in api[reject + 1:accepted]), 'Reject unauthorized UID before capability creation'
    from verify_flitsmeister import run_fragment
    local = int(re.search(r'\.locals (\d+)', api_body)[1])
    declaration = 'Landroid/os/Parcel;->dataAvail()I'
    declared_version = 'Landroid/os/Parcel;->readInt()I'
    observer = 'Lnl/johninnl/navigation/startup/ProviderControlService;->observeControlClient(IZ)V'
    assert sum(declaration in line for line in api) == 2, 'Bound the optional declaration to exactly one integer'
    assert sum(declared_version in line for line in api) == 1 and sum(observer in line for line in api) == 1, 'Singleton warning-awareness declaration and authenticated observer'
    malformed = [index for index, line in enumerate(api[:accepted]) if line.startswith('new-instance ') and 'Ljava/lang/IllegalArgumentException;' in line]
    assert len(malformed) == 1 and denied < malformed[0] < accepted, 'Malformed declarations reject before response creation'
    for uid, owned, configured, authorized in (
        (900, ['forged'], '', True), (901, ['forged'], '', False),
        (901, ['app.vela'], '', True), (901, ['app.vela'], 'configured.only', False),
        (901, ['configured.only'], 'configured.only', True),
    ):
        for available, version_value, valid in ((0, None, True), (4, 1, True), (4, 0, False), (4, 2, False), (2, 1, False), (8, 1, False)):
            parcel_reads, observed = [], []
            def caller_boundary(reference, values):
                if reference == 'Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V':
                    assert values == ['incoming-parcel', 'nl.johninnl.navigation.STARTUP_V1'], 'Status1 enforces its exact interface before UID lookup'
                    return None
                if reference == 'Landroid/os/Binder;->getCallingUid()I': return uid
                if reference == 'Landroid/os/Process;->myUid()I': return 900
                if reference.endswith('->getPackageManager()Landroid/content/pm/PackageManager;'): return 'packages'
                if reference == 'Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;':
                    assert values == ['packages', uid], 'Package ownership lookup uses actual Binder calling UID'
                    return owned
                if reference.endswith('->receiverPackage()Ljava/lang/String;'): return configured
                if reference.endswith('->allowed([Ljava/lang/String;Ljava/lang/String;)Z'):
                    assert values == [owned, configured]
                    return run_allowed(allowed, *values)
                if reference in (declaration, declared_version):
                    assert values == ['incoming-parcel'], 'Read only the actual supplied startup Parcel'
                    parcel_reads.append(reference)
                    return available if reference == declaration else version_value
                if reference == observer:
                    assert values == ['service', uid, int(available == 4)], 'Observer receives authenticated UID and only validated warning awareness'
                    observed.append(values)
                    return None
                raise AssertionError('Unexpected startup authorization operation: ' + reference)
            this = {'Lnl/johninnl/navigation/startup/ProviderControlService$1;->this$0:Lnl/johninnl/navigation/startup/ProviderControlService;': 'service'}
            _, _, stopped = run_fragment(api, 0, {f'v{local}': this, f'v{local + 1}': 1, f'v{local + 2}': 'incoming-parcel', f'v{local + 3}': 'reply-parcel', f'v{local + 4}': 0}, caller_boundary,
                                         stop=lambda pc, line, registers, calls: pc in (denied, malformed[0], accepted))
            expected = denied if not authorized else accepted if valid else malformed[0]
            assert stopped == expected, 'Actual Binder UID/package and optional declaration rejection control flow'
            assert len(observed) == int(authorized and valid), 'Observe only authenticated, valid legacy or warning-aware declarations'
            assert authorized or not parcel_reads, 'Unauthorized callers cannot decode the optional warning declaration'
    args = invoke_args(api[capability]); flags_reg = args[-1]
    constants = [line for line in api[:capability] if re.match(r'^const(?:/\w+)? ' + flags_reg + r', ', line)]
    assert constants and int(constants[-1].split(', ')[1], 16) == 0xc000000, 'Immutable update-current provider-owned PendingIntent'
    start = canonical(method(root, engine + '->startEngine()V'))
    assert any('"nl.flitsmeister.services.base.FlitsmeisterBaseService"' in line for line in start), 'Native private BaseService target'
    assert any('"checkBackgroundPermission"' in line for line in start), 'Native background permission workflow retained'
    assert sum('->startForegroundService(' in line for line in start) == 1 and not any('->startActivity(' in line for line in start), 'Silent native foreground-service entry'
    init = method(root, 'Lnl/johninnl/flitsmeister/NavigationBroadcasts;->init(Landroid/content/Context;)V')
    assert init.count(AUDIO_OWNER + '->init(Landroid/content/Context;)V') == 1, 'Provider-local audio initialized by native producer lifetime'


def verify(root, selected, version):
    verify_manifest(root, selected, version)
    audio = verify_audio(root, BROADCAST in selected, version)
    hosts = verify_hosts(root, SUPPORT in selected, version)
    verify_startup_api(root, BROADCAST in selected)
    print(f'PASS: Flitsmeister{version} current-main additions; {audio} complete native audio contracts, host packages={hosts}, exact startup services/permissions')
