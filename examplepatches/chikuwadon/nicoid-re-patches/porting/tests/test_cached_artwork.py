#!/usr/bin/env python3
"""Verify production thumbnail loading using Android storage and media doubles."""
import argparse
import pathlib
import subprocess
import tempfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("helper_classes", type=pathlib.Path)
parser.add_argument("android_jar", type=pathlib.Path)
parser.add_argument("ecj_jar", type=pathlib.Path)
args = parser.parse_args()
tests = pathlib.Path(__file__).parent
sources = sorted((tests / "cache-artwork-fixtures").rglob("*.java"))
sources += [tests / "cache-default-fixtures" / name for name in (
    "android/content/Context.java", "android/os/Looper.java",
    "android/os/ParcelFileDescriptor.java", "android/preference/PreferenceManager.java",
)]
with tempfile.TemporaryDirectory() as temporary:
    output = pathlib.Path(temporary)
    dependencies = f"{args.helper_classes.resolve()}:{args.android_jar.resolve()}"
    subprocess.run([
        "java", "-jar", str(args.ecj_jar), "-8", "-proc:none", "-nowarn",
        "-cp", dependencies, "-d", str(output), *map(str, sources),
    ], check=True)
    subprocess.run([
        "java", "-cp", f"{output}:{dependencies}", "e.e.a.CachedArtworkTest",
        str(output / "disk"),
    ], check=True)
