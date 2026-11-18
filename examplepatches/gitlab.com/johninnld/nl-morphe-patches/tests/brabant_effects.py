"""Restore only independently owned edits before hashing retained behavior."""
from dataclasses import replace
import re

from verify_dumpert import absolute_registers


def restore_alignment(value, expected_count):
    difference = expected_count - len(value.code)
    if not difference:
        return value
    assert value.switches and abs(difference) == 1, 'Unexpected Brabant switch alignment'
    assert all(value.program.labels[label] == len(value.program.instructions)
               for label in value.program.switches), 'Nonterminal Brabant switch alignment'
    if difference == 1:
        return replace(value, code=value.code + ['nop'])
    assert value.code[-1] == 'nop', 'Only Brabant alignment nop may be removed'
    return replace(value, code=value.code[:-1])


def restore_edits(value, edits, locals_):
    edits = sorted(edits, key=lambda e: e['index'])
    assert len({e['index'] for e in edits}) == len(edits), 'Overlapping Brabant owned anchors'
    regions, delta = [], 0
    for edit in edits:
        new_start = edit['index'] + delta
        regions.append((new_start, edit))
        delta += len(edit['replacement']) - len(edit['original'])
    code = [(line, True) for line in value.code]
    for new_start, edit in reversed(regions):
        expected = edit['replacement']
        actual = [line for line, _ in code[new_start:new_start + len(expected)]]
        assert [absolute_registers(x, locals_) for x in actual] == [absolute_registers(x, locals_) for x in expected], 'Missing Brabant owned edit at ' + str(edit['index'])
        code[new_start:new_start + len(expected)] = [(line, False) for line in edit['original']]

    def position(value):
        delta = 0
        for new_start, edit in regions:
            if value < new_start:
                break
            old, new = len(edit['original']), len(edit['replacement'])
            if value < new_start + new:
                if old == new:
                    return edit['index'] + value - new_start
                assert value == new_start, 'Retained Brabant branch enters inserted policy interior'
                return edit['index']
            delta += new - old
        return value - delta

    code = [re.sub(r'@(\d+)', lambda m: '@' + str(position(int(m[1]))), line)
            if remap and line.startswith(('if-', 'goto')) else line for line, remap in code]
    switches = [{key: position(target) for key, target in table.items()} for table in value.switches]
    handlers = [(position(start), position(end), kind, position(target))
                for start, end, kind, target in value.handlers]
    return replace(value, code=code, switches=switches, handlers=handlers)
