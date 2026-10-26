#!/usr/bin/env python3
"""Verify the billing regression against apktool-decoded original and candidate APKs.

Usage: python3 tools/check-infinity-billing-state.py ORIGINAL_SMALI FIXED_SMALI
Decode both with apktool d -r --no-debug-info first. No credentials are needed.
"""
import re
import sys
from pathlib import Path


def methods(text):
    return re.findall(r"^\.method[^\n]*\n.*?^\.end method", text, re.M | re.S)


def wrapper(root):
    login = next(root.glob("smali*/ml/docilealligator/infinityforreddit/activities/LoginActivity.smali"))
    create = next(m for m in methods(login.read_text()) if " onCreate(" in m.splitlines()[0])
    reads = re.findall(r"iget-byte \w+, \w+, (L[^;]+;)->([^:]+):B", create)
    assert len(reads) == 2 and len(set(reads)) == 1, "Login billing-state contract changed"
    owner, field = reads[0]
    path = next(root.glob(f"smali*/{owner[1:-1]}.smali"))
    content = path.read_text()
    ctor = next(m for m in methods(content) if " <init>()V" in m.splitlines()[0])
    setters = [m for m in methods(content) if re.search(r"\w+\(I\)V$", m.splitlines()[0])
               and f"{owner}->{field}:B" in m]
    assert len(setters) == 1
    return ctor, setters[0]


def evaluate(body, incoming=None):
    """Execute the small, straight-line wrapper while tracking byte and LiveData values."""
    values = {"p1": incoming}
    pending = None
    state = observed = None
    for raw in body.splitlines()[1:]:
        line = raw.strip()
        if not line or line.startswith((".", "#")):
            continue
        constant = re.match(r"const(?:/4|/16)? (\w+), (0x[\da-f]+|\d+)", line)
        if constant:
            values[constant[1]] = int(constant[2], 0)
        elif line.startswith("new-instance "):
            values[line.split()[1].rstrip(",")] = "object"
        elif line.startswith("iget-object "):
            values[line.split()[1].rstrip(",")] = "observable"
        elif line.startswith("invoke-"):
            registers = re.search(r"\{([^}]+)\}", line)
            regs = [] if registers is None else registers[1].split(", ")
            if "Ljava/lang/Integer;->valueOf(I)" in line:
                pending = values[regs[0]]
            elif "-><init>(Ljava/lang/Object;)V" in line or "->i(Ljava/lang/Object;)V" in line:
                observed = values[regs[1]]
            elif "Ljava/lang/Object;-><init>()V" not in line:
                raise AssertionError(f"Unexpected wrapper call: {line}")
        elif line.startswith("move-result-object "):
            values[line.split()[1]] = pending
        elif line.startswith("iput-byte "):
            state = values[line.split()[1].rstrip(",")]
        elif line.startswith(("iput-object ", "return-void")):
            pass
        else:
            raise AssertionError(f"Unexpected wrapper instruction: {line}")
    return state, observed


def main():
    original, fixed = map(Path, sys.argv[1:])
    before_ctor, before_setter = wrapper(original)
    after_ctor, after_setter = wrapper(fixed)
    assert evaluate(before_ctor) == (4, 4), "Original no-subscription state not reproduced"
    assert evaluate(before_setter, 8) == (8, 8), "Original expired-subscription state not reproduced"
    assert evaluate(after_ctor) == (1, 1), "Fresh install must initialize byte and observer consistently"
    for incoming in range(9):
        assert evaluate(after_setter, incoming) == (1, 1), f"Callback {incoming} reintroduced a gate"
    # Both independent checks in 8.3.4 reject state 4/8. The patched local state must pass both.
    for state in (evaluate(after_ctor)[0], *(evaluate(after_setter, n)[0] for n in range(9))):
        assert state not in (4, 8), "Login, BaseActivity or account picker would still reject the state"
    print("PASS: original regression reproduced; fresh install and callbacks 0–8 preserve byte/observer=1")


if __name__ == "__main__":
    main()
