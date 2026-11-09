"""Preserve APKM evidence and extract only into the workspace (stdlib only)."""
import hashlib
import json
from pathlib import Path
import zipfile

ROOT = Path(__file__).resolve().parents[1]
EXPECTED = "9beffe7bc0581ad677477b164c6b11a9c5d9434b56620954776eddbb89b83e57"


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def main():
    inputs = list(ROOT.glob("*.apkm"))
    if len(inputs) != 1:
        raise SystemExit("Expected exactly one APKM in workspace root")
    source = inputs[0]
    data = source.read_bytes()
    digest = sha256(data)
    if digest != EXPECTED:
        raise SystemExit(f"Unexpected input SHA-256: {digest}")
    out = ROOT / "analysis"
    extracted = out / "input"
    extracted.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(source) as archive:
        bad = archive.testzip()
        if bad:
            raise SystemExit(f"ZIP CRC failure: {bad}")
        info = json.loads(archive.read("info.json"))
        entries = []
        for item in archive.infolist():
            target = (extracted / item.filename).resolve()
            if not target.is_relative_to(extracted.resolve()):
                raise SystemExit("Unsafe archive path")
            if item.is_dir():
                continue
            contents = archive.read(item)
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(contents)
            entries.append(dict(name=item.filename, size=len(contents), sha256=sha256(contents)))
    dexdir = out / "dex"
    dexdir.mkdir(exist_ok=True)
    dex = []
    with zipfile.ZipFile(extracted / "base.apk") as base:
        for name in base.namelist():
            if name.startswith("classes") and name.endswith(".dex") and "/" not in name:
                contents = base.read(name)
                (dexdir / name).write_bytes(contents)
                dex.append(dict(name=name, size=len(contents), sha256=sha256(contents)))
    evidence = dict(input=source.name, size=len(data), sha256=digest, info=info, entries=entries, dex=dex)
    (out / "inventory.json").write_text(json.dumps(evidence, indent=2, ensure_ascii=False), encoding="utf-8")
    print(json.dumps(dict(size=len(data), sha256=digest, info=info, apk_count=sum(e['name'].endswith('.apk') for e in entries), dex=dex), indent=2, ensure_ascii=True))


if __name__ == "__main__":
    main()
