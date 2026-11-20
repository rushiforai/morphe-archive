#!/usr/bin/env python3
"""Measure real installed YouTube tab layouts using production TabBarHooks in an isolated probe.

Uses emulator-only, test-local preferences and APK resources. Does not start YouTube
or read/write its private files. The installed app must retain native 21.43.523 resources.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
PACKAGE = "app.afterglow.qa.tabpresentation"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--serial", default="emulator-5600")
    parser.add_argument("--adb", default="/mnt/c/Users/Corey/AppData/Local/Android/Sdk/platform-tools/adb.exe")
    parser.add_argument("--sdk", type=Path, default=Path.home() / "Android/Sdk")
    parser.add_argument("--jdk", type=Path, default=Path("/usr/lib/jvm/java-17-openjdk-amd64"))
    args = parser.parse_args()
    if not args.serial.startswith("emulator-"):
        parser.error("Only an emulator is permitted")
    adb = [args.adb, "-s", args.serial]
    def call(command, **kwargs):
        return subprocess.run(list(map(str, command)), capture_output=True, text=True,
                              check=True, timeout=120, **kwargs).stdout
    if call(adb + ["shell", "getprop", "ro.kernel.qemu"]).strip() != "1":
        parser.error("Target does not report itself as an emulator")
    if args.out.exists():
        parser.error("Choose a new evidence directory")
    args.out.mkdir(parents=True)
    for name in ("src", "classes", "dex"):
        (args.out/name).mkdir()
    fixture = ROOT/"tools/android/tab_presentation"
    for file in fixture.glob("*.java"):
        shutil.copyfile(file, args.out/"src"/file.name)
    source = ROOT/"extensions/extension/src/main/java/app/afterglow/extension/navigation/TabBarHooks.java"
    shutil.copyfile(source, args.out/"src/TabBarHooks.java")
    source_sha = hashlib.sha256((args.out/"src/TabBarHooks.java").read_bytes()).hexdigest()
    android = args.sdk/"platforms/android-36/android.jar"
    build_tools = args.sdk/"build-tools/37.0.0"
    env = dict(os.environ, JAVA_HOME=str(args.jdk))
    build_log = []
    def build(command):
        result = subprocess.run(list(map(str, command)), capture_output=True, text=True, env=env, timeout=120)
        build_log.append(result.stdout+result.stderr)
        (args.out/"build.log").write_text("\n".join(build_log))
        result.check_returncode()
    build([args.jdk/"bin/javac", "-encoding", "UTF-8", "-source", "17", "-target", "17", "-classpath",
           android, "-d", args.out/"classes", *sorted((args.out/"src").glob("*.java"))])
    build([build_tools/"d8", "--min-api", "29", "--lib", android, "--output", args.out/"dex",
           *sorted((args.out/"classes").rglob("*.class"))])
    build([build_tools/"aapt2", "link", "-I", android, "--manifest", fixture/"AndroidManifest.xml",
           "-o", args.out/"unsigned.apk"])
    with zipfile.ZipFile(args.out/"unsigned.apk", "a") as archive:
        archive.write(args.out/"dex/classes.dex", "classes.dex")
    key=args.out/"probe.jks"
    build([args.jdk/"bin/keytool", "-genkeypair", "-keystore", key, "-alias", "probe", "-keyalg", "RSA",
           "-keysize", "2048", "-storepass", "android", "-keypass", "android", "-dname",
           "CN=Afterglow test fixture", "-validity", "2", "-noprompt"])
    key.chmod(0o600)
    apk=args.out/"probe.apk"
    build([build_tools/"apksigner", "sign", "--ks", key, "--ks-key-alias", "probe", "--ks-pass", "pass:android",
           "--key-pass", "pass:android", "--out", apk, args.out/"unsigned.apk"])
    staged=None
    if args.adb.lower().endswith(".exe"):
        stage=Path("/mnt/c/Users/Corey/ytag-scratch/android/deliveries")
        stage.mkdir(parents=True, exist_ok=True)
        fd, name=tempfile.mkstemp(prefix="afterglow-tab-presentation-qa-", suffix=".apk", dir=stage)
        os.close(fd)
        staged=Path(name); shutil.copyfile(apk, staged)
        install_path=call(["wslpath", "-w", staged]).strip()
    else:
        install_path=str(apk)
    try:
        subprocess.run(adb+["uninstall", PACKAGE], capture_output=True, timeout=30)
        print(call(adb+["install", "-r", install_path]).strip(), flush=True)
        result=subprocess.run(adb+["shell", "am", "instrument", "-w",
            PACKAGE+"/app.afterglow.extension.navigation.TabPresentationRegression"],
            capture_output=True, text=True, timeout=120)
        (args.out/"instrumentation.log").write_text(result.stdout+result.stderr)
        report=json.loads(call(adb+["shell", "run-as", PACKAGE, "cat", "files/result.json"]))
        report.update(production_source_sha256=source_sha, device=args.serial, source=str(source), fixture_package=PACKAGE)
        (args.out/"result.json").write_text(json.dumps(report, indent=2)+"\n")
        print(json.dumps(report, indent=2), flush=True)
        if not report["success"]:
            raise SystemExit(1)
    finally:
        subprocess.run(adb+["uninstall", PACKAGE], capture_output=True, timeout=30)
        if staged:
            staged.unlink(missing_ok=True)


if __name__ == "__main__":
    main()
