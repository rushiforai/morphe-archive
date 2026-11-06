#!/usr/bin/env python3
import argparse
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parents[1]
GRADLE = ROOT / "gradle.properties"
POLICY = ROOT / "compatibility/version-policy.json"

parser = argparse.ArgumentParser(description="Bump the WhatsApp Morphe patch version.")
parser.add_argument("--stable", action="store_true", help="Promote the current dev version to stable.")
args = parser.parse_args()

text = GRADLE.read_text(encoding="utf-8")
match = re.search(r"(?m)^version\s*=\s*([^\s]+)\s*$", text)
if not match:
    raise SystemExit("ERROR: version not found in gradle.properties")
current = match.group(1)

if args.stable:
    m = re.fullmatch(r"(\d+\.\d+\.\d+)-dev\.(\d+)", current)
    if not m:
        raise SystemExit("ERROR: --stable requires a development version such as 1.0.5-dev.3")
    new = m.group(1)
else:
    m = re.fullmatch(r"(\d+)\.(\d+)\.(\d+)-dev\.(\d+)", current)
    if m:
        new = f"{m.group(1)}.{m.group(2)}.{m.group(3)}-dev.{int(m.group(4)) + 1}"
    else:
        m = re.fullmatch(r"(\d+)\.(\d+)\.(\d+)", current)
        if not m:
            raise SystemExit(f"ERROR: unsupported version format: {current}")
        new = f"{m.group(1)}.{m.group(2)}.{int(m.group(3)) + 1}-dev.1"

GRADLE.write_text(
    text[:match.start(1)] + new + text[match.end(1):],
    encoding="utf-8",
)

policy = json.loads(POLICY.read_text(encoding="utf-8"))
policy["current"] = new
stable = re.sub(r"-dev\.\d+$", "", new)
policy["nextStable"] = stable
POLICY.write_text(json.dumps(policy, indent=2) + "\n", encoding="utf-8")

print(f"{current} -> {new}")
