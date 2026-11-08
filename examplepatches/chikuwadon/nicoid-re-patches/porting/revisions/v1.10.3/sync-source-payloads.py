#!/usr/bin/env python3
"""Put byte-exact built MPP DEX payloads into source ZIP and TAR; preserve permissions."""
from pathlib import Path
from zipfile import ZipFile
import io
import sys
import tarfile

def synchronize(version):
    root = f"nicoid-re-{version}/patches/src/main/resources/nicoid/"
    delivery = Path("patches/build/dev-delivery")
    zip_path = delivery / f"nicoid-re-{version}-source.zip"
    tar_path = delivery / f"nicoid-re-{version}-source.tar.gz"
    bundles = list(Path("patches/build/libs").glob("*.mpp"))
    assert len(bundles) == 1, "Expected one MPP"
    with ZipFile(bundles[0]) as mpp:
        payloads = {name: mpp.read("nicoid/" + name)
                    for name in ("helpers.mpe", "method-delta.dex")}
    for name, content in payloads.items():
        assert Path("patches/src/main/resources/nicoid", name).read_bytes() == content
    replacements = {root + name: content for name, content in payloads.items()}

    temporary = zip_path.with_suffix(".zip.tmp")
    with ZipFile(zip_path) as source, ZipFile(temporary, "w") as output:
        found = set()
        for entry in source.infolist():
            if entry.is_dir():
                output.writestr(entry, b"")
                continue
            if entry.filename in replacements:
                data = replacements[entry.filename]
                found.add(entry.filename)
            else:
                data = source.read(entry)
            output.writestr(entry, data)  # Retains Unix executable permissions.
    assert found == set(replacements), "Missing DEX members in source ZIP"
    temporary.replace(zip_path)

    temporary = Path(str(tar_path) + ".tmp")
    with tarfile.open(tar_path, "r:gz") as source, tarfile.open(temporary, "w:gz") as output:
        found = set()
        for entry in source:
            if entry.isfile():
                if entry.name in replacements:
                    data = replacements[entry.name]
                    found.add(entry.name)
                else:
                    stream = source.extractfile(entry)
                    assert stream is not None
                    data = stream.read()
                entry.size = len(data)
                output.addfile(entry, io.BytesIO(data))
            else:
                output.addfile(entry)
    assert found == set(replacements), "Missing DEX members in source TAR"
    temporary.replace(tar_path)

    with ZipFile(zip_path) as zipped:
        assert zipped.testzip() is None
        for name, data in replacements.items():
            assert zipped.read(name) == data, "Source ZIP differs from shipped MPP: " + name
    with tarfile.open(tar_path, "r:gz") as tarred:
        for name, data in replacements.items():
            stream = tarred.extractfile(name)
            assert stream is not None and stream.read() == data, "Source TAR mismatch: " + name
    print("PASS: source ZIP/TAR generated DEX payloads match shipped MPP", version)

if __name__ == "__main__":
    synchronize(sys.argv[1])
