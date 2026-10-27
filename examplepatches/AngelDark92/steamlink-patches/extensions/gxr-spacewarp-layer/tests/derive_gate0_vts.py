#!/usr/bin/env python
# Derive the Gate-0 VTS appendix for the gxr-spacewarp layer's bridge consumer
# (brief 10-W2A-LAYER-WIRING: carrier 0x48 read via a direct call to the
# ValueTransportSystem read API + the SVLRoot* one-shot PLT capture).
#
# Per-base (brief 13-PORT-5001712-C1): each base derives its OWN VTS pins; the
# bases differ in MORE than addresses:
#   - 2.0.23/5002363: the read API is ValueTransportSystem::BGetRemoteValue
#     (bool in w0; true only when the id holder exists AND the FULL requested
#     size was copied), VTS slot ring inlined at SVLRoot+0x1aa0, mutex at
#     VTS+0x1a78.
#   - 2.0.20/5001712: there is NO BGetRemoteValue in this dynsym; the read API
#     is ValueTransportSystem::GetRemoteValue (RETURNS THE COPIED BYTE COUNT
#     in w0 - 0xffffffff when the id's holder is absent; the caller must treat
#     copied == requested as "present"), slots behind a pointer at VTS+0x100
#     (16-byte stride), mutex at VTS+0xd8. The derivation proves these ABI
#     differences from the disassembly-derived constants below - never assumed.
#     5002363's derivation (and its frozen output) is unchanged; never
#     overwrite a frozen 5002363 output.
#
# Stdlib only (the derive_gate0.py style, reusing that script's ELF helpers).
# Fails loudly (nonzero exit) on any ambiguity; never freezes a pin it could
# not verify. Emits gxr_spacewarp_vts_<base>.json (the Gate-0 appendix; the
# parent stages it beside the per-base gate0 JSON and the Kotlin parity test
# gains it in the packaging wave).
#
# Pins verified here (per base, "the same standard"):
#   - the read API: one DEFINED dynsym at the pinned VA, one unique 0x80-byte
#     code anchor, exactly one JUMP_SLOT (on 5002363 the client's call sites
#     route through the PLT into it; on 5001712 the single JUMP_SLOT still
#     exists and is verified - the embed proof is independent of it),
#   - the VTS embed offset proven from the real call-site add+bl pairs
#     (5002363: the two receipt-06 sites, each pair unique; 5001712: a per-base
#     census + frozen canonical pairs - 22 of the 43 bl sites into
#     ValueTransportSystem functions feed x0 = SVLRoot + 0xa08),
#   - the carrier id 0x48 unused by the client's value transport: the raw
#     `movz w1, #0x48` encodings in .text are enumerated and each must sit
#     inside a NON-ValueTransportSystem function; the id must also fit the
#     per-base RX record space (5002363: the RXMessageInternal 1..0x73 guard;
#     5001712: a single-byte record id, 0..255, auto-instantiated into the
#     this+0x100 slot arrays),
#   - the two one-shot capture slots (SVLRoot methods PLT-called by the lib's
#     own code): SVLRoot::ParsePeerValueSettings and SVLRoot::RXUnreliableStream
#     - each: one DEFINED dynsym at the pinned VA, one unique 0x80 prologue
#     anchor, exactly one JUMP_SLOT at the pinned runtime vaddr,
#   - BTI: the lib must carry NO valid GNU_PROPERTY_AARCH64_FEATURE_1_AND
#     record with the BTI bit set (the wrappers + the direct read call need an
#     unmarked lib; a valid BTI note fails closed).
#
# Usage:  python -B derive_gate0_vts.py [--base 5002363|5001712]
#                 [--scene <lib>] [--out <json>] [--check]
# --check cross-verifies the compiled-in pins of src/swp_hooks.cpp +
# src/swp_vts.cpp (per-base profile tables) against this derivation instead of
# emitting the JSON.
# Exit codes: 0 = frozen/checked, 1 = derivation error (ambiguous/missing).
import argparse
import hashlib
import json
import struct
import sys
from datetime import datetime, timezone

import derive_gate0 as g0  # same dir: ELF helpers, die(), u32/u64, constants

# Frozen expectations (receipt evidence; re-derived + asserted below, not
# trusted). 5002363 keeps its exact original values; 5001712's are fresh
# per-base derivations from android-steamlinkvr-release-base-2.0.20-5001712.
EXPECTED = {
    "5002363": {
        "versionName": "2.0.23",
        "versionCode": 5002363,
        "tree": "android-steamlinkvr-release-base-2.0.23-5002363",
        # .text dynsym shndx (derived below per base; 14 on 5002363, 15 on 5001712).
        "textShndx": 14,
        "bGetRemoteValue": {
            "label": "ValueTransportSystem::BGetRemoteValue",
            "mangled": "_ZN20ValueTransportSystem15BGetRemoteValueE16ValueTransportIDPvj",
            "va": 0x179EE0,
            "size": 164,
        },
        "capture": [
            {"mangled": "_ZN7SVLRoot22ParsePeerValueSettingsEPK16TransportValue_ti",
             "va": 0x16C60C, "size": 740, "slotRuntimeVaddr": 0x22F378,
             "capturedAbi": "x0 = the SVLRoot*; both functions return void with a single"
                            " ret path, so the wrappers capture x0 and forward verbatim"},
            {"mangled": "_ZN7SVLRoot18RXUnreliableStreamEP7datasetP11SVLDataLinkm",
             "va": 0x16C4AC, "size": 352, "slotRuntimeVaddr": 0x22F2E0,
             "capturedAbi": "x0 = the SVLRoot*; both functions return void with a single"
                            " ret path, so the wrappers capture x0 and forward verbatim"},
        ],
        # VTS embed offset verified at the two real BGetRemoteValue call sites
        # (receipts/06-bridge evidence-client-disasm-keyfuncs.txt). AArch64
        # encoding of `add x0, x20, #0xa08`:
        #   0x91000000 | (0xa08 << 10) | (20 << 5) | 0
        "embedSites": [0xFC0C8, 0xFC32C],
        "embedAddEncoding": 0x91282280,
        "embedCallSites": [0xFC0D4, 0xFC330],
        "embedCallPltStub": 0x219CD0,
        # movz w1, #0x48 (hw forms 0..3); the hw0 form must occur exactly twice,
        # both outside the ValueTransportSystem functions.
        "carrierId": 0x48,
        "carrierMovzEncodings": (0x52800901, 0x52A00901, 0x52C00901, 0x52E00901),
        "rxIdGuard": "1..0x73 (RXMessageInternal allocates unknown ids inside this"
                     " window; the host VrlinkTap publishes the carrier here)",
        "rxIdGuardMax": 0x73,
    },
    "5001712": {
        "versionName": "2.0.20",
        "versionCode": 5001712,
        "tree": "android-steamlinkvr-release-base-2.0.20-5001712",
        "textShndx": 15,
        # The renamed 2.0.20 read API (no BGetRemoteValue exists in this dynsym;
        # the ABI change is derived from the function's own code, see
        # readReturnSemantics in the emitted appendix).
        "bGetRemoteValue": {
            "label": "ValueTransportSystem::GetRemoteValue",
            "mangled": "_ZN20ValueTransportSystem14GetRemoteValueE16ValueTransportIDPvj",
            "va": 0x16A2C4,
            "size": 136,
        },
        "capture": [
            {"mangled": "_ZN7SVLRoot22ParsePeerValueSettingsEPK16TransportValue_ti",
             "va": 0x164B8C, "size": 732, "slotRuntimeVaddr": 0x21B298,
             "capturedAbi": "x0 = the SVLRoot*; this base's mangled name is"
                            " _ZN7SVLRoot22ParsePeerValueSettingsEPK16TransportValue_ti"
                            " (same shape as 5002363); the function returns void with a"
                            " single ret path (0x164b8c..0x164e78, exactly one ret), so"
                            " the wrapper captures x0 and forwards verbatim"},
            {"mangled": "_ZN7SVLRoot18RXUnreliableStreamEP7datasetP11SVLDataLink",
             "va": 0x164A44, "size": 328, "slotRuntimeVaddr": 0x21B1E0,
             "capturedAbi": "x0 = the SVLRoot*; NOTE the per-base signature: this base's"
                            " method is (dataset*, SVLDataLink*) - 3 args, NO trailing"
                            " unsigned m (5002363 has 4). The shared 4-arg wrapper"
                            " forwards the unused 4th register arg as-is; the AArch64"
                            " register ABI makes this safe (the callee never reads x3),"
                            " and the original returns void with exactly one ret path"
                            " (0x164a44..0x164b8c)"},
        ],
        # VTS embed offset: derived from the real call-site add+bl pairs (a
        # per-base census runs below; 22 of the 43 bl sites into
        # ValueTransportSystem functions feed x0 = SVLRoot + 0xa08 via
        # `add x0, x19, #0xa08`). The frozen canonical pairs (add site, bl
        # site, add encoding, callee's PLT stub, callee's JUMP_SLOT slot): the
        # first two are READ-path GetRemoteValue sites, the third is the lib's
        # own RX ingest (SVLRoot::RXUnreliableStream -> VTS::RXMessage) - the
        # structural proof that the VTS object lives at SVLRoot + 0xa08 on
        # this base too. The adds take +0xa08 from whichever register held
        # the SVLRoot* (x20 at 0xfbf74, x8 at 0x10c544, x19 at 0x164aac).
        "embedProofPairs": [
            (0xFBF74, 0xFBF78, 0x91282280, 0x2093C0, 0x21B260),  # add x0, x20, #0xa08
            (0x10C544, 0x10C548, 0x91282100, 0x2093C0, 0x21B260),  # add x0, x8, #0xa08
            (0x164AAC, 0x164AB8, 0x91282260, 0x209440, 0x21B2A0),  # add x0, x19, #0xa08
        ],
        # The full census over every bl site reaching a defined/plt-routed
        # ValueTransportSystem function with a nearest add x0 immediate feed
        # (immediate -> count); re-derived below and frozen exactly.
        "embedCensus": {0xA08: 22, 0x770: 1, 0xF33: 1},
        "carrierId": 0x48,
        "carrierMovzEncodings": (0x52800901, 0x52A00901, 0x52C00901, 0x52E00901),
        # The RX record codec on this base carries the value id as ONE BYTE
        # (ldrb w22, [x23, #1] @0x16a89c; encoding 0x394006f6) with no
        # 0x73-style bound; the holder auto-instantiates (operator new 0x40
        # @0x16a7f8 / bl @0x16a800; slot install into [this+0x100] at id*16
        # @0x16a8ac; encoding 0x8b161376).
        "rxRecord": {
            "symbol": "_ZN20ValueTransportSystem9RXMessageEPhj",
            "va": 0x16A620,
            "idSpace": "single-byte record id (0..255); no 0x73-style bound",
            "idLoadSite": 0x16A89C,
            "idLoadEncoding": 0x394006F6,
            "slotIndexSite": 0x16A8AC,
            "slotIndexEncoding": 0x8B161376,
            "carrierIdBound": 255,  # u8 record id space
        },
    },
    # 2.0.24/5002395 (sixth base, 2026-10-26): verify-only entry. The appendix
    # emit below still encodes the two originally derived call shapes (the
    # 2-site 2363 proof and the 22-site 1712 census), so this base's frozen
    # appendix is the same hand-assembled shape the restored 1812/1968/2244
    # bases use. The compiled C++ pins are still cross-checked with --check.
    "5002395": {
        "versionName": "2.0.24",
        "versionCode": 5002395,
        "tree": "android-steamlinkvr-release-base-2.0.24-5002395",
        "appendixEmit": False,
        # Tree-derived verification used by --check (the appendix emitter is not
        # generalized to this call shape). These are re-derived, not trusted.
        "verify": {
            "size": 2301432,
            "sha256": "5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b",
            "textShndx": 14,
            "anchor": {
                "offset": 0xFE954,
                "sha256": "ef7f310bbd65499404aa89a18f873c42a87282a16799b84119c75377654003a3",
            },
            "read": {
                "mangled": "_ZN20ValueTransportSystem15BGetRemoteValueE16ValueTransportIDPvj",
                "va": 0x17BA50,
                "size": 164,
                "anchorSha256":
                    "9701b8dffa8277fb88f2fe7989bf7caa96b922c33b8f73ce356b950e6b6c9dc9",
                "slotRuntimeVaddr": 0x2317C8,
            },
            "capture": [
                {"mangled": "_ZN7SVLRoot22ParsePeerValueSettingsEPK16TransportValue_ti",
                 "va": 0x16DD4C, "size": 740,
                 "anchorSha256":
                     "5923592d8f8675634571537abf2a04f2a5d513a57efc0981e91d62f068a924e2",
                 "slotRuntimeVaddr": 0x231800},
                {"mangled": "_ZN7SVLRoot18RXUnreliableStreamEP7datasetP11SVLDataLinkm",
                 "va": 0x16DBEC, "size": 352,
                 "anchorSha256":
                     "2808819d4d269ecae43aca1c731e85e8bae64125d05e0853e1f348c717853463",
                 "slotRuntimeVaddr": 0x231760},
            ],
            "eglSlotRuntimeVaddr": 0x232170,
            "embedImmediate": 0xA08,
            "embedSiteCount": 11,
        },
    },
}

R_AARCH64_JUMP_SLOT = 1026
SHT_PROGBITS = 1
SHT_RELA = 4
SHT_REL = 9
GNU_PROPERTY_NOTE_TYPE = 5
GNU_PROPERTY_AARCH64_FEATURE_1_AND = 0xC0008000
GNU_PROPERTY_AARCH64_FEATURE_1_BTI = 1


def section_headers(data):
    e_shoff, = struct.unpack_from("<Q", data, 0x28)
    e_shentsize, e_shnum, e_shstrndx = struct.unpack_from("<HHH", data, 0x3A)
    def sh(i):
        base = e_shoff + i * e_shentsize
        nameoff, sh_type, _flags, addr, offset, size = struct.unpack_from("<IIQQQQ", data, base)
        return {"nameoff": nameoff, "type": sh_type, "addr": addr, "offset": offset,
                "size": size}
    strtab_hdr = sh(e_shstrndx)
    def name_of(hdr):
        lo = strtab_hdr["offset"] + hdr["nameoff"]
        end = data.find(b"\x00", lo)
        if end == -1:
            g0.die("unterminated section-header string table")
        return data[lo:end].decode("ascii", "replace")
    out = []
    for i in range(e_shnum):
        hdr = sh(i)
        hdr["name"] = name_of(hdr)
        out.append(hdr)
    return out


def section_or_die(sections, name, types=(SHT_PROGBITS,)):
    section = next((s for s in sections if s["name"] == name), None)
    if section is None or section["type"] not in types:
        g0.die("no usable %s section; the derivation cannot proceed" % name)
    return section


def text_shndx_of(sections, text_section):
    return next((i for i, s in enumerate(sections) if s["offset"] == text_section["offset"]
                 and s["addr"] == text_section["addr"]), None)


def symcount_of(data, loads, dyn_off, dyn_size):
    symcount = None
    hash_vaddrs = g0.dyn_entries(data, dyn_off, dyn_size, g0.DT_HASH)
    if hash_vaddrs:
        symcount = g0.u32(data, g0.vaddr_to_file_offset(loads, hash_vaddrs[0]) + 4)
    if not symcount:
        gnu_hash_vaddrs = g0.dyn_entries(data, dyn_off, dyn_size, g0.DT_GNU_HASH)
        if gnu_hash_vaddrs:
            symcount = g0.gnu_hash_last_symbol(data, loads, gnu_hash_vaddrs[0])
    if not symcount:
        g0.die("cannot bound .dynsym (no hash tables)")
    return symcount


def dyn_tables(data, loads, dyn_off, dyn_size, text_shndx):
    """(all dynsym name map, defined .text symbols as (lo, hi, name))."""
    symtab_vaddr = g0.dyn_one(data, dyn_off, dyn_size, g0.DT_SYMTAB, "DT_SYMTAB")
    strtab_vaddr = g0.dyn_one(data, dyn_off, dyn_size, g0.DT_STRTAB, "DT_STRTAB")
    strsz = g0.dyn_one(data, dyn_off, dyn_size, g0.DT_STRSZ, "DT_STRSZ")
    if not (strtab_vaddr > symtab_vaddr):
        g0.die("DT_SYMTAB is not before DT_STRTAB")
    symtab = g0.vaddr_to_file_offset(loads, symtab_vaddr)
    strtab = g0.vaddr_to_file_offset(loads, strtab_vaddr)
    symcount = symcount_of(data, loads, dyn_off, dyn_size)
    names, defined = {}, []
    for i in range(symcount):
        off = symtab + i * 24
        nameoff = g0.u32(data, off)
        if nameoff >= strsz:
            continue
        end = data.find(b"\x00", strtab + nameoff, strtab + strsz)
        if end == -1:
            g0.die("unterminated dynstr entry at %d" % nameoff)
        sym = data[strtab + nameoff:end].decode("ascii", "replace")
        names[i] = sym
        shndx = struct.unpack_from("<H", data, off + 6)[0]
        st_value = g0.u64(data, off + 8)
        st_size = g0.u64(data, off + 16)
        if shndx == text_shndx and st_value and st_size:
            defined.append((st_value, st_value + st_size, sym))
    return names, defined


def find_defined_symbol(data, loads, dyn_off, dyn_size, symname, expect_shndx,
                        names=None):
    """One DEFINED dynamic symbol by mangled name; returns (index, st_value, st_size)."""
    if names is None:
        names, _defined = dyn_tables(data, loads, dyn_off, dyn_size, expect_shndx)
    symtab_vaddr = g0.dyn_one(data, dyn_off, dyn_size, g0.DT_SYMTAB, "DT_SYMTAB")
    symtab = g0.vaddr_to_file_offset(loads, symtab_vaddr)
    hits = []
    for i in sorted(names):
        off = symtab + i * 24
        if names[i] != symname:
            continue
        shndx = struct.unpack_from("<H", data, off + 6)[0]
        st_value = g0.u64(data, off + 8)
        st_size = g0.u64(data, off + 16)
        if shndx == 0:
            continue  # an undefined import with the same name is not what we pin
        hits.append((i, st_value, st_size, shndx))
    if len(hits) != 1:
        g0.die("%s appears %d times as a DEFINED dynsym; exactly one expected"
               % (symname, len(hits)))
    index, st_value, st_size, shndx = hits[0]
    if expect_shndx and shndx != expect_shndx:
        g0.die("%s lives in shndx %d, expected %d (.text)" % (symname, shndx, expect_shndx))
    return index, st_value, st_size


def jump_slots_for(data, loads, dyn_off, dyn_size, sym_index):
    hits, glob_dat = [], 0
    for vaddr_tag, size_tag, label in ((g0.DT_RELA, g0.DT_RELASZ, "DT_RELA"),
                                       (g0.DT_JMPREL, g0.DT_PLTRELSZ, "DT_JMPREL")):
        vaddrs = g0.dyn_entries(data, dyn_off, dyn_size, vaddr_tag)
        sizes = g0.dyn_entries(data, dyn_off, dyn_size, size_tag)
        if not vaddrs and not sizes:
            continue
        if len(vaddrs) != 1 or len(sizes) != 1:
            g0.die("ambiguous %s table" % label)
        if vaddrs[0] == 0 or sizes[0] == 0:
            continue
        rel_off = g0.vaddr_to_file_offset(loads, vaddrs[0])
        for off in range(rel_off, rel_off + sizes[0], 24):
            r_offset, r_info, _addend = struct.unpack_from("<QQq", data, off)
            rtype = r_info & 0xFFFFFFFF
            if r_info >> 32 != sym_index:
                continue
            if rtype == R_AARCH64_JUMP_SLOT:
                hits.append({"table": label, "slotRuntimeVaddr": r_offset})
            elif rtype == g0.R_AARCH64_GLOB_DAT:
                glob_dat += 1
    return hits, glob_dat


def anchor_window(data, offset, label):
    window = bytes(data[offset:offset + 0x80])
    digest = hashlib.sha256(window).hexdigest()
    occurrences = data.count(window)
    print("  anchor %-46s off=0x%-7x sha=%s occurrences=%d"
          % (label[:46], offset, digest[:16] + "...", occurrences))
    if occurrences != 1:
        g0.die("%s window (0x%x) occurs %d times; exactly one required"
               % (label, offset, occurrences))
    return {"name": label, "offset": offset, "size": 0x80, "sha256": digest,
            "occurrences": occurrences}


def word_at(data, loads, vaddr, label, expected):
    off = g0.vaddr_to_file_offset(loads, vaddr)
    word = g0.u32(data, off)
    if word != expected:
        g0.die("instruction word at 0x%x (%s) is 0x%08x, expected 0x%08x"
               % (vaddr, label, word, expected))


def is_add_imm_x0(w):
    """ADD (immediate), 64-bit, no shift: sf=1, op=0, S=0, opcode 100010, shift=0."""
    return (w >> 22) == 0b1001000100 and (w & 0x1F) == 0


def plt_stub_map(data, sections, names):
    """stub va -> (jump-slot runtime vaddr, dynsym index, dynsym name)."""
    plt = section_or_die(sections, ".plt")
    if (plt["size"] - 32) % 16:
        g0.die(".plt layout is not header(32) + 16-byte entries")
    relplt = section_or_die(sections, ".rela.plt", (SHT_RELA, SHT_REL))
    out = {}
    for k in range(relplt["size"] // 24):
        off = relplt["offset"] + k * 24
        r_offset, r_info, _addend = struct.unpack_from("<QQq", data, off)
        stub_va = plt["addr"] + 32 + k * 16
        out[stub_va] = (r_offset, r_info >> 32, names.get(r_info >> 32, "?"))
    return out


def bti_enforcement_check(data):
    """Fail closed on a VALID GNU-property BTI record; record the state."""
    e_phoff, = struct.unpack_from("<Q", data, 0x20)
    e_phentsize, e_phnum = struct.unpack_from("<HH", data, 0x36)
    for i in range(e_phnum):
        base = e_phoff + i * e_phentsize
        p_type, _flags = struct.unpack_from("<II", data, base)
        if p_type != 0x6474E550:  # PT_GNU_PROPERTY
            continue
        p_offset, _vaddr, _paddr, p_filesz = struct.unpack_from("<QQQQ", data, base + 8)
        namesz, descsz, ntype = struct.unpack_from("<III", data, p_offset)
        region = data[p_offset:p_offset + p_filesz]
        if not (namesz == 4 and ntype == GNU_PROPERTY_NOTE_TYPE
                and region[8:12] == b"GNU\x00"):
            print("  BTI: PT_GNU_PROPERTY present but its region is not a GNU"
                  " properties note (namesz=%d type=%d); no BTI record found -"
                  " no landing-pad requirement [derived]" % (namesz, ntype))
            return
        desc_off = p_offset + 12 + ((namesz + 3) // 4) * 4
        desc = data[desc_off:desc_off + min(descsz, 0x100)]
        jc = 0
        found_bti = False
        while jc + 8 <= len(desc):
            pr_type, pr_datasz = struct.unpack_from("<II", desc, jc)
            if pr_type == GNU_PROPERTY_AARCH64_FEATURE_1_AND and jc + 8 + pr_datasz <= len(desc):
                val = struct.unpack_from("<I", desc, jc + 8)[0]
                if val & GNU_PROPERTY_AARCH64_FEATURE_1_BTI:
                    found_bti = True
            jc += (pr_datasz + 7) // 8 * 8 + 8
        if found_bti:
            g0.die("the scene lib enforces BTI; the spacewarp layer's direct read"
                   " call + GOT wrappers need a re-derived landing-pad strategy"
                   " BEFORE this base ships (fail closed)")
        print("  BTI: valid GNU properties note, no AArch64 BTI feature record"
              " [derived]")
        return
    print("  BTI: no PT_GNU_PROPERTY segment (unmarked, like 5002363) [derived]")


# ---------------------------------------------------------------------------
# --check support: compiled-pin cross-verification (the per-base C++ profile
# tables). Needles = the exact literals the profiles hold.
# ---------------------------------------------------------------------------
CHECK_PINS = {
    "5002363": {
        "profileName": "kVtsProfile5002363",
        "vts": [
            ("0xfd6fc", "base anchor offset"),
            ("f5c43c6aacb69e61c3f929f361612e1b91bb509803d2c14824b9601b3dd8c795",
             "base anchor sha"),
            ("0x179ee0", "read API va"),
            ("0cd07a66d3af4994fad023fe60fa0b58df47f7c5bbb56fe4b77fbe6b409f9536",
             "read API anchor sha"),
            ("0x16c60c", "ParsePeerValueSettings va"),
            ("64e1e4568700c13a8b5c25a5582342146cc220340387434ece7bc80a726c7c03",
             "ParsePeerValueSettings anchor sha"),
            ("0x22f378", "ParsePeerValueSettings slot"),
            ("0x16c4ac", "RXUnreliableStream va"),
            ("f3e3ff1f08170dd8bfd01ac7e93dddf7758ffc9036a9a9e9da0f26ca6334175f",
             "RXUnreliableStream anchor sha"),
            ("0x22f2e0", "RXUnreliableStream slot"),
            ("0xa08", "VTS embed offset"),
        ],
        "hooks": [
            ("0x22fcc8", "eglCreateImageKHR slot"),
            ("f5c43c6aacb69e61c3f929f361612e1b91bb509803d2c14824b9601b3dd8c795",
             "base anchor sha"),
        ],
    },
    "5001712": {
        "profileName": "kVtsProfile5001712",
        "vts": [
            ("0xfd304", "base anchor offset"),
            ("6e5dcb4f5094763e948388ca35c6132af242159fc3c22e812f0fe2f4ab4f2649",
             "base anchor sha"),
            ("0x16a2c4", "read API va"),
            ("b5b407c66d1cbe593f161a816ecc7074375627f8ce0b533f83c9a90d54bffbf8",
             "read API anchor sha"),
            ("0x164b8c", "ParsePeerValueSettings va"),
            ("cb57aa43cab2f8047490fe0d0ae37fad53273c40e54e0a0a3aed0f8940355150",
             "ParsePeerValueSettings anchor sha"),
            ("0x21b298", "ParsePeerValueSettings slot"),
            ("0x164a44", "RXUnreliableStream va"),
            ("d16e10075b262462aaa29dfcd40a81bcb14070863efd794d5253b7f2c1364f9a",
             "RXUnreliableStream anchor sha"),
            ("0x21b1e0", "RXUnreliableStream slot"),
            ("0xa08", "VTS embed offset"),
        ],
        "hooks": [
            ("0x21bb88", "eglCreateImageKHR slot"),
            ("6e5dcb4f5094763e948388ca35c6132af242159fc3c22e812f0fe2f4ab4f2649",
             "base anchor sha"),
        ],
    },
    "5002395": {
        "profileName": "kVtsProfile5002395",
        "vts": [
            ("0xfe954", "base anchor offset"),
            ("ef7f310bbd65499404aa89a18f873c42a87282a16799b84119c75377654003a3",
             "base anchor sha"),
            ("0x17ba50", "read API va"),
            ("9701b8dffa8277fb88f2fe7989bf7caa96b922c33b8f73ce356b950e6b6c9dc9",
             "read API anchor sha"),
            ("0x16dd4c", "ParsePeerValueSettings va"),
            ("5923592d8f8675634571537abf2a04f2a5d513a57efc0981e91d62f068a924e2",
             "ParsePeerValueSettings anchor sha"),
            ("0x231800", "ParsePeerValueSettings slot"),
            ("0x16dbec", "RXUnreliableStream va"),
            ("2808819d4d269ecae43aca1c731e85e8bae64125d05e0853e1f348c717853463",
             "RXUnreliableStream anchor sha"),
            ("0x231760", "RXUnreliableStream slot"),
            ("0xa08", "VTS embed offset"),
        ],
        "hooks": [
            ("0x232170", "eglCreateImageKHR slot"),
            ("ef7f310bbd65499404aa89a18f873c42a87282a16799b84119c75377654003a3",
             "base anchor sha"),
        ],
    },
}


def profile_block(src, marker):
    start = src.find(marker)
    if start == -1:
        return None
    brace = src.find("};", start)
    if brace == -1:
        g0.die("profile %s has no '};' terminator" % marker)
    return src[start:brace]


def run_vts_check(spec_key):
    repo_root = g0.REPO_ROOT
    with open("%s/extensions/gxr-spacewarp-layer/src/swp_vts.cpp" % repo_root,
              "r", encoding="utf-8") as fh:
        vts_src = fh.read()
    with open("%s/extensions/gxr-spacewarp-layer/src/swp_hooks.cpp" % repo_root,
              "r", encoding="utf-8") as fh:
        hooks_src = fh.read()
    pins = CHECK_PINS[spec_key]
    block = profile_block(vts_src, pins["profileName"])
    if block is None:
        g0.die("no %s profile block in src/swp_vts.cpp" % pins["profileName"])
    # Strip comments so a pinned literal must appear as the actual initializer
    # value, not in the record's prose.
    code_only = g0.code_without_comments(block)
    for needle, label in pins["vts"]:
        if needle not in code_only:
            g0.die("C++ pin drift: %s (%s) not found in the %s profile initializer"
                   % (needle, label, pins["profileName"]))
    _, hooks_code = g0.compiled_got_profile(hooks_src, EXPECTED[spec_key]["versionCode"])
    for needle, label in pins["hooks"]:
        if needle not in hooks_code:
            g0.die("C++ pin drift: %s (%s) not found in the kProfile%s initializer"
                   % (needle, label, EXPECTED[spec_key]["versionCode"]))
    expected = EXPECTED[spec_key]
    if "verify" in expected:
        verify_tree_pins(spec_key)
    print("C++ pin cross-check passed (swp_hooks.cpp + swp_vts.cpp, %s)" % spec_key)
    return 0


def count_embed_sites(data, text, stub_vas, immediate):
    """Real `add x0, xN, #imm` + `bl <read-API PLT stub>` pairs in .text."""
    count = 0
    lo, hi, va = text["offset"], text["offset"] + text["size"], text["addr"]
    for off in range(lo, hi - 4, 4):
        word = g0.u32(data, off)
        if not is_add_imm_x0(word):
            continue
        if ((word >> 5) & 0x1F) == 31:
            continue  # add x0, sp, #imm is not an object pointer feed
        if ((word >> 10) & 0xFFF) != immediate:
            continue
        nxt = g0.u32(data, off + 4)
        if (nxt & 0xFC000000) != 0x94000000:
            continue
        delta = nxt & 0x03FFFFFF
        if delta & 0x02000000:
            delta |= ~0x03FFFFFF
        pc = va + (off - lo)
        # off is the add; the BL is one word later, so PC+4 is the BL address.
        if pc + 4 + delta * 4 in stub_vas:
            count += 1
    return count


def verify_tree_pins(spec_key):
    """Re-derive every CHECK_PINS value from the exact decoded scene tree."""
    entry = EXPECTED[spec_key]
    spec = entry["verify"]
    pins = CHECK_PINS[spec_key]
    scene_path = ("%s/%s/lib/arm64-v8a/libvrlink_scene.so"
                  % (g0.REPO_ROOT, entry["tree"]))
    try:
        with open(scene_path, "rb") as fh:
            data = fh.read()
    except OSError as failure:
        g0.die("cannot read the exact %s scene for --check (%s); no substitution"
               % (entry["tree"], failure))
    if len(data) != spec["size"]:
        g0.die("scene size %d, expected %d" % (len(data), spec["size"]))
    digest = hashlib.sha256(data).hexdigest()
    if digest != spec["sha256"]:
        g0.die("scene sha256 %s, expected %s" % (digest, spec["sha256"]))
    loads, dyn = g0.parse_dynamic_mappings(data)
    dyn_off, dyn_size = dyn
    sections = section_headers(data)
    text = section_or_die(sections, ".text")
    text_shndx = text_shndx_of(sections, text)
    if text_shndx != spec["textShndx"]:
        g0.die("expected .text dynsym shndx %d, derived %d"
               % (spec["textShndx"], text_shndx))
    names, _defined = dyn_tables(data, loads, dyn_off, dyn_size, text_shndx)
    bti_enforcement_check(data)

    def require_pin(needles, value, label):
        """The tree-derived value must be one of the compiled CHECK_PINS needles."""
        allowed = {needle.lower() for needle, _pin_label in needles}
        if value.lower() not in allowed:
            g0.die("tree-derived %s (%s) is not a compiled CHECK_PINS literal"
                   % (label, value))

    def check_defined(label, item, anchors, slot_is_profile_field=True):
        index, st_value, st_size = find_defined_symbol(
            data, loads, dyn_off, dyn_size, item["mangled"], text_shndx, names)
        if st_value != item["va"] or st_size != item["size"]:
            g0.die("%s re-derived at 0x%x (%d bytes), expected 0x%x (%d bytes)"
                   % (label, st_value, st_size, item["va"], item["size"]))
        anchor = anchor_window(data, st_value, label)
        if anchor["sha256"] != item["anchorSha256"]:
            g0.die("%s anchor sha %s, expected %s"
                   % (label, anchor["sha256"], item["anchorSha256"]))
        slots, _glob = jump_slots_for(data, loads, dyn_off, dyn_size, index)
        if len(slots) != 1:
            g0.die("%s must have exactly one JUMP_SLOT; found %r" % (label, slots))
        if slots[0]["slotRuntimeVaddr"] != item["slotRuntimeVaddr"]:
            g0.die("%s slot 0x%x, expected 0x%x"
                   % (label, slots[0]["slotRuntimeVaddr"], item["slotRuntimeVaddr"]))
        require_pin(anchors, hex(st_value), label + " va")
        require_pin(anchors, anchor["sha256"], label + " anchor")
        if slot_is_profile_field:
            # Capture slots are VtsProfile fields; the read API is called
            # directly, so its JUMP_SLOT is verified against the tree only.
            require_pin(anchors, hex(slots[0]["slotRuntimeVaddr"]), label + " slot")
        return index

    identity = spec["anchor"]
    identity_sha = g0.derive_anchor(data, identity["offset"], "identity anchor")
    if identity_sha != identity["sha256"]:
        g0.die("identity anchor re-derived %s, expected %s"
               % (identity_sha, identity["sha256"]))
    require_pin(pins["vts"], hex(identity["offset"]), "identity anchor offset")
    require_pin(pins["vts"], identity_sha, "identity anchor sha")
    require_pin(pins["hooks"], identity_sha, "identity anchor sha (hooks)")

    read_index = check_defined("ValueTransportSystem read API", spec["read"],
                               pins["vts"], slot_is_profile_field=False)
    for item in spec["capture"]:
        check_defined(item["mangled"].split("E")[0][-24:], item, pins["vts"])

    egl_index, _ = g0.find_symbol_index(data, loads, dyn_off, dyn_size,
                                        "eglCreateImageKHR")
    if egl_index is None:
        g0.die("eglCreateImageKHR is not imported")
    egl_hits = g0.relocation_hits(data, loads, dyn_off, dyn_size, egl_index)
    if len(egl_hits) != 1 or egl_hits[0]["slotOffset"] != spec["eglSlotRuntimeVaddr"]:
        g0.die("eglCreateImageKHR slots %r, expected one at 0x%x"
               % (egl_hits, spec["eglSlotRuntimeVaddr"]))
    require_pin(pins["hooks"], hex(spec["eglSlotRuntimeVaddr"]), "egl slot")
    require_pin(pins["vts"], hex(spec["embedImmediate"]), "embed immediate")

    # A counted stub must bind the read API's own dynsym index AND its pinned
    # GOT slot, so a same-named import or a shifted .rela.plt mapping cannot
    # stand in for the real read call.
    read_stubs = {stub for stub, info in plt_stub_map(data, sections, names).items()
                  if info[2] == spec["read"]["mangled"]
                  and info[1] == read_index
                  and info[0] == spec["read"]["slotRuntimeVaddr"]}
    if not read_stubs:
        g0.die("no PLT stub binds the read API slot 0x%x"
               % spec["read"]["slotRuntimeVaddr"])
    sites = count_embed_sites(data, text, read_stubs, spec["embedImmediate"])
    if sites != spec["embedSiteCount"]:
        g0.die("VTS embed census %d add+bl sites at +0x%x, expected %d"
               % (sites, spec["embedImmediate"], spec["embedSiteCount"]))
    print("  tree-derived verification passed (%s: size/sha, identity/read/capture"
          " VAs, anchors, slots, embed census %d)" % (spec_key, sites))
    return read_index


def main():
    repo_root = g0.REPO_ROOT
    parser = argparse.ArgumentParser()
    parser.add_argument("--base", default="5002363", choices=sorted(EXPECTED))
    parser.add_argument("--scene", default=None)
    parser.add_argument("--out", default=None)
    parser.add_argument("--check", action="store_true",
                        help="cross-verify the compiled-in C++ pins instead of emitting")
    args = parser.parse_args()
    spec_key = args.base
    spec = EXPECTED[spec_key]

    if args.check:
        return run_vts_check(spec_key)
    if spec.get("appendixEmit") is False:
        g0.die("%s is verify-only in this script (--check); its frozen appendix is"
               " hand-assembled like the restored legacy bases" % spec_key)

    default_scene = ("%s/%s/lib/arm64-v8a/libvrlink_scene.so"
                     % (repo_root, spec["tree"]))
    default_out = ("%s/extensions/gxr-spacewarp-layer/gxr_spacewarp_vts_%s.json"
                   % (repo_root, spec_key))
    scene_path = args.scene if args.scene else default_scene
    out_path = args.out if args.out else default_out

    with open(scene_path, "rb") as fh:
        data = fh.read()
    print("scene: %s (%d bytes)" % (scene_path, len(data)))
    sha256 = hashlib.sha256(data).hexdigest()
    loads, dyn = g0.parse_dynamic_mappings(data)
    dyn_off, dyn_size = dyn
    sections = section_headers(data)
    text = section_or_die(sections, ".text")
    text_shndx = text_shndx_of(sections, text)
    if text_shndx != spec["textShndx"]:
        g0.die("expected .text dynsym shndx %d, derived %d (library changed)"
               % (spec["textShndx"], text_shndx))
    # One dynsym walk shared by the whole derivation.
    _names, _defined = dyn_tables(data, loads, dyn_off, dyn_size, text_shndx)

    # ---- 1. the read API: defined symbol + anchor + PLT routability --------
    read_spec = spec["bGetRemoteValue"]
    sym_index, st_value, st_size = find_defined_symbol(
        data, loads, dyn_off, dyn_size, read_spec["mangled"], text_shndx, _names)
    if st_value != read_spec["va"] or st_size != read_spec["size"]:
        g0.die("read API re-derived at 0x%x (%d bytes), expected 0x%x (%d bytes)"
               % (st_value, st_size, read_spec["va"], read_spec["size"]))
    print("  %s: dynsym #%d, VA 0x%x, %d bytes" % (read_spec["label"], sym_index,
                                                   st_value, st_size))
    read_anchor = anchor_window(data, st_value, read_spec["label"])
    read_slots, read_globdat = jump_slots_for(data, loads, dyn_off, dyn_size, sym_index)
    if len(read_slots) != 1 or read_slots[0]["table"] != "DT_JMPREL":
        g0.die("the read API must have exactly one JUMP_SLOT; found %r"
               % (read_slots,))
    print("  read API JUMP_SLOT @ 0x%x (GLOB_DAT=%d)"
          % (read_slots[0]["slotRuntimeVaddr"], read_globdat))

    # ---- 2. the VTS embed offset from the real call sites ------------------
    plt = section_or_die(sections, ".plt")
    if (plt["size"] - 32) % 16:
        g0.die(".plt layout is not header(32) + 16-byte entries")
    embed = {"offset": 0xA08}
    if spec_key == "5002363":
        # 5002363: the original two-site proof (byte-identical derivation).
        stub_va = EXPECTED["5002363"]["embedCallPltStub"]
        if stub_va < plt["addr"] + 32 or stub_va >= plt["addr"] + plt["size"]:
            g0.die("BGetRemoteValue PLT stub 0x%x outside the .plt section" % stub_va)
        stub_index = (stub_va - (plt["addr"] + 32)) // 16
        relplt = section_or_die(sections, ".rela.plt", (SHT_RELA, SHT_REL))
        entry_off = relplt["offset"] + stub_index * 24
        r_offset, r_info, _addend = struct.unpack_from("<QQq", data, entry_off)
        if r_info >> 32 != sym_index or r_offset != read_slots[0]["slotRuntimeVaddr"]:
            g0.die("PLT stub 0x%x maps to dynsym #%d slot 0x%x; expected the read API"
                   " (dynsym #%d, slot 0x%x)" % (stub_va, r_info >> 32, r_offset,
                                                 sym_index,
                                                 read_slots[0]["slotRuntimeVaddr"]))
        print("  PLT stub 0x%x -> JUMP_SLOT 0x%x == the read API [verified chain]"
              % (stub_va, r_offset))
        for site, callsite in zip(EXPECTED["5002363"]["embedSites"],
                                  EXPECTED["5002363"]["embedCallSites"]):
            word_at(data, loads, site, "add x0, x20, #0xa08",
                    EXPECTED["5002363"]["embedAddEncoding"])
            if (stub_va - callsite) % 4:
                g0.die("call site 0x%x -> stub 0x%x is not a 4-byte multiple"
                       % (callsite, stub_va))
            bl = 0x94000000 | ((stub_va - callsite) // 4)
            word_at(data, loads, callsite, "bl -> the read API PLT stub", bl)
            pair = bytes(data[callsite - 4:callsite + 4])
            if data.count(pair) != 1:
                g0.die("embed site window (0x%x bl + add) occurs %d times; exactly one"
                       " expected" % (callsite - 4, data.count(pair)))
        print("  VTS embed offset 0xa08 proven at call sites %s (each pair unique)"
              % [hex(v) for v in EXPECTED["5002363"]["embedSites"]])
        embed.update({
            "provenAtSites": [hex(v) for v in EXPECTED["5002363"]["embedSites"]],
            "addEncoding": hex(EXPECTED["5002363"]["embedAddEncoding"]),
            "callSites": [hex(v) for v in EXPECTED["5002363"]["embedCallSites"]],
            "pltStub": hex(EXPECTED["5002363"]["embedCallPltStub"]),
        })
    else:
        # 5001712: per-base census + frozen canonical pairs (proof pairs are
        # re-derived from the lib's own bytes below; the census expectation is
        # frozen so a drifting library fails closed).
        stubs = plt_stub_map(data, sections, _names)
        vts_targets = {lo: name for lo, hi, name in _defined
                       if name.startswith("_ZN20ValueTransportSystem")}
        census = {}
        if text["addr"] != text["offset"]:
            g0.die(".text is not PT_LOAD-identity; the bl census needs VA==file-offset")
        for i in range(0, text["size"] - 3, 4):
            w = g0.u32(data, i)
            if (w >> 26) != 0x25:
                continue
            site = i  # .text is PT_LOAD-identity: VA == file offset
            imm26 = w & 0x3FFFFFF
            if imm26 & (1 << 25):
                imm26 -= 1 << 26
            target = site + imm26 * 4
            callee = vts_targets.get(target)
            if callee is None and target in stubs:
                sym_name = stubs[target][2]
                if sym_name.startswith("_ZN20ValueTransportSystem"):
                    callee = sym_name
            if callee is None:
                continue
            # nearest add x0, x?, #imm within 8 instructions back
            feed = None
            for k in range(1, 9):
                w2 = g0.u32(data, site - 4 * k)
                if is_add_imm_x0(w2):
                    feed = (site - 4 * k, (w2 >> 10) & 0xFFF, (w2 >> 5) & 0x1F, k)
                    break
            if not feed:
                continue
            census[feed[1]] = census.get(feed[1], 0) + 1
        if census != spec["embedCensus"]:
            g0.die("VTS embed census drifted: %r, expected %r (fail closed)"
                   % ({hex(k): v for k, v in sorted(census.items())},
                      {hex(k): v for k, v in sorted(spec["embedCensus"].items())}))
        print("  VTS embed census: %s (the 0xa08 imm dominates; outliers recorded)"
              % {hex(k): v for k, v in sorted(census.items())})
        canonical = []
        for add_site, call_site, add_enc, stub_va, slot_va in spec["embedProofPairs"]:
            word_at(data, loads, add_site, "add x0, x?, #0xa08", add_enc)
            if (stub_va - call_site) % 4:
                g0.die("embed call site 0x%x -> stub 0x%x is not a 4-byte multiple"
                       % (call_site, stub_va))
            bl = 0x94000000 | ((stub_va - call_site) // 4)
            word_at(data, loads, call_site, "bl -> the callee's PLT stub", bl)
            pair = bytes(data[call_site - 4:call_site + 4])
            if data.count(pair) != 1:
                g0.die("embed pair window (0x%x) occurs %d times; exactly one expected"
                       % (call_site - 4, data.count(pair)))
            r_offset, _rsym, rsym_name = stubs[stub_va]
            if r_offset != slot_va:
                g0.die("stub 0x%x resolves to slot %r, expected 0x%x"
                       % (stub_va, r_offset, slot_va))
            canonical.append({"add": add_site, "call": call_site,
                              "addEncoding": hex(add_enc), "pltStub": stub_va,
                              "slot": slot_va, "callee": rsym_name})
        print("  VTS embed offset 0xa08 proven at %d frozen call-site pairs"
              " (each pair window unique; stubs resolve through .rela.plt)"
              % len(spec["embedProofPairs"]))
        embed.update({
            "provenAtPairs": [{"add": hex(p["add"]), "call": hex(p["call"]),
                               "addEncoding": p["addEncoding"],
                               "pltStub": hex(p["pltStub"]), "slot": hex(p["slot"]),
                               "callee": p["callee"]} for p in canonical],
            "addImmediate": "0xa08 (per-site base registers x20/x8/x19)",
            "census": {hex(k): v for k, v in sorted(census.items())},
        })

    # ---- 3. carrier id 0x48 unused by the client's value transport ---------
    text_bytes = data[text["offset"]:text["offset"] + text["size"]]
    raw_hits = []
    for enc in spec["carrierMovzEncodings"]:
        start = 0
        while True:
            i = text_bytes.find(struct.pack("<I", enc), start)
            if i < 0:
                break
            raw_hits.append(text["addr"] + i)
            start = i + 1
    print("  raw 'movz w1, #0x48' encodings in .text: %d -> %s"
          % (len(raw_hits), [hex(v) for v in raw_hits]))
    if not raw_hits:
        g0.die("expected the two known libc++ 'movz w1, #0x48' locale-helper sites;"
               " found none (library or compiler changed; fail closed)")
    carrier = spec["carrierId"]
    if spec_key == "5002363":
        if not (1 <= carrier <= spec["rxIdGuardMax"]):
            g0.die("carrier id 0x%x violates the RXMessageInternal id guard %s"
                   % (carrier, spec["rxIdGuard"]))
    else:
        if not (0 <= carrier < spec["rxRecord"]["carrierIdBound"]):
            g0.die("carrier id 0x%x outside this base's u8 record-id space" % carrier)
    vt_ranges = [(lo, hi) for lo, hi, name in _defined if "ValueTransportSystem" in name]
    attributed = []
    for va in raw_hits:
        containing = [name for lo, hi, name in _defined if lo <= va < hi]
        if len(containing) != 1:
            g0.die("movz w1 #0x48 at 0x%x overlaps %d dynsym ranges; ambiguity fails"
                   " closed" % (va, len(containing)))
        if any(vlo <= va < vhi for vlo, vhi in vt_ranges):
            g0.die("movz w1 #0x48 at 0x%x inside a ValueTransportSystem function; the"
                   " carrier is not unused on the client" % va)
        attributed.append({"site": va, "function": containing[0]})
        print("  0x%x inside %s (non-VT, ok)" % (va, containing[0][:64]))

    # ---- 4. the two one-shot SVLRoot* capture slots ------------------------
    captures = []
    for cap in spec["capture"]:
        cap_index, cap_va, cap_size = find_defined_symbol(
            data, loads, dyn_off, dyn_size, cap["mangled"], text_shndx, _names)
        if cap_va != cap["va"] or cap_size != cap["size"]:
            g0.die("%s re-derived at 0x%x (%d bytes), expected 0x%x (%d bytes)"
                   % (cap["mangled"], cap_va, cap_size, cap["va"], cap["size"]))
        cap_anchor = anchor_window(data, cap_va, cap["mangled"])
        slots, globdat = jump_slots_for(data, loads, dyn_off, dyn_size, cap_index)
        jmprel = [s for s in slots if s["table"] == "DT_JMPREL"]
        if len(jmprel) != 1 or jmprel[0]["slotRuntimeVaddr"] != cap["slotRuntimeVaddr"]:
            g0.die("%s must have exactly one JUMP_SLOT at 0x%x; found %r"
                   % (cap["mangled"], cap["slotRuntimeVaddr"], slots))
        captures.append({
            "symbol": cap["mangled"],
            "va": cap_va,
            "size": cap_size,
            "anchor": cap_anchor,
            "slotRuntimeVaddr": cap["slotRuntimeVaddr"],
            "globDatCount": globdat,
            "capturedAbi": cap["capturedAbi"],
        })
        print("  capture symbol %s VA 0x%x slot 0x%x (GLOB_DAT=%d)"
              % (cap["mangled"], cap_va, cap["slotRuntimeVaddr"], globdat))

    # ---- 5. BTI status (the direct read call + wrappers need an unmarked lib)
    bti_enforcement_check(data)

    # ---- 6. the RX record codec per base (the carrier's ingest side) -------
    rx_record = None
    if spec_key == "5001712":
        rx = spec["rxRecord"]
        rx_index, rx_va, rx_size = find_defined_symbol(
            data, loads, dyn_off, dyn_size, rx["symbol"], text_shndx, _names)
        if rx_va != rx["va"]:
            g0.die("RX record codec re-derived at 0x%x, expected 0x%x" % (rx_va, rx["va"]))
        word_at(data, loads, rx["idLoadSite"], "ldrb w22, [x23, #1]",
                rx["idLoadEncoding"])
        word_at(data, loads, rx["slotIndexSite"], "add x22, x27, x22, lsl #4",
                rx["slotIndexEncoding"])
        print("  RX record codec %s VA 0x%x (%d bytes); byte id + slot-index"
              " arithmetic re-verified" % (rx["symbol"], rx_va, rx_size))
        rx_record = {
            "symbol": rx["symbol"],
            "va": rx_va,
            "size": rx_size,
            "dynsymIndex": rx_index,
            "idSpace": rx["idSpace"],
            "idLoadSite": hex(rx["idLoadSite"]),
            "slotIndexSite": hex(rx["slotIndexSite"]),
            "holderAutoInstantiate": "operator new(0x40) @0x16a7f8 + bl 0x16a800; the"
                                     " receiver creates unknown ids on first arrival"
                                     " and installs them into the [this+0x100] slot"
                                     " arrays at id*16 (0x16a8ac)",
        }

    # ---- 8. assemble + freeze the appendix (never overwrite 5002363) --------
    # The 5002363 emit keeps the original key order/fields EXACTLY (its frozen
    # output is byte-identical modulo the timestamp); the 5001712 appendix
    # appends the per-base extras (demangled name, RX ingest evidence, the
    # cross-base read-return-semantics note).
    appendix = {
        "version": 1,
        "generatedBy": "extensions/gxr-spacewarp-layer/tests/derive_gate0_vts.py",
        "generatedAt": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "base": {"app": "Steam Link VR", "package": "com.valvesoftware.steamlinkvr",
                 "versionName": spec["versionName"],
                 "versionCode": spec["versionCode"]},
        "soname": "libvrlink_scene.so",
        "decodedTree": spec["tree"],
        "size": len(data),
        "sha256": sha256,
        "sha256Use": "diagnostics only; never a full-file gate",
        "addressing": ("code segment is PT_LOAD-identity (VA == file offset); GOT slots "
                       "are RUNTIME vaddrs added to dlpi_addr (this lib is NOT "
                       "PT_LOAD-identity in its writable segments)"),
        "carrier": {
            "id": carrier,
            "idGuard": (spec["rxIdGuard"] if spec_key == "5002363" else
                        "single-byte record id (0..255) in VTS::RXMessage; no"
                        " 0x73-style bound on this base (the holder auto-instantiates"
                        " unknown ids)"),
            "payloadBytes": 4,
            "payloadSemantics": "nonzero int32 = spacewarp synthesis enabled",
            "readCadenceEndframes": 60,
            "readApi": ("ValueTransportSystem::BGetRemoteValue(ValueTransportID id,"
                        " void* out, unsigned size)"
                        if spec_key == "5002363" else
                        "ValueTransportSystem::GetRemoteValue(ValueTransportID id,"
                        " void* out, unsigned size)"),
            "readCallShape": ("fn(base + 0x179ee0)(svlRoot + 0xa08, id, out, 4); returns"
                              " true only when the id holder exists and the FULL requested"
                              " size was copied (present && copied == requested); a size"
                              " mismatch therefore reads as 'not present' = disabled"
                              if spec_key == "5002363" else
                              "fn(base + 0x16a2c4)(svlRoot + 0xa08, id, out, 4); returns"
                              " the COPIED BYTE COUNT in w0 (0xffffffff when the id's"
                              " holder is absent): present means copied == requested"
                              " (4); a partial copy or absence reads as 'not present',"
                              " which keeps synthesis disabled"),
            "clientUnusedEvidence": {
                "movzW1ImmediateSites": [hex(v["site"]) for v in attributed],
                "allAttributedNonValueTransport": True,
                "note": "the two hits are libc++ time_get_storage locale helpers; no"
                        " client value-transport read or publish uses id 0x48",
            },
        },
        "bGetRemoteValue": {
            "mangledName": read_spec["mangled"],
            "va": st_value,
            "size": st_size,
            "anchor": read_anchor,
            "jumpSlotRuntimeVaddr": read_slots[0]["slotRuntimeVaddr"],
            "callABI": ("x0 = the VTS object (SVLRoot + 0xa08), w1 = id, x2 = out, w3 ="
                        " size; returns bool in w0; internally takes/releases the"
                        " VTS-internal mutex at this+0x1a78 (safe for the render thread"
                        " to call)"
                        if spec_key == "5002363" else
                        "x0 = the VTS object (SVLRoot + 0xa08), w1 = id, x2 = out, w3 ="
                        " size; returns the copied byte count in w0; internally"
                        " lock/unlocks the VTS mutex at this+0xd8 (0x208a40/0x208a50 PLT"
                        " stubs; safe for the render thread to call); reads the slot"
                        " array from this+0x100 at id*16 (sbfiz x8, x23, #4, #0x20)"),
        },
        "vtsEmbedOffset": embed,
        "captureSlots": captures,
    }
    if spec_key != "5002363":
        appendix["readReturnSemantics"] = {
            "5002363": "bool in w0: present AND the full requested size copied",
            "5001712": "u32 copied byte count in w0; 0xffffffff = absent; the layer"
                       " treats present as copied == 4, so both bases enforce the"
                       " same full-copy policy client-side",
        }
        appendix["carrier"]["rxIngest"] = rx_record
        appendix["bGetRemoteValue"]["demangledName"] = read_spec["label"]
    with open(out_path, "w", encoding="utf-8", newline="\n") as fh:
        json.dump(appendix, fh, indent=2)
        fh.write("\n")
    print("frozen: %s" % out_path)
    return 0


if __name__ == "__main__":
    sys.exit(main())