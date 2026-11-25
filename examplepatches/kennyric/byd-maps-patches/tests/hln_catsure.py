"""Verify detached Catsure suppression and execute the emitted local queue commit."""
from hln_onboarding import Obj, VM, method, digest
from hln_catsure_originals import RETAINED, MODIFIED

COMMIT = ('dd1', 'a(Lb54;)V')
HEARTBEAT = ('xr2', 'a(Lro;Ljava/lang/String;)V')


class QueueVM(VM):
    def switch_case_map(self):
        return {}

    def invoke(self, ref, values, kind):
        owner, signature = ref.split('->')
        if owner == 'Lb54;' and signature == 'equals(Ljava/lang/Object;)Z':
            return values[0] is values[1]
        if owner == 'Lq3g;' and signature == 'm(Ljava/lang/Object;Ljava/lang/Object;)Z':
            values[0].fields['value'] = values[2]
            self.events.append(('published', values[2]))
            return True
        if owner == 'Lkp;' and signature in {'a()Ljava/lang/String;', 'c()Ljava/lang/String;'}:
            return values[0].fields['id']
        if owner == 'Ljava/util/ArrayList;':
            if signature.startswith('<init>('):
                values[0].fields['items'] = []
                return None
            if signature == 'add(Ljava/lang/Object;)Z':
                values[0].fields['items'].append(values[1])
                return True
        if signature == 'iterator()Ljava/util/Iterator;':
            items = values[0].fields['items'] if isinstance(values[0], Obj) else values[0]
            return {'values': list(items), 'index': 0}
        if owner == 'Ln53;' and signature == 'p0(Ljava/lang/Iterable;I)I':
            return len(values[0])
        if owner == 'Lm53;' and signature.startswith('Q0('):
            return ' '.join(values[0].fields['items'])
        if owner in {'Lvva;', 'Ltl1;'} and signature in {
                'i(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;',
                'l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;'}:
            return ''.join(values)
        if owner == 'Ljava/lang/String;' and signature == 'concat(Ljava/lang/String;)Ljava/lang/String;':
            return values[0] + values[1]
        if owner == 'Lkt2;' and signature == 'H(Ljava/lang/Object;Ldda;I)V':
            return None
        if owner == 'Lilc;' and signature.startswith('<init>('):
            values[0].fields['data'] = values[1:]
            return None
        if owner == 'Lkotlinx/serialization/json/Json;':
            if signature.startswith('getSerializersModule('):
                return Obj('Lvff;')
            if signature.startswith('encodeToString('):
                self.persisted = list(values[2].fields['items'])
                return 'controlled-serialized-queue'
        if owner == 'Lglc;' and signature.startswith('serializer('):
            return Obj('Lkotlinx/serialization/KSerializer;')
        if owner == 'Lhp0;' and signature.startswith('<init>('):
            values[0].fields['args'] = values[1:]
            return None
        if owner == 'Lib1;' and signature == '<init>(Ljava/lang/Object;Ljava/lang/Object;Lzs3;B)V':
            assert values[4] == 1, 'HLN local persistence must retain coroutine selector 1'
            assert values[1] is self.persistence, 'HLN coroutine must capture the original local persistence instance'
            assert values[2] == 'controlled-serialized-queue' and values[3] == 0
            values[0].fields['args'] = values[1:]
            return None
        if owner == 'Lrw8;' and signature == 'N(Lfw3;Lsv3;Ljw3;Lh17;I)Ld2g;':
            task = values[3]
            assert task.type == 'Lib1;'
            captured = task.fields['args']
            assert captured[0].type == 'Lxc1;', 'Detached Catsure queue task must never launch'
            assert captured[0] is self.persistence and captured[3] == 1
            assert captured[1] == 'controlled-serialized-queue'
            assert values[4] == 3, 'HLN local persistence must retain launch default mask 3'
            self.events.append(('persisted', self.persisted))
            return Obj('Ld2g;')
        # Any shared device ID getValue or unclassified upload remains unsupported.
        return super().invoke(ref, values, kind)


def verify_catsure(root, enabled):
    for owner, signature, expected in RETAINED:
        assert digest(method(root, owner, signature).canonical()) == expected, 'HLN preserve identity/car/player/local queue: ' + owner
    expected = {(owner, signature): value for owner, signature, value in MODIFIED}
    heartbeat = method(root, *HEARTBEAT)
    assert (heartbeat.instructions[:1] == ['return-void']) == enabled, 'HLN detached heartbeat suppression follows tracking selection'
    assert digest(heartbeat.canonical(remove=[0] if enabled else [])) == expected[HEARTBEAT]
    queue = method(root, *COMMIT)
    publish = [i for i, line in enumerate(queue.instructions) if 'Lq3g;->m(Ljava/lang/Object;Ljava/lang/Object;)Z' in line]
    persist = [i for i, line in enumerate(queue.instructions) if 'Lb54;->e:Ljava/util/ArrayList;' in line]
    assert len(publish) == len(persist) == 1
    remove = []
    if enabled:
        branches = [(i, line) for i, line in enumerate(queue.instructions)
                    if publish[0] < i < persist[0] and line.startswith('goto') and queue.labels[line.split()[1]] == persist[0]]
        assert len(branches) == 1, 'HLN exactly one owned branch bypasses the detached queue upload'
        slot, branch = branches[0]
        assert branch.startswith('goto'), 'HLN local queue publication must skip only the detached upload block'
        assert queue.labels[branch.split()[1]] == persist[0], 'HLN queue resumes at original persistence entry'
        remove = [slot]
    assert digest(queue.canonical(remove=remove)) == expected[COMMIT], 'HLN preserve complete original queue graph except owned upload branch'
    if not enabled:
        return
    assert QueueVM(root).call(*HEARTBEAT, [Obj('Lxr2;'), Obj('Lopaque/State;'), 'playing']) is None
    for current in [None, 'fixture-current']:
        for manual in [False, True]:
            vm = QueueVM(root)
            playable = Obj('Ljp;', {'id': 'fixture-item', 'a': Obj('Ll71;', {'a': 'fixture-podcast'}),
                                   'b': 'fixture-title', 'c': 'fixture-subtitle', 'd': 'fixture-image',
                                   'e': False, 'f': None})
            entry = Obj('Lhp;', {'a': playable, 'b': False})
            items = [entry] if manual else []
            before = Obj('Lb54;')
            queue_value = Obj('Lb54;', {'a': current, 'b': items, 'c': 0, 'd': items, 'e': items})
            flow = Obj('Lq3g;', {'value': before})
            vm.persistence = Obj('Lxc1;', {'b': Obj('Lkotlinx/serialization/json/Json;'), 'd': Obj('Lhg2;')})
            holder = Obj('Ldd1;', {'d': flow, 'c': vm.persistence})
            vm.call(*COMMIT, [holder, queue_value])
            assert flow.fields['value'] is queue_value
            assert vm.events[0] == ('published', queue_value) and vm.events[1][0] == 'persisted'
            persisted = vm.events[1][1]
            assert len(persisted) == int(manual), 'HLN retain every manually queued podcast'
            if manual:
                assert persisted[0].type == 'Lilc;'
                assert persisted[0].fields['data'][1:] == [
                    'fixture-podcast', 'fixture-title', 'fixture-subtitle', 'fixture-image', False, None, 0], 'HLN persistence retains original manual-item fields'
            vm.events.clear()
            vm.call(*COMMIT, [holder, queue_value])
            assert not vm.events, 'HLN unchanged queue keeps its original early return'
