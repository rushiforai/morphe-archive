"""Download the pinned tools used by build_mpp.py and the JVM checks."""
import concurrent.futures
import hashlib
import json
from pathlib import Path
from urllib.request import urlretrieve

ROOT = Path(__file__).resolve().parent


def fetch(item):
    path = ROOT / item["path"]
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.is_file() and hashlib.sha256(path.read_bytes()).hexdigest() == item["sha256"]:
        return
    temporary = path.with_suffix(path.suffix + ".download")
    urlretrieve(item["url"], temporary)
    if hashlib.sha256(temporary.read_bytes()).hexdigest() != item["sha256"]:
        raise ValueError(f"Checksum mismatch: {path.name}")
    temporary.replace(path)


if __name__ == "__main__":
    with concurrent.futures.ThreadPoolExecutor(max_workers=6) as pool:
        list(pool.map(fetch, json.loads((ROOT / "tool-dependencies.lock.json").read_text())))
