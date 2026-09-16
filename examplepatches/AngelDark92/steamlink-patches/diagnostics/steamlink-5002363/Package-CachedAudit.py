"""Package already compiled, tested source plus freshly assembled extensions as a local MPP.

This does not replace the release build. Run Compile-CachedAudit.ps1 first.
"""
from pathlib import Path
import argparse
import hashlib
import json
import re
import time
import zipfile

parser = argparse.ArgumentParser()
parser.add_argument("compiled", type=Path)
args = parser.parse_args()
root = Path(__file__).resolve().parents[2]
compiled = args.compiled.resolve()
assert (compiled / "runtime-classpath.txt").is_file()
assert list((compiled / "test-results").glob("TEST-*.xml")), "Missing JUnit results"
for report in (compiled / "test-results").glob("TEST-*.xml"):
    import xml.etree.ElementTree as ET
    suite = ET.parse(report).getroot()
    assert int(suite.get("failures", 0)) == int(suite.get("errors", 0)) == 0
version = re.search(r"(?m)^version\s*=\s*(\S+)", (root / "gradle.properties").read_text()).group(1)
patcher = re.search(r'morphe-patcher\s*=\s*"([^"]+)"', (root / "gradle/libs.versions.toml").read_text()).group(1)
fields = {
    "Manifest-Version": "1.0", "Name": "Steam Link GalaxyXR Patches",
    "Description": "Steam Link Galaxy XR patches with exact 2.0.23/5002363 adaptation",
    "Version": version, "Timestamp": str(int(time.time() * 1000)),
    "Source": "https://github.com/AngelDark92/steamlink-patches", "Author": "AngelDark92",
    "Contact": "na", "Website": "na", "License": "GPLv3", "Patcher-Version": patcher,
}
lines = []
for key, value in fields.items():
    line = f"{key}: {value}"
    while len(line) > 70:
        lines.append(line[:70])
        line = " " + line[70:]
    lines.append(line)
manifest = ("\r\n".join(lines) + "\r\n\r\n").encode("ascii")
output = root / f"patches/build/libs/patches-{version}-5002363-local.mpp"
assert not output.exists(), f"Refusing to overwrite {output}"
output.parent.mkdir(parents=True, exist_ok=True)
entries = {"META-INF/MANIFEST.MF": manifest}
for source, classes_only in [(compiled / "classes", True),
                             (root / "patches/src/main/resources", False),
                             (compiled / "resources", False)]:
    for path in sorted(source.rglob("*")):
        if not path.is_file() or (classes_only and path.suffix not in (".class", ".kotlin_module")):
            continue
        name = path.relative_to(source).as_posix()
        assert name not in entries, f"Duplicate archive entry: {name}"
        entries[name] = path.read_bytes()
for name in ("extension.mpe", "minimal-extension.mpe", "battery-extension.mpe"):
    assert entries[f"extensions/{name}"].startswith(b"dex\n")
with zipfile.ZipFile(output, "w", zipfile.ZIP_DEFLATED) as archive:
    for name, content in entries.items():
        archive.writestr(name, content)
summary = {"path": str(output), "sha256": hashlib.sha256(output.read_bytes()).hexdigest(),
           "entries": len(entries), "version": version, "build": "cached Kotlin/Morphe local audit; not Gradle release"}
(compiled / "bundle.json").write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
print(json.dumps(summary, indent=2))
