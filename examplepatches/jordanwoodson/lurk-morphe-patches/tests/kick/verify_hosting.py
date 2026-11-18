#!/usr/bin/env python3
"""Execute actual emitted Stay on channel Hermes and stock countdown/callbacks.

Usage (hermes-dec Python): verify_hosting.py stock.bundle patched.apk
Or: verify_hosting.py stock.bundle patched.bundle manifest.json
Pinned to the Kick version in kick/shared/Constants.kt (functions found by name, module slots as that version has
them). JoinHostDialogContent and useCountdown run as they are; React's hooks (state, refs, callbacks and effects, kept
across renders), JSX, the scheduler, routing and the parent that mounts the dialog while there is a host event are
boundary doubles. The random duration is fixed at 3 seconds. This does not run React Native or a real Pusher/network
event.
"""
import argparse
import ast
from io import BytesIO
import json
import math
from pathlib import Path
import sys
from zipfile import is_zipfile, ZipFile

from hermes_dec.parsers.hbc_bytecode_parser import parse_hbc_bytecode
from hermes_dec.parsers.hbc_file_parser import HBCReader
from hermes_dec.parsers.serialized_literal_parser import unpack_slp_array
sys.path.insert(0, str(Path(__file__).resolve().parent))  # Also under python -I.
from test_hermes import verify as structural  # noqa: E402

U = object()


def function_named(reader, name):
    """The one function with this name: functions are found by name, not by build-local ID."""
    ids = [fid for fid, header in enumerate(reader.function_headers) if reader.strings[header.functionName] == name]
    assert len(ids) == 1, f'expected one function named {name}, found {len(ids)}'
    return ids[0]


def instructions(reader, data, fid):
    reader.file_buffer = BytesIO(data)
    return list(parse_hbc_bytecode(reader.function_headers[fid], reader))


def same(a, b):
    return a is b or (type(a) is type(b) and isinstance(a, (str, int, float, bool)) and a == b)


def truth(value):
    return value is not U and value is not None and (bool(value) if isinstance(value, (str, int, float, bool)) else True)


class Env(dict):
    def __init__(self, parents=()):
        super().__init__()
        self.parents = list(parents)


class VM:
    """Small fail-closed executor: only instructions reached by these production functions."""
    def __init__(self, reader, data):
        self.reader, self.data, self.code, self.top = reader, data, {}, {}
        self.intervals, self.next_timer = {}, 0
        self.globals = {
            'Math': {'floor': lambda this, value: math.floor(value)},
            'setInterval': self.interval,
            'clearInterval': lambda this, handle: self.intervals.pop(handle, None),
        }

    def interval(self, this, callback, millis):
        assert millis == 1000
        self.next_timer += 1
        self.intervals[self.next_timer] = callback
        return self.next_timer

    def instructions(self, fid):
        if fid not in self.code:
            code = instructions(self.reader, self.data, fid)
            self.code[fid] = {i.original_pos: i for i in code}
            # CallBuiltin takes its arguments from the frame's highest registers, the first argument in the highest one
            # the code names (`this` above it is never written).
            self.top[fid] = max((getattr(i, f'arg{j}') for i in code for j, operand in
                                 enumerate(i.inst.operands, 1) if operand.operand_type.name == 'Reg8'), default=0)
        return self.code[fid]

    def closure(self, fid, env):
        return lambda this=U, *params: self.run(fid, [env, *env.parents], params)

    def get(self, obj, key):
        if isinstance(obj, str) and key == 'startsWith':
            return lambda this, prefix: this.startswith(prefix)
        if isinstance(obj, list):
            return obj[key] if isinstance(key, int) and key < len(obj) else U
        return obj.get(key, U)

    def builtin(self, fid, r, number, count):
        top = self.top[fid]
        args = [r.get(top - k, U) for k in range(count - 1)]
        if number == 48:  # arraySpread(target, source, nextIndex): appends, returns the next index.
            target, source, index = args
            target.extend(source)
            return index + len(source)
        if number == 49:  # apply(function, arguments, this)
            function, arguments, this = args
            return function(this, *arguments)
        raise AssertionError(f'Unsupported builtin #{number}')

    def run(self, fid, envs, params=(), pc=0, registers=None):
        r = {} if registers is None else registers
        code = self.instructions(fid)
        for _ in range(4000):
            i = code[pc]
            op = i.inst.name
            a = [getattr(i, f'arg{j}') for j in range(1, len(i.inst.operands) + 1)]
            pc = i.next_pos
            if op == 'GetParentEnvironment': r[a[0]] = envs[a[1]]
            elif op in ('CreateFunctionEnvironment', 'CreateTopLevelEnvironment'):
                r[a[0]] = Env(envs if op == 'CreateFunctionEnvironment' else ())
            elif op == 'LoadFromEnvironment': r[a[0]] = r[a[1]].get(a[2], U)
            elif op in ('StoreToEnvironment', 'StoreNPToEnvironment'): r[a[0]][a[1]] = r[a[2]]
            elif op == 'LoadParam': r[a[0]] = params[a[1]-1] if a[1] <= len(params) else U
            elif op == 'LoadConstUndefined': r[a[0]] = U
            elif op == 'LoadConstNull': r[a[0]] = None
            elif op == 'LoadConstTrue': r[a[0]] = True
            elif op == 'LoadConstFalse': r[a[0]] = False
            elif op == 'LoadConstZero': r[a[0]] = 0
            elif op in ('LoadConstUInt8', 'LoadConstInt'): r[a[0]] = a[1]
            elif op in ('LoadConstString', 'LoadConstStringLongIndex'): r[a[0]] = self.reader.strings[a[1]]
            elif op == 'GetGlobalObject': r[a[0]] = self.globals
            elif op in ('GetById', 'GetByIdShort', 'TryGetById'): r[a[0]] = self.get(r[a[1]], self.reader.strings[a[3]])
            elif op in ('NewObjectWithBuffer', 'NewObjectWithBufferLong'):
                def literal(v):
                    if v in ('null', 'true', 'false', 'undefined'):
                        return {'null': None, 'true': True, 'false': False, 'undefined': U}[v]
                    return ast.literal_eval(v)
                keys = self.reader.object_shape_keys[a[1]]
                values = unpack_slp_array(self.reader.literal_values[a[2]:], len(keys), 99).to_strings(self.reader.strings)
                r[a[0]] = {literal(k): literal(v) for k, v in zip(keys, values)}
            elif op == 'PutOwnBySlotIdx': r[a[0]][list(r[a[0]])[a[2]]] = r[a[1]]
            elif op == 'PutByIdStrict': r[a[0]][self.reader.strings[a[3]]] = r[a[1]]
            elif op == 'NewArray': r[a[0]] = [U] * a[1]
            elif op == 'DefineOwnInDenseArray': r[a[0]][a[2]] = r[a[1]]
            elif op == 'Mov': r[a[0]] = r[a[1]]
            elif op == 'IteratorBegin': r[a[0]] = iter(r[a[1]])
            elif op == 'IteratorNext':
                try: r[a[0]] = next(r[a[1]])
                except StopIteration: r[a[0]], r[a[1]] = U, U
            elif op == 'IteratorClose': pass
            elif op == 'CreateClosure': r[a[0]] = self.closure(a[2], r[a[1]])
            elif op in ('Call1', 'Call2', 'Call3', 'Call4'): r[a[0]] = r[a[1]](*[r[x] for x in a[2:]])
            elif op == 'CallBuiltin': r[a[0]] = self.builtin(fid, r, a[1], a[2])
            elif op == 'StrictEq': r[a[0]] = same(r[a[1]], r[a[2]])
            elif op == 'Eq': r[a[0]] = same(r[a[1]], r[a[2]]) or (r[a[1]] in (None, U) and r[a[2]] in (None, U))
            elif op == 'Not': r[a[0]] = not truth(r[a[1]])
            elif op == 'Div': r[a[0]] = r[a[1]] / r[a[2]]
            elif op == 'Mod': r[a[0]] = r[a[1]] % r[a[2]]
            elif op == 'Sub': r[a[0]] = r[a[1]] - r[a[2]]
            elif op in ('Jmp', 'JmpLong'): pc = i.original_pos + a[0]
            elif op in ('JmpTrue', 'JmpTrueLong', 'JmpFalse', 'JmpFalseLong'):
                if truth(r[a[1]]) == op.startswith('JmpTrue'): pc = i.original_pos + a[0]
            elif op in ('JStrictEqual', 'JStrictNotEqual', 'JNotEqual', 'JEqual', 'JGreater', 'JNotGreater'):
                left, right = r[a[1]], r[a[2]]
                equal = same(left, right) or (op in ('JNotEqual', 'JEqual') and left in (None, U) and right in (None, U))
                if op in ('JGreater', 'JNotGreater'): branch = (left > right) == (op == 'JGreater')
                else: branch = not equal if op in ('JStrictNotEqual', 'JNotEqual') else equal
                if branch: pc = i.original_pos + a[0]
            elif op == 'Ret': return r[a[0]]
            else: raise AssertionError(f'Unsupported executed instruction #{fid} {i.original_pos:#x}: {op}')
        raise AssertionError('Hermes step bound exceeded')


class Hooks:
    """React's hooks for one mounted component tree, by call order: state, refs, callbacks (kept while their
    dependencies stay the same) and effects (run after the render when their dependencies change)."""
    def __init__(self):
        self.values, self.effects, self.pending = [], {}, []
        self.cursor = 0

    def slot(self, initial):
        index = self.cursor
        self.cursor += 1
        if index == len(self.values): self.values.append(initial())
        return index

    def state(self, this, initial):
        def new():
            cell = [initial, None]
            def set_value(this, value): cell[0] = value(U, cell[0]) if callable(value) else value
            cell[1] = set_value
            return cell
        return list(self.values[self.slot(new)])

    def ref(self, this, initial):
        return self.values[self.slot(lambda: {'current': initial})]

    def callback(self, this, fn, deps):
        index = self.slot(lambda: None)
        kept = self.values[index]
        if kept is None or len(kept[0]) != len(deps) or any(not same(a, b) for a, b in zip(kept[0], deps)):
            self.values[index] = (list(deps), fn)
        return self.values[index][1]

    def effect(self, this, fn, deps):
        index = self.slot(lambda: None)
        old = self.effects.get(index)
        if old is None or len(old[0]) != len(deps) or any(not same(a, b) for a, b in zip(old[0], deps)):
            self.pending.append((index, list(deps), fn))

    def commit(self):
        pending, self.pending = self.pending, []
        for index, deps, fn in pending:
            old = self.effects.get(index)
            if old and callable(old[1]): old[1](U)
            self.effects[index] = (deps, fn(U))

    def unmount(self):
        for _, cleanup in self.effects.values():
            if callable(cleanup): cleanup(U)


class Scenario:
    def __init__(self, reader, data):
        self.vm = VM(reader, data)
        self.functions = {name: function_named(reader, name) for name in ('useCountdown', 'JoinHostDialogContent')}
        self.hooks = None
        self.event, self.tree, self.options = None, None, None
        self.redirects, self.toasts = [], []
        self.path = '/stream/first'
        self.clear = lambda this: setattr(self, 'event', None)
        self.redirect = lambda this: self.redirects.append(self.event['hosted']['username']) or self.clear(U)
        self.translate = lambda this, text, *args: (text, args[0] if args else None)
        self.toast = lambda this, toast: self.toasts.append(toast)
        self.jsx = lambda this, kind, props: {'type': kind, 'props': props}
        react = {
            'useState': lambda this, value: self.hooks.state(this, value),
            'useRef': lambda this, value: self.hooks.ref(this, value),
            'useCallback': lambda this, fn, deps: self.hooks.callback(this, fn, deps),
            'useEffect': lambda this, fn, deps: self.hooks.effect(this, fn, deps),
        }
        # JoinHostDialogContent's module, by slot, as Kick 40.35 lays it out.
        self.module = {
            0: react,
            1: {'useTranslation': lambda this: {'t': self.translate}},
            2: {key: key for key in ('Root', 'Inner', 'Header', 'Title', 'Close', 'Body', 'Description', 'Footer',
                                     'Confirm', 'Cancel')},
            4: {'currentPath': {'get': lambda this: self.path}},
            6: {'getRandomIntInclusive': lambda this, low, high: 3},  # Fixed for the test; Kick picks in [low, high].
            7: {'useChatStore': lambda this, selector: 'current-channel'},
            9: {'useCountdown': self.countdown},
            10: {'useToast': lambda this: {'showToast': self.toast}},
            11: {'JoinHostDialogMediaTile': 'MediaTile'},
            12: {'jsx': self.jsx, 'jsxs': self.jsx},
            14: [8, 12],
        }
        self.countdown_module = {0: react}

    def countdown(self, this, options):
        self.options = dict(options)
        return self.vm.run(self.functions['useCountdown'], [self.countdown_module], (options,))

    def render(self):
        # The parent mounts the dialog while there is a host event and unmounts it when the event is cleared.
        if self.event is None:
            if self.hooks: self.hooks.unmount()
            self.hooks, self.tree = None, None
            return
        if self.hooks is None: self.hooks = Hooks()
        self.hooks.cursor = 0
        props = {'event': self.event, 'clearEvent': self.clear, 'onRedirect': self.redirect}
        self.tree = self.vm.run(self.functions['JoinHostDialogContent'], [self.module], (props,))
        self.hooks.commit()

    def host(self, name):
        self.event = {'hosted': {'username': name}}
        self.render()

    def find(self, node, kind):
        if isinstance(node, list):
            for child in node:
                result = self.find(child, kind)
                if result: return result
        elif isinstance(node, dict) and 'type' in node:
            if node['type'] == kind: return node['props']
            return self.find(node['props'].get('children'), kind)
        return None

    def button(self, kind):
        found = self.find(self.tree, kind)
        assert found and callable(found.get('onPress')), f'Actual JSX has no {kind} callback'
        return found['onPress']

    def seconds(self):
        """The seconds the dialog's title shows."""
        title = self.find(self.tree, 'Title')
        assert title, 'Actual JSX has no title'
        return title['children'][1]['seconds']

    def advance(self, seconds):
        for _ in range(seconds):
            for handle, callback in list(self.vm.intervals.items()):
                if handle in self.vm.intervals: callback(U)
            self.render()


def waiting(reader, data):
    s = Scenario(reader, data)
    s.host('A')
    assert s.options['startOnMount'] is False and not s.vm.intervals, 'on must wait for Watch now'
    s.advance(30)
    assert not s.redirects and s.tree is not None, 'waiting host redirected'
    assert s.seconds() == 3, 'waiting countdown decremented'
    return s


def manual(reader, data):
    s = waiting(reader, data)
    s.button('Confirm')(U)
    assert not s.redirects and len(s.toasts) == 1, 'Watch now must toast before redirect'
    s.render()
    assert s.options['startOnMount'] is True, 'Watch now must start the countdown'
    assert s.tree is None and len(s.vm.intervals) == 1, 'Watch now hides dialog and starts one countdown'
    s.advance(3)
    assert s.redirects == ['A'] and s.hooks is None, 'actual onEnd must redirect and parent unmount'
    s.advance(10)
    assert s.redirects == ['A'], 'countdown redirected twice'
    s.host('B')
    assert s.options['startOnMount'] is False and not s.vm.intervals, 'second host must wait anew'
    s.button('Confirm')(U); s.render(); s.advance(3)
    assert s.redirects == ['A', 'B'], 'second event must target B'
    return s


def verify(stock, embedded, manifest):
    structural(stock, embedded, manifest)
    reader = HBCReader(); reader.read_whole_file(BytesIO(stock))
    edits = [e for e in manifest['edits'] if e['key'] == 'stay_on_host']
    assert len(edits) == 1
    edit = edits[0]
    offset, replacement = edit['offset'], bytes.fromhex(edit['replacement'])
    selected = bytearray(stock); selected[offset:offset+len(replacement)] = replacement
    off = bytearray(selected); off[offset:offset+len(replacement)] = bytes.fromhex(edit['original'])
    assert off == stock, 'off must restore exact stock bytes'
    # The short NewObjectWithBuffer form, then PutOwnBySlotIdx of the state into the startOnMount slot (1).
    assert replacement[0] == 0x01 and replacement[6] == 0x52 and replacement[9] == 1, 'unexpected emitted edit'
    manual(reader, selected)
    for button in ('Cancel', 'Close'):
        for after_start in (False, True):
            s = waiting(reader, selected)
            cancel = s.button(button)
            if after_start: s.button('Confirm')(U); s.render(); s.advance(1)
            cancel(U); s.render(); s.advance(30)
            assert not s.redirects and not s.vm.intervals and s.hooks is None, f'{button} must clear and stop'
    for press in (False, True):
        s = Scenario(reader, off); s.host('stock')
        assert s.options['startOnMount'] is True and len(s.vm.intervals) == 1
        if press: s.button('Confirm')(U); s.render()
        s.advance(30)
        assert s.redirects == ['stock'], 'off must redirect once automatically'
    for path, count in (('/stream/a', 1), ('/clip/a', 1), ('/vod/a', 1), ('/browse', 0)):
        s = waiting(reader, selected); s.path = path
        s.button('Confirm')(U); s.render(); s.advance(3)
        assert len(s.redirects) == count, f'actual onEnd route guard: {path}'

    # Mutation controls are executable failures, not comparisons against literals.
    def rejected(name, data, test):
        try: test(reader, data)
        except AssertionError as e:
            assert 'Unsupported' not in str(e), str(e)
            print(f'CONTROL rejected {name}: {e}')
        else: raise AssertionError(f'Mutation survived: {name}')
    rejected('stock edit while switch on', off, waiting)
    # The short literal with the state stored into the duration slot (0) instead: startOnMount keeps the value the
    # short form starts it with, and Watch now no longer starts the countdown.
    unset = bytearray(selected)
    unset[offset + 9] = 0
    rejected('state stored outside startOnMount', unset, manual)
    # onEnd returning at entry (the first version of the patch): Watch now no longer switches.
    blocked = bytearray(selected)
    content = function_named(reader, 'JoinHostDialogContent')
    ends = [i.arg3 for i in instructions(reader, stock, content) if i.inst.name == 'CreateClosure' and
            any(j.inst.name in ('LoadConstString', 'LoadConstStringLongIndex') and reader.strings[j.arg2] == '/stream'
                for j in instructions(reader, stock, i.arg3))]
    assert len(ends) == 1, 'one onEnd closure'
    header = reader.function_headers[ends[0]]
    code = instructions(reader, stock, ends[0])
    load, ret = code[-2], code[-1]
    assert ret.inst.name == 'Ret' and load.inst.name == 'LoadConstUndefined' and load.arg1 == ret.arg1
    tail = stock[header.offset + load.original_pos:header.offset + ret.next_pos]
    # Its own `return undefined` first, then a Mov r0, r0 up to the next instruction boundary, so the rest decodes.
    boundary = next(i.next_pos for i in code if i.next_pos >= len(tail) + 3)
    assert boundary == len(tail) + 3, 'onEnd starts with instructions that leave no room for the padding'
    blocked[header.offset:header.offset + boundary] = tail + bytes([0x10, 0, 0])
    rejected('onEnd return-at-entry', blocked, manual)
    print('PASS: emitted host wait/Watch now/Cancel/Close/off/consecutive event, real countdown effects, route guards; '
          'three mutation controls')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('stock', type=Path); parser.add_argument('patched', type=Path)
    parser.add_argument('manifest', nargs='?', type=Path)
    args = parser.parse_args()
    if is_zipfile(args.patched):
        with ZipFile(args.patched) as apk:
            embedded = apk.read('assets/index.android.bundle')
            manifest = json.loads(apk.read('assets/lurk-hermes.json'))
    else:
        if args.manifest is None: parser.error('manifest required for raw bundle')
        embedded = args.patched.read_bytes(); manifest = json.loads(args.manifest.read_text())
    verify(args.stock.read_bytes(), embedded, manifest)
