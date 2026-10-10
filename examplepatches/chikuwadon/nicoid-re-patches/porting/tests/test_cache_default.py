#!/usr/bin/env python3
"""Exercise production cache helpers with Android storage/service test doubles.

Pass compiled extension classes, an Android runtime stub jar and an ECJ jar.
"""
import argparse
import pathlib
import subprocess
import tempfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("helper_classes", type=pathlib.Path)
parser.add_argument("android_jar", type=pathlib.Path)
parser.add_argument("ecj_jar", type=pathlib.Path)
args = parser.parse_args()
fixtures = pathlib.Path(__file__).with_name("cache-default-fixtures")
with tempfile.TemporaryDirectory() as temporary:
    output = pathlib.Path(temporary)
    dependencies = f"{args.helper_classes.resolve()}:{args.android_jar.resolve()}"
    subprocess.run([
        "java", "-jar", str(args.ecj_jar), "-8", "-proc:none", "-nowarn",
        "-cp", dependencies, "-d", str(output),
        *map(str, sorted(fixtures.rglob("*.java"))),
    ], check=True)
    subprocess.run([
        "java", "-cp", f"{output}:{dependencies}", "e.e.a.CacheDefaultTest",
        str(output / "disk"),
    ], check=True)
