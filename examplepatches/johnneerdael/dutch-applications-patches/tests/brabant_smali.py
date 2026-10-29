"""True executable labels, switch tables, arrays and handlers for Brabant.

Keep data payloads out of instruction indexes. In particular, a packed-switch
entry names a code label; it must never redefine that label at the payload.
Existing approved-app canonical contracts remain unchanged.
"""
from dataclasses import dataclass
import hashlib
import json
import re

from rtl_vm import parse


@dataclass
class Body:
    code: list[str]
    switches: list[dict[int, int]]
    handlers: list[tuple[int, int, str | None, int]]
    arrays: list[tuple[int, list[str]]]
    program: object

    def digest(self):
        return hashlib.sha256(json.dumps([self.code, self.switches, self.handlers, self.arrays],
                                         sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def canonical(body):
    lines, arrays, label, active = [], {}, None, None
    for raw in body.splitlines():
        line = raw.strip()
        if line.startswith('.array-data '):
            assert active is None and label is not None and label not in arrays, 'Missing/duplicate Brabant array label'
            active = label
            arrays[active] = (int(line.split()[1], 0), [])
        elif line.startswith('.end array-data'):
            assert active is not None, 'Unexpected Brabant array end'
            active = None
        elif active is not None:
            value = line.split('#', 1)[0].strip()
            if value:
                arrays[active][1].append(value)
        else:
            lines.append(raw)
            if line.startswith(':'):
                label = line[1:]
            elif line and not line.startswith(('.', '#')):
                label = None
    assert active is None, 'Unterminated Brabant array payload'
    program = parse('\n'.join(lines))
    switches = {label: index for index, label in enumerate(program.switches)}
    array_ids = {label: index for index, label in enumerate(arrays)}
    code = []
    for line in program.instructions:
        op = line.split(' ', 1)[0]
        if op in {'packed-switch', 'sparse-switch', 'fill-array-data'}:
            prefix, target = line.rsplit(', :', 1)
            values, kind = (array_ids, 'array') if op == 'fill-array-data' else (switches, 'switch')
            assert target in values, 'Unknown Brabant data payload: ' + target
            code.append(prefix + ', ' + kind + '#' + str(values[target]))
        else:
            operands, separator, literal = line.partition('"')
            def target(match):
                assert match[1] in program.labels, 'Unknown Brabant branch: ' + match[1]
                return '@' + str(program.labels[match[1]])
            code.append(re.sub(r'(?<!\S):([\w$]+)', target, operands) + separator + literal)
    return Body(code, list(program.switches.values()), program.handlers, list(arrays.values()), program)
