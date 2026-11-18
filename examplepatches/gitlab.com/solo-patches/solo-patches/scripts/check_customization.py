#!/usr/bin/env python3
"""Check real WebNovel fonts, colors, analytics, reward timer and Library controls on a USB phone.

Uses the existing morphe-work JDK/CLI/signing key and Android SDK 36.
Installs and removes only app.saketh.webnovel.check. Instrumentation restarts
WebNovel without clearing data, writing customization choices, or inspecting accounts.
Reader/timer scopes open the first visible Library book and may update normal reading history.
Run after installing the matching APK: python3 scripts/check_customization.py --scope timer --reward-timer disabled
"""

import argparse
import os
import subprocess
import tempfile
import zipfile
from pathlib import Path

PACKAGE = "app.saketh.webnovel.check"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sdk = Path(os.environ.get("ANDROID_HOME", Path.home() / "Android/Sdk"))
    parser.add_argument("--adb", default=str(sdk / "platform-tools/adb"))
    parser.add_argument("--ui-font", choices=("original", "custom"), help="Require this persisted UI font state")
    parser.add_argument("--reader-font", choices=("original", "custom"), help="Require this persisted reader font state")
    parser.add_argument("--scope", choices=("all", "theme", "reader", "timer", "library", "privacy"), default="all", help="Theme scopes skip fonts; reader/timer open a Library book; privacy checks Firebase collection")
    parser.add_argument("--material-you", choices=("on", "off"), help="Require this persisted Material You choice")
    parser.add_argument("--reader-theme", choices=("on", "off"), help="Require this reader palette behavior; saved native presets must remain unchanged")
    parser.add_argument("--amoled", choices=("on", "off"), help="Require this persisted AMOLED choice; backgrounds must be black only while dark mode is on")
    parser.add_argument("--dark", choices=("on", "off"), help="Require WebNovel's tracked dark mode to be this state, so AMOLED checks cannot pass vacuously")
    parser.add_argument("--reward-timer", choices=("disabled", "native"), help="Require this saved corner reward-timer behavior; does not change preferences or credit rewards")
    parser.add_argument("--ads", choices=("hidden", "native"), help="Require this saved Hide ads behavior on Library recommendations")
    parser.add_argument("--firebase-analytics", choices=("disabled", "native"), help="Require the installed Firebase Analytics deactivation policy without changing it")
    args = parser.parse_args()
    if args.scope == "timer" and args.reward_timer is None:
        parser.error("--scope timer requires --reward-timer disabled|native")
    if args.scope == "library" and args.ads is None:
        parser.error("--scope library requires --ads hidden|native")
    if args.scope == "privacy" and args.firebase_analytics is None:
        parser.error("--scope privacy requires --firebase-analytics disabled|native")
    repo = Path(__file__).resolve().parents[1]
    tools = repo.parent / "tools"
    java = tools / "jdk21/bin/java"
    javac = tools / "jdk21/bin/javac"
    cli = tools / "morphe-desktop-2.1.1-all.jar"
    platform = sdk / "platforms/android-36/android.jar"
    build_tools = sdk / "build-tools/36.0.0"
    bundles = [path for path in (repo / "patches/build/libs").glob("*.mpp")
               if not any(part in path.name for part in ("sources", "javadoc"))]
    if len(bundles) != 1:
        parser.error("Build exactly one primary patch bundle before running the device check")

    def run(*command):
        result = subprocess.run([str(part) for part in command], capture_output=True, text=True, timeout=90)
        if result.returncode:
            raise RuntimeError(f"{Path(str(command[0])).name} failed: {result.stdout}{result.stderr}")
        if result.stderr.strip():
            print(result.stderr.strip())
        return result.stdout

    run(args.adb, "get-state")
    with tempfile.TemporaryDirectory(prefix="webnovel-customization-check-") as directory:
        folder = Path(directory)
        manifest = folder / "AndroidManifest.xml"
        manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android"
            package="{PACKAGE}" android:versionCode="1" android:versionName="1.0">
            <uses-sdk android:minSdkVersion="26" android:targetSdkVersion="36" />
            <instrumentation android:name="{PACKAGE}.CustomizationProbe" android:targetPackage="com.qidian.Int.reader" android:functionalTest="true" />
            <application android:label="WebNovel customization check" android:hasCode="true" />
        </manifest>''')
        classes = folder / "classes"
        run(javac, "--release", "17", "-cp", platform, "-d", classes, repo / "scripts/CustomizationProbe.java")
        jar = folder / "classes.jar"
        with zipfile.ZipFile(jar, "w", compression=zipfile.ZIP_DEFLATED) as archive:
            for path in classes.rglob("*.class"):
                archive.write(path, path.relative_to(classes))
        run(java, "-Xmx512m", "-XX:ActiveProcessorCount=2", "-cp", build_tools / "lib/d8.jar",
            "com.android.tools.r8.D8", "--lib", platform, "--min-api", "26", "--output", folder, jar)
        unsigned = folder / "unsigned.apk"
        signed = folder / "signed.apk"
        run(build_tools / "aapt2", "link", "-I", platform, "--manifest", manifest, "-o", unsigned)
        with zipfile.ZipFile(unsigned, "a", compression=zipfile.ZIP_DEFLATED) as archive:
            archive.write(folder / "classes.dex", "classes.dex")
        run(java, "-Xmx512m", "-XX:ActiveProcessorCount=2", "-jar", cli, "patch", "--exclusive",
            "-p", bundles[0], "-o", signed, unsigned)
        run(args.adb, "install", "-r", signed)
        try:
            scenario = ["-e", "scope", args.scope]
            for key in ("material_you", "reader_theme", "amoled", "dark", "ui_font", "reader_font", "reward_timer", "ads", "firebase_analytics"):
                value = getattr(args, key)
                if value:
                    scenario += ["-e", key, value]
            result = run(args.adb, "shell", "am", "instrument", "-w", *scenario, f"{PACKAGE}/{PACKAGE}.CustomizationProbe")
            lines = [line.strip() for line in result.splitlines() if line.strip().startswith(("PASS:", "FAIL:"))]
            if not any(line.startswith("PASS:") for line in lines):
                raise AssertionError("\n".join(lines) or "Device instrumentation did not return a result")
            print("\n".join(lines))
        finally:
            run(args.adb, "uninstall", PACKAGE)


if __name__ == "__main__":
    try:
        main()
    except (AssertionError, RuntimeError, OSError, subprocess.TimeoutExpired) as error:
        raise SystemExit(f"FAIL: {error}")
