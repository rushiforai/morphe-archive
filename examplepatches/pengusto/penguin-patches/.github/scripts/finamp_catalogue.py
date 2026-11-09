"""Read the Finamp patch declarations and fail early if their composition disagrees."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / "patches/src/main/kotlin/io/github/pengusto/patches/finamp"

def catalogue(source=SOURCE):
    features = (source / "FinampNativePatch.kt").read_text(encoding="utf-8")
    compact = (source / "FinampCompactPatch.kt").read_text(encoding="utf-8")
    composition = (source / "FinampComposition.kt").read_text(encoding="utf-8")
    entries = re.findall(r'val\s+\w+\s*=\s*finampFeature\(\s*"([^"\n]+)"\s*,\s*"[^"\n]*"\s*,\s*(\d+)\s*,\s*\)', features)
    if not entries or len(entries) != len(re.findall(r'=\s*finampFeature\(', features)):
        raise ValueError("Cannot read every Finamp feature declaration")
    names = [name for name, _ in entries]
    bits = [int(bit) for _, bit in entries]
    if len(set(names)) != len(names) or len(set(bits)) != len(bits) or any(bit <= 0 or bit > 128 or bit & (bit - 1) for bit in bits):
        raise ValueError("Finamp features must have unique names and single-bit masks")
    mask_match = re.findall(r'^internal const val FINAMP_COMPLETE_MASK = (\d+)$', composition, re.MULTILINE)
    name_match = re.findall(r'^    name = "([^"\n]+)",$', compact, re.MULTILINE)
    if len(mask_match) != 1 or int(mask_match[0]) != sum(bits) or len(name_match) != 1:
        raise ValueError("Finamp Complete name or mask does not match the individual features")
    if "applyFinampComposition(FINAMP_COMPLETE_MASK)" not in compact:
        raise ValueError("Finamp Complete must use the declared mask")
    masks = {sum(bit for i, bit in enumerate(bits) if subset & (1 << i)) for subset in range(1, 1 << len(bits))}
    return name_match[0], names, int(mask_match[0]), masks

def check_resources(root=ROOT):
    _, _, _, masks = catalogue()
    resources = root / "patches/src/main/resources/finamp/1.0.1"
    delta_dir = resources / "arm64-v8a"
    paths = list(delta_dir.glob("*.pfd"))
    actual = {p.name for p in paths if p.is_file()}
    expected = {f"{mask}.pfd" for mask in masks}
    if actual != expected or len(paths) != len(actual) or any(p.stat().st_size == 0 for p in paths):
        raise ValueError(f"Finamp payload matrix mismatch: missing {sorted(expected - actual)}, unexpected {sorted(actual - expected)}, or empty payload")
    manifest = (resources / "manifest.properties").read_text(encoding="utf-8")
    for mask in masks:
        prefix = f"abi.arm64-v8a.mask.{mask}."
        for suffix in ("sha256", "size", "resource"):
            if len(re.findall(r"^" + re.escape(prefix + suffix) + r"=.+$", manifest, re.MULTILINE)) != 1:
                raise ValueError(f"Missing or duplicate Finamp manifest entry: {prefix}{suffix}")

def main():
    import argparse
    import json
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--metadata", type=Path)
    args = parser.parse_args()
    name, names, mask, masks = catalogue()
    check_resources()
    if args.metadata:
        data = json.loads(args.metadata.read_text(encoding="utf-8"))
        patches = [p for p in data["patches"] if any(c.get("packageName") == "com.unicornsonlsd.finamp" for c in p.get("compatiblePackages", []))]
        if len(patches) != 1 or patches[0]["name"] != name:
            raise ValueError("Combined bundle must expose exactly the current Finamp Complete patch")
    print(f"Finamp catalogue: {name}, {len(names)} features, {len(masks)} combinations, mask {mask}")

if __name__ == "__main__":
    main()
