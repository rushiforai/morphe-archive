#!/usr/bin/env bash
# Apply the 10 Dart AOT hex patches to libapp.so (versioned tables, all-or-nothing).
# Usage: ./scripts/patch-calistree.sh <libapp.so path>
set -e
SO="${1:-lib/arm64-v8a/libapp.so}"
python3 << PYEOF
data = bytearray(open("$SO","rb").read())
tables = {
    "5.8.5": {
        0x20aa36c: ("e00302aa", "60830091"),  # updateState setHasProAccess param → true
        0x20aa398: ("a2035ff8", "62830091"),  # updateState state= → true
        0x20aa414: ("c0c20091", "c0820091"),  # hasProAccess default → true
        0x20aa41c: ("e00301aa", "c0820091"),  # hasProAccess cached → true
        0x20a9b28: ("e20303aa", "e2830091"),  # init() setHasProAccess → true
        0x29f5360: ("c0c20091", "c0820091"),  # Promotional check → true
        0x22d6914: ("40000054", "10000014"),  # Plan limit null gate → skip
        0x20a98bc: ("01012037", "1f2003d5"),  # backup skip gate → NOP
        0x20a9860: ("e20316aa", "c2820091"),  # StateNotifier init → true
        0x22d6960: ("8b040054", "24000014"),  # Plan limits → unlimited
    },
    "5.9.1": {
        0x22cc468: ("e00302aa", "60830091"),
        0x22cc494: ("a2035ff8", "62830091"),
        0x22cc510: ("c0c20091", "c0820091"),
        0x22cc518: ("e00301aa", "c0820091"),
        0x22cbc24: ("e20303aa", "e2830091"),
        0x2c3c9f4: ("c0c20091", "c0820091"),
        0x252a8fc: ("40000054", "10000014"),
        0x22cb9b8: ("01012037", "1f2003d5"),
        0x22cb95c: ("e20316aa", "c2820091"),
        0x252a948: ("8b040054", "24000014"),
    },
}
matched = None
for ver, table in tables.items():
    if all(data[o:o+4].hex() == exp for o, (exp, _) in table.items()):
        matched = ver
        break
if matched is None:
    print(f"libapp.so matches NO known version table ({list(tables)}) — aborting, nothing written")
    raise SystemExit(1)
for off, (exp, new) in tables[matched].items():
    old = data[off:off+4]
    data[off:off+4] = bytes.fromhex(new)
    print(f"0x{off:x}: {old.hex()} -> {new}")
open("$SO","wb").write(data)
print(f"\nMatched {matched} table — 10 hex patches applied")
PYEOF
