"""Model the emitted bottom-tab renderer prefix, preserving native route indexes."""
import struct

PROPERTIES = {176: 'key', 198: 'options', 38427: 'tabBarLabel', 233: 'title',
              71: 'name', 23151: 'BottomTabs', 24657: 'MOMENTS', 24711: 'profile',
              34803: 'moments', 12542: 'navigation.weekend'}
# Only opcodes reached in this inspected callback prefix; no general JS VM.
OPERANDS = {0x34: 'BB', 0x40: 'BB', 0x89: 'BB', 0x37: 'BBB', 0x3b: 'BBB',
            0x44: 'BBBB', 0x45: 'BBBH', 0x5d: 'BBB', 0x94: 'B', 0xb0: 'bB',
            0x76: 'B', 0xd1: 'bBB', 0xd3: 'bBB', 0xd5: 'bBB', 0xb2: 'bB',
            0x90: 'BH', 0x10: 'BB', 0xae: 'b', 0x93: 'B', 0x6e: 'BBBB'}


def route_result(prefix, name, index, options, descriptor=True, weekend=False):
    route = {'name': name, 'key': 'key-' + name}
    parent = {1: ({route['key']: {'options': options}} if descriptor else {}), 0: {'index': index},
              4: lambda key: 'Weekend' if key == 'navigation.weekend' else 'unexpected', 5: weekend}
    outer = {15: {'BottomTabs': {'MOMENTS': 'moments'}}}
    params, regs, position, visited = {1: route, 2: index}, {}, 0, set()
    while position < 118:
        assert position not in visited, 'No callback loop'
        visited.add(position)
        op = prefix[position]
        assert op in OPERANDS, (position, 'unmodeled callback instruction')
        fmt = OPERANDS[op]
        args = struct.unpack_from('<' + fmt, prefix, position + 1)
        following = position + 1 + struct.calcsize('<' + fmt)
        if op == 0x34:
            regs[args[0]] = {0: parent, 1: outer}[args[1]]
        elif op == 0x40:
            regs[args[0]] = {}
        elif op == 0x89:
            regs[args[0]] = params[args[1]]
        elif op == 0x37:
            regs[args[0]][args[1]] = regs[args[2]]
        elif op == 0x3b:
            regs[args[0]] = regs[args[1]][args[2]]
        elif op in (0x44, 0x45):
            regs[args[0]] = regs[args[1]].get(PROPERTIES[args[3]])
        elif op == 0x5d:
            regs[args[0]] = regs[args[1]].get(regs[args[2]])
        elif op in (0x94, 0x93):
            regs[args[0]] = None
        elif op == 0x90:
            regs[args[0]] = PROPERTIES[args[1]]
        elif op in (0xb0, 0xb2):
            value = regs[args[1]]
            truthy = not (value is None or value is False or isinstance(value, (str, int, float)) and value in ('', 0))
            if truthy == (op == 0xb0):
                following = position + args[0]
        elif op in (0xd1, 0xd3, 0xd5):
            left, right = regs[args[1]], regs[args[2]]
            same = type(left) is type(right) and left == right
            matches = left != right if op == 0xd1 else same if op == 0xd3 else not same
            if matches:
                following = position + args[0]
        elif op == 0xae:
            following = position + args[0]
        elif op == 0x10:
            regs[args[0]] = regs[args[1]]
        elif op == 0x6e:
            regs[args[0]] = regs[args[1]](regs[args[3]])
        elif op == 0x76:
            assert position == 31 and regs[args[0]] is None, 'Use the original null return'
            return False, None
        position = following
    assert position == 118 and parent[0]['index'] == index and regs[17] is route
    return True, regs[16]


def verify_account_tabs(data, hidden=True):
    prefix = data[7114322:7114322 + 118]
    checks = 0
    for name in ('newsBottomTab', 'recent', 'moments', 'profile', 'menu', 'newspaper', 'unexpected'):
        for index in range(6):
            for options in ({'tabBarLabel': 'explicit'}, {'title': 'title'}, {}):
                for weekend in (False, True):
                    visible, label = route_result(prefix, name, index, options, True, weekend)
                    assert visible == (not hidden or name != 'profile'), (name, index, 'tab visibility')
                    if visible:
                        expected = 'Weekend' if name == 'moments' and weekend else options.get('tabBarLabel', options.get('title', name))
                        assert label == expected, 'Retain original label and weekend behavior'
                    assert route_result(prefix, name, index, options, False, weekend) == (False, None)
                    checks += 2
    return checks


def verify_moments_gate(data, selected):
    base = 5943196
    checks = 0
    for items in (False, True):
        for weekend in (False, True):
            for logged_in in (False, True):
                for offer in (False, True):
                    regs = {4: not items and weekend, 2: not items and not weekend, 9: logged_in, 6: offer}
                    position, seen = 734, set()
                    while position not in (758, 1333, 1407, 1482):
                        assert position not in seen
                        seen.add(position)
                        op = data[base + position]
                        if op in (0xb1, 0xb3):
                            delta, register = struct.unpack_from('<iB', data, base + position + 1)
                            take = bool(regs[register]) == (op == 0xb1)
                            position += delta if take else 6
                        else:
                            assert op == 0xaf, 'Only original display branches or the guarded direct jump'
                            position += struct.unpack_from('<i', data, base + position + 1)[0]
                    expected = 1482 if not items and weekend else 1407 if not selected and (not logged_in or offer) else 1333 if not items else 758
                    assert position == expected, (items, weekend, logged_in, offer, position, expected)
                    if selected:
                        assert not any(745 <= p < 752 for p in seen), 'No dead gate padding executes'
                    checks += 1
    return checks
