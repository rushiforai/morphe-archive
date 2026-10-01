"""Run the static checks against a historical revision of the patch sources.

Usage:  python3 tools/checks/replay_history_check.py <rev> [<rev> ...]

Each rev is checked out with `git archive` into a scratch tree and every Kotlin file in
it is run through the same checks CI would run, so a check that would have caught a
shipped crash can be shown to catch it.
"""
from __future__ import annotations

import pathlib
import subprocess
import sys
import tempfile

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
from patch_smali_checks import (  # noqa: E402
    check_invoke_arity, check_replace_instructions,
)

REPO = pathlib.Path(__file__).resolve().parents[2]


def check_rev(rev: str) -> list[str]:
    with tempfile.TemporaryDirectory() as tmp:
        dest = pathlib.Path(tmp)
        subprocess.run(
            ["git", "-C", str(REPO), "archive", rev, "patches/src/main/kotlin"],
            check=True, stdout=subprocess.PIPE,
        )
        blob = subprocess.run(
            ["git", "-C", str(REPO), "archive", rev, "patches/src/main/kotlin"],
            check=True, stdout=subprocess.PIPE,
        ).stdout
        import io
        import tarfile
        with tarfile.open(fileobj=io.BytesIO(blob)) as tf:
            tf.extractall(dest)
        root = dest / "patches/src/main/kotlin"
        problems: list[str] = []
        for path in sorted(root.rglob("*.kt")):
            problems += check_invoke_arity(path)
            problems += check_replace_instructions(path)
        return problems


def main() -> int:
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    worst = 0
    for rev in sys.argv[1:]:
        subject = subprocess.run(
            ["git", "-C", str(REPO), "log", "-1", "--format=%s", rev],
            stdout=subprocess.PIPE, text=True).stdout.strip()
        problems = check_rev(rev)
        print(f"{rev}  {subject}")
        for p in problems:
            print("   FAIL", p[:130])
        print(f"   -> {len(problems)} problem(s)")
        worst = max(worst, len(problems))
    return 0


if __name__ == "__main__":
    sys.exit(main())
