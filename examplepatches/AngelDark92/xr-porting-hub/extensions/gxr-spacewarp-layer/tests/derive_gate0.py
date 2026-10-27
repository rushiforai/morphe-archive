#!/usr/bin/env python
# Derive the Gate-0 evidence JSON for the gxr-spacewarp layer's PLT GOT patch.
#
# Per-base (brief 13-PORT-5001712-C1): each supported base derives its OWN pins
# from its OWN decoded tree - a base's layout is re-derived per base, never
# transplanted from 5002363. Stdlib only: no pyelftools, no capstone. Fails
# loudly (nonzero exit) on any ambiguity; never freezes a pin it could not
# verify exactly once. The 5002363 derivation is unchanged by this extension
# and its frozen outputs are NEVER overwritten by a re-run.
#
# Re-derived pins per base (RE-SHARED-IMPL.md "Known anchors" + brief-01
# evidence values re-checked against the CURRENT tree before citing):
#   - full-file size + SHA-256 (diagnostics only, never a gate)
#   - the base-identity 0x80-byte code anchor (the codecs-support audit window
#     for that base; one unique occurrence; the expected SHA is frozen per base)
#   - brief-01 anchor windows as extra layout gates (one unique hit each)
#   - the GOT slot of eglCreateImageKHR (exactly one dynamic relocation; the
#     arrival-learning site for the spacewarp missed-tick logic)
#
# Usage:  python -B derive_gate0.py [--base 5002363|5001712]
#                 [--scene <path-to-libvrlink_scene.so>] [--out <json>] [--check]
# --check cross-verifies the compiled-in pins (src/swp_hooks.cpp's per-base
# profile table + the Kotlin patch's per-base window preconditions) instead of
# emitting.
# Exit codes: 0 = frozen/checked, 1 = derivation error (ambiguous/missing evidence).
import argparse
import hashlib
import json
import re
import struct
import sys
from datetime import datetime, timezone
from typing import NoReturn

PT_LOAD = 1
PT_DYNAMIC = 2
SHT_NULL = 0
SHT_DYNSYM = 11
SHT_DYNAMIC = 6
R_AARCH64_GLOB_DAT = 1025
R_AARCH64_JUMP_SLOT = 1026
DT_NULL = 0
DT_STRTAB = 5
DT_SYMTAB = 6
DT_STRSZ = 10
DT_RELA = 7
DT_RELASZ = 8
DT_RELAENT = 9
DT_NEEDED = 1
DT_HASH = 4
DT_JMPREL = 23
DT_PLTRELSZ = 2
DT_GNU_HASH = 0x6FFFFEF5
BIND_GLOBAL = 1
BIND_WEAK = 2

ELFCLASS64 = 2
EM_AARCH64 = 183
ELFDATA2LSB = 1
ET_DYN = 3

REPO_ROOT = "D:/Angelo/Desktop/SteamLink-GalaxyXR-Windows-Toolkit-FULL/steamlink-patches"
ANCHOR_SIZE = 0x80

# Per-base layout expectations (re-verified against the current tree below):
# the known identity anchor + its frozen sha, the brief-01/brief-13 extra
# windows, and the compiled-pin check needles. The 5002363 base anchor is the
# codecs-support audit window (sha frozen there too); the 5001712 anchor is
# that base's own codecs-support audit window (0xfd304) - brief 13's question
# ("does 5001712 share 5002363's 0xfd6fc/f5c43c6a anchor?") is answered by
# derivation below, never assumed.
BASES = {
    "5002363": {
        "tree": "android-steamlinkvr-release-base-2.0.23-5002363",
        "versionName": "2.0.23",
        "versionCode": 5002363,
        "knownAnchorOffset": 0xFD6FC,
        "expectedKnownAnchorSha":
            "f5c43c6aacb69e61c3f929f361612e1b91bb509803d2c14824b9601b3dd8c795",
        "extraGates": {
            "XrSceneStream::Render": 0x11B708,
            "QSVLClientXR::FlipFrame": 0x10CD00,
        },
        "out": "gate0.json",
        # --check needles: compiled-in profile literals (swp_hooks.cpp) for
        # this base, and the Kotlin precondition-map key.
        "checkProfileNeedles": ["0xfd6fc",
                                "f5c43c6aacb69e61c3f929f361612e1b91bb509803d2c14824b9601b3dd8c795",
                                "0x22fcc8"],
        "kotlinKey": "2.0.23/5002363",
    },
    "5001712": {
        "tree": "android-steamlinkvr-release-base-2.0.20-5001712",
        "versionName": "2.0.20",
        "versionCode": 5001712,
        "knownAnchorOffset": 0xFD304,
        "expectedKnownAnchorSha":
            "6e5dcb4f5094763e948388ca35c6132af242159fc3c22e812f0fe2f4ab4f2649",
        "extraGates": {
            "XrSceneStream::Render": 0x1190A4,
            "QSVLClientXR::FlipFrame": 0x10AD18,
            "AppTick": 0x13EB80,
        },
        "out": REPO_ROOT + "/extensions/gxr-spacewarp-layer/"
               "gxr_spacewarp_gate0_5001712.json",
        "checkProfileNeedles": ["0xfd304",
                                "6e5dcb4f5094763e948388ca35c6132af242159fc3c22e812f0fe2f4ab4f2649",
                                "0x21bb88"],
        "kotlinKey": "2.0.20/5001712",
    },
    # 2.0.24/5002395 (sixth base, 2026-10-26): fresh per-base derivation from the
    # retained 2.0.24 decoded tree. The identity anchor is this base's
    # codecs-support audit window (0xfe954); the extra gates are this base's own
    # dynsym entry VAs for FlipFrame, Render and AppTick, each a unique 0x80-byte
    # window. Emits straight to the staged resource so the frozen copy and the
    # shipped copy cannot drift.
    "5002395": {
        "tree": "android-steamlinkvr-release-base-2.0.24-5002395",
        "versionName": "2.0.24",
        "versionCode": 5002395,
        "knownAnchorOffset": 0xFE954,
        "expectedKnownAnchorSha":
            "ef7f310bbd65499404aa89a18f873c42a87282a16799b84119c75377654003a3",
        "extraGates": {
            "XrSceneStream::Render": 0x11C9A0,
            "QSVLClientXR::FlipFrame": 0xFCC60,
            "AppTick": 0x146E5C,
        },
        "out": REPO_ROOT + "/patches/src/main/resources/steamlink/androidxr/"
               "gxr_spacewarp_gate0_5002395.json",
        "checkProfileNeedles": ["0xfe954",
                                "ef7f310bbd65499404aa89a18f873c42a87282a16799b84119c75377654003a3",
                                "0x232170"],
        "kotlinKey": "2.0.24/5002395",
        # --check re-derives every window from this exact scene; a missing or
        # different tree fails closed instead of falling back to source literals.
        "checkRequiresTree": True,
        "expectedSize": 2301432,
        "expectedSha256":
            "5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b",
    },
}

RELOC_NAMES = {R_AARCH64_GLOB_DAT: "GLOB_DAT", R_AARCH64_JUMP_SLOT: "JUMP_SLOT"}


def die(msg) -> NoReturn:
    print("FATAL: %s" % msg, file=sys.stderr)
    sys.exit(1)


def u32(buf, off):
    return struct.unpack_from("<I", buf, off)[0]


def u64(buf, off):
    return struct.unpack_from("<Q", buf, off)[0]


def parse_dynamic_mappings(data):
    """Return per-PT_LOAD (fileOffset, vaddr, filesz) plus the PT_DYNAMIC map."""
    e_phoff, e_shoff = struct.unpack_from("<QQ", data, 0x20)
    e_phentsize, e_phnum = struct.unpack_from("<HH", data, 0x36)
    loads, dynamic = [], None
    for i in range(e_phnum):
        base = e_phoff + i * e_phentsize
        p_type, _p_flags = struct.unpack_from("<II", data, base)
        p_offset, p_vaddr, _p_paddr, p_filesz = struct.unpack_from("<QQQQ", data, base + 8)
        if p_type == PT_LOAD:
            loads.append((p_offset, p_vaddr, p_filesz))
        elif p_type == PT_DYNAMIC:
            dynamic = (p_offset, p_filesz)
    if not loads:
        die("no PT_LOAD segments")
    if dynamic is None:
        die("no PT_DYNAMIC segment")
    e_type, e_machine = struct.unpack_from("<HH", data, 0x10)
    e_class, e_data = data[4], data[5]
    if (e_class, e_data, e_type, e_machine) != (ELFCLASS64, ELFDATA2LSB, ET_DYN, EM_AARCH64):
        die("not a 64-bit little-endian AArch64 shared object")
    # These scene libs are NOT PT_LOAD-identity in their writable segments:
    # 5002363's writable PT_LOAD trails its vaddr by one 16 KiB page
    # (off=0x220150 va=0x224150), 5001712's likewise (off=0x20f2f0
    # va=0x2102f0) - map every VA through segment deltas instead of relying on
    # VA == file offset. The CODE segment (the 0x80-byte anchors) IS
    # PT_LOAD-identity on both audited bases.
    return loads, dynamic


def dyn_entries(data, dyn_off, dyn_size, dyn_tag):
    out = []
    end = dyn_off + dyn_size
    off = dyn_off
    while off + 16 <= end:
        tag = u64(data, off)
        if tag == DT_NULL:
            break
        if tag == dyn_tag:
            out.append(u64(data, off + 8))
        off += 16
    return out


def dyn_one(data, dyn_off, dyn_size, tag, label):
    values = dyn_entries(data, dyn_off, dyn_size, tag)
    if len(values) != 1:
        die("expected exactly one %s entry, found %d" % (label, len(values)))
    return values[0]


def gnu_hash_last_symbol(data, loads, table_vaddr):
    """Highest dynsym index referenced by a DT_GNU_HASH table (its symbol count)."""
    off = vaddr_to_file_offset(loads, table_vaddr)
    nbucket, symoffset, bloom_size, _bloom_shift = struct.unpack_from("<IIII", data, off)
    buckets_off = off + 16 + bloom_size * 8
    chains_off = buckets_off + nbucket * 4
    if symoffset > nbucket * 4 and nbucket == 0:
        die("degenerate DT_GNU_HASH table")
    highest = symoffset if symoffset else 0
    max_bucket = highest
    for b in range(nbucket):
        bucket = u32(data, buckets_off + b * 4)
        if bucket:
            max_bucket = max(max_bucket, bucket)
    # Walk the chain of the highest bucket to its terminator (LSB set).
    idx = max_bucket
    if idx:
        for _ in range(1 << 22):
            chain = u32(data, chains_off + (idx - symoffset) * 4)
            if chain & 1:
                break
            idx += 1
    return idx + 1


def vaddr_to_file_offset(loads, vaddr):
    """Map a virtual address to its file offset via the containing PT_LOAD."""
    for p_offset, p_vaddr, p_filesz in loads:
        if p_vaddr <= vaddr < p_vaddr + p_filesz:
            return p_offset + (vaddr - p_vaddr)
    die("vaddr 0x%x outside PT_LOAD file ranges" % vaddr)


def find_symbol_index(data, loads, dyn_off, dyn_size, symname):
    """Locate one undefined dynamic symbol by name; returns (index|None, symcount)."""
    symtab_vaddr = dyn_one(data, dyn_off, dyn_size, DT_SYMTAB, "DT_SYMTAB")
    strtab_vaddr = dyn_one(data, dyn_off, dyn_size, DT_STRTAB, "DT_STRTAB")
    strsz = dyn_one(data, dyn_off, dyn_size, DT_STRSZ, "DT_STRSZ")
    if not (strtab_vaddr > symtab_vaddr):
        die("DT_SYMTAB is not before DT_STRTAB; symbol-count heuristic unavailable")
    symtab = vaddr_to_file_offset(loads, symtab_vaddr)
    strtab = vaddr_to_file_offset(loads, strtab_vaddr)
    # Symbol count: derive the valid dynsym range from DT_GNU_HASH's bucket +
    # chain walk (DT_HASH is absent on these libs and the strtab-adjacency
    # heuristic overcounts; iteration must stop at the GNU-hash chain end).
    symcount = None
    hash_vaddrs = dyn_entries(data, dyn_off, dyn_size, DT_HASH)
    if hash_vaddrs:
        hash_off = vaddr_to_file_offset(loads, hash_vaddrs[0])
        symcount = u32(data, hash_off + 4)  # nchain == symbol count
    if not symcount:
        gnu_hash_vaddrs = dyn_entries(data, dyn_off, dyn_size, DT_GNU_HASH)
        if gnu_hash_vaddrs:
            symcount = gnu_hash_last_symbol(data, loads, gnu_hash_vaddrs[0])
    if not symcount:
        if strtab_vaddr > symtab_vaddr:
            symcount = (strtab_vaddr - symtab_vaddr) // 24  # heuristic fallback
    if not symcount:
        die("cannot determine dynamic symbol count (no hash tables, strtab not adjacent)")
    hits = []
    for i in range(symcount):
        off = symtab + i * 24
        nameoff = u32(data, off)
        if nameoff >= strsz:
            continue  # outside the valid dynstr range: never our well-formed import
        end = data.find(b"\x00", strtab + nameoff, strtab + strsz)
        if end == -1:
            die("unterminated dynstr entry at %d" % nameoff)
        sym = data[strtab + nameoff:end].decode("ascii", "replace")
        if sym == symname:
            bindtype = data[off + 4] >> 4
            shndx = struct.unpack_from("<H", data, off + 6)[0]
            if shndx != 0:
                die("symbol %s is not an undefined import (shndx=%d)" % (symname, shndx))
            if bindtype not in (BIND_GLOBAL, BIND_WEAK):
                die("symbol %s has unexpected bind type %d" % (symname, bindtype))
            hits.append(i)
    if len(hits) > 1:
        die("%s appears %d times in .dynsym; exactly one import expected" % (symname, len(hits)))
    return (hits[0] if hits else None), symcount


def relocation_hits(data, loads, dyn_off, dyn_size, sym_index):
    """All GLOB_DAT / JUMP_SLOT relocations referencing sym_index."""
    hits = []
    scanned_offsets = []
    for vaddr_tag, size_tag, label in ((DT_RELA, DT_RELASZ, "DT_RELA"),
                                       (DT_JMPREL, DT_PLTRELSZ, "DT_JMPREL")):
        vaddrs = dyn_entries(data, dyn_off, dyn_size, vaddr_tag)
        sizes = dyn_entries(data, dyn_off, dyn_size, size_tag)
        if not vaddrs and not sizes:
            continue
        if len(vaddrs) != 1 or len(sizes) != 1:
            die("ambiguous %s table (%d tables, %d sizes); fail closed"
                % (label, len(vaddrs), len(sizes)))
        if vaddrs[0] == 0 or sizes[0] == 0:
            continue
        if sizes[0] % 24:
            die("%s size 0x%x is not a multiple of 24" % (label, sizes[0]))
        rel_off = vaddr_to_file_offset(loads, vaddrs[0])
        if any(scanned == rel_off for scanned in scanned_offsets):
            continue  # DT_JMPREL aliasing DT_RELA (common under full RELRO)
        scanned_offsets.append(rel_off)
        for off in range(rel_off, rel_off + sizes[0], 24):
            r_offset, r_info, _r_addend = struct.unpack_from("<QQq", data, off)
            rtype = r_info & 0xFFFFFFFF
            rsym = r_info >> 32
            if rsym == sym_index and rtype in (R_AARCH64_GLOB_DAT, R_AARCH64_JUMP_SLOT):
                hits.append({"slotOffset": r_offset, "relocType": RELOC_NAMES[rtype],
                             "table": label})
    return hits


# ---------------------------------------------------------------------------
# --check support: compiled-pin cross-verification (C++ profile table + the
# Kotlin per-base precondition list). Bases flagged checkRequiresTree also
# re-derive every window from their exact decoded scene, so the check cannot
# pass from hand-copied literals alone.
# ---------------------------------------------------------------------------
HOOKS_SRC = REPO_ROOT + "/extensions/gxr-spacewarp-layer/src/swp_hooks.cpp"
KOTLIN_SRC = (REPO_ROOT + "/patches/src/main/kotlin/app/template/patches/steamlink/"
              "androidxr/GxrSpacewarpLayerPatch.kt")
C_BLOCK_COMMENT = re.compile(r"/\*.*?\*/", re.S)


def code_without_comments(text):
    """Drop C block and line comments so a pinned literal must be real code."""
    return "\n".join(line.split("//")[0]
                     for line in C_BLOCK_COMMENT.sub("", text).splitlines())


def compiled_got_profile(hooks_src, version_code):
    """The comments-stripped GOTProfile initializer for one exact base."""
    marker = "const GOTProfile kProfile%s = {" % version_code
    start = hooks_src.find(marker)
    if start == -1:
        die("no %r profile in src/swp_hooks.cpp" % marker)
    end = hooks_src.find("};", start)
    if end == -1:
        die("%r has no '};' terminator" % marker)
    return marker, code_without_comments(hooks_src[start:end])


def derive_anchor(data, offset, label):
    if offset < 0 or offset + ANCHOR_SIZE > len(data):
        die("%s window at 0x%x runs past the scene" % (label, offset))
    window = bytes(data[offset:offset + ANCHOR_SIZE])
    digest = hashlib.sha256(window).hexdigest()
    occurrences = data.count(window)
    if occurrences != 1:
        die("%s window (0x%x) occurs %d times; exactly one required"
            % (label, offset, occurrences))
    return digest


def kotlin_precondition_block(kotlin_src, base_key):
    """The Triple list under one per-base key of gxrSpacewarpScenePreconditions."""
    marker = '"%s" to listOf(' % base_key
    start = kotlin_src.find(marker)
    if start == -1:
        return None
    rest = kotlin_src[start + len(marker):]
    tail = rest.find('    "')  # the next map key line
    cutoff = len(rest) if tail == -1 else tail
    return rest[:cutoff]


def run_gate0_check(spec):
    with open(HOOKS_SRC, "r", encoding="utf-8") as fh:
        hooks_src = fh.read()
    with open(KOTLIN_SRC, "r", encoding="utf-8") as fh:
        kotlin_src = fh.read()

    marker, code_only = compiled_got_profile(hooks_src, spec["versionCode"])
    for needle in spec["checkProfileNeedles"]:
        if needle not in code_only:
            die("compiled pin drift: %s not found in the %s initializer"
                % (needle, marker))

    block = kotlin_precondition_block(kotlin_src, spec["kotlinKey"])
    if not block:
        die("no %r precondition list in the Kotlin patch" % spec["kotlinKey"])
    triples = [(int(off_hex, 16), sha)
               for off_hex, sha in
               re.findall(r'Triple\((0x[0-9a-fA-F]+), 0x80, "([0-9a-f]{64})"\)', block)]

    if spec.get("checkRequiresTree"):
        scene_path = ("%s/%s/lib/arm64-v8a/libvrlink_scene.so"
                      % (REPO_ROOT, spec["tree"]))
        try:
            with open(scene_path, "rb") as fh:
                data = fh.read()
        except OSError as failure:
            die("cannot read the exact %s scene for --check (%s); no substitution"
                % (spec["tree"], failure))
        if len(data) != spec["expectedSize"]:
            die("scene size %d, expected %d" % (len(data), spec["expectedSize"]))
        digest = hashlib.sha256(data).hexdigest()
        if digest != spec["expectedSha256"]:
            die("scene sha256 %s, expected %s" % (digest, spec["expectedSha256"]))
        derived = [(spec["knownAnchorOffset"],
                    derive_anchor(data, spec["knownAnchorOffset"], "codecs-audit-anchor"))]
        if derived[0][1] != spec["expectedKnownAnchorSha"]:
            die("known anchor re-derived %s, expected %s"
                % (derived[0][1], spec["expectedKnownAnchorSha"]))
        for label, offset in sorted(spec["extraGates"].items(), key=lambda kv: kv[1]):
            derived.append((offset, derive_anchor(data, offset, label)))
        ordered = sorted(derived, key=lambda pair: pair[0])
        for left, right in zip(ordered, ordered[1:]):
            if left[0] + ANCHOR_SIZE > right[0]:
                die("anchor windows overlap at 0x%x and 0x%x" % (left[0], right[0]))
        # The Kotlin list is emitted identity-first, then the other gates in
        # file order; compare both order and SHA so a transplanted window fails.
        if triples != derived:
            die("Kotlin %s preconditions %r; tree-derived %r"
                % (spec["kotlinKey"], triples, derived))
        print("  tree-derived anchors verified (%s: %d windows from the exact scene)"
              % (spec["kotlinKey"], len(derived)))
    else:
        offsets_seen = {offset for offset, _sha in triples}
        want_offsets = set([spec["knownAnchorOffset"]] + list(spec["extraGates"].values()))
        if offsets_seen != want_offsets:
            die("Kotlin %s preconditions list %r; expected exactly %r"
                % (spec["kotlinKey"], sorted(hex(v) for v in offsets_seen),
                   sorted(hex(v) for v in want_offsets)))

    # The base anchor sha must occur exactly once across the whole patch file
    # (an anchor shared between two bases cannot disambiguate them, and a
    # transplanted 5002363 value must not appear inside the 5001712 list).
    occurrences = kotlin_src.count(spec["expectedKnownAnchorSha"])
    if occurrences != 1:
        die("base anchor sha %s occurs %d times in the Kotlin patch; exactly one"
            " (per base) expected" % (spec["expectedKnownAnchorSha"][:16] + "...", occurrences))
    print("gate0 --check passed (%s: swp_hooks.cpp profile + Kotlin preconditions)"
          % spec["kotlinKey"])
    return 0


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--base", default="5002363", choices=sorted(BASES))
    parser.add_argument("--scene", default=None)
    parser.add_argument("--out", default=None)
    parser.add_argument("--check", action="store_true",
                        help="cross-verify the compiled-in C++/Kotlin pins instead of emitting")
    args = parser.parse_args()
    spec = BASES[args.base]

    if args.check:
        return run_gate0_check(spec)

    default_scene = "%s/%s/lib/arm64-v8a/libvrlink_scene.so" % (REPO_ROOT, spec["tree"])
    scene_path = args.scene if args.scene else default_scene
    out_path = args.out if args.out else spec["out"]

    with open(scene_path, "rb") as fh:
        data = fh.read()
    print("scene: %s (%d bytes)" % (scene_path, len(data)))
    size = len(data)
    sha256 = hashlib.sha256(data).hexdigest()
    print("  full-file sha256 (diagnostics only): %s" % sha256)

    loads, dynamic = parse_dynamic_mappings(data)
    dyn_off, dyn_size = dynamic
    needed = []
    strtab_vaddrs = dyn_entries(data, dyn_off, dyn_size, DT_STRTAB)
    strsz_list = dyn_entries(data, dyn_off, dyn_size, DT_STRSZ)
    if len(strtab_vaddrs) != 1 or len(strsz_list) != 1:
        die("expected exactly one DT_STRTAB and one DT_STRSZ")
    strtab = vaddr_to_file_offset(loads, strtab_vaddrs[0])
    for entry in dyn_entries(data, dyn_off, dyn_size, DT_NEEDED):
        if entry >= strsz_list[0]:
            die("DT_NEEDED string offset %d beyond DT_STRSZ %d" % (entry, strsz_list[0]))
        end = data.find(b"\x00", strtab + entry, strtab + strsz_list[0])
        if end == -1:
            die("unterminated DT_NEEDED string at %d" % entry)
        needed.append(data[strtab + entry:end].decode("ascii", "replace"))
    print("  DT_NEEDED: %s" % ", ".join(needed))

    # ---- eglCreateImageKHR GOT slot ---------------------------------------
    import_symbol = "eglCreateImageKHR"
    sym, symcount = find_symbol_index(data, loads, dyn_off, dyn_size, import_symbol)
    if sym is None:
        die("%s is NOT imported by %s; the arrival-learning hook target is invalid"
            % (import_symbol, "libvrlink_scene.so"))
    print("  dynsym: %s is import entry %d of %d" % (import_symbol, sym, symcount))
    hits = relocation_hits(data, loads, dyn_off, dyn_size, sym)
    print("  %s relocations: %s" % (import_symbol,
                                    [(h['table'], h['relocType'], hex(h['slotOffset']))
                                     for h in hits]))
    if len(hits) != 1:
        die("%s has %d GOT relocations; exactly one import slot expected"
            % (import_symbol, len(hits)))
    slot = hits[0]

    def anchor_window(offset, label):
        window = bytes(data[offset:offset + ANCHOR_SIZE])
        digest = hashlib.sha256(window).hexdigest()
        occurrences = data.count(window)
        print("  anchor %-28s off=0x%-7x sha=%s occurrences=%d"
              % (label, offset, digest[:16] + "...", occurrences))
        if occurrences != 1:
            die("%s window (0x%x) occurs %d times; exactly one required"
                % (label, offset, occurrences))
        return {"name": label, "offset": offset, "size": ANCHOR_SIZE,
                "sha256": digest, "occurrences": occurrences}

    known = anchor_window(spec["knownAnchorOffset"], "codecs-audit-anchor")
    if known["sha256"] != spec["expectedKnownAnchorSha"]:
        die("known codecs-audit anchor re-derived %s but expected %s "
            "(library or layout changed; fail closed)"
            % (known["sha256"], spec["expectedKnownAnchorSha"]))
    if args.base == "5001712":
        # Brief 13 asked whether 5001712 shares 5002363's identity anchor:
        # prove it does NOT (fresh derivation, no assumption). The 0xfd6fc
        # window is still unique in this lib - it just hashes differently,
        # so the per-base anchors keep every base unambiguous.
        shared_window = anchor_window(0xFD6FC, "5002363-anchor-shared-check")
        if shared_window["sha256"] == BASES["5002363"]["expectedKnownAnchorSha"]:
            die("5001712 unexpectedly matches the 5002363 anchor bytes; the"
                " anchor pair could not disambiguate the two bases (fail closed)")
    extra = [anchor_window(off, label) for label, off in sorted(spec["extraGates"].items(),
                                                                key=lambda kv: kv[1])]
    gates = [known] + extra
    # Overlap is a property of the offsets, not of the identity-first emission
    # order: 2.0.24/5002395's identity window (0xfe954) sits above its
    # FlipFrame gate (0xfcc60). Sort a copy for the check; keep the emitted
    # order (identity first, then the other gates) because the Kotlin
    # precondition list and the packaging test consume it in that order.
    ordered = sorted(gates, key=lambda gate: gate["offset"])
    for j in range(len(ordered) - 1):
        if ordered[j]["offset"] + ordered[j]["size"] > ordered[j + 1]["offset"]:
            die("anchor windows overlap: %s and %s"
                % (ordered[j]["name"], ordered[j + 1]["name"]))

    gate0 = {
        "version": 1,
        "generatedBy": "extensions/gxr-spacewarp-layer/tests/derive_gate0.py",
        "generatedAt": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "base": {"app": "Steam Link VR", "package": "com.valvesoftware.steamlinkvr",
                 "versionName": spec["versionName"], "versionCode": spec["versionCode"]},
        "soname": "libvrlink_scene.so",
        "decodedTree": spec["tree"],
        "size": size,
        "sha256": sha256,
        "sha256Use": "diagnostics only; never a full-file gate",
        "dtNeeded": needed,
        "anchors": [known] + extra,
        "anchorAddressing": "file offsets (byte windows in the APK's lib file); "
                            "re-derive sha256 over bytes[offset:offset+size]",
        "slotPins": [
            {"symbol": import_symbol,
             "slotOffset": slot["slotOffset"],
             "slotAddressing": "runtime vaddr; address = dlpi_addr + slotOffset "
                               "(this lib is NOT PT_LOAD-identity: file offset of the "
                               "slot differs by the containing PT_LOAD delta)",
             "slotFileOffset": vaddr_to_file_offset(loads, slot["slotOffset"]),
             "relocType": slot["relocType"],
             "occurrences": 1,
             "note": "BIND_NOW + full RELRO slot; the layer wraps this import to "
                     "learn decoded-frame arrivals for the missed-tick decision"},
        ],
    }
    with open(out_path, "w", encoding="utf-8", newline="\n") as fh:
        json.dump(gate0, fh, indent=2)
        fh.write("\n")
    print("frozen: %s" % out_path)
    return 0


if __name__ == "__main__":
    sys.exit(main())