"""Resolve Android resource ids (0x7f......) to their resource names in resources.arsc.

Usage:
  python tools/dexquery/arsc_names.py <resources.arsc> <id> [<id> ...]
  python tools/dexquery/arsc_names.py <resources.arsc> --grep <substring> [type]
  python tools/dexquery/arsc_names.py <resources.arsc> --dump <type> [<substring>]

Only the type/key tables are read; values are not decoded. This is enough to turn the integer
immediates Gboard passes to its preference API into the resource names those ids stand for.
"""

import struct
import sys

RES_STRING_POOL = 0x0001
RES_TABLE = 0x0002
RES_TABLE_PACKAGE = 0x0200
RES_TABLE_TYPE = 0x0201


def read_string_pool(data, start):
    chunk_type, header_size, size = struct.unpack_from("<HHI", data, start)
    assert chunk_type == RES_STRING_POOL, hex(chunk_type)
    string_count, style_count, flags, strings_start, styles_start = struct.unpack_from(
        "<IIIII", data, start + 8
    )
    utf8 = (flags & (1 << 8)) != 0
    offsets = struct.unpack_from("<%dI" % string_count, data, start + header_size)
    base = start + strings_start
    out = []
    for offset in offsets:
        pos = base + offset
        if utf8:
            # u16 length (or two bytes with high bit set), then u8 length, then data.
            first = data[pos]
            if first & 0x80:
                pos += 2
            else:
                pos += 1
            second = data[pos]
            if second & 0x80:
                length = ((second & 0x7F) << 8) | data[pos + 1]
                pos += 2
            else:
                length = second
                pos += 1
            out.append(data[pos : pos + length].decode("utf-8", "replace"))
        else:
            length = struct.unpack_from("<H", data, pos)[0]
            pos += 2
            if length & 0x8000:
                length = ((length & 0x7FFF) << 16) | struct.unpack_from("<H", data, pos)[0]
                pos += 2
            out.append(data[pos : pos + length * 2].decode("utf-16-le", "replace"))
    return out, start + size


def parse(data):
    chunk_type, header_size, total = struct.unpack_from("<HHI", data, 0)
    assert chunk_type == RES_TABLE, hex(chunk_type)
    global_strings, _ = read_string_pool(data, header_size)
    offset = header_size
    names = {}
    values = {}
    type_names = {}
    while offset < total:
        ctype, cheader, csize = struct.unpack_from("<HHI", data, offset)
        if ctype == RES_TABLE_PACKAGE:
            package_id = struct.unpack_from("<I", data, offset + 8)[0]
            type_strings_off = struct.unpack_from("<I", data, offset + 268)[0]
            key_strings_off = struct.unpack_from("<I", data, offset + 276)[0]
            _, _ = read_string_pool(data, offset + type_strings_off)
            type_strings, _ = read_string_pool(data, offset + type_strings_off)
            key_strings, _ = read_string_pool(data, offset + key_strings_off)
            cursor = offset + cheader
            while cursor < offset + csize:
                ttype, theader, tsize = struct.unpack_from("<HHI", data, cursor)
                if ttype == RES_TABLE_TYPE:
                    type_id = data[cursor + 8]
                    entry_count = struct.unpack_from("<I", data, cursor + 12)[0]
                    entries_start = struct.unpack_from("<I", data, cursor + 16)[0]
                    type_name = type_strings[type_id - 1] if type_id - 1 < len(type_strings) else "?"
                    type_names.setdefault(type_id, type_name)
                    offsets = struct.unpack_from("<%dI" % entry_count, data, cursor + theader)
                    for index, entry_offset in enumerate(offsets):
                        if entry_offset == 0xFFFFFFFF:
                            continue
                        entry_pos = cursor + entries_start + entry_offset
                        key_index = struct.unpack_from("<I", data, entry_pos + 4)[0]
                        name = key_strings[key_index]
                        resource_id = (package_id << 24) | (type_id << 16) | index
                        names[resource_id] = (type_name, name)
                        entry_size = struct.unpack_from("<H", data, entry_pos)[0]
                        value_pos = entry_pos + entry_size
                        if value_pos + 8 <= len(data):
                            value_size, _, data_type, raw = struct.unpack_from(
                                "<HBBI", data, value_pos
                            )
                            if data_type == 0x03 and raw < len(global_strings):
                                values[resource_id] = global_strings[raw]
                cursor += tsize
        offset += csize
    return names, values


def main():
    path = sys.argv[1]
    with open(path, "rb") as handle:
        data = handle.read()
    names, values = parse(data)
    args = sys.argv[2:]
    if not args:
        print("resources: %d" % len(names))
        return
    if args[0] == "--grep":
        needle = args[1]
        wanted_type = args[2] if len(args) > 2 else None
        for rid in sorted(names):
            rtype, name = names[rid]
            if wanted_type and rtype != wanted_type:
                continue
            value = values.get(rid, "")
            if needle.lower() in name.lower() or needle.lower() in value.lower():
                print("0x%08x %s/%s = %r" % (rid, rtype, name, value))
        return
    if args[0] == "--dump":
        wanted_type = args[1]
        needle = args[2] if len(args) > 2 else ""
        for rid in sorted(names):
            rtype, name = names[rid]
            value = values.get(rid, "")
            if rtype == wanted_type and needle.lower() in value.lower():
                print("0x%08x %s/%s = %r" % (rid, rtype, name, value))
        return
    for text in args:
        rid = int(text, 0)
        print("0x%08x -> %s = %r" % (rid, names.get(rid, "<unknown>"), values.get(rid, "")))


if __name__ == "__main__":
    main()
