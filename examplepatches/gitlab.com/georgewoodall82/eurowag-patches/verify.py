#!/usr/bin/env python3
"""Offline verifier for the Eurowag Navi Premium patch bundle.

Checks:
  * source fingerprints and constants,
  * the XAPK layout and target version,
  * the built .mpp (classes.dex + manifest version),
  * patches-list.json,
  * and, when a patched APK is available, the injected instructions in the
    patched dex.

Usage:
    python3 verify.py
    EUROWAG_PATCHED_APK=/path/to/patched.apk python3 verify.py
"""

from __future__ import annotations

import json
import os
import re
import sys
import tempfile
import zipfile
from pathlib import Path

try:
    from loguru import logger
    logger.remove()
except Exception:
    pass

ROOT = Path(__file__).resolve().parent
XAPK = Path(
    os.environ.get(
        "EUROWAG_XAPK",
        "/home/george/builds/songsterrpatch/"
        "Eurowag+Navigation+-+Truck+GPS_4.18.1-7eb59b0f_APKPure.xapk",
    )
)
PATCHED = Path(
    os.environ.get(
        "EUROWAG_PATCHED_APK",
        "/tmp/eurowag/final_e2e_101/eurowag-signed.apk",
    )
)

PASS = 0
FAIL = 0


def check(name: str, condition: bool, detail: str = "") -> None:
    global PASS, FAIL
    if condition:
        PASS += 1
        print(f"[PASS] {name} {detail}")
    else:
        FAIL += 1
        print(f"[FAIL] {name} {detail}")


def read(rel: str) -> str:
    p = ROOT / rel
    return p.read_text(encoding="utf-8") if p.is_file() else ""


def main() -> int:
    print(f"Repo: {ROOT}")

    # ---------------------------------------------------------------- source
    constants = read("patches/src/main/kotlin/app/eurowag/patches/shared/Constants.kt")
    fps = read("patches/src/main/kotlin/app/eurowag/patches/premium/Fingerprints.kt")
    patch = read("patches/src/main/kotlin/app/eurowag/patches/premium/UnlockPremiumPatch.kt")
    build = read("patches/build.gradle.kts")
    props = read("gradle.properties")

    check("package name pinned", 'packageName = "com.roadlords.android"' in constants)
    check("version pinned", 'version = "4.18.1-7eb59b0f"' in constants)
    check("XAPK compatibility", "ApkFileType.XAPK" in constants)
    check("arn.v fingerprint", 'definingClass = "Larn;"' in fps and 'name = "v"' in fps)
    check("xhn.x fingerprint", 'definingClass = "Lxhn;"' in fps and 'name = "x"' in fps)
    check("fra.resolve fingerprint", 'definingClass = "Lfra;"' in fps and 'name = "resolve"' in fps)
    check("am9.i fingerprint", 'definingClass = "Lam9;"' in fps and 'name = "i"' in fps)
    check("fallback upgrade present", 'Ldqk;->a' in patch and 'Lkqk;->a' in patch)
    check("voice/lane upgrade present", 'Lwdm;->a' in patch and 'Lucd;->a' in patch)
    check("vehicle params upgrade present", 'Lrsl;->a' in patch)
    check("premium status present", 'Lzgc;-><init>' in patch and "eurowag_premium" in patch)
    check("packageBundle guard present", 'getEntry("classes.dex")' in build)
    m = re.search(r"^version\s*=\s*(\S+)", props, re.M)
    version = m.group(1) if m else ""
    check("gradle version set", bool(version), version)

    # ------------------------------------------------------------------ XAPK
    if XAPK.is_file():
        check("XAPK exists", True, f"{XAPK.stat().st_size:,} bytes")
        with zipfile.ZipFile(XAPK) as z:
            names = set(z.namelist())
            check("XAPK base apk", "com.roadlords.android.apk" in names)
            check("XAPK arm64 split", "config.arm64_v8a.apk" in names)
            check("XAPK mdpi split", "config.mdpi.apk" in names)
            manifest = json.loads(z.read("manifest.json"))
            check("XAPK package", manifest.get("package_name") == "com.roadlords.android",
                  str(manifest.get("package_name")))
            check("XAPK version", manifest.get("version_name") == "4.18.1-7eb59b0f",
                  str(manifest.get("version_name")))
            check("XAPK versionCode", str(manifest.get("version_code")) == "41801",
                  str(manifest.get("version_code")))
            check("XAPK splits", set(manifest.get("split_configs", [])) ==
                  {"config.arm64_v8a", "config.mdpi"})
    else:
        check("XAPK exists", False, str(XAPK))

    # ------------------------------------------------------------------- MPP
    mpp = ROOT / f"patches/build/libs/patches-{version}.mpp"
    if mpp.is_file():
        check("bundle exists", True, f"{mpp.stat().st_size:,} bytes")
        with zipfile.ZipFile(mpp) as z:
            names = z.namelist()
            check("bundle classes.dex", "classes.dex" in names)
            mf = z.read("META-INF/MANIFEST.MF").decode("utf-8", "replace")
            check("bundle manifest version", f"Version: {version}" in mf.splitlines())
            check("bundle patcher 2.0.0", "Patcher-Version: 2.0.0" in mf)
        if (ROOT / "patches-list.json").is_file():
            data = json.loads((ROOT / "patches-list.json").read_text())
            check("patches-list version", data.get("version") == version,
                  str(data.get("version")))
            names = [p.get("name") for p in data.get("patches", [])]
            check("patches-list has Unlock Premium", "Unlock Premium" in names, str(names))
    else:
        check("bundle exists", False, str(mpp))

    # ---------------------------------------------------------- patched APK
    if PATCHED.is_file():
        check("patched APK exists", True, f"{PATCHED.stat().st_size:,} bytes")
        with zipfile.ZipFile(PATCHED) as z:
            names = z.namelist()
            check("patched libsygic present", "lib/arm64-v8a/libsygic.so" in names)
            check("patched resources present", "resources.arsc" in names)
            check("patched new dex present", "classes5.dex" in names)

            with tempfile.TemporaryDirectory(prefix="eurowag-verify-") as td:
                dex_path = Path(td) / "classes5.dex"
                dex_path.write_bytes(z.read("classes5.dex"))

                try:
                    from androguard.core.dex import DEX

                    dex = DEX(dex_path.read_bytes())
                    classes = {c.get_name(): c for c in dex.get_classes()}

                    def instructions(class_name: str, method_name: str) -> list[str]:
                        cls = classes.get(class_name)
                        if cls is None:
                            return []
                        for method in cls.get_methods():
                            if method.get_name() == method_name:
                                return [i.get_output() for i in method.get_instructions()]
                        return []

                    fallback_ins = instructions("Larn;", "v")
                    fallback = " ".join(fallback_ins)
                    resolver = " ".join(instructions("Lfra;", "resolve"))
                    anonymous = " ".join(instructions("Lxhn;", "x"))
                    monetization = " ".join(instructions("Lam9;", "i"))

                    check("patched arn.v full traffic", "Ldqk;" in fallback)
                    check("patched arn.v traffic unlocked", "Lkqk;" in fallback)
                    check("patched arn.v voice enabled", "Lwdm;" in fallback)
                    check("patched arn.v lane/restrictions enabled", "Lucd;" in fallback)
                    check("patched arn.v all vehicle params", "Lrsl;" in fallback)
                    check("patched arn.v favourites limits", "Lq87;" in fallback and "750" in fallback)
                    map_call = next(
                        (i for i, ins in enumerate(fallback_ins) if "Lwkb;-><init>" in ins),
                        -1,
                    )
                    map_args = fallback_ins[max(0, map_call - 4):map_call] if map_call >= 0 else []
                    check(
                        "patched arn.v offline maps enabled",
                        sum(1 for ins in map_args if ins.endswith(", 1")) >= 2,
                        str(map_args),
                    )
                    vehicle_call = next(
                        (i for i, ins in enumerate(fallback_ins) if "Lq3m;-><init>" in ins),
                        -1,
                    )
                    vehicle_args = fallback_ins[max(0, vehicle_call - 4):vehicle_call] if vehicle_call >= 0 else []
                    check(
                        "patched arn.v vehicle purchase flag off",
                        any(ins.endswith(", 0") for ins in vehicle_args),
                        str(vehicle_args),
                    )
                    check("patched arn.v no premium map lock", "Lpva;" not in fallback)
                    check("patched arn.v no limited traffic", "Leqk;" not in fallback)
                    check("patched arn.v no traffic lock", "Lhqk;" not in fallback)
                    check("patched arn.v no disabled voice", "Lvdm;" not in fallback)
                    check("patched arn.v no disabled lane", "Ltcd;" not in fallback)
                    check("patched arn.v no dimensional-only", "Ltsl;" not in fallback)
                    check("patched resolver -> fixture", "Larn;->v" in resolver)
                    check("patched anonymous -> fixture", "Larn;->v" in anonymous)
                    check("patched monetization -> premium", "Lzgc;" in monetization)
                    check("patched premium fallback product id", "eurowag_premium" in monetization)
                except Exception as exc:  # pragma: no cover - diagnostic path
                    check("patched dex readable", False, repr(exc))
    else:
        print(f"[SKIP] patched APK not found: {PATCHED}")

    print()
    print(f"RESULT: {PASS} PASS / {FAIL} FAIL")
    return 1 if FAIL else 0


if __name__ == "__main__":
    sys.exit(main())
