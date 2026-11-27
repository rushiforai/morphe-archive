"""Discover and verify ARM64 report-icon call sites before packaging a Morphe profile."""
import argparse
import hashlib
import io
import json
import re
import struct
import zipfile
from pathlib import Path

from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
from capstone.arm64 import ARM64_OP_IMM, ARM64_OP_REG
from elftools.elf.elffile import ELFFile
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
CATALOG = ROOT / "ci/native_icon_catalog.json"
TEMPLATES = {"tinypin_hazard": "tiny", "smallpin_hazard": "small", "map_pins_report_medium_small_hazard": "tex"}


def require(condition, message):
    if not condition:
        raise ValueError("Native icon discovery: " + message)


def read_package(path):
    native = []
    base = []
    with zipfile.ZipFile(path) as archive:
        parts = [archive.read(name) for name in archive.namelist() if name.endswith(".apk")]
        if not parts:
            parts = [Path(path).read_bytes()]
    for part in parts:
        with zipfile.ZipFile(io.BytesIO(part)) as archive:
            if "lib/arm64-v8a/libwaze.so" in archive.namelist():
                native.append(archive.read("lib/arm64-v8a/libwaze.so"))
            if "assets/res/skins/default/tinypin_hazard.png" in archive.namelist():
                base.append(part)
    require(len(native) == len(base) == 1, "expected one ARM64 renderer and one base APK")
    return native[0], base[0]


class Renderer:
    def __init__(self, data):
        self.data = data
        self.elf = ELFFile(io.BytesIO(data))
        require(self.elf.elfclass == 64 and self.elf.little_endian and self.elf['e_machine'] == 'EM_AARCH64', "expected little-endian ARM64 ELF")
        self.loads = [(i, segment) for i, segment in enumerate(self.elf.iter_segments()) if segment['p_type'] == 'PT_LOAD']
        self.text = self.elf.get_section_by_name('.text')
        require(self.text is not None and self.text['sh_flags'] & 4, "executable text section missing")
        self.code = self.text.data()
        self.address = self.text['sh_addr']
        require(self.offset(self.address, len(self.code), executable=True) == self.text['sh_offset'], "text mapping mismatch")

    def offset(self, address, length=1, executable=False):
        matches = [s['p_offset'] + address - s['p_vaddr'] for _, s in self.loads
                   if s['p_vaddr'] <= address and address + length <= s['p_vaddr'] + s['p_filesz']
                   and (not executable or s['p_flags'] & 1)]
        require(len(matches) == 1, "ambiguous or unmapped address " + hex(address))
        offset = matches[0]
        require(0 <= offset <= len(self.data) - length, "mapping exceeds file")
        return offset

    def string(self, address):
        offset = self.offset(address)
        end = self.data.find(b'\0', offset, offset + 200)
        require(end > offset, "invalid resource string")
        value = self.data[offset:end].decode('ascii')
        require(re.fullmatch(r'[A-Za-z0-9_./@-]+', value) is not None, "unexpected resource name")
        return value

    def functions(self):
        section = self.elf.get_section_by_name('.eh_frame_hdr')
        require(section is not None, "function boundaries missing")
        data = section.data()
        require(data[:4] == bytes.fromhex('011b033b'), "unrecognised unwind-table encoding")
        count = struct.unpack_from('<I', data, 8)[0]
        require(count > 0 and 12 + count * 8 <= len(data), "invalid unwind table")
        starts = [section['sh_addr'] + struct.unpack_from('<i', data, 12 + i * 8)[0] for i in range(count)]
        require(starts == sorted(set(starts)), "unordered function boundaries")
        return starts

    def padding(self, size):
        candidates = []
        for i, segment in self.loads:
            if segment['p_flags'] != 5 or segment['p_filesz'] != segment['p_memsz']:
                continue
            end = segment['p_offset'] + segment['p_filesz']
            address = segment['p_vaddr'] + segment['p_memsz']
            if end % 4 or address % 4 or end + size > len(self.data) or any(self.data[end:end + size]):
                continue
            overlap = False
            for j, other in self.loads:
                if i == j:
                    continue
                overlap |= end < other['p_offset'] + other['p_filesz'] and other['p_offset'] < end + size
                overlap |= address < other['p_vaddr'] + other['p_memsz'] and other['p_vaddr'] < address + size
            for section in self.elf.iter_sections():
                if section['sh_type'] != 'SHT_NOBITS' and section['sh_size']:
                    overlap |= end < section['sh_offset'] + section['sh_size'] and section['sh_offset'] < end + size
            for start, length in [(0, self.elf['e_ehsize']), (self.elf['e_phoff'], self.elf['e_phnum'] * self.elf['e_phentsize']),
                                  (self.elf['e_shoff'], self.elf['e_shnum'] * self.elf['e_shentsize'])]:
                overlap |= end < start + length and start < end + size
            if not overlap:
                candidates.append((i, segment, end, address))
        require(len(candidates) <= 1, "ambiguous executable-segment tail")
        return candidates[0] if candidates else None

    def appended_segment(self, pool_size):
        require(self.elf['e_phentsize'] == 56 and self.elf['e_phnum'] < 128, "unsupported program headers")
        alignment = max(16384, *(s['p_align'] for _, s in self.loads))
        require(alignment <= 2 * 1024 * 1024 and alignment & (alignment - 1) == 0, "unsupported segment alignment")
        align = lambda value: (value + alignment - 1) & -alignment
        offset = align(len(self.data))
        address = align(max(s['p_vaddr'] + s['p_memsz'] for _, s in self.loads))
        count = self.elf['e_phnum'] + 1
        table_size = count * 56
        size = table_size + pool_size
        table = bytearray()
        phdr_count = 0
        for segment in self.elf.iter_segments():
            header_offset = self.elf['e_phoff'] + len(table)
            entry = self.data[header_offset:header_offset + 56]
            if segment['p_type'] == 'PT_PHDR':
                phdr_count += 1
                entry = struct.pack('<IIQQQQQQ', 6, 4, offset, address, address, table_size, table_size, 8)
            table.extend(entry)
        require(phdr_count == 1, "expected one program-header mapping")
        table.extend(struct.pack('<IIQQQQQQ', 1, 5, offset, address, address, size, size, alignment))
        return offset + table_size, address + table_size, bytes(offset - len(self.data)) + table, offset, count


def branch(source, target, link=False):
    delta = target - source
    require(delta % 4 == 0 and -(1 << 27) <= delta < (1 << 27), "branch out of range")
    return (0x94000000 if link else 0x14000000) | ((delta // 4) & 0x3ffffff)


def discover(data):
    renderer = Renderer(data)
    from native_layout import discover_layout
    warnings = []
    constructor, builder, groups = discover_layout(renderer, TEMPLATES, json.loads(CATALOG.read_text()), warnings)
    catalog = json.loads(CATALOG.read_text())
    replacements = []
    aliases = {}
    for group in groups:
        require(len(group) in (3, 4, 5, 6), "unknown report group shape")
        detail = next(c['name'] for c in reversed(group) if c['name'].startswith(('bigpin_', 'alert_icons/trait_enriched/icon_')))
        suffix = detail.rsplit('/', 1)[-1].removeprefix('bigpin_')
        for call in group:
            if call['name'] in TEMPLATES:
                name = 'morphe_' + TEMPLATES[call['name']] + '_' + suffix
                aliases[name] = True
                replacements.append({'call': call['call'], 'name': name})
    require(set(aliases) <= set(catalog['aliases']), "alias artwork missing")
    require(len({r['call'] for r in replacements}) == len(replacements), "duplicate replacement call")
    pool_size = 0
    for name in aliases:
        pool_size = (pool_size + 3) & ~3
        pool_size += 12 + len(name) + 1
    pool_size = (pool_size + 3) & ~3
    padding = renderer.padding(pool_size)
    appended = None
    if padding:
        segment_index, segment, cave, cave_address = padding
    else:
        cave, cave_address, prefix, new_phoff, new_phnum = renderer.appended_segment(pool_size)
        appended = prefix
    pool = bytearray()
    stubs = {}
    for name in aliases:
        while len(pool) % 4:
            pool.append(0)
        start = cave_address + len(pool)
        pointer = start + 12
        page_delta = (pointer >> 12) - (start >> 12)
        adrp = 0x90000001 | ((page_delta & 3) << 29) | (((page_delta >> 2) & 0x7ffff) << 5)
        add = 0x91000021 | ((pointer & 4095) << 10)
        pool.extend(struct.pack('<III', adrp, add, branch(start + 8, constructor)))
        pool.extend(name.encode('ascii') + b'\0')
        stubs[name] = start
    while len(pool) % 4:
        pool.append(0)
    require(len(pool) == pool_size, "stub size mismatch")
    patches = []

    def edit(offset, after):
        require(0 <= offset <= len(data) - len(after), "edit exceeds renderer")
        patches.append({'offset': offset, 'before': data[offset:offset + len(after)].hex(), 'after': after.hex()})

    for replacement in replacements:
        address = replacement['call']
        offset = renderer.offset(address, 4, executable=True)
        require(struct.unpack_from('<I', data, offset)[0] == branch(address, constructor, True), "constructor call changed")
        edit(offset, struct.pack('<I', branch(address, stubs[replacement['name']], True)))
    if appended is None:
        edit(cave, bytes(pool))
        header = renderer.elf['e_phoff'] + segment_index * renderer.elf['e_phentsize']
        edit(header + 32, struct.pack('<QQ', segment['p_filesz'] + pool_size, segment['p_memsz'] + pool_size))
    else:
        appended += pool
        edit(32, struct.pack('<Q', new_phoff))
        edit(56, struct.pack('<H', new_phnum))
    ordered = sorted(patches, key=lambda p: p['offset'])
    require(all(a['offset'] + len(bytes.fromhex(a['before'])) <= b['offset'] for a, b in zip(ordered, ordered[1:])), "overlapping native edits")
    result = bytearray(data)
    for patch in patches:
        after = bytes.fromhex(patch['after'])
        result[patch['offset']:patch['offset'] + len(after)] = after
    result.extend(appended or b'')
    validate_output(renderer, bytes(result), constructor, replacements, stubs)
    return {'source_sha256': hashlib.sha256(data).hexdigest(), 'output_sha256': hashlib.sha256(result).hexdigest(),
            'output_size': len(result), 'storage': 'existing-padding' if appended is None else 'appended-rx-segment',
            'append': (appended or b'').hex(), 'constructor': constructor, 'builder': builder,
            'groups': len(groups), 'call_sites': len(replacements), 'aliases': len(aliases), 'pool_size': pool_size,
            'pool_offset': cave, 'pool_address': cave_address, 'patches': patches, 'warnings': warnings}


def validate_output(original, result, constructor, replacements, stubs):
    patched = Renderer(result)
    loads = [s for _, s in patched.loads]
    require([s['p_vaddr'] for s in loads] == sorted(s['p_vaddr'] for s in loads), "load segments are unordered")
    for i, segment in enumerate(loads):
        require(segment['p_filesz'] <= segment['p_memsz'] and segment['p_offset'] + segment['p_filesz'] <= len(result), "invalid load size")
        require(segment['p_vaddr'] % 16384 == segment['p_offset'] % 16384, "16 KiB load alignment mismatch")
        for other in loads[i + 1:]:
            require(segment['p_vaddr'] + segment['p_memsz'] <= other['p_vaddr'], "overlapping load segments")
    phdr = [s for s in patched.elf.iter_segments() if s['p_type'] == 'PT_PHDR']
    require(len(phdr) == 1 and patched.offset(phdr[0]['p_vaddr'], phdr[0]['p_filesz']) == patched.elf['e_phoff'], "program headers are not mapped")
    require(phdr[0]['p_filesz'] == patched.elf['e_phnum'] * patched.elf['e_phentsize'], "program-header size mismatch")
    for _, segment in original.loads:
        require(any(segment['p_offset'] == s['p_offset'] and segment['p_vaddr'] == s['p_vaddr'] and segment['p_flags'] == s['p_flags'] for s in loads), "existing load mapping changed")
    decoder = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
    decoder.detail = True
    for replacement in replacements:
        address = replacement['call']
        call_offset = patched.offset(address, 4)
        call = next(decoder.disasm(result[call_offset:call_offset + 4], address))
        stub = stubs[replacement['name']]
        require(call.mnemonic == 'bl' and call.operands[0].imm == stub, "rewritten call target mismatch")
        offset = patched.offset(stub, 12, executable=True)
        instructions = list(decoder.disasm(result[offset:offset + 12], stub))
        require([ins.mnemonic for ins in instructions] == ['adrp', 'add', 'b'], "unexpected stub instructions")
        page, add, jump = instructions
        require(page.reg_name(page.operands[0].reg) == 'x1' and
                all(add.reg_name(add.operands[i].reg) == 'x1' for i in (0, 1)), "stub clobbers an unexpected register")
        pointer = page.operands[1].imm + add.operands[2].imm
        require(patched.string(pointer) == replacement['name'] and jump.operands[0].imm == constructor, "stub resource or constructor mismatch")


def verify_assets(base):
    catalog = json.loads(CATALOG.read_text())
    warnings = []
    readable = set()
    with zipfile.ZipFile(io.BytesIO(base)) as archive:
        names = set(archive.namelist())
        for name, expected in catalog['templates'].items():
            if 'assets/res/skins/default/' + name not in names:
                warnings.append('optional icon template absent: ' + name)
                continue
            try:
                with Image.open(io.BytesIO(archive.read('assets/res/skins/default/' + name))) as image:
                    image = image.convert('RGBA')
                    readable.add(name)
                    if list(image.size) != expected['size']:
                        warnings.append('icon template canvas changed; sized aliases retain their bundled dimensions: ' + name)
                    elif hashlib.sha256(image.tobytes()).hexdigest() != expected['rgba_sha256']:
                        warnings.append('icon template artwork changed; sized aliases retain their bundled artwork: ' + name)
            except (OSError, ValueError):
                warnings.append('unreadable icon template; sized aliases use bundled artwork: ' + name)
        for stem in ('tinypin_hazard', 'smallpin_hazard'):
            require(any(name == stem + '.png' or name.startswith(stem + '@') for name in readable),
                    'icon template family missing or unreadable: ' + stem)
    for message in warnings:
        print('WARNING: Native icons: ' + message)
    return warnings


def properties(report):
    lines = ['source.sha256=' + report['source_sha256'], 'profile.schema=2',
             'output.sha256=' + report['output_sha256'], 'output.size=' + str(report['output_size']),
             'append=' + report['append'],
             'call.sites=' + str(report['call_sites']), 'report.groups=' + str(report['groups'])]
    lines += [f"patch.{p['offset']:x}={p['before']}:{p['after']}" for p in report['patches']]
    return '\n'.join(lines) + '\n'


def prepare_profile(source, output_root, report_path):
    data, base = read_package(source)
    asset_warnings = verify_assets(base)
    report = discover(data)
    report['warnings'].extend(asset_warnings)
    filename = report['source_sha256'] + '.properties'
    cached = ROOT / 'src/main/resources/themes/native-profiles' / filename
    generated = Path(output_root) / 'themes/native-profiles' / filename
    text = properties(report)
    if cached.exists():
        require(cached.read_text() == text, "generated profile differs from the checked regression profile")
    else:
        generated.parent.mkdir(parents=True, exist_ok=True)
        generated.write_text(text)
    Path(report_path).parent.mkdir(parents=True, exist_ok=True)
    Path(report_path).write_text(json.dumps(report, indent=2) + '\n')
    return report


def verify_patched_apk(apk, report):
    with zipfile.ZipFile(apk) as archive:
        data = archive.read('lib/arm64-v8a/libwaze.so')
    require(len(data) == report['output_size'] and hashlib.sha256(data).hexdigest() == report['output_sha256'],
            "packaged renderer differs from the independently verified result")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', type=Path, required=True)
    destination = parser.add_mutually_exclusive_group(required=True)
    destination.add_argument('--output', type=Path)
    destination.add_argument('--resource-root', type=Path)
    parser.add_argument('--report', type=Path, required=True)
    args = parser.parse_args()
    if args.resource_root:
        report = prepare_profile(args.input, args.resource_root, args.report)
    else:
        data, base = read_package(args.input)
        asset_warnings = verify_assets(base)
        report = discover(data)
        report['warnings'].extend(asset_warnings)
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(properties(report))
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2) + '\n')
    print(f"Verified native icon profile: {report['groups']} report groups, {report['call_sites']} calls, {report['aliases']} aliases; {report['source_sha256']}")


if __name__ == '__main__':
    main()
