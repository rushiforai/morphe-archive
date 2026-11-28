#!/usr/bin/env python3
"""Verify a built APK against the patch manifests — the built artefact, not the sources.

This exists because a patch pipeline can fail *silently* in a way that still produces an
installable APK: the smali gets patched, then the dex is reassembled from a tree that
was re-decoded or never patched, and everything downstream succeeds. The only reliable
check is to read the dex that is actually inside the APK and look at the instructions.

Checks performed:

1. the APK contains the dex entry the patch targets;
2. that dex passes its own integrity checks (magic, SHA-1 signature, adler32, size);
3. for every hook, the target method's first instruction really is the injected
   `sget-object` on the expected field;
4. every other zip entry is byte-identical to the source APK.

Requires a JDK and apktool.jar (for baksmali); see scripts/bootstrap.sh.

Usage:
  python3 scripts/verify_apk.py --apk patch/patch.apk --source-apk apk/original.apk --tools tools
  python3 scripts/verify_apk.py --apk patch/patch.apk --tools tools --json
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(REPO / "scripts"))

import dex  # noqa: E402


class VerifyError(Exception):
    """Raised when the built APK does not match what the manifests promise."""


# ------------------------------------------------------------------ smali inspection

def method_body(smali: str, signature: str) -> list[str] | None:
    """Return the instruction lines of a method, or None when it is absent."""
    lines = smali.splitlines()
    start = None
    for i, line in enumerate(lines):
        if line.strip() == signature.strip():
            start = i + 1
            break
    if start is None:
        return None
    body = []
    in_annotation = False
    for line in lines[start:]:
        if line.startswith(".end method"):
            break
        stripped = line.strip()
        # annotations open a method body before its .locals; they are not instructions
        if stripped.startswith(".annotation"):
            in_annotation = True
            continue
        if in_annotation:
            if stripped.startswith(".end annotation"):
                in_annotation = False
            continue
        if not stripped or stripped.startswith(("#", ".registers", ".locals", ".line", ".param")):
            continue
        if stripped.startswith(":"):  # jump label
            continue
        body.append(stripped)
    return body


def disassemble_dex(java: Path, apktool_jar: Path, dex: Path, out_dir: Path) -> None:
    """Disassemble one dex with baksmali from apktool.jar."""
    sep = ";" if sys.platform.startswith("win") else ":"
    workdir = out_dir.parent / "driver"
    helper = write_disassembler(workdir, apktool_jar, sep)
    classpath = f"{apktool_jar}{sep}{helper.parent}"
    subprocess.run(
        [str(java), "-Xmx3g", "-cp", classpath, "Disassemble", str(dex), str(out_dir)],
        check=True,
        stdout=subprocess.DEVNULL,
    )


DISASSEMBLER_SOURCE = """\
import com.android.tools.smali.baksmali.Baksmali;
import com.android.tools.smali.baksmali.BaksmaliOptions;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.MultiDexContainer;
import java.io.File;

/** Disassemble a dex with the baksmali bundled in apktool.jar. */
public class Disassemble {
    public static void main(String[] args) throws Exception {
        MultiDexContainer container =
                DexFileFactory.loadDexContainer(new File(args[0]), new Opcodes(33, 0));
        var entry = container.getEntry((String) container.getDexEntryNames().get(0));
        Baksmali.disassembleDexFile(entry.getDexFile(), new File(args[1]), 4, new BaksmaliOptions());
    }
}
"""


def write_disassembler(workdir: Path, apktool_jar: Path, sep: str) -> Path:
    """Compile the tiny baksmali driver once per run, against apktool.jar."""
    workdir.mkdir(parents=True, exist_ok=True)
    src = workdir / "Disassemble.java"
    if not src.exists():
        src.write_text(DISASSEMBLER_SOURCE, encoding="utf-8")
    if not (workdir / "Disassemble.class").exists():
        proc = subprocess.run(
            ["javac", "-nowarn", "-cp", str(apktool_jar), "-d", str(workdir), str(src)],
            capture_output=True,
            text=True,
        )
        if proc.returncode != 0:
            raise VerifyError(f"could not compile the baksmali driver:\n{proc.stderr.strip()}")
    return src


# --------------------------------------------------------------------------- main

def _verify_global(
    hook: dict,
    entries: dict[str, bytes],
    tmp: Path,
    java: Path,
    apktool_jar: Path,
    results: list[dict],
    failures: list[str],
) -> None:
    """Check a tree-wide hook: the sites must be exactly the declared ones, each answered."""
    served = f'{hook["replace_with"]} '
    value = hook["literal"] if not hook["replace_with"].startswith("const-string") else f'"{hook["literal"]}"'
    hits: list[str] = []
    wrong: list[str] = []
    dexes: set[str] = set()
    for name in sorted(n for n in entries if n.endswith(".dex")):
        out_dir = tmp / f"global-{hook['id']}-{name}"
        disassemble_dex(java, apktool_jar, _stage(tmp, name, entries[name]), out_dir)
        for smali in sorted(out_dir.rglob("*.smali")):
            lines = smali.read_text(encoding="utf-8").splitlines()
            for i, line in enumerate(lines):
                if not line.strip().endswith(hook["invoke"]):
                    continue
                hits.append(f"{smali.stem}:{name}")
                dexes.add(name)
                # the marker comment sits between the call and the answer
                got = "<empty>"
                for follow in lines[i + 1:]:
                    stripped = follow.strip()
                    if stripped and not stripped.startswith("#"):
                        got = stripped
                        break
                if not (got.startswith(served) and got.endswith(value)):
                    wrong.append(f"{smali.stem}:{i} -> {got!r}")
    ok = len(hits) == hook["expect"] and not wrong
    results.append(
        {
            "hook": hook["id"],
            "call_sites": len(hits),
            "expected_sites": hook["expect"],
            "replacement": [],
            "dexes": sorted(dexes),
            "ok": ok,
        }
    )
    if len(hits) != hook["expect"]:
        failures.append(f"{hook['id']}: {len(hits)} call site(s) in the built APK, {hook["expect"]} expected")
    for problem in wrong:
        failures.append(f"{hook['id']}: site not answered {problem}")


def _stage(tmp: Path, name: str, data: bytes) -> Path:
    path = tmp / f"staged-{name}"
    if not path.exists():
        path.write_bytes(data)
    return path


def load_hooks() -> list[dict]:
    hooks = []
    for path in sorted((REPO / "patches").glob("*/patch.json")):
        manifest = json.loads(path.read_text(encoding="utf-8"))
        for hook in manifest["hooks"]:
            hook["_patch"] = manifest["name"]
            hooks.append(hook)
    return hooks


def expected_first_instruction(hook: dict) -> str:
    """The first real instruction of the injected block: what must open the body."""
    for line in hook["replacement"].splitlines():
        stripped = line.strip()
        if not stripped or stripped.startswith(("#", ".locals", ".registers", ".line", ".param")):
            continue
        if stripped.startswith(":"):
            continue
        return stripped
    raise VerifyError(f"{hook['id']}: replacement has no instruction")


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("--apk", required=True, type=Path, help="built APK to verify")
    ap.add_argument("--source-apk", type=Path, help="original APK, for the entry comparison")
    ap.add_argument("--tools", type=Path, default=REPO / "tools", help="bootstrap directory")
    ap.add_argument("--json", action="store_true", help="machine-readable result")
    a = ap.parse_args()

    if not a.apk.is_file():
        raise VerifyError(f"no such APK: {a.apk}")

    java = a.tools / "jdk" / "bin" / "java"
    if not java.is_file():
        # accept an unversioned bootstrap layout too
        candidates = sorted((a.tools).glob("jdk*/bin/java"))
        if not candidates:
            raise VerifyError("no JDK under tools/ — run scripts/bootstrap.sh")
        java = candidates[0]
    apktool_jar = a.tools / "apktool.jar"
    if not apktool_jar.is_file():
        raise VerifyError("no tools/apktool.jar — run scripts/bootstrap.sh")

    hooks = load_hooks()
    results: list[dict] = []
    failures: list[str] = []

    with zipfile.ZipFile(a.apk) as apk_zip:
        entries = {i.filename: apk_zip.read(i.filename) for i in apk_zip.infolist()}

    # Which dex holds each hook's class? Ask the APK, not a guess.
    with tempfile.TemporaryDirectory(prefix="verify-apk-") as tmpdir:
        tmp = Path(tmpdir)
        for hook in hooks:
            if hook.get("kind") == "callsite-global":
                _verify_global(hook, entries, tmp, java, apktool_jar, results, failures)
                continue

            # The dex string table stores JVM descriptors, with the leading L and
            # trailing semicolon: Lcom/example/Foo;
            descriptor = f"L{hook['class']};".encode()
            candidates = [
                name for name, data in entries.items()
                if name.endswith(".dex") and descriptor in data
            ]
            # A descriptor also shows up in dex files that merely reference the class,
            # so a hit only counts once the disassembled dex really defines it.
            entry_name = None
            dex_data = None
            out_dir = None
            for name in candidates:
                probe_dir = tmp / f"probe-{hook['id']}-{name}"
                disassemble_dex(java, apktool_jar, _stage(tmp, name, entries[name]), probe_dir)
                if (probe_dir / f"{hook['class']}.smali").is_file():
                    if entry_name is not None:
                        failures.append(
                            f"{hook['id']}: class defined in both {entry_name} and {name}"
                        )
                    entry_name, dex_data, out_dir = name, entries[name], probe_dir
            if entry_name is None:
                failures.append(f"{hook['id']}: class not defined in any dex of {a.apk.name}")
                continue

            problems = dex.check_header(dex_data, entry_name) + dex.check_map(dex_data, entry_name)
            if problems:
                failures.extend(problems)

            smali_path = out_dir / f"{hook['class']}.smali"
            if not smali_path.is_file():
                failures.append(f"{hook['id']}: {smali_path.name} missing after disassembly")
                continue
            body = method_body(smali_path.read_text(encoding="utf-8"), hook["method"])
            if body is None:
                failures.append(f"{hook['id']}: method not found in the built dex")
                continue

            if hook.get("kind", "anchor") == "anchor":
                want = expected_first_instruction(hook)
                got = body[0] if body else "<empty>"
                ok = got == want
                results.append(
                    {
                        "hook": hook["id"],
                        "dex": entry_name,
                        "first_instruction": got,
                        "expected_instruction": want,
                        "ok": ok,
                    }
                )
                if not ok:
                    failures.append(
                        f"{hook['id']}: built dex starts with {got!r}, expected {want!r}"
                    )
                continue

            # Call-site hooks: the call stays, the result right after it must be the literal.
            hits = [i for i, line in enumerate(body) if line.endswith(hook["invoke"])]
            unrelated = [
                i
                for i, line in enumerate(body)
                if hook["invoke"] in line and i not in hits
            ]
            ok = len(hits) == hook["expect"] and not unrelated
            detail = []
            for i in hits:
                wanted = f'{hook["replace_with"]} '
                got = body[i + 1] if i + 1 < len(body) else "<empty>"
                good = got.startswith(wanted) and got.endswith(f'"{hook["literal"]}"')
                ok = ok and good
                detail.append(got)
                if not good:
                    failures.append(
                        f"{hook['id']}: call at {i} is followed by {got!r}, "
                        f'expected {hook["replace_with"]} "{hook["literal"]}"'
                    )
            results.append(
                {
                    "hook": hook["id"],
                    "dex": entry_name,
                    "call_sites": len(hits),
                    "expected_sites": hook["expect"],
                    "replacement": detail,
                    "ok": ok,
                }
            )
            if len(hits) != hook["expect"]:
                failures.append(
                    f"{hook['id']}: {len(hits)} call site(s) in the built dex, "
                    f"{hook['expect']} expected"
                )
            if unrelated:
                failures.append(f"{hook['id']}: {len(unrelated)} unmatched mention(s) of the call")

    # Everything except the patched dex (and the signature files) must be untouched.
    if a.source_apk:
        if not a.source_apk.is_file():
            raise VerifyError(f"no such source APK: {a.source_apk}")
        with zipfile.ZipFile(a.source_apk) as src_zip:
            src_entries = {i.filename: src_zip.read(i.filename) for i in src_zip.infolist()}
        patched_dexes = {r["dex"] for r in results if "dex" in r}
        # a global hook reports every dex it wrote to, since it names no class
        patched_dexes |= {d for r in results for d in r.get("dexes", [])}
        changed = []
        for name, data in entries.items():
            if name.startswith("META-INF/") or name.endswith((".SF", ".RSA", ".DSA")):
                continue
            if name in patched_dexes:
                continue
            if name not in src_entries:
                changed.append(f"{name} (added)")
            elif hashlib.sha256(data).hexdigest() != hashlib.sha256(src_entries[name]).hexdigest():
                changed.append(name)
        for name in src_entries:
            if name not in entries and name != "stamp-cert-sha256":
                changed.append(f"{name} (missing)")
        if changed:
            failures.append(f"unexpected differences outside the patched dex: {changed}")
        results.append({"check": "entry-comparison", "changed": changed, "ok": not changed})

    if a.json:
        print(json.dumps({"apk": str(a.apk), "results": results, "failures": failures}, indent=2))
    else:
        print(f"APK: {a.apk}")
        for r in results:
            if "hook" in r and "first_instruction" in r:
                mark = "OK  " if r["ok"] else "FAIL"
                print(f"  {mark} {r['hook']} [{r['dex']}] first instruction: {r['first_instruction']}")
            elif "hook" in r and "dex" in r:
                mark = "OK  " if r["ok"] else "FAIL"
                print(
                    f"  {mark} {r['hook']} [{r['dex']}] "
                    f"{r['call_sites']}/{r['expected_sites']} call site(s) answered: {r['replacement']}"
                )
            elif "hook" in r:
                mark = "OK  " if r["ok"] else "FAIL"
                print(
                    f"  {mark} {r['hook']} (whole tree) "
                    f"{r['call_sites']}/{r['expected_sites']} call site(s) answered"
                )
            else:
                state = "OK  " if r["ok"] else "FAIL"
                print(f"  {state} {r['check']}: {'no other entry changed' if r['ok'] else r['changed']}")
        for f in failures:
            print(f"  !! {f}")
        print("VERIFIED" if not failures else f"{len(failures)} PROBLEM(S)")

    return 1 if failures else 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except VerifyError as exc:
        print(f"error: {exc}", file=sys.stderr)
        sys.exit(2)
