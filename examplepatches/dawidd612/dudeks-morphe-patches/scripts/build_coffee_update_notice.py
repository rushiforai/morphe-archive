"""Build the exact-hash Coffee update-notice delta; game inputs stay private."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
from keystone import Ks, KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN
from elftools.elf.elffile import ELFFile
from build_pizza_native_delta import encode

ROOT = Path(__file__).resolve().parents[1]


def build(source, destination, delta):
    layout = json.loads((ROOT/'native/coffeebusiness/update-1260.json').read_text(encoding='utf-8'))
    original = source.read_bytes()
    if hashlib.sha256(original).hexdigest() != layout['input_sha256']:
        raise ValueError('Coffee update notice requires this exact original ARM64 library')
    addr = lambda name: int(layout[name], 0)
    values = {name: addr(name) for name in ('signer_check', 'epilogue')}
    values.update(vm_page=addr('java_vm') & ~0xfff, vm_low=addr('java_vm') & 0xfff)
    text = (ROOT/'native/coffeebusiness/update-1260.s').read_text(encoding='utf-8')
    assembly = '\n'.join(line.split('//', 1)[0] for line in text.splitlines()).format(**values)
    assembler = Ks(KS_ARCH_ARM64, KS_MODE_LITTLE_ENDIAN)
    payload = bytes(assembler.asm(assembly, addr('entry'))[0])
    # The original table is followed immediately by Android notes. Relocate the
    # table into the appended RX segment rather than overwriting those notes or
    # allowing a writer to shift any original virtual addresses.
    phoff = struct.unpack_from('<Q', original, 32)[0]
    phsize, count = struct.unpack_from('<HH', original, 54)
    assert original[:6] == b'\x7fELF\x02\x01' and struct.unpack_from('<H', original, 18)[0] == 183
    assert phoff == 64 and phsize == 56 and count == 10
    table = bytearray(original[phoff:phoff+phsize*count])
    offset = (len(original)+0x3fff) & ~0x3fff
    payload_offset = addr('entry')-addr('segment')
    assert (count+1)*phsize <= payload_offset
    phdrs = 0
    hook_offset = None
    for index in range(count):
        at = index*phsize
        kind, flags, file_offset, va, pa, file_size, mem_size, align = struct.unpack_from('<IIQQQQQQ', table, at)
        if kind == 6:
            phdrs += 1
            struct.pack_into('<IIQQQQQQ', table, at, kind, flags, offset,
                addr('segment'), addr('segment'), (count+1)*phsize, (count+1)*phsize, align)
        elif kind == 1:
            assert va+mem_size <= addr('segment')
            if va <= addr('hook') < va+file_size:
                hook_offset = file_offset+addr('hook')-va
    assert phdrs == 1 and hook_offset is not None
    table.extend(struct.pack('<IIQQQQQQ', 1, 5, offset, addr('segment'), addr('segment'),
        payload_offset+len(payload), payload_offset+len(payload), 0x4000))
    output = bytearray(original)+bytearray(offset+payload_offset+len(payload)-len(original))
    struct.pack_into('<Q', output, 32, offset)
    struct.pack_into('<H', output, 56, count+1)
    output[offset:offset+len(table)] = table
    output[offset+payload_offset:] = payload
    expected = bytes(assembler.asm('ldr w8, [x20, #0xc0]')[0])
    if original[hook_offset:hook_offset+4] != expected:
        raise ValueError('Coffee version gate shape changed')
    output[hook_offset:hook_offset+4] = bytes(assembler.asm(f'b #{addr("entry")}', addr('hook'))[0])
    destination.write_bytes(output)
    with destination.open('rb') as stream:
        for item in ELFFile(stream).iter_segments():
            if item['p_type'] == 'PT_LOAD':
                assert item['p_vaddr'] % 0x4000 == item['p_offset'] % 0x4000, '16 KiB mapping mismatch'
    output = destination.read_bytes()
    delta.parent.mkdir(parents=True, exist_ok=True)
    delta.write_bytes(encode(original, output))
    print(json.dumps({'input_sha256': layout['input_sha256'], 'output_sha256': hashlib.sha256(output).hexdigest(), 'payload_bytes': len(payload), 'delta_bytes': delta.stat().st_size}))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('input', type=Path)
    parser.add_argument('output', type=Path)
    parser.add_argument('--delta', type=Path, required=True)
    args = parser.parse_args()
    build(args.input, args.output, args.delta)
