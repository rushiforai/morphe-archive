"""Binary Android string-pool rewriting (AXML + resources.arsc).

Content-level replacement: pool entries keep their indices, only byte
content of selected entries changes, so every existing reference (attribute
values, resource IDs, string-table indices) stays valid.

GPL-3.0; part of the rambler-bangla project.
"""
import struct


def _read_u8len(data, p):
    b = data[p]
    if b & 0x80:
        return ((b & 0x7F) << 8) | data[p + 1], 2
    return b, 1


def _read_u16len(data, p):
    w = struct.unpack_from('<H', data, p)[0]
    if w & 0x8000:
        return ((w & 0x7FFF) << 16) | struct.unpack_from('<H', data, p + 2)[0], 4
    return w, 2


def _write_u8len(out, value):
    if value > 0x7F:
        out += bytes([(value >> 8) | 0x80, value & 0xFF])
    else:
        out += bytes([value])
    return out


def _write_u16len(out, value):
    if value > 0x7FFF:
        out += struct.pack('<HH', (value >> 16) | 0x8000, value & 0xFFFF)
    else:
        out += struct.pack('<H', value)
    return out


class StringPool:
    """Parsed ResStringPool chunk starting at `off` in `data`."""

    def __init__(self, data, off):
        self.off = off
        type_, self.header_size, self.size = struct.unpack_from('<HHI', data, off)
        if type_ != 0x0001:
            raise ValueError('not a string pool at %d (type=%04x)' % (off, type_))
        (self.string_count, self.style_count, self.flags,
         self.strings_start, self.styles_start) = struct.unpack_from('<IIIII', data, off + 8)
        self.is_utf8 = bool(self.flags & 0x100)
        offsets = struct.unpack_from('<%dI' % self.string_count, data, off + self.header_size)
        base = off + self.strings_start
        self.strings = []
        for o in offsets:
            p = base + o
            if self.is_utf8:
                _, n1 = _read_u8len(data, p)
                blen, n2 = _read_u8len(data, p + n1)
                s = data[p + n1 + n2:p + n1 + n2 + blen].decode('utf-8')
            else:
                clen, n = _read_u16len(data, p)
                s = data[p + n:p + n + clen * 2].decode('utf-16-le')
            self.strings.append(s)

    def rebuild(self, replacements):
        """Return new chunk bytes with replacements {index: new_value} applied.
        Indices, order, styles and the UTF-8/UTF-16 flag are preserved."""
        data = bytearray()
        offsets = []
        for i, s in enumerate(self.strings):
            value = replacements.get(i, s)
            u16_units = len(value.encode('utf-16-le')) // 2
            offsets.append(len(data))
            if self.is_utf8:
                raw = value.encode('utf-8')
                data = _write_u8len(data, u16_units)    # utf-16 length
                data = _write_u8len(data, len(raw))     # utf-8 byte length
                data += raw + b'\x00'
            else:
                raw = value.encode('utf-16-le')
                data = _write_u16len(data, u16_units)
                data += raw + b'\x00\x00'
        while len(data) % 4:
            data += b'\x00'
        styles = b''
        if self.style_count and self.styles_start:
            styles_end = self.off + self.size
            styles = bytes(self._orig[self.off + self.styles_start:styles_end])
        header_size = 28
        strings_start = header_size + 4 * self.string_count
        styles_start = strings_start + len(data) if styles else 0
        size = strings_start + len(data) + len(styles)
        out = struct.pack('<HHI', 0x0001, header_size, size)
        out += struct.pack('<IIIII', self.string_count, self.style_count,
                           self.flags, strings_start, styles_start)
        out += struct.pack('<%dI' % self.string_count, *offsets)
        out += data
        out += styles
        return out

    def parse_offsets(self, data):
        self._orig = data
        return self


def rewrite_axml(data, rules):
    """Apply exact-value rules to an AXML file (manifest or res/*.xml).
    rules: dict old_value -> new_value. Returns (new_bytes, applied_map)."""
    pool = StringPool(data, 8).parse_offsets(data)
    applied = {}
    replacements = {}
    for i, s in enumerate(pool.strings):
        if s in rules:
            replacements[i] = rules[s]
            applied[s] = rules[s]
    if not replacements:
        return data, applied
    new_pool = pool.rebuild(replacements)
    tail = data[8 + pool.size:]
    total = 8 + len(new_pool) + len(tail)
    header = struct.pack('<HHI', 0x0003, 8, total)
    return header + new_pool + tail, applied


def rewrite_arsc(data, old_package, new_package):
    """Rewrite the ResTable_package name field(s) in resources.arsc.
    The field is a fixed 128-char UTF-16LE slot, so the new name must fit.
    Returns (new_bytes, changed_count)."""
    out = bytearray(data)
    changed = 0
    _, hsize, _ = struct.unpack_from('<HHI', data, 0)
    pos = hsize + StringPool(data, hsize).size
    while pos < len(data):
        t, hs, sz = struct.unpack_from('<HHI', data, pos)
        if t == 0x0200:
            name = data[pos + 12:pos + 12 + 256].decode('utf-16-le').rstrip('\x00')
            if name == old_package:
                if len(new_package) > 127:
                    raise ValueError('new package name exceeds arsc name slot')
                field = new_package.encode('utf-16-le')
                field += b'\x00' * (256 - len(field))
                out[pos + 12:pos + 12 + 256] = field
                changed += 1
        pos += sz
    return bytes(out), changed
