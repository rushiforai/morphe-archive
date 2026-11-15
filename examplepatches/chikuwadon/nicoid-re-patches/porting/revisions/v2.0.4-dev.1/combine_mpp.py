"""Package verified dev helper payloads with the CURRENT compiled Kotlin patch.
The older payload builder carries outdated v1.11.1 patch classes; never ship it
directly with the AndroidManifest.xml.bin bug under Morphe 2.3 lazy extraction.
"""
from pathlib import Path
from zipfile import ZipFile, ZIP_DEFLATED
import hashlib
import sys

COMPILED, PAYLOAD, OUTPUT = map(Path, sys.argv[1:4])
OVERRIDES = ("nicoid/helpers.mpe", "nicoid/method-delta.dex", "nicoid/resources.zip")
LICENSE = "META-INF/java-lame-3.98.4-LGPL-3.0.txt"
FIX_MARKER = b"Missing original nicoid 6.49 APK entry"
with ZipFile(COMPILED) as compiled, ZipFile(PAYLOAD) as payload:
    assert compiled.testzip() is None and payload.testzip() is None
    assert all(name in compiled.namelist() and name in payload.namelist() for name in OVERRIDES)
    assert all(compiled.read(name) and payload.read(name) for name in OVERRIDES)
    assert b"Version: 2.0.4-dev.1" in compiled.read("META-INF/MANIFEST.MF")
    code_entries = [name for name in compiled.namelist() if (
        name.endswith(".dex") or name.endswith(".class") or name.endswith(".jar")
    ) and not name.startswith("nicoid/")]
    assert code_entries, "No Gradle compiled patch code in MPP"
    assert any(FIX_MARKER in compiled.read(name) for name in code_entries), (
        "Stale Kotlin patch code; the manifest access fix was not compiled"
    )
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    with ZipFile(OUTPUT, "w", ZIP_DEFLATED, compresslevel=9) as output:
        for entry in compiled.infolist():
            output.writestr(entry, payload.read(entry.filename) if entry.filename in OVERRIDES
                            else compiled.read(entry.filename))
        if LICENSE not in compiled.namelist():
            assert LICENSE in payload.namelist(), "MP3 encoder license missing"
            output.writestr(LICENSE, payload.read(LICENSE))
with ZipFile(COMPILED) as compiled, ZipFile(PAYLOAD) as payload, ZipFile(OUTPUT) as output:
    assert output.testzip() is None
    assert all(output.read(name) == payload.read(name) for name in OVERRIDES)
    assert all(output.read(name) == compiled.read(name)
               for name in compiled.namelist() if name not in OVERRIDES)
    assert any(FIX_MARKER in output.read(name) for name in code_entries)
print("PASS: v2.0.4-dev.1 Kotlin patch code retained, not old v1.11.1 implementation")
print("PASS: all verified dev.18 helper and resource payloads retained")
print("MPP SHA-256", hashlib.sha256(OUTPUT.read_bytes()).hexdigest())
