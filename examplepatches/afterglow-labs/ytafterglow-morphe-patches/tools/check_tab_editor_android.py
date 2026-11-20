#!/usr/bin/env python3
"""Exercise the production tab editor through real Android touch dispatch on an emulator.

The probe has its own package and in-memory preference fixture. It neither reads
nor changes the installed Afterglow app's settings, media or other state.
Use --source to run an older TabEditorScreen through the identical regression.
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
PACKAGE = "app.afterglow.qa.tabeditor"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=ROOT / "extensions/extension/src/main/java/app/afterglow/extension/ui/TabEditorScreen.java")
    parser.add_argument("--out", type=Path, required=True, help="New evidence/build directory")
    parser.add_argument("--serial", default="emulator-5600")
    parser.add_argument("--adb", default="/mnt/c/Users/Corey/AppData/Local/Android/Sdk/platform-tools/adb.exe")
    parser.add_argument("--sdk", type=Path, default=Path.home() / "Android/Sdk")
    parser.add_argument("--jdk", type=Path, default=Path("/usr/lib/jvm/java-17-openjdk-amd64"))
    parser.add_argument("--windows-stage", type=Path, default=Path("/mnt/c/Users/Corey/ytag-scratch/android/deliveries"))
    parser.add_argument("--expect-error", help="Negative control: require this exact exception text instead of success")
    args = parser.parse_args()
    if not args.serial.startswith("emulator-"):
        parser.error("This isolated test only permits an emulator serial")
    adb = [args.adb, "-s", args.serial]
    def call(command, **kwargs):
        return subprocess.run(list(map(str, command)), check=True, text=True,
                              capture_output=True, timeout=120, **kwargs).stdout
    if call(adb + ["shell", "getprop", "ro.kernel.qemu"]).strip() != "1":
        parser.error("The selected device does not report itself as an emulator")
    if args.out.exists():
        parser.error("Evidence directory exists; choose a new --out")
    args.out.mkdir(parents=True)
    for name in ("src", "classes", "dex"):
        (args.out / name).mkdir()
    fixture = ROOT / "tools/android/tab_editor"
    for file in fixture.glob("*.java"):
        shutil.copyfile(file, args.out / "src" / file.name)
    shutil.copyfile(args.source, args.out / "src/TabEditorScreen.java")
    source_sha = hashlib.sha256((args.out / "src/TabEditorScreen.java").read_bytes()).hexdigest()
    sdk = args.sdk
    android = sdk / "platforms/android-36/android.jar"
    build_tools = sdk / "build-tools/37.0.0"
    env = dict(os.environ, JAVA_HOME=str(args.jdk))
    log = []
    def build(command):
        result = subprocess.run(list(map(str, command)), capture_output=True, text=True, env=env)
        log.append(result.stdout + result.stderr)
        (args.out / "build.log").write_text("\n".join(log))
        if result.returncode:
            raise RuntimeError(result.stderr or result.stdout)
    build([args.jdk / "bin/javac", "-encoding", "UTF-8", "-source", "17", "-target", "17",
           "-classpath", android, "-d", args.out / "classes", *sorted((args.out / "src").glob("*.java"))])
    build([build_tools / "d8", "--min-api", "29", "--lib", android,
           "--output", args.out / "dex", *sorted((args.out / "classes").rglob("*.class"))])
    build([build_tools / "aapt2", "link", "-I", android, "--manifest", fixture / "AndroidManifest.xml",
           "-o", args.out / "unsigned.apk"])
    with zipfile.ZipFile(args.out / "unsigned.apk", "a") as archive:
        archive.write(args.out / "dex/classes.dex", "classes.dex")
    # Disposable probe-only key. It is never used for a delivered application.
    key = args.out / "probe.jks"
    build([args.jdk / "bin/keytool", "-genkeypair", "-keystore", key, "-alias", "probe", "-keyalg", "RSA",
           "-keysize", "2048", "-storepass", "android", "-keypass", "android", "-dname", "CN=Afterglow test fixture",
           "-validity", "2", "-noprompt"])
    key.chmod(0o600)
    apk = args.out / "probe.apk"
    build([build_tools / "apksigner", "sign", "--ks", key, "--ks-key-alias", "probe", "--ks-pass", "pass:android",
           "--key-pass", "pass:android", "--out", apk, args.out / "unsigned.apk"])
    staged = None
    if args.adb.lower().endswith(".exe"):
        args.windows_stage.mkdir(parents=True, exist_ok=True)
        fd, path = tempfile.mkstemp(prefix="afterglow-tab-editor-qa-", suffix=".apk", dir=args.windows_stage)
        os.close(fd)
        staged = Path(path)
        shutil.copyfile(apk, staged)
        install_path = call(["wslpath", "-w", str(staged)]).strip()
    else:
        install_path = str(apk)
    try:
        subprocess.run(adb + ["uninstall", PACKAGE], capture_output=True, timeout=30)
        print(call(adb + ["install", "-r", install_path]).strip(), flush=True)
        result = subprocess.run(adb + ["shell", "am", "instrument", "-w", PACKAGE + "/app.afterglow.extension.ui.TabEditorRegression"],
                                capture_output=True, text=True, timeout=120)
        (args.out / "instrumentation.log").write_text(result.stdout + result.stderr)
        report = json.loads(call(adb + ["shell", "run-as", PACKAGE, "cat", "files/result.json"]))
        report["production_source_sha256"] = source_sha
        report["device"] = args.serial
        report["source"] = str(args.source.resolve())
        report["fixture_package"] = PACKAGE
        (args.out / "result.json").write_text(json.dumps(report, indent=2) + "\n")
        summary = dict(report)
        if "error" in summary:
            summary["error"] = "\n".join(summary["error"].splitlines()[:15])
        print(json.dumps(summary, indent=2), flush=True)
        if args.expect_error:
            if report["success"] or args.expect_error not in report.get("error", ""):
                raise SystemExit("Expected regression was not reproduced")
            print("PASS negative control: reproduced expected exception", flush=True)
        elif not report["success"]:
            raise SystemExit(1)
    finally:
        subprocess.run(adb + ["uninstall", PACKAGE], capture_output=True, timeout=30)
        if staged:
            staged.unlink(missing_ok=True)


if __name__ == "__main__":
    main()
