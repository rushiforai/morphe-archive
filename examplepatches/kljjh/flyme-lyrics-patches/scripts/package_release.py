import argparse
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import tarfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]


def package(repository):
    config = json.loads((ROOT / "compatibility.json").read_text())
    version = config["project_version"]
    source = ROOT / f"patches/build/libs/patches-{version}.mpp"
    with zipfile.ZipFile(source) as bundle:
        if bundle.testzip() is not None:
            raise RuntimeError("Invalid bundle: corrupt ZIP entry")
        names = bundle.namelist()
        required = ["classes.dex", "io/github/kljjh/flymelyrics/FlymeLyricsPatchKt.class", "community/LICENSE", "community/NOTICE", "community/UPSTREAM.md"]
        for name in required:
            if name not in names:
                raise RuntimeError(f"Invalid bundle: missing {name}")
        dex_entries = [name for name in names if name.lower().endswith(".dex")]
        if dex_entries != ["classes.dex"] or not bundle.read("classes.dex").startswith(b"dex\n"):
            raise RuntimeError(f"Invalid bundle: expected one valid top-level DEX, got {dex_entries}")
        extensions = [n for n in names if n.endswith(".mpe")]
        if extensions != ["extensions/flyme.mpe"]:
            raise RuntimeError(f"Expected ONLY the independent Flyme extension, got {extensions}")
        if any(n.startswith("app/morphe/patches/") for n in names):
            raise RuntimeError("Official patch classes must not be bundled")
        if b"FlymeLyrics" not in bundle.read(extensions[0]):
            raise RuntimeError("Flyme runtime missing")
        manifest = bundle.read("META-INF/MANIFEST.MF").decode("utf-8", "replace")
        for attribute in ("Name:", "Version:", "Patcher-Version:"):
            if not any(line.startswith(attribute) for line in manifest.splitlines()):
                raise RuntimeError(f"Invalid bundle: manifest missing {attribute}")
        if "Name: Flyme Lyrics Add-on" not in manifest:
            raise RuntimeError("Unexpected bundle identity")
    dist = ROOT / "dist"
    dist.mkdir(exist_ok=True)
    target = dist / f"flyme-lyrics-patches-{version}.mpp"
    shutil.copy2(source, target)
    digest = hashlib.sha256(target.read_bytes()).hexdigest()
    (dist / "SHA256SUMS.txt").write_text(f"{digest}  {target.name}\n", encoding="utf-8")
    manifest = {
        "version": version,
        # Morphe's LocalDateTime parser expects an ISO timestamp without a zone suffix.
        "created_at": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S"),
        "description": f"Independent Flyme add-on. Also select Third-party lyrics from the OFFICIAL Morphe source. Tested against official {config['official_version']}. Does not bundle official patches. Device validation pending.",
        "download_url": f"https://github.com/{repository}/releases/download/v{version}/{target.name}",
        "signature_download_url": "",
        "public_key": None,
    }
    (dist / "patches-bundle.json").write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    for name in ("LICENSE", "NOTICE", "UPSTREAM.md"):
        shutil.copy2(ROOT / name, dist / name)
    # Only this independent project's corresponding source; the official fixture is excluded.
    paths = subprocess.check_output(
        ["git", "-C", str(ROOT), "ls-files", "--cached", "--others", "--exclude-standard", "-z"]
    ).decode().split("\0")
    with tarfile.open(dist / f"flyme-lyrics-patches-{version}-sources.tar.gz", "w:gz") as archive:
        for name in sorted(set(filter(None, paths))):
            path = ROOT / name
            if path.is_file():
                archive.add(path, arcname=f"flyme-lyrics-patches-{version}/{name}")
    print(f"Validated {target.name}: {digest}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--repository", default="kljjh/flyme-lyrics-patches")
    args = parser.parse_args()
    package(args.repository)
