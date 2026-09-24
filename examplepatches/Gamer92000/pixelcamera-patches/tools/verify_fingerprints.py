#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-or-later
"""
verify_fingerprints.py - check that the patch's fingerprints resolve, and
resolve uniquely, against a given Pixel Camera APK.

This re-implements the two fingerprints from
`patches/src/main/kotlin/app/morphe/patches/pixelcamera/gallery/Fingerprints.kt`
using dexscan.py, so a Pixel Camera update can be checked in seconds without a
Gradle build, a Morphe toolchain, or a GitHub Packages token.

A fingerprint is considered good when it matches EXACTLY ONE method. Zero
matches means the patch will fail with a diagnostic; more than one means the
fingerprint is ambiguous and must be tightened before it can be trusted.

It also verifies the mutation preconditions the Kotlin patch asserts at patch
time (register counts of the calls being replaced), so a mismatch is caught
here rather than in a broken APK.

Usage:
    python tools/verify_fingerprints.py base.apk
    python tools/verify_fingerprints.py PixelCamera.apkm

Exit status is 0 only when every fingerprint and precondition passes.
"""

from __future__ import annotations

import os
import sys
from dataclasses import dataclass
from typing import Callable, Dict, List, Optional, Sequence, Tuple

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from dexscan import (  # noqa: E402  (path set above)
    ACC_FINAL,
    ACC_PUBLIC,
    ACC_STATIC,
    INVOKE_OPS,
    STRING_OPS,
    Apk,
    ClassInfo,
    Dex,
    Insn,
    MethodBody,
    decode,
    invoke_registers,
    render,
)

PHOTOS_PACKAGE_NAME = "com.google.android.apps.photos"


# --------------------------------------------------------------------------- #
# Filter primitives, mirroring app.morphe.patcher InstructionFilter semantics
# --------------------------------------------------------------------------- #

@dataclass
class Filter:
    """One ordered instruction filter."""
    label: str
    predicate: Callable[[Dex, Insn], bool]


def string_filter(value: str) -> Filter:
    def pred(dex: Dex, ins: Insn) -> bool:
        if ins.opcode not in STRING_OPS:
            return False
        idx = ins.index_operand
        return idx is not None and dex.string(idx) == value
    return Filter(f'string("{value}")', pred)


def method_call_filter(defining_class: Optional[str] = None,
                       name: Optional[str] = None,
                       return_type: Optional[str] = None) -> Filter:
    parts = []
    if defining_class:
        parts.append(f'definingClass="{defining_class}"')
    if name:
        parts.append(f'name="{name}"')
    if return_type:
        parts.append(f'returnType="{return_type}"')

    def pred(dex: Dex, ins: Insn) -> bool:
        if ins.opcode not in INVOKE_OPS:
            return False
        idx = ins.index_operand
        if idx is None:
            return False
        ref = dex.method(idx)
        if defining_class and ref.class_desc != defining_class:
            return False
        if name and ref.name != name:
            return False
        if return_type:
            ret = ref.proto.split(")", 1)[1] if ")" in ref.proto else ""
            # The patcher compares return types with String.startsWith.
            if not ret.startswith(return_type):
                return False
        return True

    return Filter(f"methodCall({', '.join(parts)})", pred)


@dataclass
class Fingerprint:
    name: str
    access_flags: int          # flags that must all be set
    forbidden_flags: int       # flags that must not be set
    return_type: str           # compared with startswith
    parameters: Optional[List[str]]   # None = don't care; "L" = any object type
    filters: List[Filter]


@dataclass
class FpMatch:
    dex: str
    klass: str
    method: str
    filter_indices: List[int]
    insns: List[Insn]


def _proto_parts(proto: str) -> Tuple[List[str], str]:
    inner = proto[proto.index("(") + 1:proto.index(")")]
    ret = proto[proto.index(")") + 1:]
    params: List[str] = []
    i = 0
    while i < len(inner):
        c = inner[i]
        if c == "L":
            j = inner.index(";", i)
            params.append(inner[i:j + 1])
            i = j + 1
        elif c == "[":
            j = i
            while inner[j] == "[":
                j += 1
            if inner[j] == "L":
                k = inner.index(";", j)
                params.append(inner[i:k + 1])
                i = k + 1
            else:
                params.append(inner[i:j + 1])
                i = j + 1
        else:
            params.append(c)
            i += 1
    return params, ret


def _params_match(declared: Sequence[str], wanted: Sequence[str]) -> bool:
    if len(declared) != len(wanted):
        return False
    for got, want in zip(declared, wanted):
        if want == "L":
            # Obfuscation-safe wildcard: any object type.
            if not got.startswith("L"):
                return False
        elif not got.startswith(want):
            return False
    return True


def match_fingerprint(apk: Apk, fp: Fingerprint) -> List[FpMatch]:
    out: List[FpMatch] = []
    for dex in apk.dexes:
        for cls in dex.classes:
            for mb in cls.methods:
                if not mb.insns:
                    continue
                if (mb.access_flags & fp.access_flags) != fp.access_flags:
                    continue
                if mb.access_flags & fp.forbidden_flags:
                    continue
                ref = dex.method(mb.method_idx)
                params, ret = _proto_parts(ref.proto)
                if not ret.startswith(fp.return_type):
                    continue
                if fp.parameters is not None and not _params_match(params, fp.parameters):
                    continue

                decoded = decode(mb.insns)
                indices: List[int] = []
                cursor = 0
                for filt in fp.filters:
                    found = -1
                    for k in range(cursor, len(decoded)):
                        if filt.predicate(dex, decoded[k]):
                            found = k
                            break
                    if found < 0:
                        break
                    indices.append(found)
                    cursor = found + 1
                if len(indices) == len(fp.filters):
                    out.append(FpMatch(
                        dex=dex.origin,
                        klass=cls.descriptor,
                        method=f"{ref.name}{ref.proto}",
                        filter_indices=indices,
                        insns=decoded,
                    ))
    return out


# --------------------------------------------------------------------------- #
# The two fingerprints under test
# --------------------------------------------------------------------------- #

THUMBNAIL_REVIEW_LAUNCHER = Fingerprint(
    name="ThumbnailReviewLauncherFingerprint",
    access_flags=ACC_PUBLIC | ACC_FINAL,
    forbidden_flags=ACC_STATIC,
    return_type="Z",
    parameters=["Landroid/content/Intent;", "Landroid/view/View;", "Landroid/graphics/Bitmap;"],
    filters=[
        method_call_filter(defining_class="Landroid/content/Intent;", name="resolveActivity"),
        string_filter("photos_review_launch_timestamp"),
        string_filter("shared_element_return_transition"),
        method_call_filter(defining_class="Landroid/app/Activity;", name="startActivityForResult"),
    ],
)

PHOTOS_AVAILABILITY_GATE = Fingerprint(
    name="PhotosAvailabilityGateFingerprint",
    access_flags=ACC_PUBLIC | ACC_FINAL,
    forbidden_flags=ACC_STATIC,
    return_type="V",
    parameters=["L"],
    filters=[
        string_filter(PHOTOS_PACKAGE_NAME),
        method_call_filter(return_type="Landroid/content/pm/PackageInfo;"),
        method_call_filter(defining_class="Landroid/content/pm/PackageManager;",
                           name="getApplicationEnabledSetting"),
        method_call_filter(defining_class="Landroid/content/pm/PackageManager;",
                           name="isPackageSuspended"),
        string_filter("Photos is disabled. Canceling."),
    ],
)

# Filter index -> required register count of the call the patch replaces.
# Mirrors the `expectedArgs` assertions in UseThirdPartyGalleryPatch.kt.
GATE_REGISTER_EXPECTATIONS: Dict[int, Tuple[str, int]] = {
    1: ("Photos PackageInfo probe", 1),
    2: ("Photos enabled probe", 2),
    3: ("Photos suspended probe", 2),
}


def report(apk: Apk) -> int:
    failures = 0
    meta = apk.base_manifest
    if meta:
        print(f"package     : {meta.package}")
        print(f"versionName : {meta.version_name}")
        print(f"versionCode : {meta.version_code}")
    print(f"dex files   : {len(apk.dexes)}")
    print()

    for fp in (THUMBNAIL_REVIEW_LAUNCHER, PHOTOS_AVAILABILITY_GATE):
        matches = match_fingerprint(apk, fp)
        status = "OK" if len(matches) == 1 else "FAIL"
        if len(matches) != 1:
            failures += 1
        print(f"[{status}] {fp.name}: {len(matches)} match(es)")
        for m in matches:
            print(f"        {m.klass}->{m.method}   ({m.dex})")
            for fi, ii in enumerate(m.filter_indices):
                print(f"          filter[{fi}] {fp.filters[fi].label}")
                print(f"                    -> #{ii}")
        print()

    # Mutation preconditions on the gate.
    gate_matches = match_fingerprint(apk, PHOTOS_AVAILABILITY_GATE)
    if len(gate_matches) == 1:
        m = gate_matches[0]
        print("Mutation preconditions (register counts of replaced calls):")
        for filter_index, (what, expected) in GATE_REGISTER_EXPECTATIONS.items():
            ins = m.insns[m.filter_indices[filter_index]]
            actual = len(invoke_registers(ins))
            ok = actual == expected
            if not ok:
                failures += 1
            print(f"  [{'OK' if ok else 'FAIL'}] {what}: expected {expected} register(s), "
                  f"found {actual}")
        print()

    # The launcher must keep its own resolveActivity guard, since the patch
    # reuses it as the "no compatible activity installed" path.
    launcher_matches = match_fingerprint(apk, THUMBNAIL_REVIEW_LAUNCHER)
    if len(launcher_matches) == 1:
        m = launcher_matches[0]
        has_guard = m.filter_indices[0] < 8
        if not has_guard:
            failures += 1
        print(f"[{'OK' if has_guard else 'WARN'}] resolveActivity guard is near the method "
              f"entry (instruction #{m.filter_indices[0]}); the injected call at index 0 "
              f"runs before it.")
        print()

    print("RESULT:", "PASS" if failures == 0 else f"FAIL ({failures} problem(s))")
    return 0 if failures == 0 else 1


def main(argv: List[str]) -> int:
    if len(argv) != 2:
        print(__doc__)
        return 2
    return report(Apk(argv[1]))


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
