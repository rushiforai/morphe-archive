"""Update native-library alignment hints before APK signing, without moving data."""
import struct
import zipfile


def normalise_native_alignment(path, page_size=16384):
    if page_size not in (4096, 16384):
        raise ValueError("Unsupported native page size")
    changed = 0
    with zipfile.ZipFile(path) as archive, open(path, "r+b") as output:
        for entry in archive.infolist():
            if entry.compress_type != zipfile.ZIP_STORED or not entry.filename.endswith(".so"):
                continue
            output.seek(entry.header_offset)
            header = output.read(30)
            if len(header) != 30 or header[:4] != b"PK\x03\x04":
                raise ValueError("Invalid native-library local ZIP header")
            name_length, extra_length = struct.unpack_from("<HH", header, 26)
            start = entry.header_offset + 30 + name_length
            output.seek(start)
            extra = output.read(extra_length)
            offset = 0
            while offset + 4 <= len(extra):
                kind, length = struct.unpack_from("<HH", extra, offset)
                if offset + 4 + length > len(extra):
                    break  # zipalign padding may end with an incomplete field.
                if kind == 0xD935 and length >= 2:
                    if struct.unpack_from("<H", extra, offset + 4)[0] != page_size:
                        output.seek(start + offset + 4)
                        output.write(struct.pack("<H", page_size))
                        changed += 1
                offset += 4 + length
    return changed


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk")
    args = parser.parse_args()
    print(f"Updated {normalise_native_alignment(args.apk)} native alignment hints")
