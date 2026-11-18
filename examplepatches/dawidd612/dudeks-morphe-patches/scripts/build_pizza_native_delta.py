"""Encode an exact-build native initialization repair; inputs remain local evidence."""
import argparse
import gzip
import hashlib
import struct
from pathlib import Path


def encode(original: bytes, restored: bytes) -> bytes:
    block = 1024
    locations = {original[i:i + block]: i for i in range(0, len(original), block)}
    operations = []
    for offset in range(0, len(restored), block):
        data = restored[offset:offset + block]
        source = locations.get(data)
        if source is None:
            if operations and operations[-1][0] == 0:
                operations[-1][1].extend(data)
            else:
                operations.append([0, bytearray(data)])
        elif operations and operations[-1][0] == 1 and operations[-1][1] + operations[-1][2] == source:
            operations[-1][2] += len(data)
        else:
            operations.append([1, source, len(data)])
    payload = bytearray(b'PZB2' + hashlib.sha256(original).digest() + hashlib.sha256(restored).digest())
    payload += struct.pack('>II', len(restored), len(operations))
    for op in operations:
        payload.append(op[0])
        if op[0] == 0:
            payload += struct.pack('>I', len(op[1])) + op[1]
        else:
            payload += struct.pack('>II', op[1], op[2])
    return gzip.compress(payload, mtime=0)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original', type=Path)
    parser.add_argument('restored', type=Path)
    parser.add_argument('output', type=Path)
    args = parser.parse_args()
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(encode(args.original.read_bytes(), args.restored.read_bytes()))
    print(f'{args.output}: {args.output.stat().st_size} bytes')
