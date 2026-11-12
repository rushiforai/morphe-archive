"""Derive and verify the far-plane native quad helper's patchable slots.

    python -B extensions/native-quad-far-plane/tools/far_slot.py <libgxr_quad_native.so>

Prints the whole-file size, SHA-256, marker offset, distance-slot offset and settings-slot offset,
and fails when the marker is missing or duplicated, the slots do not follow the marker at +16/+20,
the stock float bytes or the keep-mode byte are not present, or the far-plane build identity is
absent. The Kotlin installer pins the same values; this tool is the generation-time derivation that
keeps that pin honest.
"""
import argparse
import hashlib
import struct
import sys

MARKER = b'GXRQUADDIST16M0'
DISTANCE_DELTA = 16
SETTINGS_DELTA = 20
STOCK_DISTANCE = 1.996000051498413
STOCK_BYTES = struct.pack('<f', STOCK_DISTANCE)          # ee 7c ff 3f
STOCK_SETTINGS = 0                                        # keep mode
BUILD_ID = b'GXR-NATIVE-QUAD-1.3-FARPLANE-ABI1'


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('helper')
    parser.add_argument('--expect-size', type=int)
    parser.add_argument('--expect-sha256')
    parser.add_argument('--expect-slot', type=lambda v: int(v, 0))
    parser.add_argument('--expect-settings', type=lambda v: int(v, 0))
    args = parser.parse_args()

    data = open(args.helper, 'rb').read()
    problems = []
    offsets = []
    start = data.find(MARKER)
    while start != -1:
        offsets.append(start)
        start = data.find(MARKER, start + 1)
    if len(offsets) != 1:
        problems.append('marker occurrences: %d (expected exactly 1)' % len(offsets))
    slot = offsets[0] + DISTANCE_DELTA if offsets else -1
    settings = slot + (SETTINGS_DELTA - DISTANCE_DELTA) if slot >= 0 else -1
    if slot >= 0:
        if data[slot - DISTANCE_DELTA:slot - 1] != MARKER or data[slot - 1] != 0:
            problems.append('marker is not NUL-terminated at slot - 16')
        if data[slot:slot + 4] != STOCK_BYTES:
            problems.append('slot does not hold the stock float bytes: %s' % data[slot:slot + 4].hex())
        if data[settings] != STOCK_SETTINGS:
            problems.append('settings slot does not hold the keep-mode byte: %d' % data[settings])
    if BUILD_ID not in data:
        problems.append('far-plane build identity missing')
    sha = hashlib.sha256(data).hexdigest()
    if args.expect_size is not None and args.expect_size != len(data):
        problems.append('size %d does not match expected %d' % (len(data), args.expect_size))
    if args.expect_sha256 is not None and args.expect_sha256.lower() != sha:
        problems.append('sha256 %s does not match expected %s' % (sha, args.expect_sha256.lower()))
    if args.expect_slot is not None and args.expect_slot != slot:
        problems.append('slot 0x%x does not match expected 0x%x' % (slot, args.expect_slot))
    if args.expect_settings is not None and args.expect_settings != settings:
        problems.append('settings offset 0x%x does not match expected 0x%x' % (settings, args.expect_settings))

    print('size: %d' % len(data))
    print('sha256: %s' % sha)
    print('marker_offset: 0x%x' % (offsets[0] if offsets else -1))
    print('slot_offset: 0x%x' % slot)
    print('settings_offset: 0x%x' % settings)
    print('stock_slot_bytes: %s' % STOCK_BYTES.hex())
    if problems:
        for problem in problems:
            print('FAIL: %s' % problem, file=sys.stderr)
        return 1
    return 0


if __name__ == '__main__':
    sys.exit(main())
