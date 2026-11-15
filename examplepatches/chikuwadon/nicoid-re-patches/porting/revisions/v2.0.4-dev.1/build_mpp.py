"""Build source-only v2.0.4-dev.1 from the verified v2.0.3-dev.18 payload."""
import argparse
import hashlib
import importlib.util
import os
from pathlib import Path
import sys
from tempfile import TemporaryDirectory

VERSION = "2.0.4-dev.1"
ROOT = Path(__file__).resolve().parent
DEVELOPMENT = ROOT.parent / "v2.0.3-dev.18"
sys.path.insert(0, str(DEVELOPMENT))
spec = importlib.util.spec_from_file_location("nicoid_dev18_reused_builder", DEVELOPMENT / "build_mpp.py")
builder = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = builder
spec.loader.exec_module(builder)

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for key in ("base", "tools", "media", "output"):
        parser.add_argument("--" + key, type=Path, required=True)
    parser.add_argument("--compile-jar", type=Path, action="append", default=[])
    parser.add_argument("--ci-without-apk", action="store_true")
    args = parser.parse_args()
    if not (os.environ.get("GITHUB_ACTIONS") == "true"
            and os.environ.get("GITHUB_REF") == "refs/heads/dev"
            and args.ci_without_apk):
        parser.error("Source-only development MPP restricted to guarded dev Actions")
    if len(args.compile_jar) < 2:
        parser.error("Missing pinned compiler dependencies")
    if args.base.resolve() == args.output.resolve():
        parser.error("Do not overwrite the stable base MPP")
    if hashlib.sha256(args.base.read_bytes()).hexdigest() != builder.BASE_HASH:
        parser.error("v1.11.1 official MPP checksum mismatch")
    args.apk = None
    args.official_release = False
    builder.VERSION = VERSION
    args.output.parent.mkdir(parents=True, exist_ok=True)
    with TemporaryDirectory(prefix="nicoid-v204-dev1-") as work:
        builder.build(args, Path(work))
    print("Created development patch:", args.output)

if __name__ == "__main__":
    main()
