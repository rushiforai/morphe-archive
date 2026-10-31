"""Build the same patch for desktop Java and Android Manager; Python 3 + JDK 17+."""
import argparse
import hashlib
import os
from pathlib import Path
import shutil
import subprocess
import urllib.request
import zipfile

ROOT = Path(__file__).resolve().parent
VERSION = "1.0.1"
TOOLS = {
    "morphe": (
        "https://github.com/MorpheApp/morphe-desktop/releases/download/v1.18.1/morphe-desktop-1.18.1-all.jar",
        "1b506ab5f03d16a2f65026d5e0e1910d01fc1e2152f21eaeb44ed2f30856597b",
    ),
    "r8": (
        "https://storage.googleapis.com/r8-releases/raw/8.3.37/r8.jar",
        "900dfbc649519969fc5a4c7520d6b7355338e565fa1249874e0190b8d61b1199",
    ),
}


def tool(name, override):
    url, expected = TOOLS[name]
    path = Path(override).resolve() if override else ROOT / "build" / "tools" / (name + ".jar")
    if not path.exists():
        path.parent.mkdir(parents=True, exist_ok=True)
        with urllib.request.urlopen(url, timeout=120) as source, path.open("wb") as dest:
            shutil.copyfileobj(source, dest)
    actual = hashlib.sha256(path.read_bytes()).hexdigest()
    if actual != expected:
        raise ValueError(f"{name} checksum mismatch: {actual}; remove {path} and retry")
    return path


def run(*args):
    subprocess.run([str(a) for a in args], check=True, cwd=ROOT)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--morphe-jar", default=os.environ.get("MORPHE_JAR"))
    parser.add_argument("--r8-jar", default=os.environ.get("R8_JAR"))
    args = parser.parse_args()
    morphe, r8 = tool("morphe", args.morphe_jar), tool("r8", args.r8_jar)
    java = shutil.which("java")
    if not java:
        raise RuntimeError("JDK 17+ java is required")
    classes, dex = ROOT / "build/classes", ROOT / "build/dex"
    for directory in (classes, dex):
        if directory.exists():
            shutil.rmtree(directory)
        directory.mkdir(parents=True)
    run(java, "-cp", morphe, "com.sun.tools.javac.Main", "--release", "17",
        "-encoding", "UTF-8", "-cp", morphe, "-d", classes,
        ROOT / "src/tracket/morphe/LifetimeUnlock.java")
    class_files = sorted(classes.rglob("*.class"))
    if len(class_files) != 3:
        raise RuntimeError(f"Expected three patch classes, found {len(class_files)}")
    run(java, "-cp", r8, "com.android.tools.r8.D8", "--release", "--min-api", "26",
        "--classpath", morphe, "--output", dex, *class_files)
    dex_files = sorted(dex.glob("*.dex"))
    if not dex_files or any(p.stat().st_size == 0 for p in dex_files):
        raise RuntimeError("D8 did not produce a nonempty DEX")
    manifest = "\r\n".join([
        "Manifest-Version: 1.0", "Name: Tracket Patches", f"Version: {VERSION}",
        "Description: Tracket 0.9.38 patch bundle",
        "Source: https://github.com/contactjayclatty/tracket-patches",
        "Author: contactjayclatty", "License: GPL-3.0-or-later", "", "",
    ]).encode()
    output = ROOT / "dist" / f"patches-{VERSION}.mpp"
    output.parent.mkdir(exist_ok=True)
    # Stable ZIP headers make independent builds byte-for-byte comparable.
    with zipfile.ZipFile(output, "w", compression=zipfile.ZIP_DEFLATED) as archive:
        entries = [("META-INF/MANIFEST.MF", manifest)]
        entries += [(p.relative_to(classes).as_posix(), p.read_bytes()) for p in class_files]
        entries += [(p.name, p.read_bytes()) for p in dex_files]
        for name, data in entries:
            info = zipfile.ZipInfo(name, (2026, 10, 31, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o100644 << 16
            archive.writestr(info, data)
    # Use the real Morphe patch loader and dexlib, not only a ZIP-magic check.
    smoke = ROOT / "build/smoke"
    smoke.mkdir(exist_ok=True)
    run(java, "-cp", morphe, "com.sun.tools.javac.Main", "--release", "17",
        "-cp", morphe, "-d", smoke, ROOT / "tests/BundleSmoke.java")
    run(java, "-cp", os.pathsep.join((str(morphe), str(smoke))),
        "BundleSmoke", output, VERSION)
    checksum = hashlib.sha256(output.read_bytes()).hexdigest()
    output.with_suffix(".mpp.sha256").write_text(f"{checksum}  {output.name}\n")
    print(f"PASS: {output.name}, {output.stat().st_size} bytes, SHA-256 {checksum}")


if __name__ == "__main__":
    main()
