import sys
from pathlib import Path

from src.core.logger import IS_GITHUB, abort


def _require_ci(script: str) -> None:
    if not IS_GITHUB:
        abort(f"'{script}' is only available in GitHub Actions")

def _parse_log_file(log: Path, green_lines: list[str], collected: list[str]) -> str:
    microg_line = ""
    lines = [ln.strip() for ln in log.read_text(encoding="utf-8").splitlines() if ln.strip()]
    for i, line in enumerate(lines):
        if line.startswith("- 🟢"):
            green_lines.append(f"{line}  ")
        elif not microg_line and line.startswith("▶️") and "MicroG" in line:
            microg_line = line
        elif line.startswith("> ⚙️ » CLI:"):
            collected.append(f"{line}  ")
        elif line.startswith("> ⚙️ » Patches:"):
            next_line = lines[i + 1] if i + 1 < len(lines) else ""
            collected.append(f"{line}  \n{next_line}  ".strip())
    return microg_line

def combine_logs(logs_dir: Path | str) -> None:
    logs = sorted(Path(logs_dir).rglob("build*.md"))
    if not logs:
        return

    green_lines: list[str] = []
    collected: list[str] = []
    microg_line = ""
    for log in logs:
        m_line = _parse_log_file(log, green_lines, collected)
        if not microg_line:
            microg_line = m_line

    if green_lines:
        print("\n".join(green_lines), end="\n\n")

    if microg_line:
        print(microg_line, end="\n\n")

    if unique := list(dict.fromkeys(collected)):
        print("\n\n".join(unique))

def main() -> None:
    _require_ci("logs.py")
    match sys.argv[1:]:
        case ["combine-logs", *args]:
            combine_logs(logs_dir=Path(args[0] if args else "logs"))
        case _:
            abort("Usage: logs.py combine-logs [dir]")

if __name__ == "__main__":
    main()