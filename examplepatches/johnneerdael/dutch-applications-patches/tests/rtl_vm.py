"""Bounded instruction fixtures for RTL; references never use Python truthiness."""
from dataclasses import dataclass, field
import re


@dataclass(eq=False)
class Reference:
    value: object
    descriptor: str | None = None


def is_zero(value):
    return value is None or (type(value) in (int, bool) and value == 0)


def equal(a, b):
    if is_zero(a) and is_zero(b):
        return True
    if type(a) in (int, bool) and type(b) in (int, bool):
        return a == b
    return a is b


class Memory:
    """Explicit fixture memory, with hierarchy supplied by the bound original DEX."""
    def __init__(self, parents=None, statics=None):
        self.parents = parents or {}
        self.statics = statics or {}
        self.classes = {}

    def instance_of(self, value, descriptor):
        if is_zero(value):
            return False
        actual = value.descriptor if isinstance(value, Reference) else 'Ljava/lang/String;' if isinstance(value, str) else None
        assert actual, 'Unknown RTL reference type'
        pending, visited = [actual], set()
        while pending:
            current = pending.pop()
            if current == descriptor or descriptor == 'Ljava/lang/Object;':
                return True
            if current in visited:
                continue
            visited.add(current)
            pending.extend(self.parents(current) if callable(self.parents) else self.parents.get(current, ()))
        return False

    def get(self, instance, field):
        if is_zero(instance):
            raise VmThrown(Reference({}, 'Ljava/lang/NullPointerException;'))
        assert isinstance(instance, Reference) and isinstance(instance.value, dict), 'RTL field receiver needs explicit object memory'
        assert field in instance.value, 'Unknown RTL field: ' + field
        return instance.value[field]

    def put(self, instance, field, value):
        if is_zero(instance):
            raise VmThrown(Reference({}, 'Ljava/lang/NullPointerException;'))
        assert isinstance(instance, Reference) and isinstance(instance.value, dict), 'RTL field receiver needs explicit object memory'
        instance.value[field] = value

    def static(self, field):
        assert field in self.statics, 'Unknown RTL static: ' + field
        return self.statics[field]


@dataclass
class Program:
    instructions: list[str]
    labels: dict[str, int]
    switches: dict[str, dict[int, int]]
    handlers: list[tuple[int, int, str | None, int]] = field(default_factory=list)


class VmThrown(Exception):
    def __init__(self, value):
        assert isinstance(value, Reference), 'RTL throwable needs a typed reference'
        self.value = value
        super().__init__(value.descriptor)


def parse(body):
    """Keep executable labels and packed/sparse routing as distinct structures."""
    instructions, labels, tables, catches = [], {}, {}, []
    annotation, table, table_label, last_label, next_key = 0, None, None, None, None
    for raw in body.splitlines():
        line = raw.strip().split('    #')[0]
        if line.startswith('.annotation'):
            annotation += 1
        if line.startswith('.end annotation'):
            annotation -= 1
            continue
        if annotation or not line or line.startswith('#'):
            continue
        if line.startswith(('.catch ', '.catchall ')):
            match = re.fullmatch(r'\.catch(?: (L[^;]+;)|all) \{:(\w+) \.\. :(\w+)\} :(\w+)', line)
            assert match, 'Malformed RTL catch: ' + line
            catches.append(match.groups())
            continue
        if line.startswith(('.end packed-switch', '.end sparse-switch')):
            assert table is not None, 'Unexpected switch end'
            tables[table_label] = table
            table, table_label, next_key = None, None, None
            continue
        if table is not None:
            if next_key is None:
                match = re.fullmatch(r'(-?0x[0-9a-fA-F]+|-?\d+)\s*->\s*:([\w$]+)', line)
                assert match, 'Malformed sparse switch entry: ' + line
                key, target = int(match[1], 0), match[2]
            else:
                assert re.fullmatch(r':[\w$]+', line), 'Malformed packed switch entry: ' + line
                key, target = next_key, line[1:]
                next_key += 1
            assert key not in table, 'Duplicate switch key'
            table[key] = target
            continue
        if line.startswith(('.packed-switch', '.sparse-switch')):
            assert last_label is not None and last_label not in tables, 'Missing/duplicate switch payload label'
            table, table_label = {}, last_label
            next_key = int(line.split()[1], 0) if line.startswith('.packed-switch') else None
            continue
        if line.startswith(':'):
            label = line[1:]
            assert label not in labels, 'Duplicate label: ' + label
            labels[label] = len(instructions)
            last_label = label
        elif not line.startswith('.'):
            instructions.append(line.replace('const-string/jumbo ', 'const-string '))
            last_label = None
    assert table is None, 'Unterminated switch payload'
    switches = {}
    for label, entries in tables.items():
        switches[label] = {}
        for key, target in entries.items():
            assert target in labels, 'Missing switch target: ' + target
            switches[label][key] = labels[target]
    handlers = [(labels[start], labels[end], kind, labels[handler])
                for kind, start, end, handler in catches]
    return Program(instructions, labels, switches, handlers)


def execute(program, registers, invoke, start=0, limit=10000, memory=None, stop_at=(), trace=None):
    """Execute only explicitly modeled fixture instructions; fail closed otherwise."""
    import json
    assert isinstance(program, Program), 'RTL executor needs parsed labels and switch tables'
    pc, result, memory, exception = start, None, memory or Memory(), None
    monitors = []  # Single-thread fixture balance; this does not model scheduling.
    def target(value):
        if value.startswith('@'):
            return int(value[1:])
        assert value.startswith(':') and value[1:] in program.labels, 'Unknown RTL target: ' + value
        return program.labels[value[1:]]
    for _ in range(limit):
        assert 0 <= pc < len(program.instructions), 'RTL execution fell off method'
        if pc in stop_at:
            return pc
        line = program.instructions[pc]
        if trace:
            trace(line)
        pc += 1
        op, _, operands = line.partition(' ')
        args = operands.split(', ')
        try:
            if op == 'nop':
                continue
            if op == 'const-class':
                descriptor = args[1]
                if descriptor not in memory.classes:
                    memory.classes[descriptor] = Reference(descriptor, 'Ljava/lang/Class;')
                registers[args[0]] = memory.classes[descriptor]
            elif op.startswith('const-string'):
                # Smali additionally permits escaped apostrophes in double quotes.
                # Preserve paired backslashes (a literal backslash before a quote).
                literal = re.sub(r"(?<!\\)((?:\\\\)*)\\'", r"\1'", operands.split(', ', 1)[1])
                registers[args[0]] = json.loads(literal)
            elif op.startswith('const'):
                registers[args[0]] = int(args[1].removesuffix('L'), 0)
                if op.startswith('const-wide'):
                    registers[args[0][0] + str(int(args[0][1:]) + 1)] = 0
            elif op == 'throw':
                raise VmThrown(registers[operands])
            elif op == 'move-exception':
                assert exception is not None, 'RTL move-exception outside handler'
                registers[operands], exception = exception, None
            elif op.startswith('move-result'):
                registers[args[0]] = result
                if op == 'move-result-wide':
                    registers[args[0][0] + str(int(args[0][1:]) + 1)] = 0
            elif op.startswith('move'):
                second = registers[args[1][0] + str(int(args[1][1:]) + 1)] if op.startswith('move-wide') else None
                registers[args[0]] = registers[args[1]]
                if op.startswith('move-wide'):
                    registers[args[0][0] + str(int(args[0][1:]) + 1)] = second
            elif op.startswith('iget'):
                registers[args[0]] = memory.get(registers[args[1]], args[2])
                if op == 'iget-wide':
                    registers[args[0][0] + str(int(args[0][1:]) + 1)] = 0
            elif op.startswith('iput'):
                memory.put(registers[args[1]], args[2], registers[args[0]])
            elif op.startswith('sget'):
                registers[args[0]] = memory.static(args[1])
            elif op in {'sput-object', 'sput-boolean'}:
                memory.statics[args[1]] = registers[args[0]]
            elif op == 'instance-of':
                registers[args[0]] = int(memory.instance_of(registers[args[1]], args[2]))
            elif op == 'check-cast':
                assert is_zero(registers[args[0]]) or memory.instance_of(registers[args[0]], args[1]), 'RTL cast failed: ' + line
            elif op == 'new-instance':
                registers[args[0]] = Reference({}, args[1])
            elif op == 'new-array':
                registers[args[0]] = Reference(([0] if args[2]=='[I' else [None]) * registers[args[1]], args[2])
            elif op == 'array-length':
                array = registers[args[1]]
                assert isinstance(array, Reference) and isinstance(array.value, list) and (array.descriptor or '').startswith('['), 'RTL array length requires an array'
                registers[args[0]] = len(array.value)
            elif op == 'aget':
                array,index=registers[args[1]],registers[args[2]]
                assert isinstance(array,Reference) and array.descriptor=='[I' and isinstance(array.value,list), 'RTL int array required'
                assert type(index) is int and 0<=index<len(array.value), 'RTL array index outside bounds'
                value=array.value[index]
                assert type(value) is int and -2**31<=value<2**31, 'RTL int array element required'
                registers[args[0]]=value
            elif op == 'aput':
                array,index,value=registers[args[1]],registers[args[2]],registers[args[0]]
                assert isinstance(array,Reference) and array.descriptor=='[I' and isinstance(array.value,list), 'RTL int array required'
                assert type(index) is int and 0<=index<len(array.value), 'RTL array index outside bounds'
                assert type(value) is int and -2**31<=value<2**31, 'RTL int array element required'
                array.value[index]=value
            elif op == 'aget-object':
                array, index = registers[args[1]], registers[args[2]]
                assert isinstance(array, Reference) and isinstance(array.value, list), 'RTL object array required'
                assert type(index) is int and 0 <= index < len(array.value), 'RTL array index outside bounds'
                registers[args[0]] = array.value[index]
            elif op in {'filled-new-array','filled-new-array/range'}:
                match = re.fullmatch(r'\{([^}]*)\}, (\[.+)', operands)
                assert match, 'Malformed RTL filled array'
                if op.endswith('/range'):
                    span=re.fullmatch(r'([vp])(\d+) \.\. \1(\d+)',match[1])
                    assert span and int(span[2])<=int(span[3]),'Malformed RTL filled array range'
                    names=[span[1]+str(i) for i in range(int(span[2]),int(span[3])+1)]
                else:names=[name for name in match[1].split(', ') if name]
                result = Reference([registers[name] for name in names], match[2])
            elif op == 'monitor-enter':
                assert not is_zero(registers[operands]), 'Null RTL monitor'
                monitors.append(registers[operands])
            elif op == 'monitor-exit':
                assert monitors and monitors.pop() is registers[operands], 'Unbalanced RTL monitor'
            elif op == 'cmp-long':
                a, b = registers[args[1]], registers[args[2]]
                assert type(a) is int and type(b) is int, 'RTL long comparison needs primitive values'
                registers[args[0]] = (a > b) - (a < b)
            elif op == 'int-to-long':
                assert type(registers[args[1]]) is int, 'RTL widening needs primitive int'
                registers[args[0]] = registers[args[1]]
                registers[args[0][0] + str(int(args[0][1:]) + 1)] = 0
            elif op == 'mul-int/lit16':
                assert type(registers[args[1]]) is int, 'RTL multiplication needs primitive int'
                value = (registers[args[1]] * int(args[2], 0)) & 0xffffffff
                registers[args[0]] = value - 0x100000000 if value >= 0x80000000 else value
            elif op in {'sub-long/2addr', 'add-long/2addr'}:
                a, b = registers[args[0]], registers[args[1]]
                assert type(a) is int and type(b) is int, 'RTL long arithmetic needs primitives'
                value = a + b if op == 'add-long/2addr' else a - b
                registers[args[0]] = (value + 2**63) % 2**64 - 2**63
                registers[args[0][0] + str(int(args[0][1:]) + 1)] = 0
            elif op.startswith(('and-int', 'or-int', 'xor-int', 'add-int', 'sub-int')):
                if '/2addr' in op:
                    a, b = registers[args[0]], registers[args[1]]
                else:
                    a = registers[args[1]]
                    b = int(args[2], 0) if '/lit' in op else registers[args[2]]
                assert type(a) in (int, bool) and type(b) in (int, bool), 'RTL int operation needs primitives'
                kind = op.split('-', 1)[0]
                value = {'and': lambda: a & b, 'or': lambda: a | b, 'xor': lambda: a ^ b,
                         'add': lambda: a + b, 'sub': lambda: a - b}[kind]()
                registers[args[0]] = (value + 2**31) % 2**32 - 2**31
            elif op in {'packed-switch', 'sparse-switch'}:
                table = args[1].removeprefix(':')
                assert table in program.switches, 'Missing RTL switch table: ' + table
                value = registers[args[0]]
                assert type(value) is int, 'RTL switch key must be primitive int'
                pc = program.switches[table].get(value, pc)
            elif op.startswith('if-'):
                a = registers[args[0]]
                if op in {'if-eqz', 'if-nez'}:
                    take = is_zero(a) if op == 'if-eqz' else not is_zero(a)
                else:
                    b = registers[args[1]] if len(args) == 3 else 0
                    if op in {'if-eq', 'if-ne'}:
                        take = equal(a, b) if op == 'if-eq' else not equal(a, b)
                    else:
                        assert type(a) in (int, bool) and type(b) in (int, bool), 'RTL ordered comparison needs primitives'
                        if op in {'if-lt', 'if-ltz'}: take = a < b
                        elif op in {'if-le', 'if-lez'}: take = a <= b
                        elif op in {'if-gt', 'if-gtz'}: take = a > b
                        elif op in {'if-ge', 'if-gez'}: take = a >= b
                        else: raise AssertionError('Unsupported RTL branch: ' + line)
                if take:
                    pc = target(args[-1])
            elif op.startswith('goto'):
                pc = target(operands)
            elif op.startswith('invoke-'):
                match = re.fullmatch(r'\{([^}]*)\}, (.+)', operands)
                assert match, 'Malformed RTL invocation: ' + line
                names, method = match.groups()
                if ' .. ' in names:
                    first, last = names.split(' .. ')
                    assert first[0] == last[0], 'Mixed RTL range register namespaces'
                    names = [first[0] + str(i) for i in range(int(first[1:]), int(last[1:]) + 1)]
                else:
                    names = names.split(', ') if names else []
                result = invoke(method, [registers[name] for name in names])
            elif op == 'return-void':
                assert not monitors, 'Unreleased RTL monitor'
                return None
            elif op in {'return', 'return-object', 'return-wide'}:
                assert not monitors, 'Unreleased RTL monitor'
                return registers[operands]
            else:
                raise AssertionError('Unsupported RTL instruction: ' + line)
        except VmThrown as thrown:
            handlers = [h for h in program.handlers if h[0] <= pc - 1 < h[1]
                        and (h[2] is None or memory.instance_of(thrown.value, h[2]))]
            if not handlers:
                raise
            exception, pc = thrown.value, handlers[0][3]
    raise AssertionError('RTL execution did not terminate')
