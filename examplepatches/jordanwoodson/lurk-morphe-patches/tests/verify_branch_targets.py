#!/usr/bin/env python3
"""Check that every branch in a patched APK's hooked methods lands on an instruction.

A smali snippet with a label of its own, added through the patcher's plain addInstructions at an index
other than 0, keeps the label's address relative to the snippet: the branch then points into the middle
of an earlier instruction, ART's verifier rejects the whole class, and the app crashes where that class
is first used (issue 49, Chat overlay in the vertical theatre). The patcher reports nothing. This reads
the APK's dex files with dexdump and, for every method that calls into Lurk's extension, checks that
each if-*, goto and switch target is the address of an instruction of that method.

Usage: python3 -I tests/verify_branch_targets.py <patched.apk>
bin/verify-hooks runs it after the extension-call check. Needs dexdump from the Android build-tools.
"""
import re
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from verify_extension_calls import EXTENSION, dexdump  # noqa: E402

INSTRUCTION = re.compile(r"^\s*[0-9a-f]+:\s+.*?\|([0-9a-f]{4}): (.*)$")
BRANCH = re.compile(r"^(?:if-\w+|goto(?:/\d+)?|packed-switch|sparse-switch) .*?\b([0-9a-f]{4,8}) // [+-]")
PAYLOAD_TARGET = re.compile(r"^\s+(?:#\d+|-?\d+|0x[0-9a-f]+)\s*(?:->|:)\s*([0-9a-f]{4,8}) // [+-]")


def check(apk):
    bad = []
    methods = 0
    tool = dexdump()
    with tempfile.TemporaryDirectory() as tmp, zipfile.ZipFile(apk) as z:
        for name in z.namelist():
            if not re.fullmatch(r"classes\d*\.dex", name):
                continue
            path = Path(tmp) / name
            path.write_bytes(z.read(name))
            out = subprocess.run([tool, "-d", str(path)], capture_output=True, text=True, errors="replace").stdout
            cls = method = None
            offsets = set()
            targets = []
            hooked = False

            def finish():
                nonlocal methods
                if method and hooked:
                    methods += 1
                    for target, text in targets:
                        if target not in offsets:
                            bad.append(f"{cls}->{method}: {text.strip()} (no instruction at {target:04x})")

            for line in out.splitlines():
                m = re.match(r"\s+Class descriptor\s+:\s+'(L[^']+;)'", line)
                if m:
                    finish()
                    cls, method, offsets, targets, hooked = m.group(1), None, set(), [], False
                    continue
                m = re.match(r"\s+name\s+:\s+'([^']+)'", line)
                if m:
                    finish()
                    method, offsets, targets, hooked = m.group(1), set(), [], False
                    continue
                m = INSTRUCTION.match(line)
                if m:
                    offset, text = int(m.group(1), 16), m.group(2)
                    offsets.add(offset)
                    if EXTENSION in text and "invoke" in text:
                        hooked = True
                    b = BRANCH.match(text)
                    if b:
                        targets.append((int(b.group(1), 16), text))
                    continue
                m = PAYLOAD_TARGET.match(line)
                if m and method:
                    targets.append((int(m.group(1), 16), line))
            finish()
    return methods, bad


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    methods, bad = check(sys.argv[1])
    for problem in bad:
        print("BAD  " + problem)
    if bad:
        sys.exit(f"FAIL: {len(bad)} branch(es) into the middle of an instruction in {methods} hooked methods")
    print(f"PASS every branch of {methods} hooked methods lands on an instruction")


if __name__ == "__main__":
    main()
