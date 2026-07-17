import os
import sys
from typing import Never

IS_GITHUB = os.getenv("GITHUB_ACTIONS") == "true"
INTERRUPTED = False


def is_interrupted() -> bool:
    return INTERRUPTED

def mark_interrupted() -> None:
    global INTERRUPTED
    INTERRUPTED = True

def _log(color: str, symbol: str, msg: str, gh_level: str | None = None) -> None:
    if IS_GITHUB and gh_level:
        print(f"::{gh_level}::{msg}", file=sys.stderr)
    else:
        print(f"\033[0;{color}m[{symbol}] {msg}\033[0m", file=sys.stderr)

def pr(msg: str) -> None:
    _log("32", "+", msg)

def epr(msg: str) -> None:
    _log("31", "-", msg, "error")

def wpr(msg: str) -> None:
    _log("33", "!", msg, "warning")

def abort(msg: str) -> Never:
    epr(f"ABORT: {msg}")
    sys.exit(1)