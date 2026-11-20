#!/usr/bin/env python3
"""Build all Maps features from preserved local inputs; never downloads or installs."""
import argparse
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parent


def sha256(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def run(*args, env=None):
    subprocess.run([str(a) for a in args], check=True, env=env)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--recovery-root", type=Path, required=True)
    parser.add_argument("--from", dest="source", choices=["stock", "baseline"], default="stock")
    parser.add_argument("--output", type=Path)
    parser.add_argument("--verify-offline", action="store_true",
                        help="Deny Java socket connections during this build using JDK 21 policy.")
    args = parser.parse_args()
    if args.source == "baseline":
        # Upstream 1.3.0 has no saved places on the map; its markers/labels path lives at tag v1.3.1.
        raise ValueError("The legacy baseline build needs our own markers and labels: run it from a "
                         "checkout of tag v1.3.1 (git worktree add ../maps-v1.3.1 v1.3.1)")
    kit = args.recovery_root.resolve()
    lock = json.loads((ROOT / "config/build-lock.json").read_text(encoding="utf-8"))
    source_name = "inputs/maps-stock-26.44.06.apk"  # baseline is refused above
    selected = [name for name in lock["files"] if not name.startswith("inputs/") or name == source_name]
    for name in selected:
        path = kit / name
        if not path.is_file() or sha256(path) != lock["files"][name]:
            raise ValueError("Missing or changed recovery input/tool: " + name)
    current = json.loads((ROOT / "config/morphe-source-lock.json").read_text())
    if args.source == "stock":
        for name, expected in current["files"].items():
            if sha256(ROOT / name) != expected:
                raise ValueError("Preserved Morphe source checksum mismatch: " + name)
        source_manifest = json.loads((ROOT / ("vendor/artifacts/tutto-enhancements-%s.sources.json"
                                              % current["bundle_version"])).read_text())
        for name, expected in source_manifest.items():
            if sha256(ROOT / name) != expected:
                raise ValueError("Tutto bundle is stale. Rebuild and release it after changing: " + name)
    for name in ("maps-signing.p12", "signing-password.txt"):
        if not (kit / "signing" / name).is_file():
            raise ValueError("Missing private signing input: " + name)
    stamp = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
    work = ROOT / "build" / ("complete-" + stamp)
    output = (args.output or ROOT / "dist" / ("ungoogled-maps-all-" + stamp + ".apk")).resolve()
    if output.exists() or work.exists():
        raise ValueError("Output/work path already exists; choose a new output")
    work.mkdir(parents=True)
    java = kit / "jdk/bin/java.exe"
    javac = kit / "jdk/bin/javac.exe"
    sdk = kit / "sdk"
    signer = sdk / "build-tools" / lock["sdk_build_tools"] / "lib/apksigner.jar"
    env = os.environ.copy()
    env["JAVA_HOME"] = str(kit / "jdk")
    env["PATH"] = str(kit / "jdk/bin") + os.pathsep + env.get("PATH", "")
    env["ANDROID_SDK_ROOT"] = str(sdk)
    # Keep all caches and tool settings in this new build directory.
    env["USERPROFILE"] = str(work / "profile")
    env["GRADLE_USER_HOME"] = str(work / "gradle")
    (work / "profile").mkdir()
    if args.verify_offline:
        probe = work / "offline-probe"
        probe.mkdir()
        run(javac, "--release", "8", "-d", probe, ROOT / "tests/OfflineNetworkProbe.java",
            ROOT / "tests/OfflineSecurityManager.java", env=env)
        env["JAVA_TOOL_OPTIONS"] = ('-Xbootclasspath/a:"' + str(probe) + '" '
                                   '-Djava.security.manager=OfflineSecurityManager')
        # The negative control must fail to connect before the real build.
        run(java, "-cp", probe, "OfflineNetworkProbe", env=env)
    stage_input = kit / source_name
    if args.source == "stock":
        unsigned = work / "upstream-unsigned.apk"
        cli = work / "tools/morphe-desktop.jar"
        cli.parent.mkdir()
        shutil.copy2(kit / "tools/morphe-desktop.jar", cli)
        upstream = current["upstream_release"].lstrip("v")
        print("Applying bearinmind %s and Tutto Enhancements %s together." % (upstream, current["bundle_version"]), flush=True)
        run(java, "-Xmx4g", "-jar", cli, "patch",
            "-p", ROOT / ("vendor/artifacts/patches-%s.mpp" % upstream),
            "-p", ROOT / ("vendor/artifacts/tutto-enhancements-%s.mpp" % current["bundle_version"]),
            "--options-file", ROOT / "config/morphe-combined-options.json",
            "--bytecode-mode", "FULL", "--unsigned", "-o", unsigned,
            "-t", work / "morphe-temp", "-r", work / "morphe-result.json",
            kit / source_name, env=env)
        output.parent.mkdir(parents=True, exist_ok=True)
        run(java, "-jar", signer, "sign", "--ks", kit / "signing/maps-signing.p12",
            "--ks-pass", "file:" + str(kit / "signing/signing-password.txt"),
            "--ks-key-alias", "morphe", "--out", output, unsigned, env=env)
        sys.path.insert(0, str(ROOT))
        from build import certificates
        if certificates(java, signer, output) != certificates(java, signer, kit / "inputs/maps-working.apk"):
            raise ValueError("Output signing certificate differs from the preserved working app")
    else:
        print("Legacy baseline: compiling and applying Home/Work, markers and local labels.", flush=True)
        run(sys.executable, ROOT / "build.py", "--input", stage_input,
            "--apktool", kit / "tools/apktool.jar", "--sdk", sdk,
            "--java", java, "--javac", javac, "--keystore", kit / "signing/maps-signing.p12",
            "--password-file", kit / "signing/signing-password.txt",
            "--work-dir", work / "enhancements", "--output", output, env=env)
    report = {
        "source": args.source, "input_sha256": lock["files"][source_name],
        "upstream_commit": current["upstream_commit"] if args.source == "stock" else lock["upstream_commit"],
        "patch_bundles": current["files"] if args.source == "stock" else {"patches-1.3.0.mpp": lock["patch_bundle_sha256"]},
        "output_sha256": sha256(output), "java_network_denied": args.verify_offline,
        "downloaded_during_build": False, "installed": False,
    }
    output.with_suffix(".complete-build.json").write_text(json.dumps(report, indent=2) + "\n")
    print("Complete APK:", output)
    print("No device changes were made.")


if __name__ == "__main__":
    main()
