# Pizza 5.57.3 initialization reconstruction

This is the ARM64 startup repair for the supported stable Pizza target. The source build and emulator results are
recorded in `pizza-project-context.md`; they do not establish ARM32 support or
physical-device compatibility. APKs, account data, signing keys and raw runtime
snapshots are local ignored artifacts.

The previous startup no-op omitted 1459 static strings and a native initializer.
The signed original application was observed twice on the disposable API 35 AVD.
Both runs produced the same strings. The native program `HKU28jIt1punH16H` restored
50864 executable bytes, 3794 data words and 200 imported functions. The executable
and constant data agreed across independently randomized process mappings.

`reconstruct_pizza_native.py` reproduces those changes with LIEF 1.0.0 and
pyelftools 0.33. It preserves existing relocations and the C++ initialization array,
replaces the observed runtime imports with symbolic ELF relocations, and removes
the now-redundant protected `DT_INIT`. The libc IFUNC target was resolved to the
portable `memmove` symbol, never a captured runtime address. LIEF relocates the ELF
layout while rebuilding its dynamic tables.

The script takes the evidence directory containing `libcocos2dcpp.so`,
`native-before-{1,6}.bin`, `native-after-{1,6}.bin`,
`native-after-{1,6}-first.bin`, both `dump-native-messages*.jsonl` snapshots and
the resolved/unknown native import JSON files. Capture and import-resolution
scripts remain with that session's local evidence. They must run against the
original signed build, never against a user's authenticated game instance.

Encode the resulting native file using:

```text
python scripts/build_pizza_native_delta.py ORIGINAL_LIBRARY RESTORED_LIBRARY patches/src/main/resources/pizzabusiness/5.57.3/arm64-init.delta.gz
```

The compressed PZB2 format contains input/output SHA-256, output length, and a
sequence of source-copy or literal operations. The patch checks both hashes and
never mutates the input array. Exact-build matching is necessary because applying
a native layout repair to a different binary can corrupt executable code.

`strings.tsv.gz` stores descriptor, field name and Base64 UTF-8 value from the
matching original runtime snapshots. These are shipped application constants,
not account credentials.

`sdk-receivers.dex` contains only four recovered method bodies: three Fyber 8.4.6
receivers and one Ad Quality 9.9.0 receiver. Their source AARs are official Maven
artifacts listed with hashes in `pizza-bootstrap-provenance.json`. The AAR
`classes.jar` files were converted with Android build-tools 35.0.0 D8, min API 23.
Every referenced method/field used by these replacements was checked against the
game's DEX. All other SDK methods remain unchanged. Remaining protected VM callers
still require runtime coverage; do not infer their safety from an idle menu.

Validation includes native output parity and malformed-input recovery,
all-split asset/library preservation with only the exact reconstructed native
hash accepted, unchanged authentication methods, original SDK method parity and
the existing observable reward-dispatch scenarios. Actual account selection,
authorization, save persistence and gameplay must also be tested on the device.
