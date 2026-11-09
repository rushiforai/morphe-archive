"""Find disassembled methods; output full instruction evidence and a JSON index."""
import argparse
import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
HEADER = re.compile(r"^[0-9a-f]+:.*\|\[([0-9a-f]+)\] (.+)$")


def methods(path):
    current = None
    lines = []
    with path.open(encoding="utf-8", errors="replace") as stream:
        for number, line in enumerate(stream, 1):
            match = HEADER.match(line)
            boundary = match or line.startswith("    #") or line.startswith("Class #")
            if current and boundary:
                yield current, lines
                current, lines = None, []
            if match:
                current = dict(dump=path.name, line=number, code_offset="0x" + match[1], method=match[2])
            if current:
                lines.append(line)
    if current:
        yield current, lines


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("pattern", help="Regex against method name and body")
    parser.add_argument("--name", default="candidates")
    parser.add_argument("--dump", default="*.txt", help="Limit input, e.g. classes4.txt")
    args = parser.parse_args()
    pattern = re.compile(args.pattern, re.I)
    destination = ROOT / "analysis" / args.name
    if not destination.resolve().is_relative_to((ROOT / "analysis").resolve()):
        raise SystemExit("Output must stay inside analysis")
    destination.mkdir(parents=True, exist_ok=True)
    index = []
    for path in sorted((ROOT / "analysis/dexdump").glob(args.dump)):
        for item, lines in methods(path):
            body = "".join(lines)
            if not pattern.search(body):
                continue
            evidence = f"{path.stem}_{item['code_offset']}.txt"
            (destination / evidence).write_text(body, encoding="utf-8")
            item.update(evidence=evidence, dump_sha256=hashlib.sha256(body.encode()).hexdigest(), matches=[line.strip() for line in lines if pattern.search(line)])
            index.append(item)
            print(f"{path.name}:{item['line']} {item['method']} -> {evidence}")
    (destination / "index.json").write_text(json.dumps(index, indent=2), encoding="utf-8")
    print(f"{len(index)} methods")


if __name__ == "__main__":
    main()
