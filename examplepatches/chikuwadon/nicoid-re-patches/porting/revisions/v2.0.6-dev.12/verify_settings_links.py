"""Verify helper references in a candidate MPP or the APK produced by Morphe."""
import re
import subprocess
import sys
from pathlib import Path
from tempfile import TemporaryDirectory
from zipfile import ZipFile

archive, tools = map(Path, sys.argv[1:3])
classpath = f"{tools / 'dexlib2.jar'}:{tools / 'guava.jar'}"
with TemporaryDirectory() as folder, ZipFile(archive) as source:
    out = Path(folder)
    names = source.namelist()
    if "nicoid/helpers.mpe" in names:
        names = ["nicoid/helpers.mpe", "nicoid/method-delta.dex"]
    else:
        names = [name for name in names if re.fullmatch(r"classes(?:[0-9]+)?\.dex", name)]
    assert names, "No DEX files"
    inputs = []
    for i, name in enumerate(names):
        dex = out / f"{i}.dex"
        dex.write_bytes(source.read(name))
        inputs.append(dex)
    code = Path(__file__).with_name("VerifySettingsLinks.java")
    subprocess.run(["javac", "-cp", classpath, "-d", out, code], check=True)
    subprocess.run(["java", "-cp", f"{out}:{classpath}", "VerifySettingsLinks", *inputs], check=True)
