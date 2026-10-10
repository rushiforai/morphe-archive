#!/usr/bin/env python3
"""Build a standard JVM+DEX Morphe bundle from pinned public release toolchains."""
import hashlib
import json
import sys
from datetime import datetime, timezone
import os
from pathlib import Path
import subprocess
import urllib.request
import zipfile
import tarfile

ROOT = Path(__file__).resolve().parents[1]
TOOLS = ROOT / "work" / "tools"
BUILD = ROOT / "patches" / "build"
PROPERTIES = dict(line.split("=", 1) for line in (ROOT / "gradle.properties").read_text().splitlines() if "=" in line)
PROPERTIES = {key.strip(): value.strip() for key, value in PROPERTIES.items()}
VERSION = PROPERTIES["version"]
RELEASE_TAG = PROPERTIES.get("releaseTag", f"v{VERSION}")
ASSET_NAME = PROPERTIES.get("releaseAsset", f"patches-{VERSION}.mpp")
DEPENDENCIES = {
    "terser.tgz": (
        "https://registry.npmjs.org/terser/-/terser-5.44.0.tgz",
        "86b954e059e70d536a7918fdf7f2f74292e81e03f30a9ab4bd281484e7c9edfc"),
    "android-platform.zip": (
        "https://dl.google.com/android/repository/platform-35_r02.zip",
        "0988cacad01b38a18a47bac14a0695f246bc76c1b06c0eeb8eb0dc825ab0c8e0"),
    "gson.jar": (
        "https://repo.maven.apache.org/maven2/com/google/code/gson/gson/2.14.0/gson-2.14.0.jar",
        "2cbd119bf1961c28788310963dc80ba65f58cdeec1dd139c8bdb1240faa2c36f"),
    "morphe.jar": (
        "https://github.com/MorpheApp/morphe-desktop/releases/download/v1.18.0/morphe-desktop-1.18.0-all.jar",
        "36e20d7a18f655fb5829ae50aadd61217e2208536c0741df5f7799300f758f56"),
    "kotlin24.zip": (
        "https://github.com/JetBrains/kotlin/releases/download/v2.4.0/kotlin-compiler-2.4.0.zip",
        "ba1b9e6eb6ddc3275079224f2e9ea4a2b02eef7d59ce2d38404f04b22613c20a"),
    "r8.jar": (
        "https://storage.googleapis.com/r8-releases/raw/8.12.22/r8.jar",
        "f18a6d1d7b37b7c9c8fbbcb5fd65b62f18bf7ce8f5be8e623b72648e282d964e"),
}


def run(*args, cwd=ROOT, env=None):
    subprocess.run([str(a) for a in args], cwd=cwd, check=True,
                   env={**os.environ, "JAVA_OPTS": "-Xmx384m", **(env or {})})


def digest(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def tools():
    TOOLS.mkdir(parents=True, exist_ok=True)
    for name, (url, sha) in DEPENDENCIES.items():
        path = TOOLS / name
        if not path.exists():
            print(f"Downloading {name}", flush=True)
            temporary = path.with_suffix(".download")
            try:
                urllib.request.urlretrieve(url, temporary)
                if digest(temporary) != sha:
                    raise SystemExit(f"Checksum mismatch for downloaded {name}")
                temporary.replace(path)
            finally:
                temporary.unlink(missing_ok=True)
        if digest(path) != sha:
            raise SystemExit(f"Checksum mismatch: {path}; remove it and retry")
    # Read one known tool file; never extract arbitrary npm archive paths.
    with tarfile.open(TOOLS / "terser.tgz") as archive:
        (TOOLS / "terser.js").write_bytes(archive.extractfile("package/dist/bundle.min.js").read())
    # Always extract the pinned compiler, not an arbitrary previously installed version.
    with zipfile.ZipFile(TOOLS / "kotlin24.zip") as compiler:
        for entry in compiler.infolist():
            target = (TOOLS / entry.filename).resolve()
            if not target.is_relative_to(TOOLS.resolve()):
                raise SystemExit("Unsafe compiler archive path")
        compiler.extractall(TOOLS)
    (TOOLS / "kotlinc/bin/kotlinc").chmod(0o755)
    with zipfile.ZipFile(TOOLS / "android-platform.zip") as platform:
        (TOOLS / "android.jar").write_bytes(platform.read("android-35/android.jar"))


def compact_runtime():
    # Parser/printer only: preserve identifiers and scopes for Hermes native eval.
    script = r"""
const fs = require('node:fs'), vm = require('node:vm'), context = {};
vm.runInNewContext(fs.readFileSync(process.argv[1], 'utf8'), context);
const source = fs.readFileSync(process.argv[2], 'utf8').replace('/*__FEATURES__*/', '__VENUS_FEATURES__');
context.Terser.minify(source, {compress:false, mangle:false,
    format:{comments:false, ascii_only:true}}).then(result => {
    process.stdout.write(result.code.replace('__VENUS_FEATURES__', '/*__FEATURES__*/'));
});
"""
    source = ROOT / "patches/src/main/resources/venus/bootstrap.js"
    result = subprocess.run(["node", "-e", script, str(TOOLS / "terser.js"), str(source)],
                            cwd=ROOT, check=True, capture_output=True, text=True)
    content = result.stdout
    # No size budget: the injector stores the runtime as bytecode, not in a size-limited slot.
    if content.count("/*__FEATURES__*/") != 1:
        raise SystemExit("Invalid compact runtime")
    BUILD.mkdir(parents=True, exist_ok=True)
    output = BUILD / "bootstrap.js"
    output.write_text(content)
    print(f"Prelude characters: {len(source.read_text())} -> {len(content)}", flush=True)
    return output


def build():
    tools()
    run("node", "--test", "tests/runtime.test.cjs")
    runtime = compact_runtime()
    run("node", "--test", "tests/runtime.test.cjs", env={"VENUS_RUNTIME_PATH": str(runtime)})
    libs = BUILD / "libs"
    libs.mkdir(parents=True, exist_ok=True)
    # Compile-only bridge ABI stubs are on the classpath, never in the extension DEX.
    stubs = BUILD / "bridge-stubs.jar"
    compiler = TOOLS / "kotlinc/bin/kotlinc"
    run(compiler, "-no-stdlib", "-no-reflect", "-cp", TOOLS / "morphe.jar",
        *sorted((ROOT / "extensions/voice/stubs").rglob("*.kt")), "-d", stubs)
    voice_classes = BUILD / "voice-classes.jar"
    voice_sources = sorted((ROOT / "extensions/voice/src/main/kotlin").rglob("*.kt"))
    run(compiler, "-no-stdlib", "-no-reflect", "-language-version", "2.1", "-api-version", "2.1",
        "-jvm-target", "11", "-Xlambdas=class", "-cp",
        f"{TOOLS / 'android.jar'}:{TOOLS / 'morphe.jar'}:{stubs}",
        *voice_sources, "-d", voice_classes)
    # The Android host obfuscates collection/text/Result/Unit helpers. A JVM compile
    # alone can succeed with dependencies that will not link inside Discord.
    with zipfile.ZipFile(voice_classes) as native:
        for name in native.namelist():
            if not name.endswith(".class"):
                continue
            content = native.read(name)
            for unsafe in (b"kotlin/text/", b"kotlin/collections/", b"kotlin/Result", b"kotlin/Unit"):
                if unsafe in content:
                    raise SystemExit(f"Unsafe host Kotlin helper in {name}: {unsafe.decode()}; use Java APIs")
    pcm_tests = BUILD / "pcm-tests.jar"
    run(compiler, "-no-stdlib", "-no-reflect", "-cp", f"{voice_classes}:{TOOLS / 'morphe.jar'}",
        ROOT / "tests/native/PcmToolsTest.kt", "-d", pcm_tests)
    run("java", "-Xmx128m", "-cp", f"{pcm_tests}:{voice_classes}:{TOOLS / 'morphe.jar'}", "PcmToolsTestKt")
    voice_dex = BUILD / "voice-dex"
    voice_dex.mkdir(exist_ok=True)
    for stale in voice_dex.glob("classes*.dex"):
        stale.unlink()
    run("java", "-Xmx384m", "-cp", TOOLS / "r8.jar", "com.android.tools.r8.D8",
        "--release", "--min-api", "26", "--lib", TOOLS / "android.jar",
        "--classpath", TOOLS / "morphe.jar", "--classpath", stubs,
        "--output", voice_dex, voice_classes)
    classes = BUILD / "classes.jar"
    sources = sorted((ROOT / "patches/src/main/kotlin").rglob("*.kt"))
    run(TOOLS / "kotlinc/bin/kotlinc", "-no-stdlib", "-no-reflect",
        "-jvm-target", "11", "-Xlambdas=class", "-cp", f"{TOOLS / 'morphe.jar'}:{TOOLS / 'gson.jar'}",
        *sources, "-d", classes)
    # Static privacy ABI checks and detached assembler fixtures, never the APK patching engine.
    privacy_tests = BUILD / "privacy-tests.jar"
    run(compiler, "-no-stdlib", "-no-reflect", "-Xfriend-paths=" + str(classes),
        "-cp", f"{classes}:{TOOLS / 'morphe.jar'}", ROOT / "tests/native/PrivacyTest.kt", "-d", privacy_tests)
    original_apk = os.environ.get("VENUS_ORIGINAL_APK")
    run("java", "-Xmx384m", "-cp", f"{privacy_tests}:{classes}:{TOOLS / 'morphe.jar'}",
        "app.venus.patches.PrivacyTestKt", *([original_apk, str(BUILD / "privacy-fixtures")] if original_apk else []))
    dex = BUILD / "dex"
    dex.mkdir(exist_ok=True)
    for stale in dex.glob("classes*.dex"):
        stale.unlink()
    run("java", "-Xmx384m", "-cp", TOOLS / "r8.jar", "com.android.tools.r8.D8",
        "--release", "--min-api", "26", "--classpath", TOOLS / "morphe.jar",
        "--classpath", TOOLS / "gson.jar",
        "--output", dex, classes)
    # Same JVM classes + classes.dex layout and manifest keys as the official plugin.
    manifest = "\r\n".join([
        "Manifest-Version: 1.0", "Name: Venus Patches",
        "Description: Extra features and privacy options for Discord on Android.",
        f"Version: {VERSION}", "Patcher-Version: 1.15.0",
        "Source: https://github.com/VenusIsJaded/Venus-Patches",
        "Author: VenusIsJaded", "License: GPL-3.0", "", "",
    ])
    bundle = libs / ASSET_NAME
    # Normalize ZIP timestamps, order and modes so identical inputs produce identical bundles.
    with zipfile.ZipFile(bundle, "w", zipfile.ZIP_DEFLATED) as out:
        def add(name, content):
            entry = zipfile.ZipInfo(str(name), date_time=(1980, 1, 1, 0, 0, 0))
            entry.compress_type = zipfile.ZIP_DEFLATED
            entry.create_system = 3
            entry.external_attr = 0o100644 << 16
            out.writestr(entry, content)

        add("META-INF/MANIFEST.MF", manifest)
        with zipfile.ZipFile(classes) as compiled:
            for name in sorted(compiled.namelist()):
                if name != "META-INF/MANIFEST.MF":
                    add(name, compiled.read(name))
        for path in sorted((ROOT / "patches/src/main/resources").rglob("*")):
            if path.is_file():
                content = runtime.read_bytes() if path.name == "bootstrap.js" else path.read_bytes()
                add(path.relative_to(ROOT / "patches/src/main/resources"), content)
        add("extensions/voice.mpe", (voice_dex / "classes.dex").read_bytes())
        for path in sorted(dex.glob("classes*.dex")):
            add(path.name, path.read_bytes())
    run("java", "-Xmx256m", "-cp", f"{bundle}:{TOOLS / 'morphe.jar'}:{TOOLS / 'gson.jar'}",
        "util.PatchListGeneratorKt", bundle, cwd=ROOT / "patches")
    checksum = libs / "SHA256SUMS"
    checksum.write_text(f"{digest(bundle)}  {bundle.name}\n")
    print(f"Bundle: {bundle.relative_to(ROOT)}", flush=True)


RELEASE_SUMMARY = (
    "Bug fixes and less work: Read All, Quest Completer, ReviewDB and NoDelete fixes. "
    "Patch the original Discord 348.10 APKM."
)


def check_metadata(metadata):
    """Reject a manifest Morphe Manager cannot read before it is ever published."""
    import re
    for key in ("created_at", "description", "download_url", "version"):
        if not isinstance(metadata.get(key), str) or not metadata[key]:
            raise SystemExit(f"patches-bundle.json: missing {key}")
    # Morphe Manager parses created_at as a kotlinx LocalDateTime: no UTC offset or "Z".
    if not re.fullmatch(r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}(:\d{2}(\.\d{1,9})?)?", metadata["created_at"]):
        raise SystemExit("patches-bundle.json: created_at must be a LocalDateTime without a UTC offset")
    if not metadata["download_url"].startswith("https://github.com/VenusIsJaded/Venus-Patches/releases/download/"):
        raise SystemExit("patches-bundle.json: unexpected download_url")


def release_metadata():
    # An offset such as "+00:00" makes Morphe reject the whole remote source.
    created_at = datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%S")
    metadata = {
        "created_at": created_at,
        "description": RELEASE_SUMMARY,
        "download_url": f"https://github.com/VenusIsJaded/Venus-Patches/releases/download/{RELEASE_TAG}/{ASSET_NAME}",
        "page_url": f"https://github.com/VenusIsJaded/Venus-Patches/releases/tag/{RELEASE_TAG}",
        "signature_download_url": "",
        "version": VERSION,
    }
    check_metadata(metadata)
    (ROOT / "patches-bundle.json").write_text(json.dumps(metadata, indent=2) + "\n")


if __name__ == "__main__":
    if "--metadata-only" in sys.argv:
        release_metadata()
    elif "--check-metadata" in sys.argv:
        check_metadata(json.loads((ROOT / "patches-bundle.json").read_text()))
        print("patches-bundle.json is readable by Morphe Manager")
    else:
        build()
