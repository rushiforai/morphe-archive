"""Extract full dexdump classes by exact DEX descriptor, including interfaces."""
import argparse
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("descriptors", nargs="+")
    parser.add_argument("--implementors", action="store_true")
    args = parser.parse_args()
    output = ROOT / "analysis/classes"
    output.mkdir(exist_ok=True)
    targets = set(args.descriptors)
    for path in (ROOT / "analysis/dexdump").glob("*.txt"):
        header, stream, descriptor = [], None, None
        with path.open(encoding="utf-8", errors="replace") as source:
            for line in source:
                if line.startswith("Class #"):
                    if stream:
                        stream.close()
                    header, stream, descriptor = [], None, None
                if stream:
                    stream.write(line)
                    continue
                header.append(line)
                match = re.search(r"Class descriptor\s+: '([^']+)'", line)
                if match:
                    descriptor = match[1]
                if line.startswith("  Static fields"):
                    matched = descriptor in targets or (args.implementors and any("'" + target + "'" in "".join(header) for target in targets))
                    if matched:
                        filename = re.sub(r"[^a-zA-Z0-9_.-]", "_", descriptor)
                        stream = (output / (filename + ".txt")).open("w", encoding="utf-8")
                        stream.writelines(header)
                        print(path.name, descriptor, flush=True)
                    header = []
                # Discard bodies of unwanted classes.
                if len(header) > 200:
                    header = []
        if stream:
            stream.close()


if __name__ == "__main__":
    main()
