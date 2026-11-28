#!/usr/bin/env python3
"""Apply the smali patches declared in patches/*/patch.json to a disassembly tree.

The manifests are the single source of truth for both this pipeline and the Morphe
port, so a patch cannot silently drift between the two.

Every hook is applied by literal match and refuses to run when the target is missing or
ambiguous. That is deliberate: a patch that "sort of" applies is worse than a patch that
refuses, because the build still succeeds and the app still launches. Hooks are also
idempotent — applying twice is a no-op, not a double patch.

Two hook kinds exist:

  anchor    replaces one literal sequence of smali instructions with another. Used when the
            whole body of a method is being short-circuited.
  callsite  matches an `invoke-*` on a given method signature and replaces the `move-result*`
            that follows it, leaving the call in place. Used when the same API is read from
            several classes and every read must be answered the same way.

Usage:
  python3 scripts/apply_patches.py --decoded build/decoded
  python3 scripts/apply_patches.py --decoded build/decoded --only unlimited-words
  python3 scripts/apply_patches.py --decoded build/decoded --dry-run
  python3 scripts/apply_patches.py --decoded build/decoded --revert
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
PATCH_DIR = REPO / "patches"

RESULT_REGISTERS = r"(v\d+|p\d+)"
RESULT_OPCODES = ("move-result", "move-result-object", "move-result-wide")


class PatchError(Exception):
    """Raised when a hook cannot be applied exactly as declared."""


def load_manifests(only: str | None = None) -> list[dict]:
    manifests = []
    for path in sorted(PATCH_DIR.glob("*/patch.json")):
        manifest = json.loads(path.read_text(encoding="utf-8"))
        manifest["_path"] = path
        if only and manifest["name"] != only:
            continue
        manifests.append(manifest)
    if only and not manifests:
        raise PatchError(f"no patch named {only!r} in {PATCH_DIR}")
    return manifests


def class_file(decoded: Path, class_name: str) -> Path:
    """Locate the smali file for a class descriptor such as com/example/Foo."""
    hits = sorted(decoded.glob(f"smali*/{class_name}.smali"))
    if not hits:
        raise PatchError(f"{class_name}: no smali file found under {decoded}")
    if len(hits) > 1:
        raise PatchError(f"{class_name}: {len(hits)} smali files found, expected one")
    return hits[0]


def method_span(text: str, signature: str) -> tuple[int, int]:
    """Character span of a method body, excluding its `.method` line and `.end method`."""
    start = text.find(signature)
    if start == -1:
        raise PatchError(f"method not found: {signature.strip()}")
    body_start = text.find("\n", start) + 1
    end = text.find("\n.end method", body_start)
    if end == -1:
        raise PatchError(f"method is not terminated: {signature.strip()}")
    return body_start, end


# --------------------------------------------------------------------------- anchor hooks

def _anchor_block(hook: dict) -> str:
    return f"    # {hook['marker']}\n{hook['replacement']}    # end {hook['marker']}\n"


def apply_anchor_hook(path: Path, hook: dict, text: str, *, revert: bool) -> str:
    block, anchor = _anchor_block(hook), hook["anchor"]
    if hook["method"] not in text:
        raise PatchError(f"{hook['id']}: method not found in {path.name}")

    if revert:
        # On the way back the marker is the proof the file is patched; the anchor is gone
        # by construction, so it must not be required here.
        if block not in text:
            return "skip (not applied)"
        return text.replace(block, anchor, 1)

    if block in text:
        return "skip (already applied)"
    if anchor not in text:
        raise PatchError(
            f"{hook['id']}: anchor not found — the target class changed, the patch needs updating"
        )
    if text.count(anchor) != 1:
        raise PatchError(
            f"{hook['id']}: anchor appears {text.count(anchor)} times, expected exactly one"
        )
    return text.replace(anchor, block, 1)


# ------------------------------------------------------------------------- call-site hooks

def _callsite_pattern(hook: dict) -> re.Pattern[str]:
    """Match an invoke on the declared signature and the result move that follows it."""
    return re.compile(
        r"^(?P<indent>[ \t]*)(?P<call>invoke-[a-z/-]+ \{[^}]*\}, "
        + re.escape(hook["invoke"])
        + r")\n(?P<blank>[ \t]*\n)"
        + r"(?P<indent2>[ \t]*)(?P<opcode>move-result[a-z-]*) (?P<reg>v\d+|p\d+)\n",
        re.MULTILINE,
    )


def _callsite_value(hook: dict) -> str:
    """The operand written after the replacement opcode: quoted for strings, bare otherwise."""
    if hook["replace_with"].startswith("const-string"):
        return '"' + hook["literal"].replace('"', '\\"') + '"'
    return str(hook["literal"])


def _callsite_block(hook: dict, match: re.Match[str]) -> str:
    """The call is kept; only its result is replaced, and a marker says so."""
    return (
        f"{match.group('indent')}{match.group('call')}\n"
        f"{match.group('blank')}"
        f"{match.group('indent')}# {hook['marker']}\n"
        f"{match.group('indent2')}{hook['replace_with']} {match.group('reg')}, {_callsite_value(hook)}\n"
    )


def _callsite_revert_pattern(hook: dict) -> re.Pattern[str]:
    return re.compile(
        r"^(?P<indent>[ \t]*)# "
        + re.escape(hook["marker"])
        + r"\n(?P<indent2>[ \t]*)"
        + re.escape(hook["replace_with"])
        + r" (?P<reg>v\d+|p\d+), "
        + re.escape(_callsite_value(hook))
        + r"\n",
        re.MULTILINE,
    )


def apply_callsite_hook(path: Path, hook: dict, text: str, *, revert: bool) -> str:
    start, end = method_span(text, hook["method"])
    body = text[start:end]
    expected = hook["expect"]
    marker = f"# {hook['marker']}"

    if revert:
        if body.count(marker) < expected:
            return "skip (not applied)"
        reverted = _callsite_revert_pattern(hook).sub(
            lambda m: f"{m.group('indent2')}{hook['result']} {m.group('reg')}\n", body
        )
        if reverted == body:
            raise PatchError(f"{hook['id']}: revert produced no change")
        return text[:start] + reverted + text[end:]

    if body.count(marker) == expected:
        return "skip (already applied)"

    pattern = _callsite_pattern(hook)
    found = list(pattern.finditer(body))
    if not found:
        raise PatchError(
            f"{hook['id']}: no call to {hook['invoke']} in the method — "
            "the target class changed, the patch needs updating"
        )
    if len(found) != expected:
        raise PatchError(f"{hook['id']}: {len(found)} call site(s) found, {expected} expected")

    patched = pattern.sub(lambda match: _callsite_block(hook, match), body, count=expected)
    if patched == body:
        raise PatchError(f"{hook['id']}: replacement produced no change")
    return text[:start] + patched + text[end:]


# ------------------------------------------------------------------ global call-site hooks

def apply_callsite_global(decoded: Path, hook: dict, *, revert: bool, dry_run: bool) -> str:
    """Answer every matching call site in the whole tree, whatever class holds it.

    Used for platform APIs an app reads from vendored SDKs whose class names are obfuscated
    and change between versions: naming a class would mean re-deriving a name that carries no
    meaning. The declared `expect` is the total across the tree, so a version that adds or
    drops a site still fails loudly.
    """
    marker = f"# {hook['marker']}"
    expected = hook["expect"]
    pattern = _callsite_pattern(hook)
    revert_pattern = _callsite_revert_pattern(hook)

    files = sorted(decoded.glob("smali*/**/*.smali"))
    if not files:
        raise PatchError(f"{hook['id']}: no smali file under {decoded}")

    pending: list[tuple[Path, str]] = []
    seen = 0
    for path in files:
        text = path.read_text(encoding="utf-8")
        present = text.count(marker)
        if revert:
            if not present:
                continue
            reverted = revert_pattern.sub(
                lambda m: f"{m.group('indent2')}{hook['result']} {m.group('reg')}\n", text
            )
            if reverted == text:
                raise PatchError(f"{hook['id']}: revert produced no change in {path.name}")
            pending.append((path, reverted))
            seen += present
            continue

        found = list(pattern.finditer(text))
        if present and not found:
            # already answered here: the result move is gone, only the marker is left
            seen += present
            continue
        if not found:
            continue
        if present == len(found):
            seen += present
            continue
        pending.append((path, pattern.sub(lambda m: _callsite_block(hook, m), text)))
        seen += len(found)

    # A wrong count is a failure even when nothing is left to write: it means the target
    # moved, not that the patch is in place.
    if seen != expected:
        found_text = "no call to" if seen == 0 else f"{seen} call site(s) found"
        raise PatchError(
            f"{hook['id']}: {found_text} {hook['invoke']} across the tree, {expected} expected — "
            "the target changed, the patch needs updating"
        )
    if not pending:
        return "skip (already applied)" if not revert else "skip (not applied)"
    if not dry_run:
        for path, text in pending:
            path.write_text(text, encoding="utf-8")
    return "reverted" if revert else "applied"


# ---------------------------------------------------------------------------------- driver

def apply_hook(decoded: Path, hook: dict, *, revert: bool, dry_run: bool) -> str:
    # Manifests may declare their own marker so a patch applied by an older version of
    # this script is still recognised; otherwise the patch name and hook id are enough.
    scope = hook.get("patch", "test")
    hook = {**hook, "marker": hook.get("marker") or f"patch:{scope}:{hook['id']}"}
    kind = hook.get("kind", "anchor")
    if kind not in ("anchor", "callsite", "callsite-global"):
        raise PatchError(f"{hook['id']}: unknown hook kind {kind!r}")

    if kind == "callsite-global":
        return apply_callsite_global(decoded, hook, revert=revert, dry_run=dry_run)

    path = class_file(decoded, hook["class"])
    text = path.read_text(encoding="utf-8")
    apply = apply_anchor_hook if kind == "anchor" else apply_callsite_hook

    new_text = apply(path, hook, text, revert=revert)
    if new_text.startswith("skip"):
        return new_text
    if new_text == text:
        raise PatchError(f"{hook['id']}: produced no change")
    if not dry_run:
        path.write_text(new_text, encoding="utf-8")
    return "reverted" if revert else "applied"


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("--decoded", required=True, type=Path, help="apktool output tree")
    ap.add_argument("--only", help="apply a single patch by name")
    ap.add_argument("--dry-run", action="store_true", help="report without writing")
    ap.add_argument("--revert", action="store_true", help="undo the patches")
    a = ap.parse_args()

    if not a.decoded.is_dir():
        print(f"error: no such disassembly tree: {a.decoded}", file=sys.stderr)
        return 2

    failures = 0
    try:
        manifests = load_manifests(a.only)
    except PatchError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1

    for manifest in manifests:
        print(f"== {manifest['name']}: {manifest['title']}")
        for hook in manifest["hooks"]:
            try:
                result = apply_hook(
                    a.decoded, {**hook, "patch": manifest["name"]}, revert=a.revert, dry_run=a.dry_run
                )
            except PatchError as exc:
                print(f"  FAIL {hook['id']}: {exc}")
                failures += 1
                continue
            print(f"  ok   {hook['id']}: {result}")

    if failures:
        print(f"\n{failures} hook(s) failed — nothing was written for those", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
