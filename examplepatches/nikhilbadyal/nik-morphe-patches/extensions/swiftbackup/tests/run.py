#!/usr/bin/env python3
"""Run restart/storage regressions on the host without credentials, an Android device, or the Morphe registry."""
import argparse
import hashlib
from pathlib import Path
import subprocess
import tempfile
import urllib.request

# Pin the JSON implementation so host checks never run Android's throwing android.jar stubs.
JSON_URL = "https://repo.maven.apache.org/maven2/org/json/json/20250517/json-20250517.jar"
JSON_SHA256 = "3ea61b2a06e31edf1c91134fe9106b0ebb16628be169f3db75bc7a2b06b45796"


def main():
    """Compile production Java with isolated Android substitutes and keep all outputs outside the repository."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--json-jar", type=Path, help="Use an already downloaded org.json jar for offline checks")
    args = parser.parse_args()
    tests = Path(__file__).resolve().parent
    sources = list((tests.parent / "src/main/java/app/morphe/extension/swiftbackup").glob("*.java"))
    with tempfile.TemporaryDirectory(prefix="swiftbackup-tests-") as scratch:
        scratch = Path(scratch)
        jar = args.json_jar.resolve() if args.json_jar else scratch / "json.jar"
        if not args.json_jar:
            # The checked-in digest binds the version to the exact artifact verified during development.
            urllib.request.urlretrieve(JSON_URL, jar)
            if hashlib.sha256(jar.read_bytes()).hexdigest() != JSON_SHA256:
                raise RuntimeError("JSON dependency digest mismatch")
        classes = scratch / "classes"
        classes.mkdir()
        java_files = [str(p) for p in tests.rglob("*.java")] + [str(p) for p in sources]
        subprocess.run(["javac", "-encoding", "UTF-8", "-cp", str(jar), "-d", str(classes), *java_files], check=True)
        subprocess.run(["java", f"-Dtest.root={scratch}", "-cp", str(classes) + ":" + str(jar), "LocalDbTest"], check=True)
        subprocess.run(["java", f"-Dtest.root={scratch}", "-cp", str(classes) + ":" + str(jar), "SettingsBackupTest"], check=True)


if __name__ == "__main__":
    main()
