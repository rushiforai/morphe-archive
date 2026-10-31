"""Replace only popup RelativeLayout tags, preserving all binary XML attributes/IDs."""
import struct

def replace_pool(data):
    kind, header, total = struct.unpack_from('<HHI', data)
    assert kind == 3 and total == len(data)
    offset = 8
    kind, header, size = struct.unpack_from('<HHI', data, offset)
    assert kind == 1 and header == 28
    count, styles, flags, start, style_start = struct.unpack_from('<5I', data, offset+8)
    assert flags & 256 and styles == 0 and style_start == 0
    def length(i):
        a = data[i]
        return (a, i+1) if a < 128 else (((a & 127) << 8) | data[i+1], i+2)
    def encoded(n):
        return bytes([n]) if n < 128 else bytes([(n >> 8) | 128, n & 255])
    strings = []
    for n in range(count):
        i = offset+start+struct.unpack_from('<I', data, offset+header+4*n)[0]
        _, i = length(i)
        ln, i = length(i)
        strings.append(data[i:i+ln].decode('utf-8'))
    assert strings.count('RelativeLayout') == 1 and strings.count('LinearLayout') == 1
    strings = ['e.e.a.PinnedPopup247' if s == 'RelativeLayout' else 'e.e.a.PinnedPopupLinear248' if s == 'LinearLayout' else s for s in strings]
    payload = bytearray()
    offsets = []
    for s in strings:
        offsets.append(len(payload))
        b = s.encode('utf-8')
        payload += encoded(len(s.encode('utf-16le'))//2)+encoded(len(b))+b+b'\0'
    payload += bytes((-len(payload)) % 4)
    chunk = struct.pack('<HHI5I', 1, header, start+len(payload), count, 0, flags & ~1, start, 0)
    chunk += struct.pack('<'+'I'*count, *offsets)+payload
    out = bytearray(data[:offset]+chunk+data[offset+size:])
    struct.pack_into('<I', out, 4, len(out))
    return bytes(out)
