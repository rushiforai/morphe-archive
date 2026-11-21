"""Download pinned public build tools into .tools; never downloads or installs LINE."""
from pathlib import Path
import hashlib
import os
import subprocess
import urllib.request
import zipfile

ROOT = Path(__file__).resolve().parents[1]
TOOLS = ROOT / ".tools"
DOWNLOADS = TOOLS / "downloads"
ASSETS = [
    ("temurin21.zip", "https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.13%2B9/OpenJDK21U-jdk_x64_windows_hotspot_21.0.13_9.zip",
     "a4dbaa05fca4bd89d84584e58c459bd732efebb1722af80ab13c6516832004f9", "java"),
    ("kotlin-compiler-2.4.21.zip", "https://github.com/JetBrains/kotlin/releases/download/v2.4.21/kotlin-compiler-2.4.21.zip",
     "7cc140e76daf416a0424a5557f99afd7ca89ebd463ea1101261e3e01c33e75cd", "kotlin"),
    ("android-commandlinetools.zip", "https://dl.google.com/android/repository/commandlinetools-win-15859902_latest.zip",
     "90ae805d20434428bffcb699c290860f19bb5f66a67e6b330067e3de801fb04a", "android-sdk/cmdline-tools/22.0"),
    ("morphe-desktop.jar", "https://github.com/MorpheApp/morphe-desktop/releases/download/v2.1.1/morphe-desktop-2.1.1-all.jar",
     "3a2efefd567b44dde15971a58d5aa649a32aba30781d3400dc08d688c720168f", None),
]


def bootstrap():
    if os.name != "nt":
        raise SystemExit("This bootstrap targets Windows x64; see README for the Gradle build.")
    DOWNLOADS.mkdir(parents=True, exist_ok=True)
    for name, url, expected, destination in ASSETS:
        archive = DOWNLOADS / name if destination else TOOLS / name
        if not archive.exists():
            print("Downloading", name, flush=True)
            urllib.request.urlretrieve(url, archive)
        with archive.open("rb") as source:
            actual = hashlib.file_digest(source, "sha256").hexdigest()
        if actual != expected:
            raise SystemExit(f"Checksum mismatch: {archive}. File was left untouched; inspect before retrying.")
        if destination:
            output = (TOOLS / destination).resolve()
            marker = output / ".line-build-extracted"
            if not marker.exists():
                with zipfile.ZipFile(archive) as source:
                    for entry in source.infolist():
                        if not (output / entry.filename).resolve().is_relative_to(output):
                            raise SystemExit("Unsafe archive path")
                    source.extractall(output)
                marker.write_text(expected, encoding="ascii")
        print("Verified", name, flush=True)
    sdk = TOOLS / "android-sdk"
    java = TOOLS / "java/jdk-21.0.13+9"
    env = dict(os.environ, JAVA_HOME=str(java))
    manager = sdk / "cmdline-tools/22.0/cmdline-tools/bin/sdkmanager.bat"
    packages = {
        "platforms;android-35": sdk / "platforms/android-35/android.jar",
        "build-tools;35.0.0": sdk / "build-tools/35.0.0/lib/d8.jar",
        "platform-tools": sdk / "platform-tools/adb.exe",
    }
    missing = [name for name, path in packages.items() if not path.exists()]
    if missing:
        print("Android SDK may ask you to review and accept its licenses in this terminal.", flush=True)
        subprocess.run([str(manager), "--sdk_root=" + str(sdk), *missing], env=env, check=True)
    print("Build tools ready. Run: python scripts/build.py")


if __name__ == "__main__":
    bootstrap()
