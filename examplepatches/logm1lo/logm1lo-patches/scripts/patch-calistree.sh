#!/usr/bin/env bash
# Apply 10 Dart AOT hex patches to libapp.so
# Usage: ./scripts/patch-calistree.sh <libapp.so path>
set -e
SO="${1:-lib/arm64-v8a/libapp.so}"
python3 << PYEOF
import sys
data = bytearray(open("$SO","rb").read())
patches = {
    0x20aa36c: "60830091",  # updateState setHasProAccess param → true
    0x20aa398: "62830091",  # updateState state= → true
    0x20aa414: "c0820091",  # hasProAccess default → true
    0x20aa41c: "c0820091",  # hasProAccess cached → true
    0x20a9b28: "e2830091",  # init() setHasProAccess → true
    0x29f5360: "c0820091",  # Promotional check → true
    0x22d6914: "10000014",  # Plan limit null gate → skip
    0x20a98bc: "1f2003d5",  # backup skip → NOP
    0x20a9860: "c2820091",  # StateNotifier init → true
    0x22d6960: "24000014",  # Plan limits → unlimited
}
for off, hex in patches.items():
    old = data[off:off+len(hex)//2]
    new = bytes.fromhex(hex)
    data[off:off+len(hex)//2] = new
    print(f"0x{off:x}: {old.hex()} -> {new.hex()}")
open("$SO","wb").write(data)
print("\n10 hex patches applied")
PYEOF
