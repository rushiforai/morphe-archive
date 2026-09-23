"""Offline verification of the actual ELF inputs, loader constants and helper payloads."""
import argparse
import hashlib
import io
import json
from pathlib import Path
import re
import sys
import zipfile

parser = argparse.ArgumentParser()
parser.add_argument('--python-tools', type=Path)
parser.add_argument('--apk-root', type=Path)
parser.add_argument('--output', required=True, type=Path)
args = parser.parse_args()
root = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(args.python_tools or root / 'build/oled-native-audit/python'))
from elftools.elf.elffile import ELFFile

layouts = json.loads((Path(__file__).parent / 'decoder-hook-layouts.json').read_text())
source = (root / 'extensions/decoder-input-buffering/src/install_hooks.cpp').read_text()
names = ['Acquire', 'Submit', 'Init', 'Flush', 'Stop', 'Destructor',
         'PeriodicCheckForErrors', 'FECAcceptVideoPacket']
ids = ['Acquire', 'Submit', 'Init', 'Flush', 'Stop', 'Destructor', 'Periodic', 'AcceptPacket']

def fnv(data):
    value = 14695981039346656037
    for byte in data:
        value = ((value ^ byte) * 1099511628211) & ((1 << 64) - 1)
    return value

def offset(elf, va, size):
    matches = [s for s in elf.iter_segments() if s['p_type'] == 'PT_LOAD' and
               s['p_vaddr'] <= va and va + size <= s['p_vaddr'] + s['p_filesz']]
    assert len(matches) == 1, f'No unique mapping for {va:x}'
    s = matches[0]
    return s['p_offset'] + va - s['p_vaddr']

def inspect_scene(data, code):
    layout = layouts[code]
    elf = ELFFile(io.BytesIO(data))
    assert len(data) == layout['size']
    assert data[0x2d0:0x2e0].hex() == '040000001400000003000000474e5500'
    assert data[0x2e0:0x2f4].hex() == layout['build_id']
    block = source.split(f'GXR_BUILD_CODE == {code}', 1)[1].split('#elif', 1)[0].split('#else', 1)[0]
    functions = re.findall(r'\{(0x[\da-f]+),(0x[\da-f]+),(0x[\da-f]+)ULL\}', block)
    assert len(functions) == len(names) == 8
    for name, (va, size, checksum) in zip(names, functions):
        va, size, checksum = int(va, 16), int(size, 16), int(checksum, 16)
        item = layout['functions'][name]
        assert (va, size) == (int(item['va'], 16), item['size'])
        start = offset(elf, va, size)
        assert fnv(data[start:start + size]) == checksum, f'{code}/{name}: loader checksum mismatch'
        assert hashlib.sha256(data[start:start + size]).hexdigest() == item['sha256']
        assert not item['direct_branches'], f'{code}/{name}: direct call bypasses data hook'
    relocations = {}
    for section in elf.iter_sections():
        if section['sh_type'] != 'SHT_RELA':
            continue
        symbols = elf.get_section(section['sh_link'])
        for relocation in section.iter_relocations():
            symbol = symbols.get_symbol(relocation['r_info_sym'])
            relocations[relocation['r_offset']] = (symbol.name, symbol['st_value'] + relocation['r_addend'])
    slots = re.findall(r'\{(0x[\da-f]+),HookId::(\w+)\}', block)
    assert len(slots) == 11
    for raw_va, hook in slots:
        va = int(raw_va, 16)
        item = layout['functions'][names[ids.index(hook)]]
        assert relocations[va] == (item['symbol'], int(item['va'], 16))
        assert any(s['p_type'] == 'PT_GNU_RELRO' and s['p_vaddr'] <= va and
                   va + 8 <= s['p_vaddr'] + s['p_memsz'] for s in elf.iter_segments())
        for page_size in (4096, 16384):
            page_start = va & ~(page_size - 1)
            for segment in elf.iter_segments():
                if segment['p_type'] != 'PT_LOAD' or not segment['p_flags'] & 1:
                    continue
                assert page_start + page_size <= segment['p_vaddr'] or page_start >= segment['p_vaddr'] + segment['p_memsz'], 'Hook page intersects executable load'
    for name in names:
        expected = {int(r['va'], 16) for r in layout['functions'][name]['relocations']}
        found = {int(va, 16) for va, hook in slots if names[ids.index(hook)] == name}
        assert expected == found, f'{code}/{name}: incomplete relocation coverage'
    return {'code': code, 'sha256': hashlib.sha256(data).hexdigest(),
            'size': len(data), 'functions': 8, 'data_slots': len(slots),
            'header_mapping': 'GNU bytes in readable PT_LOAD; PT_NOTE optional for Visual Delay'}

result = {'status': 'passed', 'runtime_test': False, 'stock': [], 'helpers': [], 'apks': []}
for code, layout in layouts.items():
    scene = root / f"decoded-apk-android-steamlinkvr-release-base-{layout['version']}-{code}/lib/arm64-v8a/libvrlink_scene.so"
    data = scene.read_bytes()
    assert hashlib.sha256(data).hexdigest() == layout['sha256']
    result['stock'].append(inspect_scene(data, code))
    helper = root / f'patches/src/main/resources/steamlink/decoder/libgxr_dbuf_{code}.so'
    data = helper.read_bytes()
    elf = ELFFile(io.BytesIO(data))
    dynamic = elf.get_section_by_name('.dynamic')
    needed = [t.needed for t in dynamic.iter_tags() if t.entry.d_tag == 'DT_NEEDED']
    assert needed.count('libmediandk.so') == 1
    assert [t.soname for t in dynamic.iter_tags() if t.entry.d_tag == 'DT_SONAME'] == ['libgxr_dbuf.so']
    assert all(s['p_align'] == 16384 for s in elf.iter_segments() if s['p_type'] == 'PT_LOAD')
    exports = [s for s in elf.get_section_by_name('.dynsym').iter_symbols() if s['st_shndx'] != 'SHN_UNDEF']
    assert [s.name for s in exports] == ['gxr_decoder_buffering_config']
    assert exports[0]['st_other']['visibility'] == 'STV_PROTECTED'
    assert data.count(b'GXRDBUFCONFIG01!') == 1
    result['helpers'].append({'code': code, 'sha256': hashlib.sha256(data).hexdigest(),
                              'size': len(data), 'needed': needed, 'only_export': exports[0].name,
                              'load_alignment': 16384})
if args.apk_root:
    apks = sorted(args.apk_root.rglob('result-unsigned.apk'))
    assert len(apks) == 14, f'Expected full APK matrix, found {len(apks)}'
    for apk in apks:
        code = next(c for c in layouts if apk.parent.name.startswith(c))
        with zipfile.ZipFile(apk) as archive:
            entry = inspect_scene(archive.read('lib/arm64-v8a/libvrlink_scene.so'), code)
        entry['case'] = apk.parent.name
        entry['apk_sha256'] = hashlib.sha256(apk.read_bytes()).hexdigest()
        result['apks'].append(entry)
args.output.parent.mkdir(parents=True, exist_ok=True)
args.output.write_text(json.dumps(result, indent=2) + '\n')
print(f"PASS: {len(result['stock'])} stock ELF layouts, {len(result['helpers'])} native helpers, {len(result['apks'])} APK mappings; no runtime claim")
