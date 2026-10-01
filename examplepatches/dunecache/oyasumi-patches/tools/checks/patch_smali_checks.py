"""Static checks for the patch sources, runnable without a device or an APK.

Two classes of defect have shipped five broken releases in a row, and neither is caught
by compiling, because both are correct Kotlin producing wrong smali:

1. **Invoke arity.** An inserted 35c invoke's register list must name the receiver plus
   every declared argument. Passing only the receiver assembles cleanly, compiles, and
   is rejected by the verifier at class-load time. `check_invoke_arity` derives the
   required register count from the target method's own descriptor.

2. **Helper call shape.** `replaceInstructions` removes as many instructions as the
   replacement list is long, so a hand-written `nop` block that is meant to erase one
   invoke silently deletes the instructions after it. `check_replace_instructions` flags
   every call whose replacement is longer than what the comment claims to replace.

Fingerprint resolution needs a pinned APK and is handled by `verify_fingerprints.py`.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

#: a descriptor like (Ljava/lang/String; I J)V, split into parameter types
DESC = re.compile(r"^\((.*)\)(.*)$")


def parse_descriptor(desc: str) -> tuple[list[str], str]:
    """Split a method descriptor into its parameter types and return type."""
    m = DESC.match(desc)
    if not m:
        raise ValueError(f"not a method descriptor: {desc!r}")
    params = m.group(1)
    out: list[str] = []
    i = 0
    while i < len(params):
        start = i
        while params[i] == "[":
            i += 1
        if params[i] == "L":
            i = params.index(";", i) + 1
        else:
            i += 1
        out.append(params[start:i])
    return out, m.group(2)


def is_reference(descriptor: str) -> bool:
    """True when a type is an object or array, i.e. occupies a register as a reference."""
    return descriptor.startswith("L") or descriptor.startswith("[")


def smali_registers(text: str) -> list[str]:
    """Registers named in a smali 35c/3rc register list, e.g. `{v5, v0}`."""
    m = re.search(r"\{([^}]*)\}", text)
    if not m:
        return []
    return [r.strip() for r in m.group(1).split(",") if r.strip()]


#: `invoke-virtual {v5, v0}, Landroid/view/View;->setVisibility(I)V`
INVOKE = re.compile(
    r"invoke-\S+\s*\{([^}]*)\}\s*,\s*"
    r"(L[^;]+;)->([^\s(]+)\(([^)]*)\)([^\s]*)"
)

#: a bare `invoke-kind v0, v0, L...;->m()V` with no register list
INVOKE_NO_LIST = re.compile(
    r"invoke-\S+\s+((?:v\d+\s*,\s*)*v\d+)\s*,\s*"
    r"(L[^;]+;)->([^\s(]+)\(([^)]*)\)([^\s]*)"
)


def string_concat_in(src: str) -> list[tuple[int, str]]:
    """Reassemble Kotlin string concatenations into the smali text they produce.

    A patch body builds its smali as `"const/16 v0, 0x8\n" + "invoke-virtual {v5}, ..."`,
    so the smali only exists after the concatenation is folded. Literal interpolation of
    a `const` is preserved verbatim, which is enough for arity because only the register
    list matters.
    """
    out: list[tuple[int, str]] = []
    for m in re.finditer(r'"((?:[^"\\]|\\.)*)"', src):
        pass
    # fold adjacent "..." + "..." chains
    for m in re.finditer(r'"((?:[^"\\\n]|\\.)*)"\s*(?:\+\s*\n?\s*"((?:[^"\\\n]|\\.)*)")+', src):
        parts = re.findall(r'"((?:[^"\\\n]|\\.)*)"', m.group(0))
        if len(parts) > 1:
            out.append((m.start(), "".join(unescape(p) for p in parts)))
    return out


def unescape(text: str) -> str:
    """Apply Kotlin's string escapes, including `\\$` for a literal dollar sign.

    `unicode_escape` is not usable here: it treats `\\$` as an invalid escape and warns,
    and it would mangle any non-ASCII character in a string. Only the escapes that can
    actually appear in a patch's smali are handled.
    """
    out: list[str] = []
    i = 0
    while i < len(text):
        c = text[i]
        if c == "\\" and i + 1 < len(text):
            nxt = text[i + 1]
            out.append({"n": "\n", "t": "\t", "r": "\r", "\\": "\\", "\"": "\"", "$": "$"}.get(nxt, "\\" + nxt))
            i += 2
            continue
        out.append(c)
        i += 1
    return "".join(out)


def check_invoke_arity(path: Path, constants: dict[str, str] | None = None) -> list[str]:
    """Every inserted invoke must name the receiver plus each declared argument.

    Register names in the source are interpolated (`{v$receiver, $VISIBILITY_REGISTER}`),
    so the real count has to come from the *shape* of the list rather than from the
    literal text: a `$NAME` or `v$NAME` entry is one register whatever it expands to.
    That is enough for arity, which is a count and not a value.
    """
    problems: list[str] = []
    src = path.read_text(encoding="utf-8")
    for offset, smali in string_concat_in(src):
        # the folded text is one logical smali program; join before splitting so an
        # invoke whose reference sits on the next source line is still one instruction
        for line in smali.splitlines():
            line = line.strip()
            if not line.startswith("invoke-"):
                continue
            m = INVOKE.search(line) or INVOKE_NO_LIST.search(line)
            if not m:
                continue
            named = smali_registers(line)
            if not named:
                # bare form: count the comma separated registers before the reference
                named = [r.strip() for r in m.group(1).split(",") if r.strip()]
            params_text = m.group(4)
            # The parameter list has to be split by the descriptor grammar, not on
            # whitespace. `Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I`
            # is one token with no space in it, so a whitespace split reported one
            # argument for a two-argument call and demanded a register the call does
            # not have. `parse_descriptor` already walks the grammar correctly.
            params, _ret = parse_descriptor(f"({params_text})V")
            # A long or double is named once in the register list but is *counted* twice,
            # so it adds a register rather than removing one. AOSP's
            # `MethodVerifierImpl::SetTypesFromSignature` seeds `expected_args` from the
            # instruction's own `ins_size` with the comment "long/double count as two",
            # and `VerifyInvocationArgsFromIterator` advances
            # `sig_registers += reg_type.IsLongOrDoubleTypes() ? 2 : 1` and then rejects
            # any invoke whose encoded register-list count differs. So `z(J)V` needs two
            # registers and `z(JI)V` needs three. Subtracting the wide count, as this
            # check did until the Djezzy work, happens to be right for no signature a
            # patch is likely to contain, which is why it never showed up before.
            wide = sum(1 for p in params if p in ("J", "D"))
            # `invoke-static` has no receiver, so it needs one register per argument and
            # nothing more. Every other invoke kind takes the receiver as its first
            # register. Verified against the 3.0.9 DEX, where the app's own code calls
            # `Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;` with a single
            # register: `invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)...`. Counting
            # a receiver for it reported a correct line as an error, and "fixing" the
            # patch to satisfy the count would have put a second register in a static call
            # and broken the build for real.
            kind = line.split(None, 1)[0]
            has_receiver = not kind.startswith("invoke-static")
            required = len(params) + wide + (1 if has_receiver else 0)
            shape = "receiver + arguments" if has_receiver else "arguments, no receiver"
            if len(named) != required:
                problems.append(
                    f"{path.name}:{offset}: `{line[:64]}` names {len(named)} "
                    f"register(s) but {m.group(2)}->{m.group(3)} declares "
                    f"{len(params)} argument(s) and needs {required} ({shape})")
    return problems


def check_replace_instructions(path: Path) -> list[str]:
    """`replaceInstructions` deletes as many instructions as the list is long.

    A single 35c invoke is three code units, and padding it back out to three `nop`s
    keeps the method size identical -- which is exactly why the mistake is invisible.
    Width preservation is necessary but not sufficient: the helper also removes the two
    instructions that follow. Each of those shipped a launch crash.
    """
    problems: list[str] = []
    src = path.read_text(encoding="utf-8")
    for m in re.finditer(r"replaceInstructions\(", src):
        # take the balanced argument list so nested parens do not truncate the match
        i = m.end() - 1
        depth = 0
        for j in range(i, len(src)):
            if src[j] == "(":
                depth += 1
            elif src[j] == ")":
                depth -= 1
                if depth == 0:
                    break
        else:
            continue
        arg = src[i:j + 1]
        line = src[: m.start()].count("\n") + 1
        # the replacement is one or more string literals holding newline-separated smali,
        # so count instructions in the folded text rather than occurrences of a quote
        folded = "".join(re.findall(r'"((?:[^"\\\n]|\\.)*)"', arg))
        nops = len([w for w in re.split(r"\\n|\s+", folded) if w == "nop"])
        if nops > 1:
            problems.append(
                f"{path.name}:{line}: replaceInstructions with a {nops}-instruction "
                f"replacement also removes the {nops - 1} instruction(s) after the "
                f"target. To erase one invoke while keeping the width, use "
                f"removeInstruction(index) followed by addInstructions(index, nops).")
    return problems


def _declared_names(src: str) -> set[str]:
    """Every identifier a Kotlin template in this file could legitimately resolve to."""
    body = "\n".join(l for l in src.split("\n") if not l.strip().startswith("//"))
    names: set[str] = set()
    names |= set(re.findall(r"\b(?:val|var)\s+(\w+)", body))
    names |= set(re.findall(r"\bconst\s+val\s+(\w+)", body))
    # a destructuring `val (field, register) = ...` names every component
    for group in re.findall(r"\bval\s*\(([^)]*)\)\s*=", body):
        names |= {n.strip() for n in group.split(",") if n.strip()}
    for params in re.findall(r"\bfun\s+\w+\s*\(([^)]*)\)", body, re.S):
        for part in params.split(","):
            token = part.split(":")[0].split("=")[0].strip()
            names |= set(re.findall(r"\w+", token))
    names |= {l.split(".")[-1].strip() for l in src.split("\n") if l.startswith("import ")}
    names |= set(re.findall(r"\bobject\s+(\w+)", body))
    return names


def check_dollar_in_strings(path: Path) -> list[str]:
    """A `$name` in a string that resolves to nothing is a compile error, not a bug.

    `Lio/flutter/plugin/common/EventChannel$EventSink;` is a type descriptor with a
    nested class, so a patch that references it naturally writes the `$` unescaped and
    Kotlin resolves `$EventSink` as a template expression over a name the file does not
    declare. The Djezzy patch did exactly this in three places and failed
    `:patches:compileKotlin` with `Unresolved reference 'EventSink'`.

    This is a compile error rather than a smali defect, so nothing else here can see it:
    the file never gets as far as assembling, and `check_invoke_arity` is reading text
    that will not be built. Deliberate templates are fine and are not reported -- only a
    name that resolves to nothing, which the file's own declarations rule out.
    """
    problems: list[str] = []
    src = path.read_text(encoding="utf-8")
    declared = _declared_names(src)
    for m in re.finditer(r'"((?:[^"\\]|\\.)*)"', src):
        content = m.group(1).replace("${'$'}", "")
        for hit in re.finditer(r"(?<!\\)\$(?:\{(\w+)\}|(\w+))", content):
            name = hit.group(1) or hit.group(2)
            if name in declared:
                continue
            line = src[: m.start(1) + hit.start()].count("\n") + 1
            problems.append(
                f"{path.name}:{line}: `${name}` inside a string literal is a Kotlin "
                f"template, and nothing in this file declares `{name}`. A nested type "
                f"descriptor such as Lio/flutter/plugin/common/EventChannel$EventSink; "
                f"has to be written with an escaped dollar sign, 'EventChannel\\$EventSink;', "
                f"so the dollar survives into the smali."
            )
    return problems


def check_imports(path: Path) -> list[str]:
    """Every import must be used, and every Morphe helper used must be imported.

    An import removed on the assumption that it had become unused is a silent build
    break, and CI only finds it at `:patches:compileKotlin`, after semantic-release has
    already started. Counting occurrences over the whole file is not enough: the name
    also appears in the import line and in prose, so usage is measured against the body
    alone.
    """
    problems: list[str] = []
    text = path.read_text(encoding="utf-8")
    lines = text.split("\n")
    imports = [l for l in lines if l.startswith("import ")]
    body = "\n".join(l for l in lines if not l.startswith("import "))
    imported = {l.split(".")[-1].strip() for l in imports}

    for l in imports:
        sym = l.split(".")[-1].strip()
        if not re.search(r"\b" + re.escape(sym) + r"\b", body):
            line = text[: text.index(l)].count("\n") + 1
            problems.append(f"{path.name}:{line}: import {sym!r} is unused")

    for name in sorted(n for n in _MORPHE_API if re.search(r"\b" + n + r"\s*\(", body)):
        if name in imported or name in _locals_defined(body):
            continue
        problems.append(f"{path.name}: {name!r} is called but not imported")
    return problems


#: Only the top-level functions and extension helpers. `Fingerprint`, `bytecodePatch`,
#: `compatibleWith` and the `InstructionLocation` factories resolve through the patcher
#: DSL's own imports, so including them produced false positives on files that compile.
_MORPHE_API = frozenset({
    "fieldAccess", "methodCall", "string", "literal", "opcode",
    "addInstruction", "addInstructions", "removeInstruction", "removeInstructions",
    "replaceInstruction", "replaceInstructions", "getInstruction",
    "addInstructionsWithLabels",
})


def _locals_defined(body: str) -> set[str]:
    """Names this file defines itself, so they need no import."""
    out: set[str] = set()
    for m in re.finditer(r"\b(?:val|var|fun|object|class)\s+([A-Za-z_][A-Za-z0-9_]*)",
                         body):
        out.add(m.group(1))
    for m in re.finditer(r"\b([A-Za-z_][A-Za-z0-9_]*)\s*\{", body):
        out.add(m.group(1))
    return out


def main() -> int:
    root = Path(__file__).resolve().parents[2] / "patches/src/main/kotlin"
    if not root.is_dir():
        print(f"no patch sources at {root}")
        return 0
    problems: list[str] = []
    for path in sorted(root.rglob("*.kt")):
        problems += check_invoke_arity(path)
        problems += check_replace_instructions(path)
        problems += check_dollar_in_strings(path)
        problems += check_imports(path)
    for p in problems:
        print("  FAIL", p)
    print(f"checked {len(list(root.rglob('*.kt')))} file(s): "
          f"{len(problems)} problem(s)")
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
