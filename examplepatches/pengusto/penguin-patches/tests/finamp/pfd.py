#!/usr/bin/env python3
"""Bounded PFD1 codec for the pinned Finamp native snapshot deltas.

Generation uses bsdiff4==1.2.6; decoding uses only the Python standard library.
The Kotlin patch decoder implements this same documented format.
"""
import bz2
import hashlib
import struct
import zlib

MAGIC = b'PFD1'
HEADER = struct.Struct('<4sQQ32s32sQQQ')
MAX_FILE = 64 * 1024 * 1024
MAX_BODY = 128 * 1024 * 1024


def _offtin(raw):
    value = int.from_bytes(raw, 'little')
    return -(value & ((1 << 63) - 1)) if value >> 63 else value


def make_delta(old, new):
    import bsdiff4
    if len(old) > MAX_FILE or len(new) > MAX_FILE:
        raise ValueError('Native file exceeds size limit')
    patch = bsdiff4.diff(old, new)
    if patch[:8] != b'BSDIFF40':
        raise ValueError('Unexpected bsdiff format')
    ctrl_size, diff_size, new_size = [_offtin(patch[i:i + 8]) for i in (8, 16, 24)]
    if new_size != len(new) or ctrl_size < 0 or diff_size < 0:
        raise ValueError('Invalid bsdiff header')
    control = bz2.decompress(patch[32:32 + ctrl_size])
    difference = bz2.decompress(patch[32 + ctrl_size:32 + ctrl_size + diff_size])
    extra = bz2.decompress(patch[32 + ctrl_size + diff_size:])
    if len(control) % 24:
        raise ValueError('Invalid bsdiff controls')
    controls = b''.join(struct.pack('<q', _offtin(control[i:i + 8])) for i in range(0, len(control), 8))
    header = HEADER.pack(MAGIC, len(old), len(new), hashlib.sha256(old).digest(), hashlib.sha256(new).digest(),
                         len(controls), len(difference), len(extra))
    result = header + zlib.compress(controls + difference + extra, 9)
    if apply_delta(old, result) != new:
        raise ValueError('Delta self-verification failed')
    return result


def apply_delta(old, patch):
    if len(patch) < HEADER.size:
        raise ValueError('Truncated PFD1 header')
    magic, old_size, new_size, old_hash, new_hash, c_size, d_size, e_size = HEADER.unpack_from(patch)
    if magic != MAGIC or old_size != len(old) or old_size > MAX_FILE or new_size > MAX_FILE:
        raise ValueError('Unsupported native input or PFD1 header')
    if hashlib.sha256(old).digest() != old_hash:
        raise ValueError('Original native hash mismatch')
    if c_size % 24 or c_size > MAX_FILE or d_size + e_size != new_size or c_size + d_size + e_size > MAX_BODY:
        raise ValueError('Invalid PFD1 segment sizes')
    decoder = zlib.decompressobj()
    expected_size = c_size + d_size + e_size
    body = decoder.decompress(patch[HEADER.size:], expected_size + 1)
    if len(body) != expected_size or not decoder.eof or decoder.unused_data or decoder.unconsumed_tail:
        raise ValueError('Invalid compressed PFD1 body')
    result = bytearray(new_size)
    old_pos = new_pos = diff_pos = extra_pos = 0
    for x, y, z in struct.iter_unpack('<qqq', body[:c_size]):
        if x < 0 or y < 0 or x > new_size - new_pos or y > new_size - new_pos - x:
            raise ValueError('Invalid PFD1 output bounds')
        if x > d_size - diff_pos or y > e_size - extra_pos:
            raise ValueError('Invalid PFD1 segment bounds')
        for i in range(x):
            previous = old[old_pos + i] if 0 <= old_pos + i < old_size else 0
            result[new_pos + i] = (body[c_size + diff_pos + i] + previous) & 255
        new_pos += x
        diff_pos += x
        old_pos += x
        result[new_pos:new_pos + y] = body[c_size + d_size + extra_pos:c_size + d_size + extra_pos + y]
        new_pos += y
        extra_pos += y
        old_pos += z
        if not -(1 << 63) <= old_pos < (1 << 63):
            raise ValueError('PFD1 source position overflow')
    if new_pos != new_size or diff_pos != d_size or extra_pos != e_size:
        raise ValueError('Incomplete PFD1 reconstruction')
    if hashlib.sha256(result).digest() != new_hash:
        raise ValueError('Patched native hash mismatch')
    return bytes(result)
