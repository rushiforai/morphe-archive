"""Build exact-input Pizza UI-only update notice deltas; game files stay private."""
import argparse
import hashlib
import json
from pathlib import Path
import struct

from keystone import Ks, KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN
from build_pizza_native_delta import encode

ROOT = Path(__file__).resolve().parents[1]


def build(original, layout):
    digest = hashlib.sha256(original).hexdigest()
    name = next((name for name, value in layout['inputs'].items() if value == digest), None)
    if name is None:
        raise ValueError('Pizza update notice requires a reviewed exact native input from this profile')
    address = lambda key: int(layout[key], 0)
    source = (ROOT / 'native/pizzabusiness/update-5592.s').read_text(encoding='utf-8')
    source = '\n'.join(line.split('//', 1)[0] for line in source.splitlines())
    source = source.format(**{key: address(key) for key in (
        'original_resume', 'cleanup', 'missing_callback', 'jni_method_info')})
    assembler = Ks(KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN)
    payload = bytes(assembler.asm(source, address('entry'))[0])
    if original[:6] != b'\x7fELF\x02\x01' or struct.unpack_from('<H', original, 18)[0] != 183:
        raise ValueError('Expected a little-endian ARM64 ELF')
    phoff = struct.unpack_from('<Q', original, 32)[0]
    size, count = struct.unpack_from('<HH', original, 54)
    if size != 56 or not 1 <= count <= 17:
        raise ValueError('Unsupported program-header layout')
    table = bytearray(original[phoff:phoff + size * count])
    if len(table) != size * count:
        raise ValueError('Truncated program-header table')
    offset = (len(original) + 0x3fff) & ~0x3fff
    payload_offset = address('entry') - address('segment')
    if payload_offset < (count + 1) * size:
        raise ValueError('Payload overlaps the relocated program-header table')
    phdrs, hook_offset = 0, None
    for index in range(count):
        at = index * size
        kind, flags, file_offset, va, pa, file_size, memory_size, align = struct.unpack_from('<IIQQQQQQ', table, at)
        if kind == 6:  # PT_PHDR follows the table into the appended RX segment.
            phdrs += 1
            struct.pack_into('<IIQQQQQQ', table, at, kind, flags, offset,
                             address('segment'), address('segment'),
                             (count + 1) * size, (count + 1) * size, align)
        elif kind == 1:
            if va + memory_size > address('segment'):
                raise ValueError('Update notice segment overlaps an original load segment')
            if va <= address('hook') < va + file_size:
                hook_offset = file_offset + address('hook') - va
            if va % 0x4000 != file_offset % 0x4000:
                raise ValueError('Original native input has incompatible 16 KiB segment congruence')
    if phdrs != 1 or hook_offset is None:
        raise ValueError('Required program-header or UI hook location is missing')
    if original[hook_offset:hook_offset + 4] != bytes.fromhex(layout['hook_expected']):
        raise ValueError('Pizza version UI boundary changed')
    table.extend(struct.pack('<IIQQQQQQ', 1, 5, offset,
                             address('segment'), address('segment'),
                             payload_offset + len(payload), payload_offset + len(payload), 0x4000))
    output = bytearray(original) + bytearray(offset + payload_offset + len(payload) - len(original))
    struct.pack_into('<Q', output, 32, offset)
    struct.pack_into('<H', output, 56, count + 1)
    output[offset:offset + len(table)] = table
    output[offset + payload_offset:] = payload
    output[hook_offset:hook_offset + 4] = bytes(assembler.asm(
        f'b #{address("entry")}', address('hook'))[0])
    return bytes(output), name


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('input', type=Path)
    parser.add_argument('output', type=Path)
    parser.add_argument('--layout', type=Path,
                        default=ROOT / 'native/pizzabusiness/update-5592.json')
    parser.add_argument('--delta-dir', type=Path, required=True)
    args = parser.parse_args()
    original = args.input.read_bytes()
    output, name = build(original, json.loads(args.layout.read_text(encoding='utf-8')))
    args.output.write_bytes(output)
    args.delta_dir.mkdir(parents=True, exist_ok=True)
    delta = args.delta_dir / name
    delta.write_bytes(encode(original, output))
    print(json.dumps({'input_sha256': hashlib.sha256(original).hexdigest(),
                      'output_sha256': hashlib.sha256(output).hexdigest(),
                      'output_bytes': len(output), 'delta': str(delta),
                      'delta_bytes': delta.stat().st_size}))
