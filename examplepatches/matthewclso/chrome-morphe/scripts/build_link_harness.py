#!/usr/bin/env python3
"""Build the small external-intent fixture with the already installed Android SDK."""
import os
from pathlib import Path
import subprocess
import zipfile

project = Path(__file__).resolve().parents[1]
work = project.parent
tools = work / "tools"
source = project / "tests/link-harness"
out = work / "link-harness-build"
out.mkdir(exist_ok=True)
(out / "classes").mkdir(exist_ok=True)
sdk = tools / "android-sdk-native"
build = sdk / "build-tools/36.0.0"
android = sdk / "platforms/android-36/android.jar"
jdk = sorted((tools / "jdk").glob("jdk-*"))[-1]
env = {**os.environ, "PATH": str(jdk / "bin") + os.pathsep + os.environ["PATH"]}
def run(*cmd):
    subprocess.run(list(map(str, cmd)), env=env, check=True)
run(jdk / "bin/javac", "--release", "17", "-classpath", android, "-d", out / "classes", source / "MainActivity.java")
run(jdk / "bin/jar", "cf", out / "classes.jar", "-C", out / "classes", ".")
run(build / "d8", "--min-api", "26", "--lib", android, "--output", out, out / "classes.jar")
run(build / "aapt2", "link", "--manifest", source / "AndroidManifest.xml", "-I", android, "-o", out / "unsigned.apk")
with zipfile.ZipFile(out / "unsigned.apk", "a") as apk:
    apk.write(out / "classes.dex", "classes.dex")
run(build / "zipalign", "-f", "4", out / "unsigned.apk", out / "aligned.apk")
key = work / "keys/link-test.p12"
if not key.exists():
    run(jdk / "bin/keytool", "-genkeypair", "-keystore", key, "-storetype", "PKCS12", "-storepass", "android",
        "-alias", "test", "-keyalg", "RSA", "-keysize", "2048", "-validity", "3650", "-dname", "CN=Local link test")
run(build / "apksigner", "sign", "--ks", key, "--ks-pass", "pass:android", "--out", out / "link-test.apk", out / "aligned.apk")
print(out / "link-test.apk")
