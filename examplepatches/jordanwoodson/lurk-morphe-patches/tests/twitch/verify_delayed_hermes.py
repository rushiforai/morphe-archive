#!/usr/bin/env python3
"""Independent HBC98 append verifier; no APK or third-party disassembler implementation required."""
import hashlib
import json
from pathlib import Path
import struct
import sys

def u32(data, at):
    return struct.unpack_from('<I', data, at)[0]

def header(data, position):
    first, second = struct.unpack_from('<II', data, position)
    assert data[position + 11] & 32
    full = (first & 0xffffff) | (((second >> 14) & 255) << 24)
    body, params, loop, size, name, numbers, nonpointers, frame = struct.unpack_from('<8I', data, full)
    assert full + 37 <= len(data) - 20 and body + size <= len(data) - 20
    return full, body, size, frame, data[full + 36]

def verify(stock, patched, manifest):
    assert hashlib.sha256(stock).hexdigest() == '059f4713e0cea80b58e68b675fb05d63053056869e2ac60c79f5d57567a3e583'
    assert hashlib.sha256(patched).hexdigest() == manifest['embeddedSha256']
    assert u32(patched, 8) == 98 and u32(patched, 32) == len(patched)
    assert hashlib.sha1(patched[:-20]).digest() == patched[-20:]
    append = manifest['append']
    assert append['key'] == 'chat_show_deleted' and append['default'] is True
    assert append['originalLength'] == len(stock)
    assert patched[108:112] == stock[108:112], 'global debug data moved'
    table = append['headerOffset']
    assert table >= 128 and (table - 128) % 12 == 0 and (table - 128) // 12 < u32(stock, 40)
    assert stock[table:table+12] == bytes.fromhex(append['originalHeader'])
    assert patched[table:table+12] == bytes.fromhex(append['replacementHeader'])
    assert patched[len(stock)-20:-20] == bytes.fromhex(append['tail'])
    original_header = header(stock, table)
    assert original_header[2] == 122 and original_header[4] & 0x18 == 0
    full, body, size, frame, flags = header(patched, table)
    assert body >= len(stock)-20 and full >= body+size and flags & 8 and not flags & 16
    assert 8 <= frame <= 32
    code = patched[body:body+size]
    lengths = {0x10:3,0x17:4,0x34:3,0x3b:4,0x3d:2,0x46:8,0x49:8,0x5d:4,
               0x6c:4,0x6f:6,0x76:2,0x77:2,0x89:3,0x8c:6,0x91:6,0x93:2,
               0x96:2,0xae:2,0xb6:8,0xd3:4,0xd5:4}
    positions, branches = set(), []
    at = 0
    while at < size:
        positions.add(at)
        op = code[at]
        length = lengths[op]
        assert at + length <= size
        if op in (0xae,0xd3,0xd5):
            branches.append(at + struct.unpack_from('<b',code,at+1)[0])
        if op == 0xb6:
            branches.append(at + struct.unpack_from('<i',code,at+1)[0])
        at += length
    assert at == size and all(target in positions for target in branches)
    exception_table = (full + 37 + 3) & ~3
    assert u32(patched, exception_table) == 1
    start, end, target = struct.unpack_from('<III',patched,exception_table+4)
    assert start in positions and end in positions | {size} and target in positions
    assert start < end and code[target] == 0x77
    getter = next(p for p in positions if code[p] == 0x49)
    call = next(p for p in positions if code[p] == 0x6f)
    assert start <= getter < call < end, 'getter/function errors are not caught'
    # Every changed byte belongs to the declared equal-length edits, one compact header, or append.
    expected = bytearray(stock[:-20]) + bytes.fromhex(append['tail']) + bytes(20)
    expected[table:table+12] = bytes.fromhex(append['replacementHeader'])
    struct.pack_into('<I',expected,32,len(expected))
    for edit in manifest['edits']:
        before, after = bytes.fromhex(edit['original']), bytes.fromhex(edit['replacement'])
        offset = edit['offset']
        assert len(before) == len(after) and stock[offset:offset+len(before)] == before
        if edit['default']:
            expected[offset:offset+len(after)] = after
    expected[-20:] = hashlib.sha1(expected[:-20]).digest()
    assert expected == patched, 'undeclared main-bundle changes'
    restored = bytearray(patched[:len(stock)])
    restored[table:table+12] = bytes.fromhex(append['originalHeader'])
    for edit in manifest['edits']:
        before = bytes.fromhex(edit['original'])
        restored[edit['offset']:edit['offset']+len(before)] = before
    struct.pack_into('<I',restored,32,len(stock))
    restored[-20:] = hashlib.sha1(restored[:-20]).digest()
    assert restored == stock
    print(f'PASS independent HBC98 predicate: {size} bytes, {len(branches)} branches, guarded catch, exact off restoration')

if __name__ == '__main__':
    verify(Path(sys.argv[1]).read_bytes(), Path(sys.argv[2]).read_bytes(), json.loads(Path(sys.argv[3]).read_text()))
