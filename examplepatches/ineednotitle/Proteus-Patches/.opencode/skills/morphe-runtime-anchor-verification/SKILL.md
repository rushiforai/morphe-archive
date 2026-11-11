---
name: morphe-runtime-anchor-verification
description: Use when a Morphe/Proteus patch applies but has no runtime effect, when a Reddit APK version changes, or before hooking an obfuscated class/method. Covers jadx, dexdump, DEX class lookup, render-path tracing, register checks, and verifying the patched instruction.
---

# Morphe runtime anchor verification

Patches fail silently when the fingerprint matches a real method that is not on
the render path. Verify the anchor before changing the detector.

## Tool paths used in this workspace

- APK: `/tmp/opencode/reddit-xapk/com.reddit.frontpage.apk`
- Extracted DEX: `/tmp/opencode/reddit42-dex/classes*.dex`
- jadx 1.5.6: `/tmp/opencode/jadx/bin/jadx`
- JDK: `JAVA_HOME=/tmp/opencode/jdk21`
- dexdump: `/tmp/opencode/android-sdk/build-tools/36.1.0/dexdump`
- Patcher CLI: `/tmp/opencode/tools/morphe-desktop.jar`

Do not run jadx `--single-class` against the full APK: it OOMs on the 111 MB
input. Run it against one dex file at a time.

## 1. Find which dex defines a descriptor

```bash
cd /tmp/opencode/reddit42-dex
for f in classes*.dex; do
  if /tmp/opencode/android-sdk/build-tools/36.1.0/dexdump -f "$f" 2>/dev/null \
      | grep -q "Class descriptor  : 'Lcom/reddit/domain/model/listing/Listing;'"; then
    echo "$f"
  fi
done
```

`strings classes*.dex | grep '...'` finds references, but `dexdump -f` confirms
the class definition.

## 2. Decompile one class

```bash
cd /tmp/opencode
JAVA_HOME=/tmp/opencode/jdk21 /tmp/opencode/jadx/bin/jadx \
  -q --no-res --single-class 'com.reddit.comments.tree.c' \
  --single-class-output /tmp/opencode/jadx-out/tree-c.java \
  /tmp/opencode/reddit42-dex/classes8.dex
```

Jadx prints obfuscated default-package classes as `defpackage.c5l0`; the DEX
descriptor is still `Lc5l0;`.

## 3. Dump the exact method and registers

```bash
cd /tmp/opencode/reddit42-dex
/tmp/opencode/android-sdk/build-tools/36.1.0/dexdump -d classes8.dex 2>/dev/null \
  | LC_ALL=C awk '/Class descriptor  : .Lc5l0;/ {p=1}
      p && /Class descriptor  : / && !/Lc5l0;/ {if(p) exit} p' \
  | sed -n '1,90p'
```

Record:

- Method signature (`<init>`, parameter list, return type)
- `registers`, `ins`, `outs`
- Field-write order and source registers
- Whether the value is written directly from `pN` or moved into a local
- Every `return`/`return-void` (end-injection only covers the final one)

For wide constructors, compute `p0Register` or use `p0` in smali and verify the
patched dump shows the expected high register, e.g.
`invoke-static/range {v1}, ...`.

## 4. Trace the render path

Do not trust a class name. Follow construction and emission:

- `Listing` is a feed container, not automatically a comment container.
- Reddit 2026.42.0 comment threads use the obfuscated store
  `com.reddit.comments.tree.c` → `lfa` state → `Lc5l0` TreeData.
- `Lc5l0` fields: `a` changes, `b` ordered ids, `c` id → comment map,
  `d` id → tree-item map.
- Tree item wrappers are `Lf5l0` (user comment), `Ld5l0` (ad), `Le5l0`
  (more-comment), all extending `Lg5l0;` with public field `a` = kind-with-id.
- GraphQL and REST both construct the full
  `Lcom/reddit/domain/model/Comment;` eventually.

If a helper filters a list but the UI resurrects rows, check for parallel
maps/lists that also need filtering.

## 5. Check the patched instruction

```bash
unzip -q /tmp/opencode/reddit42-test.apk 'classes*.dex' -d /tmp/opencode/reddit42-test-dex
# find the dex that now defines the patched class, then dexdump -d it
```

Confirm the injected `invoke-static` is present, the original field write still
exists, and the `move-result-object` writes back into the same source register.
If the class moved to a new dex after patching, that is normal.

## 6. Never conclude from "Applied" alone

The patcher report only proves fingerprints matched and bytecode rebuilt. It
does not prove thread, batching, or runtime behavior. Report those separately:
static hook verified, runtime on-device behavior unverified.
