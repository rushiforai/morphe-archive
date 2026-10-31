#!/usr/bin/env python3
"""Patch the three original APKs and verify the output. Set ORIGINAL_APKS_DIR."""

from pathlib import Path
import subprocess, zipfile, json, hashlib, struct, tempfile, re, os

from buildenv import APP_VERSION, BUNDLE_NAME, MORPHE_JAR, PATCHES, ROOT, VERSION, jdk

r = ROOT
if "ORIGINAL_APKS_DIR" not in os.environ:
    raise SystemExit(
        "Set ORIGINAL_APKS_DIR to the folder with the original BitChord APKs."
    )
inputs = Path(os.environ["ORIGINAL_APKS_DIR"])
outputs = r / "build/validation-apks"
outputs.mkdir(parents=True, exist_ok=True)
java = jdk() / "bin/java"
javac = java.with_name("javac")
jar = MORPHE_JAR
mpp = r / "build" / BUNDLE_NAME
checks = r / "build/apk-check-classes"
checks.mkdir(exist_ok=True)
subprocess.run(
    [
        str(javac),
        "-J-Xshare:off",
        "--release",
        "21",
        "-cp",
        str(jar),
        "-d",
        str(checks),
        *map(str, (r / "checks").glob("Verify*.java")),
    ],
    check=True,
)
allresults = []
for abi, machine in [("arm64-v8a", 183), ("armeabi-v7a", 40), ("x86_64", 62)]:
    original = inputs / f"BitChord-v{APP_VERSION}_{abi}.apk"
    output = outputs / f"BitChord-Telegram-{VERSION}-{abi}-test.apk"
    expected = next(
        item["sha256"]
        for item in json.loads((r / "PROVENANCE.json").read_text())["original_apks"]
        if item["file"] == original.name
    )
    if hashlib.sha256(original.read_bytes()).hexdigest() != expected:
        raise RuntimeError("Original APK hash mismatch: " + original.name)
    command = [
        str(java),
        "-Xshare:off",
        "-Xmx4g",
        "-jar",
        str(jar),
        "patch",
        "--validate",
        "-p",
        str(mpp),
        *[arg for name in PATCHES for arg in ("-e", name)],
        "-r",
        str(r / f"patch-report-{abi}.json"),
        "-o",
        str(output),
        str(original),
    ]
    with (r / f"patch-log-{abi}.txt").open("w") as log:
        subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
    flow = subprocess.run(
        [
            str(java),
            "-Xshare:off",
            "-Xmx3g",
            "-cp",
            str(checks) + ":" + str(jar),
            "VerifyDexControlFlow",
            str(output),
        ],
        capture_output=True,
        text=True,
    )
    (r / f"dex-control-flow-{abi}.txt").write_text(flow.stdout + flow.stderr)
    print(abi, flow.stdout, flow.stderr, flush=True)
    flow.check_returncode()
    verify = subprocess.run(
        [
            str(java),
            "-Xshare:off",
            "-Xmx3g",
            "-cp",
            str(checks) + ":" + str(jar),
            "VerifyApk",
            str(original),
            str(output),
        ],
        capture_output=True,
        text=True,
    )
    (r / f"apk-check-{abi}.txt").write_text(verify.stdout + verify.stderr)
    print(abi, verify.stdout, verify.stderr, flush=True)
    verify.check_returncode()
    with zipfile.ZipFile(output) as z, zipfile.ZipFile(
        mpp
    ) as bundle, tempfile.TemporaryDirectory() as temp:
        assert json.loads(z.read("assets/telegram-native/application.json")) == {
            "apiId": 0,
            "apiHash": "",
        }
        found = {
            name.split("/")[1]
            for name in z.namelist()
            if name.startswith("lib/") and name.endswith(".so")
        }
        assert found == {abi}, found
        for name in ("libtdjni.so", "libsslx.so", "libcryptox.so", "libc++_shared.so"):
            path = f"lib/{abi}/{name}"
            data = z.read(path)
            assert data == bundle.read(path)
            assert struct.unpack_from("<H", data, 18)[0] == machine
            local = Path(temp) / name
            local.write_bytes(data)
            headers = subprocess.check_output(["readelf", "-lW", str(local)], text=True)
            alignments = [
                int(line.split()[-1], 16)
                for line in headers.splitlines()
                if line.strip().startswith("LOAD")
            ]
            assert alignments and min(alignments) >= (
                0x1000 if abi == "armeabi-v7a" else 0x4000
            ), (abi, name, alignments)
            dynamic = subprocess.check_output(["readelf", "-dW", str(local)], text=True)
            needed = re.findall(r"Shared library: \[([^]]+)\]", dynamic)
            system = {
                "libc.so",
                "libm.so",
                "libdl.so",
                "liblog.so",
                "libandroid.so",
                "libz.so",
                "libstdc++.so",
            }
            assert all(
                n in system or f"lib/{abi}/{n}" in z.namelist() for n in needed
            ), (abi, name, needed)
            assert "GNU_RELRO" in headers and (
                "BIND_NOW" in dynamic or " NOW" in dynamic
            ), (abi, name, "RELRO/NOW")
            stacks = [line for line in headers.splitlines() if "GNU_STACK" in line]
            assert stacks and all(
                "E" not in "".join(line.split()[6:-1]) for line in stacks
            )
            allresults.append(
                f"PASS {abi}/{name}: matching ELF machine {machine}, {min(alignments)//1024} KiB LOAD alignment, RELRO/NOW and non-executable stack, bundled dependencies, exact MPP bytes"
            )
        allresults.append(
            f"PASS {abi}: no credentials embedded; only matching ABI included; signed APK and DEX checks passed"
        )
(r / "native-check-log.txt").write_text("\n".join(allresults) + "\n")
print("\n".join(allresults), flush=True)
