"""Fetch the pinned official compiler classpath without GitHub Packages credentials."""
import hashlib
from pathlib import Path
import subprocess

VERSION = "1.19.1"
SHA256 = "a51472252cd63b2eac635dbb5a154ff918bfc15268da89679feb3d760230c573"
ROOT = Path(__file__).resolve().parents[1]
JAR = ROOT / ".tools" / f"morphe-desktop-{VERSION}-all.jar"


def valid(path: Path) -> bool:
    return path.is_file() and hashlib.sha256(path.read_bytes()).hexdigest() == SHA256


if not valid(JAR):
    JAR.parent.mkdir(exist_ok=True)
    temporary = JAR.with_suffix(".download")
    subprocess.run([
        "curl", "--fail", "--location", "--silent", "--show-error",
        "--output", str(temporary),
        f"https://github.com/MorpheApp/morphe-desktop/releases/download/v{VERSION}/{JAR.name}",
    ], check=True)
    if not valid(temporary):
        temporary.unlink()
        raise SystemExit("Official desktop JAR checksum mismatch")
    temporary.replace(JAR)
print(f"Verified Morphe Desktop {VERSION}: {JAR}")
