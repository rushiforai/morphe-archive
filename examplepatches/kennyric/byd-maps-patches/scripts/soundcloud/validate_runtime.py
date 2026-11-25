"""Sign and exercise SoundCloud's new hooks on a disposable Android 12L+ emulator."""
import argparse
import os
from pathlib import Path
import re
import subprocess
import zipfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk", type=Path, help="Unsigned with-home.apk from validate_soundcloud.py")
    parser.add_argument("--serial", required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    assert args.serial.startswith("emulator-"), "Use a disposable emulator"
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    sdk = Path(os.environ["ANDROID_HOME"])
    tools = max((sdk / "build-tools").iterdir(), key=lambda p: tuple(map(int, p.name.split("."))))
    android = sdk / "platforms/android-36/android.jar"
    key = Path.home() / ".android/debug.keystore"
    assert key.is_file(), "An existing Android debug keystore is required"

    def run(*command):
        return subprocess.run([str(c) for c in command], check=True, text=True, capture_output=True).stdout

    def adb(*command):
        return run(sdk / "platform-tools/adb", "-s", args.serial, *command)

    installed = adb("shell", "pm", "list", "packages").splitlines()
    for package in ["com.soundcloud.android", "nl.johninnl.soundcloudprobe"]:
        assert "package:" + package not in installed, "Refusing to replace existing " + package
    manifest = output / "AndroidManifest.xml"
    manifest.write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android"
        package="nl.johninnl.soundcloudprobe"><uses-sdk android:minSdkVersion="32" android:targetSdkVersion="36"/>
        <application android:label="SoundCloud hook probe"/>
        <instrumentation android:name="nl.johninnl.soundcloudprobe.RuntimeProbe"
            android:targetPackage="com.soundcloud.android"/></manifest>''')
    classes = output / "classes"
    dex = output / "dex"
    classes.mkdir(exist_ok=True)
    dex.mkdir(exist_ok=True)
    source = Path(__file__).resolve().parents[2] / "tests/soundcloud/RuntimeProbe.java"
    run("javac", "-source", "11", "-target", "11", "-cp", android, "-d", classes, source)
    run(tools / "d8", "--lib", android, "--min-api", "32", "--output", dex, *classes.rglob("*.class"))
    probe = output / "probe-unsigned.apk"
    run(tools / "aapt2", "link", "--manifest", manifest, "-I", android, "-o", probe)
    with zipfile.ZipFile(probe, "a") as archive:
        archive.write(dex / "classes.dex", "classes.dex")
    signed = []
    for name, unsigned in [("soundcloud", args.apk.resolve()), ("probe", probe)]:
        aligned = output / (name + "-aligned.apk")
        destination = output / (name + ".apk")
        run(tools / "zipalign", "-f", "-p", "4", unsigned, aligned)
        run(tools / "apksigner", "sign", "--ks", key, "--ks-key-alias", "androiddebugkey",
            "--ks-pass", "pass:android", "--key-pass", "pass:android", "--out", destination, aligned)
        run(tools / "apksigner", "verify", destination)
        signed.append(destination)
    try:
        for apk in signed:
            print(adb("install", apk), flush=True)
        result = adb("shell", "am", "instrument", "-w", "-r", "nl.johninnl.soundcloudprobe/.RuntimeProbe")
        (output / "instrumentation.txt").write_text(result)
        print(result, flush=True)
        assert "PASS 16 checks:" in result and "INSTRUMENTATION_CODE: -1" in result, result
        activity = adb("shell", "cmd", "package", "resolve-activity", "--brief", "com.soundcloud.android").splitlines()[-1]
        launch = adb("shell", "am", "start", "-W", "-n", activity)
        (output / "launch.txt").write_text(launch)
        assert "Status: ok" in launch, launch
        pid = adb("shell", "pidof", "com.soundcloud.android").strip().split()[0]
        logs = adb("logcat", "-d", "--pid=" + pid)
        (output / "logcat.txt").write_text(logs)
        assert not re.search(r"FATAL EXCEPTION|VerifyError", logs), "See logcat.txt"
        print("PASS app launch without fatal or verifier errors")
    finally:
        for package in ["nl.johninnl.soundcloudprobe", "com.soundcloud.android"]:
            adb("uninstall", package)


if __name__ == "__main__":
    main()
