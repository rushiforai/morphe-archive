#!/usr/bin/env python3
"""v8_splice.py <in_apk> <out_apk> <new_classes1.dex> <new_classes3.dex>
                <mini_classes5.dex> <liboprx.so> <libhev.so>

Builds the v8 APK payload from the v6 universal build:
1. binary AXML edits on AndroidManifest.xml (size-preserving):
   - android:extractNativeLibs false -> true   (child exec from nativeLibraryDir)
   - the two android:label refs 0x7f1413ee (vpn_pro_title "VPN Pro")
     -> 0x7f141408 (vpn_title "VPN") on the QS tile service + app widget
2. replaces classes.dex / classes3.dex (v8 smali patches)
3. replaces the empty classes5.dex stub with the embedded VPN stack dex
4. adds lib/armeabi-v7a/liboprx.so + libhev-socks5-tunnel.so (deflated;
   extracted at install because extractNativeLibs=true)
5. strips the old v1 signature entries (MORPHE.SF/.RSA, MANIFEST.MF)

Verifies the expected number of AXML edits and refuses to write otherwise.
"""
import struct
import sys
import zipfile

ACON = 'http://schemas.android.com/apk/res/android'
LABEL_OLD = 0x7f1413ee  # string/vpn_pro_title "VPN Pro"
LABEL_NEW = 0x7f141408  # string/vpn_title "VPN"


# ----------------------------------------------------------------- AXML edit

class StringPool:
    def __init__(self, data):
        (self.type, hdr, self.size, self.count, _styles, flags,
         self.strings_start, _styles_start) = struct.unpack_from('<HHIIIIII', data, 0)
        self.is_utf8 = bool(flags & 0x100)
        self.offsets = struct.unpack_from('<%dI' % self.count, data, hdr)
        self.data = data

    def get(self, i):
        if i == 0xFFFFFFFF or i >= self.count:
            return None
        off = self.strings_start + self.offsets[i]
        d = self.data
        if self.is_utf8:
            n = d[off]
            off += 1
            if n & 0x80:
                n = ((n & 0x7F) << 8) | d[off]
                off += 1
            m = d[off]
            off += 1
            if m & 0x80:
                m = ((m & 0x7F) << 8) | d[off]
                off += 1
            return d[off:off + m].decode('utf-8', 'replace')
        n = struct.unpack_from('<H', d, off)[0]
        off += 2
        if n & 0x8000:
            n = ((n & 0x7FFF) << 16) | struct.unpack_from('<H', d, off)[0]
            off += 2
        return d[off:off + n * 2].decode('utf-16-le', 'replace')


def patch_manifest(buf):
    """In-place (size-preserving) edits. Returns (edited_buffer, stats)."""
    b = bytearray(buf)
    if struct.unpack_from('<H', b, 0)[0] != 0x0003:
        raise SystemExit('not a binary XML chunk')
    # find the string pool (first chunk after the 8-byte file header)
    off = 8
    pool = None
    while off < len(b):
        ctype, hdr, csize = struct.unpack_from('<HHI', b, off)
        if ctype == 0x0001:
            pool = StringPool(bytes(b[off:off + csize]))
            break
        off += csize
    if pool is None:
        raise SystemExit('no string pool in manifest')

    stats = {'extract': 0, 'label': 0}
    off = 8
    while off < len(b):
        ctype, hdr, csize = struct.unpack_from('<HHI', b, off)
        if ctype != 0x0102:  # START_ELEMENT
            off += csize
            continue
        # ResXMLTree_node: header(8) + lineNumber(4) + comment(4), then
        # ResXMLTree_attrExt: ns(4), name(4), attributeStart(2),
        # attributeSize(2), attributeCount(2); attributes at
        # headerSize + attributeStart (= 16 + 20 = 36).
        ns, name = struct.unpack_from('<II', b, off + 16)
        attr_start, attr_size, attr_count = struct.unpack_from('<HHH', b, off + 24)
        base = off + hdr + attr_start
        for i in range(attr_count):
            a = base + i * attr_size
            a_ns, a_name, a_raw = struct.unpack_from('<III', b, a)
            # Res_value: size u16, res0 u8, dataType u8, data u32
            dtype = b[a + 15]
            data = struct.unpack_from('<I', b, a + 16)[0]
            ns_s = pool.get(a_ns) if a_ns != 0xFFFFFFFF else None
            name_s = pool.get(a_name)
            if ns_s == ACON and name_s == 'extractNativeLibs':
                if dtype != 0x12:
                    raise SystemExit('extractNativeLibs not boolean (type 0x%x)' % dtype)
                if data != 0:
                    raise SystemExit('extractNativeLibs already true?')
                struct.pack_into('<I', b, a + 16, 1)
                stats['extract'] += 1
            elif (ns_s == ACON and name_s == 'label'
                  and dtype == 0x01 and data == LABEL_OLD):
                struct.pack_into('<I', b, a + 16, LABEL_NEW)
                stats['label'] += 1
        off += csize
    return bytes(b), stats


# ------------------------------------------------------------------- splice

STRIP = {'META-INF/MORPHE.SF', 'META-INF/MORPHE.RSA', 'META-INF/MANIFEST.MF'}


def main():
    (src, dst, c1, c3, c5, oprx, hev) = sys.argv[1:8]
    zin = zipfile.ZipFile(src)
    manifest = patch_manifest(zin.read('AndroidManifest.xml'))
    if manifest[1] != {'extract': 1, 'label': 2}:
        raise SystemExit('manifest edit count mismatch: %s' % (manifest[1],))

    payload = {
        'classes.dex': open(c1, 'rb').read(),
        'classes3.dex': open(c3, 'rb').read(),
        'classes5.dex': open(c5, 'rb').read(),
        'AndroidManifest.xml': manifest[0],
    }
    adds = {
        'lib/armeabi-v7a/liboprx.so': open(oprx, 'rb').read(),
        'lib/armeabi-v7a/libhev-socks5-tunnel.so': open(hev, 'rb').read(),
    }
    for k, v in list(adds.items()) + list(payload.items()):
        if not v:
            raise SystemExit('empty payload: ' + k)

    zout = zipfile.ZipFile(dst, 'w', zipfile.ZIP_DEFLATED)
    n = 0
    for info in zin.infolist():
        name = info.filename
        if name in STRIP or name in payload:
            continue
        zi = zipfile.ZipInfo(name, date_time=info.date_time)
        zi.compress_type = info.compress_type
        zi.external_attr = info.external_attr
        zout.writestr(zi, zin.read(name))
        n += 1
    for name, data in payload.items():
        zout.writestr(name, data, compress_type=zipfile.ZIP_DEFLATED)
        n += 1
    for name, data in adds.items():
        zout.writestr(name, data, compress_type=zipfile.ZIP_DEFLATED)
        n += 1
    zout.close()
    print('spliced %d entries -> %s' % (n, dst))
    print('manifest edits: %s' % (manifest[1],))


if __name__ == '__main__':
    main()
