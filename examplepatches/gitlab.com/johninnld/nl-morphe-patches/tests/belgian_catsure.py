"""Execute local queue commits while the two detached Catsure uploads stop.

StateFlow and local storage are platform boundaries; commit order, duplicate
queue handling and entry into the real emitted no-ops are app instructions.
"""
import json
import re
from pathlib import Path
from ad_onboarding import VM, Obj, method, digest

A = 'nl/dpgmedia/mcdpg/amalia/'
QUEUE = A+'audio/queue/catsure/CatsureQueueSyncRepository'
HEARTBEAT = A+'player/audio/tracking/catsure/CatsureHeartbeatRepository'
TELEMETRY = A+'player/audio/tracking/telemetry/AudioTelemetryEventRepository'
HOLDER = A+'audio/queue/holder/AudioQueueHolder'
COMMIT = 'commit(L'+A+'audio/queue/holder/CurrentQueue;)V'
SINKS = [(QUEUE, 'syncQueue(L'+A+'audio/queue/holder/CurrentQueue;)V'),
         (HEARTBEAT, 'sendHeartbeat(L'+A+'player/audio/statemachine/model/AmaliaAudioPlayerState;Ljava/lang/String;)V')]


def input_version(root):
    """Publisher input version from the decoded apktool metadata."""
    match = re.search(r"versionName: ['\"]?([0-9.]+)", (Path(root) / 'apktool.yml').read_text())
    assert match, 'Decoded input has no versionName'
    return match.group(1)


class QueueVM(VM):
    def switch_case_map(self):
        return {}

    def __init__(self, root, enabled):
        super().__init__(root)
        self.enabled = enabled
        self.saved = []

    def invoke(self, ref, values, kind):
        typ, sig = ref.split('->')
        cls = typ[1:-1]
        if cls == A+'audio/queue/holder/CurrentQueue':
            if sig == 'equals(Ljava/lang/Object;)Z':
                return values[0] is values[1]
            if sig == 'getDebugString()Ljava/lang/String;':
                return 'controlled queue fixture'
            if sig == 'getCurrentItemQueueUid-LCoMoLo()Ljava/lang/String;':
                return values[0].fields['current']
            if sig == 'getUpNextManualItems()Ljava/util/List;':
                return values[0].fields['manual']
        if typ == 'Lkotlinx/coroutines/flow/MutableStateFlow;':
            if sig == 'getValue()Ljava/lang/Object;':
                return values[0].fields['value']
            if sig == 'setValue(Ljava/lang/Object;)V':
                values[0].fields['value'] = values[1]
                self.events.append(('queue', values[1]))
                return None
        if cls == A+'audio/queue/persistence/AudioQueueDatastore' and sig == 'save(Ljava/util/List;)V':
            self.saved.append(values[1])
            self.events.append(('saved', values[1]))
            return None
        if cls == QUEUE:
            if self.enabled:
                return self.call(cls, sig, values)
            # The unselected repository is an asynchronous network boundary.
            # No fake server result enters local queue state.
            return None
        if cls == A+'util/platform/logging/LoggingExtKt':
            return None
        if typ == 'Landroidx/car/app/AppInfo$$ExternalSyntheticOutline0;':
            return values[0]+values[1]
        return super().invoke(ref, values, kind)


def verify_catsure(root, enabled, brand):
    dataset = 'belgian_catsure_originals_755.json' if input_version(root) == '7.55.0' else 'belgian_catsure_originals.json'
    original = json.loads(Path(__file__).with_name(dataset).read_text())[brand]
    for cls, sig, expected in original['retained']:
        assert digest(method(root,cls,sig).canonical()) == expected, 'Preserve local queue/persistence/device/radio/auth: '+cls+'->'+sig
    for cls, sig, expected in original['sinks']:
        emitted = method(root,cls,sig)
        assert digest(emitted.canonical(remove=[0] if enabled else [])) == expected, 'Preserve original Catsure tail: '+cls+'->'+sig
        code = method(root, cls, sig).instructions
        assert (code[:1] == ['return-void']) == enabled, 'Suppress detached Catsure upload: '+cls
        if enabled:
            # An opaque state object has no device/payload fields. The real
            # emitted no-op must return before any payload, ID or job is read.
            vm = QueueVM(root, enabled)
            args = [Obj('L'+cls+';'), Obj('Lopaque/Fixture;')]
            if cls == HEARTBEAT:
                args.append('playing')
            elif cls == TELEMETRY:
                # The 7.55.0 ingest sink takes the opaque playable and state pair.
                args.append(Obj('Lopaque/Fixture;'))
            assert vm.call(cls, sig, args) is None
            assert not vm.events and not vm.saved
    for current in [None, 'fixture-current-uid']:
        vm = QueueVM(root, enabled)
        before = Obj('L'+A+'audio/queue/holder/CurrentQueue;')
        manual = [Obj('Lopaque/ExistingManualItem;')]
        queue = Obj('L'+A+'audio/queue/holder/CurrentQueue;', {'current':current, 'manual':manual})
        flow = Obj('Lkotlinx/coroutines/flow/MutableStateFlow;', {'value':before})
        holder = Obj('L'+HOLDER+';', {'queueFlowMutable':flow,
            'catsureQueueSyncRepository':Obj('L'+QUEUE+';'),
            'persistence':Obj('L'+A+'audio/queue/persistence/AudioQueueDatastore;')})
        assert vm.call(HOLDER, COMMIT, [holder, queue]) is None
        assert flow.fields['value'] is queue and vm.saved == [manual]
        assert vm.events == [('queue',queue),('saved',manual)], 'Local queue remains published before persistence'
        # Recommitting an unchanged queue must retain the native early return.
        vm.events.clear()
        vm.saved.clear()
        vm.call(HOLDER, COMMIT, [holder, queue])
        assert not vm.events and not vm.saved
