"""Locate report tables through resource references and verified call arguments."""
import bisect
import collections
import struct

from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
from capstone.arm64 import ARM64_OP_IMM, ARM64_OP_REG


def require(value, message):
    if not value:
        raise ValueError('Native report layout: ' + message)


def candidate_ranges(renderer, templates):
    targets = set()
    for section in renderer.elf.iter_sections():
        if section['sh_flags'] & 2 and not section['sh_flags'] & 4 and section['sh_type'] != 'SHT_NOBITS':
            raw = section.data()
            for name in templates:
                needle = name.encode() + b'\0'
                at = raw.find(needle)
                while at >= 0:
                    targets.add(section['sh_addr'] + at)
                    at = raw.find(needle, at + 1)
    require(targets, 'hazard resource strings missing')
    starts = renderer.functions()
    ranges = set()
    pages = {}
    for index, (word,) in enumerate(struct.iter_unpack('<I', renderer.code)):
        address = renderer.address + index * 4
        value = None
        if word & 0x9f000000 == 0x90000000:
            immediate = ((word >> 5) & 0x7ffff) * 4 + ((word >> 29) & 3)
            if immediate & (1 << 20):
                immediate -= 1 << 21
            pages[word & 31] = ((address & ~4095) + immediate * 4096, address)
        elif word & 0xffc00000 == 0x91000000:
            source = (word >> 5) & 31
            if source in pages and address - pages[source][1] <= 64:
                value = pages[source][0] + ((word >> 10) & 4095)
        elif word & 0x9f000000 == 0x10000000:
            immediate = ((word >> 5) & 0x7ffff) * 4 + ((word >> 29) & 3)
            if immediate & (1 << 20):
                immediate -= 1 << 21
            value = address + immediate
        if value in targets:
            at = bisect.bisect_right(starts, address) - 1
            require(0 <= at < len(starts) - 1, 'resource reference outside function bounds')
            ranges.add((starts[at], starts[at + 1]))
    require(0 < len(ranges) <= 32, 'resource initializer candidates missing or excessive')
    return sorted(ranges)


def calls_in(renderer, start, end):
    require(end - start <= 1024 * 1024, 'initializer exceeds analysis bound')
    offset = renderer.offset(start, end - start, executable=True)
    decoder = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
    decoder.detail = True
    registers = {}
    covered = 0
    for ins in decoder.disasm(renderer.data[offset:offset + end - start], start):
        covered += ins.size
        old = registers.copy()
        for reg in ins.regs_access()[1]:
            name = ins.reg_name(reg)
            registers.pop('x' + name[1:] if name.startswith('w') else name, None)
        operands = ins.operands
        reg = lambda op: ('x' + ins.reg_name(op.reg)[1:])
        if ins.mnemonic in ('adr', 'adrp'):
            registers[reg(operands[0])] = operands[1].imm
        elif ins.mnemonic == 'add' and len(operands) == 3 and operands[2].type == ARM64_OP_IMM:
            source = reg(operands[1])
            if source in old:
                registers[reg(operands[0])] = old[source] + (operands[2].imm << operands[2].shift.value)
        elif ins.mnemonic in ('mov', 'movz') and len(operands) == 2:
            if operands[1].type == ARM64_OP_IMM:
                registers[reg(operands[0])] = operands[1].imm << operands[1].shift.value
            elif operands[1].type == ARM64_OP_REG and reg(operands[1]) in old:
                registers[reg(operands[0])] = old[reg(operands[1])]
        elif ins.mnemonic == 'bl':
            name = None
            if 'x1' in old:
                try:
                    name = renderer.string(old['x1'])
                except (ValueError, UnicodeDecodeError):
                    pass
            yield {'call': ins.address, 'target': operands[0].imm, 'name': name, 'count': old.get('x2')}
            for name in list(registers):
                if name.startswith('x') and (int(name[1:]) <= 18 or name == 'x30'):
                    registers.pop(name, None)
        elif ins.mnemonic == 'ret' or ins.mnemonic == 'b' or ins.mnemonic.startswith(('b.', 'cb', 'tb', 'br', 'blr')):
            yield None
            registers.clear()
    require(covered == end - start, 'undecodable initializer')


def verify_builder(renderer, address):
    """Check the vector initializer's ABI and element stride, independent of its address."""
    decoder = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
    decoder.detail = True
    offset = renderer.offset(address, 64, executable=True)
    constants = {}
    zero_vectors = set()
    stride = None
    stores = set()
    for ins in decoder.disasm(renderer.data[offset:offset + 64], address):
        op = ins.operands
        reg = lambda operand: ins.reg_name(operand.reg)
        if ins.mnemonic in ('mov', 'movz') and op[1].type == ARM64_OP_IMM:
            constants[reg(op[0])] = op[1].imm << op[1].shift.value
        elif ins.mnemonic == 'movi' and op[1].imm == 0:
            zero_vectors.add(reg(op[0]).split('.')[0].replace('v', 'q'))
        elif ins.mnemonic == 'add' and [reg(x) for x in op[:3]] == ['x2', 'x1', 'x2']:
            stride = 1 << op[2].shift.value
        elif ins.mnemonic == 'madd' and reg(op[0]) == 'x2' and reg(op[1]) == 'x2' and reg(op[3]) == 'x1':
            stride = constants.get(reg(op[2]), constants.get(reg(op[2]).replace('x', 'w')))
        elif ins.mnemonic == 'str':
            require(ins.reg_name(op[1].mem.base) == 'x0' and op[1].mem.disp == 32 and constants.get(reg(op[0])) == 0x3f800000,
                    'unexpected vector initializer store')
            stores.add('scale')
        elif ins.mnemonic == 'stp':
            require(reg(op[0]) in zero_vectors and reg(op[1]) in zero_vectors and ins.reg_name(op[2].mem.base) == 'x0' and op[2].mem.disp == 0,
                    'unexpected vector initializer zeroing')
            stores.add('zeros')
        elif ins.mnemonic == 'b':
            require(stride in (32, 48, 72) and stores == {'scale', 'zeros'}, 'unrecognised vector element geometry')
            renderer.offset(op[0].imm, 4, executable=True)
            return stride
        else:
            raise ValueError('Native report layout: unsupported vector initializer operation ' + ins.mnemonic)
    raise ValueError('Native report layout: vector initializer has no tail call')


def discover_layout(renderer, templates, catalog, warnings=None):
    streams = [list(calls_in(renderer, start, end)) for start, end in candidate_ranges(renderer, templates)]
    references = collections.defaultdict(list)
    for stream in streams:
        for call in stream:
            if call and call['name'] in templates:
                references[call['target']].append(call['name'])
    constructors = [target for target, names in references.items()
                    if names.count('tinypin_hazard') >= 4 and names.count('smallpin_hazard') >= 4]
    require(constructors, 'cannot identify one shared report string constructor; inlined layouts require review')
    # Resource names also occur in ordinary icon loaders. Prove the complete
    # table geometry for each candidate before deciding whether it is ambiguous.
    matches = []
    failures = []
    for constructor in constructors:
        candidate_warnings = []
        try:
            result = discover_groups(renderer, streams, constructor, templates, catalog, candidate_warnings)
        except ValueError as error:
            failures.append(error)
        else:
            matches.append((result, candidate_warnings))
    if not matches and len(failures) == 1:
        raise failures[0]
    require(len(matches) == 1, 'cannot identify one shared report string constructor with verified report tables')
    result, candidate_warnings = matches[0]
    if warnings is not None:
        warnings.extend(candidate_warnings)
    return result


def discover_groups(renderer, streams, constructor, templates, catalog, warnings):
    groups = []
    builders = set()
    helper_strides = {}
    for stream in streams:
        pending = []
        for call in stream:
            relevant = any(c['name'] in templates for c in pending)
            if call is None:
                require(not relevant, 'control flow crosses an unfinished report group')
                pending = []
            elif call['target'] == constructor:
                pending.append(call)
            else:
                if call['target'] not in helper_strides:
                    try:
                        helper_strides[call['target']] = verify_builder(renderer, call['target'])
                    except (ValueError, IndexError):
                        helper_strides[call['target']] = None
                if helper_strides[call['target']] is None:
                    continue
                if relevant:
                    icons = [c for c in pending if c['name'] and not c['name'].startswith('map_pins_report_') and 'albedo' not in c['name']]
                    require(call['count'] == len(icons) == 3, 'report count disagrees with constructor calls: ' +
                            str((call['count'], [c['name'] for c in pending], hex(call['target']))))
                    groups.append(pending)
                    builders.add(call['target'])
                pending = []
        require(not any(c['name'] in templates for c in pending), 'unfinished report group')
    require(len(builders) == 1 and len(groups) >= 8, 'ambiguous or incomplete report tables')
    builder = builders.pop()
    stride = helper_strides[builder]
    known = {tuple(group) for group in catalog['groups']}
    known.update(tuple(name for name in group if name != 'map_pins_report_medium_small_hazard') for group in catalog['groups'])
    known.update(tuple(name for name in group if not name.startswith('map_pins_report_') and 'albedo' not in name) for group in catalog['groups'])
    compact = {tuple(name for name in group if not name.startswith('map_pins_report_') and 'albedo' not in name)
               for group in catalog['groups']}
    matched = []
    for group in groups:
        names = tuple(call['name'] for call in group)
        if names in (compact if stride == 32 else known):
            matched.append(group)
        else:
            message = 'unmapped report group left unchanged: ' + str(names)
            if warnings is not None:
                warnings.append(message)
            print('WARNING: Native icons: ' + message)
    require(len(matched) >= 8, 'report artwork schema is not recognised: fewer than 8 mapped groups')
    return constructor, builder, matched
