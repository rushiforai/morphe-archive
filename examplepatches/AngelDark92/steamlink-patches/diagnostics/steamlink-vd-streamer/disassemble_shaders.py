"""Read installed VD DXBC; use Microsoft's D3DDisassemble, without running VD.

https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3ddisassemble
Outputs compact textual evidence. No installed file or application state is changed.
"""
import ctypes as C
import hashlib
import json
from pathlib import Path
import re
import struct

root = Path(__file__).resolve().parents[2]
installed = Path('C:/Program Files/Virtual Desktop Streamer')
expected = {
    Path(item['path']): item
    for item in json.loads((root / 'diagnostics/steamlink-vd-streamer/installed-inputs.json').read_text())['files']
}
out = root / 'build/vd-streamer-shaders'
out.mkdir(parents=True, exist_ok=True)
api = C.WinDLL('C:/Windows/System32/d3dcompiler_47.dll')
api.D3DDisassemble.argtypes = [C.c_void_p, C.c_size_t, C.c_uint, C.c_char_p, C.POINTER(C.c_void_p)]
api.D3DDisassemble.restype = C.c_long
rows = []
for path in [installed / 'VirtualDesktop.Streamer.exe', *sorted((installed / 'Effects').glob('*.tkb'))]:
    binary = path.read_bytes()
    identity = expected[path]
    assert len(binary) == identity['size'] and hashlib.sha256(binary).hexdigest() == identity['sha256'], f'Different installed input: {path}'
    for match in re.finditer(b'DXBC', binary):
        offset = match.start()
        size, count = struct.unpack_from('<II', binary, offset + 24)
        assert 32 + 4 * count <= size <= len(binary) - offset
        source = binary[offset:offset + size]
        chunks = []
        for i in range(count):
            at = struct.unpack_from('<I', source, 32 + i * 4)[0]
            chunk_size = struct.unpack_from('<I', source, at + 4)[0]
            assert at + 8 + chunk_size <= size
            chunks.append(source[at:at+4].decode('ascii'))
        # Signature-only containers are effect metadata, not shader instructions.
        if not any(tag in chunks for tag in ['SHDR', 'SHEX']):
            continue
        blob = C.c_void_p()
        buf = C.create_string_buffer(source)
        result = api.D3DDisassemble(buf, len(source), 4, None, C.byref(blob))
        assert result >= 0 and blob.value, (path.name, hex(offset), result)
        table = C.cast(blob, C.POINTER(C.POINTER(C.c_void_p))).contents
        get_pointer = C.WINFUNCTYPE(C.c_void_p, C.c_void_p)(table[3])
        get_size = C.WINFUNCTYPE(C.c_size_t, C.c_void_p)(table[4])
        release = C.WINFUNCTYPE(C.c_ulong, C.c_void_p)(table[2])
        text = C.string_at(get_pointer(blob), get_size(blob)).rstrip(b'\0').decode('utf8')
        release(blob)
        file = out / f'{path.stem}-{offset:x}.asm'
        file.write_text(text, encoding='utf8')
        rows.append({'source': str(path), 'offset': hex(offset), 'bytes': size,
                     'sha256': hashlib.sha256(source).hexdigest(), 'chunks': chunks,
                     'disassembly': file.relative_to(root).as_posix(),
                     'fraction_or_round_ops': len(re.findall(r'\b(?:frc|round_[a-z]+)\b', text))})
(root / 'diagnostics/steamlink-vd-streamer/shader-inventory.json').write_text(
    json.dumps({'shaders': rows}, indent=2) + '\n', encoding='utf8')
print(f'Disassembled {len(rows)} embedded shaders; inputs unchanged.')
