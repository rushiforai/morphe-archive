"""Test the production manifest helper; only the version value may change."""
from pathlib import Path
from zipfile import ZipFile
import struct
import subprocess

root = Path(__file__).resolve().parents[1]
folder = root / 'build/manifest-refresh-fixtures'
folder.mkdir(parents=True, exist_ok=True)
with ZipFile(root / 'downloads/waze-arm64/base.apk') as apk:
    original = apk.read('AndroidManifest.xml')
u16 = lambda at: struct.unpack_from('<H', original, at)[0]
u32 = lambda at: struct.unpack_from('<I', original, at)[0]
pos = u16(2)
slots = []
while pos < len(original):
    kind, header, size = struct.unpack_from('<HHI', original, pos)
    if kind == 0x180:
        ids = [u32(i) for i in range(pos + header, pos + size, 4)]
    elif kind == 0x102:
        ext = pos + header
        start, stride, count = struct.unpack_from('<HHH', original, ext + 8)
        for i in range(count):
            attr = ext + start + i * stride
            name = u32(attr + 4)
            if name < len(ids) and ids[name] == 0x0101021b:
                slots.append(attr)
    pos += size
assert len(slots) == 1
attr = slots[0]
cases = [(0x10, v, True) for v in [1, 1030732, 1030743, 1030746, 1030747, 1030800]]
cases += [(0x11, 1030732, True), (0x10, 2147483646, True),
          (0x10, 2147483647, False), (0x10, -1, False), (0x03, 1030732, False)]
for index, (kind, value, valid) in enumerate(cases):
    data = bytearray(original)
    data[attr + 15] = kind
    struct.pack_into('<i', data, attr + 16, value)
    (folder / f'{index}.input').write_bytes(data)
    expected = folder / f'{index}.expected'
    if valid:
        struct.pack_into('<i', data, attr + 16, max(1030747, value + 1))
        expected.write_bytes(data)
    elif expected.exists():
        expected.unlink()
jdk = Path(r'C:\Program Files\Android\Android Studio\jbr\bin')
classpath = 'build/libs/waze-theme-selector-1.6.2.jar;tools/morphe-desktop.jar'
subprocess.run([str(jdk / 'javac.exe'), '-cp', classpath, '-d', 'build', 'tools/ValidateManifestRefresh.java'], cwd=root, check=True)
subprocess.run([str(jdk / 'java.exe'), '-cp', 'build;' + classpath, 'ValidateManifestRefresh', str(folder)], cwd=root, check=True)
