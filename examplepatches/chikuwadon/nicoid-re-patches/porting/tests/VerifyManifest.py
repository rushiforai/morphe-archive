"""Check PackageParser-sensitive names in the actual bundled binary manifest.

Android's PackageParser.validateName/buildCompoundName reject '-' in taskAffinity.
Run on resources.zip, an APK, or an extracted binary AndroidManifest.xml.
"""
import struct
import sys
import zipfile
from pathlib import Path


def elements(data):
    strings = []
    offset = struct.unpack_from('<H', data, 2)[0]
    while offset < len(data):
        kind, header, size = struct.unpack_from('<HHI', data, offset)
        if size < header or offset + size > len(data):
            raise ValueError('Invalid binary XML chunk')
        if kind == 1:
            count, _, flags, start, _ = struct.unpack_from('<5I', data, offset + 8)
            def length(pos, utf8):
                if utf8:
                    n = data[pos]; pos += 1
                    if n & 0x80:
                        n = ((n & 0x7f) << 8) | data[pos]; pos += 1
                else:
                    n = struct.unpack_from('<H', data, pos)[0]; pos += 2
                    if n & 0x8000:
                        n = ((n & 0x7fff) << 16) | struct.unpack_from('<H', data, pos)[0]; pos += 2
                return n, pos
            for i in range(count):
                pos = offset + start + struct.unpack_from('<I', data, offset + header + 4*i)[0]
                utf8 = bool(flags & 0x100)
                n, pos = length(pos, utf8)
                if utf8:
                    n, pos = length(pos, True)
                strings.append(data[pos:pos+n*(1 if utf8 else 2)].decode('utf-8' if utf8 else 'utf-16le'))
        elif kind == 0x102:
            name = struct.unpack_from('<I', data, offset + 20)[0]
            attr_start, attr_size, count = struct.unpack_from('<3H', data, offset + 24)
            attrs = {}
            for i in range(count):
                pos = offset + 16 + attr_start + i*attr_size
                ns, key, raw = struct.unpack_from('<3I', data, pos)
                value_type = data[pos + 15]
                value = struct.unpack_from('<I', data, pos + 16)[0]
                key = (strings[ns] if ns != 0xffffffff else '', strings[key])
                attrs[key] = strings[raw] if raw != 0xffffffff else strings[value] if value_type == 3 else value
            yield strings[name], attrs
        offset += size


def valid_name(name, require_separator):
    front, separator = True, False
    for char in name:
        if 'a' <= char <= 'z' or 'A' <= char <= 'Z':
            front = False
        elif not front and ('0' <= char <= '9' or char == '_'):
            pass
        elif char == '.':
            front, separator = True, True
        else:
            return False
    return separator or not require_separator


def verify(data):
    checked = 0
    for tag, attrs in elements(data):
        for (_, key), value in attrs.items():
            if key not in ('taskAffinity', 'process') or not isinstance(value, str) or not value:
                continue
            name = value[1:] if value.startswith(':') else value
            if not name or not valid_name(name, not value.startswith(':')):
                raise ValueError(f'Invalid {tag} {key}: {value!r}')
            checked += 1
    if not checked:
        raise ValueError('No taskAffinity/process strings found; check manifest input')
    return checked


if __name__ == '__main__':
    # Regression: the dev.2 affinity compiled successfully but Android rejected it.
    assert not valid_name('com.sauzask.nicoid.hls.popup-link', True)
    assert valid_name('com.sauzask.nicoid.hls.popup_link', True)
    assert not valid_name('com.example.1invalid', True)
    path = Path(sys.argv[1])
    if zipfile.is_zipfile(path):
        with zipfile.ZipFile(path) as bundle:
            data = bundle.read('AndroidManifest.xml')
    else:
        data = path.read_bytes()
    print(f'Manifest names validated: {verify(data)}')
