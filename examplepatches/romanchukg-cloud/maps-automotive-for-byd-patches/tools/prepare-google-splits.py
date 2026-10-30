#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-only
"""Patch and sign the pinned original Google APKM as its original 10-split set.

No installation, account access, key creation or network access. Use the SAME
keystore as Maps. Passwords are read privately; they are never written to a log.
"""
from pathlib import Path
import argparse
import getpass
import hashlib
import json
import os
import re
import shutil
import subprocess
import zipfile

INPUT_SHA256 = "74fbc9db80cbaa88cd1a6bf3374e0ec00e314baaa6f6d7de54dcf068768dc446"
BASE_SHA256 = "6d07cf6454fcdd04b3aaacf6cd4d046d8507f5422ac40999bf7c46d96d186315"
CLI_SHA256 = "1b506ab5f03d16a2f65026d5e0e1910d01fc1e2152f21eaeb44ed2f30856597b"
CERTS = {"f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83",
         "7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053"}
NAMES = {"base.apk", "split_config.hdpi.apk", "split_config.ldpi.apk",
         "split_config.mdpi.apk", "split_config.tvdpi.apk", "split_config.xhdpi.apk",
         "split_config.xxhdpi.apk", "split_lens_ondevice_engine_feature_module.apk",
         "split_lens_ondevice_engine_play_ml_module.apk", "split_tclib_native_feature_module.apk"}
PATCH = "Google app for BYD (MicroG-RE TEST)"


def digest(p):
    h = hashlib.sha256()
    with p.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""): h.update(chunk)
    return h.hexdigest()


def require(b, message):
    if not b: raise SystemExit(message)


def certificates(text):
    return set(re.findall(r"Signer #\d+ certificate SHA-256 digest: ([0-9a-fA-F]{64})", text))


def payload(p):
    with zipfile.ZipFile(p) as z:
        return {n: hashlib.sha256(z.read(n)).hexdigest() for n in z.namelist()
                if not n.endswith("/") and not n.startswith("META-INF/") and n != "stamp-cert-sha256"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name, help_text in (("input", "Complete original signed APKM; not a merged or patched APK"),
                            ("bundle", "Our preview6 .mpp"), ("cli", "Morphe Desktop1.18.1 all-JAR"),
                            ("sdk", "Android SDK with build-tools36.0.0"),
                            ("keystore", "Your existing Maps signing keystore"),
                            ("out", "New output directory; never overwritten")):
        parser.add_argument("--" + name, required=True, type=Path, help=help_text)
    parser.add_argument("--alias", required=True, help="Your existing Maps key alias")
    args = parser.parse_args()
    for key in ("input", "bundle", "cli", "sdk", "keystore", "out"):
        setattr(args, key, getattr(args, key).expanduser().resolve())
    require(all(p.is_file() for p in (args.input, args.bundle, args.cli, args.keystore)), "An input file is missing.")
    require(digest(args.input) == INPUT_SHA256, "Wrong original APKM. Do not bypass this check.")
    require(digest(args.cli) == CLI_SHA256, "Wrong Desktop JAR; this helper pins1.18.1.")
    require(not args.out.exists(), "Output already exists; choose a fresh directory.")
    bt = args.sdk / "build-tools/36.0.0"
    signer = bt / ("apksigner.bat" if os.name == "nt" else "apksigner")
    align = bt / ("zipalign.exe" if os.name == "nt" else "zipalign")
    require(signer.is_file() and align.is_file() and shutil.which("java"), "JDK and SDK Build Tools36.0.0 are required.")
    # Exact names + full archive hash: no archive paths are extracted unchecked.
    with zipfile.ZipFile(args.input) as z:
        entries = [n for n in z.namelist() if n.endswith(".apk")]
        require(len(entries) == 10 and set(entries) == NAMES, "Unexpected original split set.")
    args.out.mkdir(parents=True)
    original, signed = args.out / "original", args.out / "signed"
    original.mkdir(); signed.mkdir()
    env = os.environ.copy()

    def run(*command, patch_log=False):
        result = subprocess.run([str(c) for c in command], capture_output=True, text=True, env=env)
        if patch_log: (args.out / "PATCH.log").write_text(result.stdout + result.stderr, encoding="utf-8")
        require(result.returncode == 0, "Tool failed: " + Path(str(command[0])).name +
                (" (see PATCH.log)." if patch_log else "; no credentials were logged."))
        return result.stdout

    with zipfile.ZipFile(args.input) as z:
        for name in sorted(NAMES): (original / name).write_bytes(z.read(name))
    require(digest(original / "base.apk") == BASE_SHA256, "Wrong base APK.")
    for path in sorted(original.glob("*.apk")):
        cert = certificates(run(signer, "verify", "--min-sdk-version", "32", "--max-sdk-version", "32", "--print-certs", path))
        require(len(cert) == 1 and cert <= CERTS, "Original Google split signature mismatch.")
    unsigned = args.out / "google-base-unsigned.apk"
    run("java", "-Xmx6g", "-jar", args.cli, "patch", "--unsigned", "--exclusive", "-p", args.bundle,
        "-e", PATCH, "-o", unsigned, "-r", args.out / "PATCH-RESULT.json",
        "-t", args.out / "scratch", original / "base.apk", patch_log=True)
    result = json.loads((args.out / "PATCH-RESULT.json").read_text())
    require(not result.get("failedPatches") and result.get("appliedPatches") == [{"name": PATCH}]
            and result.get("patchingSteps") and all(x.get("success") for x in result["patchingSteps"]), "Patch did not complete exactly as expected.")
    # Environment injection supports a private local test harness; ordinary users get hidden prompts.
    env["BYD_GSA_STORE_PASS"] = env.get("BYD_GSA_STORE_PASS") or getpass.getpass("Existing Maps keystore password: ")
    if "BYD_GSA_KEY_PASS" not in env:
        env["BYD_GSA_KEY_PASS"] = getpass.getpass("Key password (Enter = same): ") or env["BYD_GSA_STORE_PASS"]
    rows = []; output_cert = None
    try:
        for name in sorted(NAMES):
            source = unsigned if name == "base.apk" else original / name
            aligned, dest = args.out / "aligned.apk", signed / name
            run(align, "-P", "16", "4", source, aligned)
            run(signer, "sign", "--ks", args.keystore, "--ks-key-alias", args.alias,
                "--ks-pass", "env:BYD_GSA_STORE_PASS", "--key-pass", "env:BYD_GSA_KEY_PASS", "--out", dest, aligned)
            cert = certificates(run(signer, "verify", "--min-sdk-version", "32", "--max-sdk-version", "32", "--print-certs", dest))
            require(len(cert) == 1, "Output must have exactly one signing certificate.")
            if output_cert is None: output_cert = cert
            require(cert == output_cert, "Splits were signed with different certificates.")
            run(align, "-c", "-P", "16", "4", dest)
            require(payload(source) == payload(dest), "Unexpected payload change during signing.")
            rows.append({"file": name, "sha256": digest(dest), "bytes": dest.stat().st_size,
                         "certificate_sha256": next(iter(cert)), "payload_preserved": True})
            aligned.unlink()
    finally:
        env.pop("BYD_GSA_STORE_PASS", None); env.pop("BYD_GSA_KEY_PASS", None)
    record = {"agent": "ChatGPT", "input_sha256": INPUT_SHA256, "bundle_sha256": digest(args.bundle),
              "google_revision": "08", "min_api": 32, "installed": False, "new_key_created": False,
              "same_key_as_maps_must_be_checked_by_user": True, "files": rows}
    (args.out / "SIGNED-SPLITS.json").write_text(json.dumps(record, indent=2) + "\n")
    (signed / "SHA256SUMS").write_text("".join(row["sha256"] + "  " + row["file"] + "\n" for row in rows))
    print("Prepared and verified 10 APKs in " + str(signed) + ". Nothing installed.")
    print("Certificate SHA-256: " + next(iter(output_cert)))


if __name__ == "__main__":
    main()
