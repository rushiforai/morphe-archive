"""Portable, fail-closed eight-patch release builder. Requires JDK 21 + Android SDK 36."""
import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import zipfile
from pathlib import Path
from urllib.request import urlopen
from release_config import BUNDLE_SERIES, RELEASE_NOTES
from alignment import normalise_native_alignment
from native_icons import prepare_profile, verify_patched_apk

ROOT = Path(__file__).resolve().parents[1]
DESKTOP_HASH = "36e20d7a18f655fb5829ae50aadd61217e2208536c0741df5f7799300f758f56"
COMPANION_HASH = "e5d442454418efd4ff438b3ed3f6bfa5a3aee78f52616625cb25ce0ec8855b48"
WAZE_CERT = "03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7"
OPTIONS = {"Selectable map themes", "Detailed report icons at normal sizes",
           "Rank badge selector", "Unlock driver moods", "Android Auto setup", "Selectable report icon packs", "Android Auto police alert distance", "Speed camera sound below speed limit"}


def sha(path):
    with Path(path).open("rb") as source:
        return hashlib.file_digest(source, "sha256").hexdigest()


def run(*args, capture=False):
    args = [str(x) for x in args]
    print("+ " + " ".join(args), flush=True)
    try:
        result = subprocess.run(args, check=True, text=True, encoding="utf-8", stdout=subprocess.PIPE if capture else None,
                                stderr=subprocess.STDOUT if capture else None)
    except subprocess.CalledProcessError as error:
        # Captured signer/aapt/validator output otherwise disappears from nightly.log.
        if capture and error.stdout:
            print(error.stdout, end="" if error.stdout.endswith("\n") else "\n", flush=True)
        raise
    return result.stdout or ""


def inspect_apk(apk, aapt, signer):
    badging = run(aapt, "dump", "badging", apk, capture=True)
    match = re.search(r"package: name='([^']+)' versionCode='(\d+)' versionName='([^']*)'", badging)
    if not match:
        raise ValueError("Could not inspect package identity")
    signature = run(signer, "verify", "--print-certs", apk, capture=True)
    certificates = re.findall(r"Signer #\d+ certificate SHA-256 digest: ([a-fA-F0-9]+)", signature)
    return {"package": match[1], "code": int(match[2]), "version": match[3],
            "certificates": [x.lower() for x in certificates],
            "split": bool(re.search(r"^package:.* split='[^']+'", badging, re.MULTILINE))}


def inspect_original(source, scratch, aapt, signer, metadata):
    apks = []
    if source.suffix == ".apk":
        apks = [source]
    else:
        with zipfile.ZipFile(source) as archive:
            for i, name in enumerate(archive.namelist()):
                if name.endswith(".apk"):
                    path = scratch / f"original-{i}.apk"
                    path.write_bytes(archive.read(name))
                    apks.append(path)
    if not apks:
        raise ValueError("Original archive contains no APKs")
    native_hash = None
    base_count = 0
    for apk in apks:
        identity = inspect_apk(apk, aapt, signer)
        if not identity["split"]:
            base_count += 1
        if (identity["package"] != "com.waze" or identity["code"] != metadata["version_code"]
                or (not identity["split"] and identity["version"] != metadata["version"])
                or identity["certificates"] != [WAZE_CERT]):
            raise ValueError(f"Original package identity/signature mismatch: {identity}")
        with zipfile.ZipFile(apk) as archive:
            if "lib/arm64-v8a/libwaze.so" in archive.namelist():
                native_hash = hashlib.sha256(archive.read("lib/arm64-v8a/libwaze.so")).hexdigest()
    if base_count != 1:
        raise ValueError("Expected exactly one base APK")
    if not native_hash:
        raise ValueError("Original package does not include the ARM64 renderer")
    return native_hash


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--metadata", default="build/upstream.json")
    parser.add_argument("--input", type=Path)
    parser.add_argument("--keystore", type=Path, required=True)
    parser.add_argument("--alias", default="Morphe")
    args = parser.parse_args()
    os.chdir(ROOT)
    metadata = json.loads(Path(args.metadata).read_text())
    version = metadata["version"]
    if not re.fullmatch(r"\d+(\.\d+){3}", version) or not isinstance(metadata["version_code"], int):
        raise ValueError("Invalid upstream version metadata")
    source = (args.input or Path(metadata["input"])).resolve()
    if not args.keystore.is_file():
        raise ValueError("Persistent release keystore is required")
    for key in ("WAZE_STORE_PASSWORD", "WAZE_KEY_PASSWORD"):
        if key not in os.environ:
            raise ValueError(f"Missing {key}")
    work = ROOT / "build" / "nightly"
    # This fixed path is inside build/, never derived from external metadata.
    if work.exists():
        shutil.rmtree(work)
    work.mkdir(parents=True)
    output = ROOT / "dist" / "nightly"
    if output.exists():
        shutil.rmtree(output)
    output.mkdir(parents=True)
    sdk = Path(os.environ.get("ANDROID_HOME") or os.environ["ANDROID_SDK_ROOT"])
    sdk_tools = sdk / "build-tools" / "36.0.0"
    android = sdk / "platforms" / "android-36" / "android.jar"
    windows = os.name == "nt"
    java_bin = Path(os.environ["JAVA_HOME"]) / "bin"
    java = java_bin / ("java.exe" if windows else "java")
    javac = java_bin / ("javac.exe" if windows else "javac")
    jar = java_bin / ("jar.exe" if windows else "jar")
    d8 = sdk_tools / ("d8.bat" if windows else "d8")
    aapt = sdk_tools / ("aapt2.exe" if windows else "aapt2")
    signer = sdk_tools / ("apksigner.bat" if windows else "apksigner")
    align = sdk_tools / ("zipalign.exe" if windows else "zipalign")
    native_hash = inspect_original(source, work, aapt, signer, metadata)
    metadata.update(original_sha256=sha(source), native_sha256=native_hash)
    # Preserve verified input provenance even if renderer discovery fails.
    (output / "build-info.json").write_text(json.dumps(metadata, indent=2) + "\n")
    native_report = prepare_profile(source, ROOT / "build/generated/native-icons", output / "native-profile.json")
    run(os.sys.executable, ROOT / "ci/native_regression.py", "--input", source)
    (output / "build-info.json").write_text(json.dumps(metadata, indent=2) + "\n")
    desktop = ROOT / "tools" / "morphe-desktop.jar"
    desktop.parent.mkdir(exist_ok=True)
    if not desktop.exists():
        with urlopen("https://github.com/MorpheApp/morphe-desktop/releases/download/v1.18.0/morphe-desktop-1.18.0-all.jar", timeout=120) as response:
            with desktop.open("wb") as target:
                shutil.copyfileobj(response, target)
    if sha(desktop) != DESKTOP_HASH:
        raise ValueError("Unexpected Morphe Desktop dependency")
    companion = ROOT / "companion" / "waze-aa-installer-1.0.0.apk"
    if sha(companion) != COMPANION_HASH:
        raise ValueError("Unexpected companion installer")
    extensions = {}
    for folder, dex_name in [("theme-extension", "theme-selector.dex"), ("badge-extension", "badge-selector.dex"), ("aa-extension", "aa-installer.dex"), ("icon-extension", "icon-pack.dex"), ("alert-extension", "alert-distance.dex"), ("camera-extension", "camera-sound.dex")]:
        classes = work / folder / "classes"
        dex = work / folder / "dex"
        classes.mkdir(parents=True)
        dex.mkdir()
        sources = sorted((ROOT / folder / "src").rglob("*.java"))
        run(javac, "--release", "11", "-cp", android, "-d", classes, *sources)
        archive = work / (folder + ".jar")
        run(jar, "cf", archive, "-C", classes, ".")
        run(d8, "--release", "--min-api", "29", "--lib", android, "--output", dex, archive)
        extensions[dex_name] = dex / "classes.dex"
    # Run the production decorators against small JVM view fixtures in every order.
    settings_classes = work / "settings-tests"
    settings_classes.mkdir()
    settings_cp = os.pathsep.join([str(android)] + [str(work / (name + ".jar"))
        for name in ["theme-extension", "icon-extension", "aa-extension", "alert-extension", "camera-extension", "badge-extension"]])
    run(javac, "-cp", settings_cp, "-d", settings_classes, *sorted((ROOT / "ci/settings-fixtures").rglob("*.java")), *sorted((ROOT / "ci/alert-fixtures").rglob("*.java")))
    run(java, "-cp", os.pathsep.join([str(settings_classes), settings_cp]), "ValidateSettingsRows")
    run(java, "-cp", os.pathsep.join([str(settings_classes), settings_cp]), "ValidateBadgeResources")
    run(java, "-cp", os.pathsep.join([str(settings_classes), settings_cp]), "ValidateIconFallback")
    run(java, "-cp", os.pathsep.join([str(settings_classes), settings_cp]), "local.wazemaps.alerts.ValidateAlertDistance")
    run(java, "-cp", os.pathsep.join([str(settings_classes), settings_cp]), "local.wazemaps.alerts.ValidateCameraSound")
    fixture_inputs = []
    for fixture in json.loads((ROOT / "ci/compatibility_fixtures.json").read_text()):
        if fixture["version"] == version:
            continue
        extension = fixture.get("extension", ".apkm")
        if extension not in (".apk", ".apkm"):
            raise ValueError("Unsupported fixture package type")
        fixture_source = ROOT / "downloads" / f"waze-{fixture['version']}-original-arm64{extension}"
        if not fixture_source.exists():
            fixture_source.parent.mkdir(exist_ok=True)
            if "url" in fixture:
                with urlopen(fixture["url"], timeout=120) as response, fixture_source.open("wb") as target:
                    shutil.copyfileobj(response, target)
            else:
                from upstream import download, requests
                download(requests.Session(impersonate="chrome"), fixture, fixture_source)
        if sha(fixture_source) != fixture["sha256"]:
            raise ValueError("Compatibility fixture checksum changed")
        fixture_work = work / fixture["version"]
        fixture_work.mkdir()
        inspect_original(fixture_source, fixture_work, aapt, signer, fixture)
        if fixture.get("unsupported_patches"):
            try:
                prepare_profile(fixture_source, ROOT / "build/generated/native-icons", fixture_work / "native-profile.json")
            except ValueError as error:
                if "inlined layouts require review" not in str(error):
                    raise
            else:
                raise ValueError("Oldest renderer is now supported; update its expected compatibility")
            fixture_report = None
        else:
            fixture_report = prepare_profile(fixture_source, ROOT / "build/generated/native-icons", fixture_work / "native-profile.json")
            run(os.sys.executable, ROOT / "ci/native_regression.py", "--input", fixture_source)
        fixture_inputs.append((fixture, fixture_source, fixture_work, fixture_report))

    bundle_version = f"{BUNDLE_SERIES}.{metadata['version_code']}"
    gradle = [str(ROOT / "gradlew.bat")] if windows else ["bash", str(ROOT / "gradlew")]
    run(*gradle, "themesJar", "--no-daemon", "--console=plain", f"-PwazeVersion={version}", f"-PbundleVersion={bundle_version}")
    patch_jar = ROOT / "build" / "libs" / f"waze-theme-selector-{bundle_version}.jar"
    patch_dex = work / "patch-dex"
    patch_dex.mkdir()
    run(d8, "--release", "--min-api", "26", "--lib", android, "--classpath", desktop, "--output", patch_dex, patch_jar)
    bundle = output / f"waze-theme-selector-{bundle_version}.mpp"
    shutil.copyfile(patch_jar, bundle)
    with zipfile.ZipFile(bundle, "a", compression=zipfile.ZIP_DEFLATED) as archive:
        archive.write(patch_dex / "classes.dex", "classes.dex")
        for name, path in extensions.items():
            archive.write(path, "extensions/" + name)
        archive.write(companion, "installer/waze-aa-installer.apk")
    discovery_cp = os.pathsep.join([str(desktop), str(bundle)])
    run(javac, "-cp", discovery_cp, "-d", work, ROOT / "ci/java/ValidateDiscovery.java")
    run(java, "-cp", os.pathsep.join([str(work), discovery_cp]), "ValidateDiscovery")
    run(javac, "-cp", desktop, "-d", work, ROOT / "ci/java/ValidateBundleOptions.java")
    run(java, "-cp", os.pathsep.join([str(work), str(desktop)]), "ValidateBundleOptions", bundle)
    run(javac, "-cp", discovery_cp, "-d", work, ROOT / "ci/java/ValidateMoodBinding.java")
    mood_cp = os.pathsep.join([str(work), discovery_cp])
    for mood_source in [source] + [fixture_source for _, fixture_source, _, _ in fixture_inputs]:
        run(java, "-Xmx2g", "-cp", mood_cp, "ValidateMoodBinding", mood_source)
    unsigned = work / "patched-unsigned.apk"
    report = output / "patch-report.json"
    run(java, "-Xmx4g", "-jar", desktop, "patch", "--unsigned", "--bytecode-mode", "STRIP_SAFE",
        "--striplibs", "arm64-v8a", "-p", bundle, "-o", unsigned, "-r", report, source)
    result = json.loads(report.read_text())
    if (result.get("failedPatches") or {x["name"] for x in result.get("appliedPatches", [])} != OPTIONS
            or not result.get("patchingSteps") or any(not x["success"] for x in result["patchingSteps"])):
        raise ValueError("All eight patches must succeed before publishing")
    run(java, "-Xmx2g", "-cp", mood_cp, "ValidateMoodBinding", unsigned, "--patched")
    run(javac, "-cp", desktop, "-d", work, ROOT / "ci/java/ValidatePatchSelection.java")
    validation_cp = os.pathsep.join([str(work), str(desktop)])
    run(java, "-cp", validation_cp, "ValidatePatchSelection", unsigned, "true", "true", "true", "true", "true", metadata["version_code"])
    run(os.sys.executable, ROOT / "ci/icon_compatibility_regression.py", "--input", source, "--bundle", bundle,
        "--desktop", desktop, "--java", java, "--work", work / "icon-compatibility")
    for name, theme, icons, auto, alerts, camera, filename in [
            ("Selectable map themes", "true", "false", "false", "false", "false", "themes-only"),
            ("Selectable report icon packs", "false", "true", "false", "false", "false", "icons-only"),
            ("Android Auto setup", "false", "false", "true", "false", "false", "aa-only"),
            ("Android Auto police alert distance", "false", "false", "false", "true", "false", "alerts-only"),
            ("Speed camera sound below speed limit", "false", "false", "false", "false", "true", "camera-only")]:
        subset = work / (filename + ".apk")
        run(java, "-Xmx4g", "-jar", desktop, "patch", "--unsigned", "--bytecode-mode", "STRIP_SAFE",
            "--striplibs", "arm64-v8a", "--exclusive", "-e", name, "-p", bundle, "-o", subset, source)
        run(java, "-cp", validation_cp, "ValidatePatchSelection", subset, theme, icons, auto, alerts, camera, metadata["version_code"])
    verify_patched_apk(unsigned, native_report)
    verified_versions = [version]
    for fixture, fixture_source, fixture_work, fixture_report in fixture_inputs:
        fixture_apk = fixture_work / "patched.apk"
        fixture_result = fixture_work / "patch-report.json"
        unsupported = set(fixture.get("unsupported_patches", []))
        command = [java, "-Xmx4g", "-jar", desktop, "patch", "--unsigned", "--bytecode-mode", "STRIP_SAFE",
                   "--striplibs", "arm64-v8a", "-p", bundle, "-o", fixture_apk, "-r", fixture_result]
        if unsupported:
            command += ["--force", "--continue-on-error"]
        run(*command, fixture_source)
        applied = json.loads(fixture_result.read_text())
        failed = {x["patch"]["name"] for x in applied.get("failedPatches", [])}
        if failed != unsupported or {x["name"] for x in applied.get("appliedPatches", [])} != OPTIONS - unsupported:
            raise ValueError("Compatibility regression failed for " + fixture["version"])
        if not applied.get("patchingSteps") or any(not step["success"] for step in applied["patchingSteps"]):
            raise ValueError("Compatibility APK reconstruction failed")
        run(java, "-cp", validation_cp, "ValidatePatchSelection", fixture_apk, "true", "true", "true", "true", "true", fixture["version_code"])
        run(java, "-Xmx2g", "-cp", mood_cp, "ValidateMoodBinding", fixture_apk, "--patched")
        if fixture_report:
            verify_patched_apk(fixture_apk, fixture_report)
            verified_versions.append(fixture["version"])
    # Only synthetic, unsigned test inputs bypass certificate matching. Real releases above never do.
    run(javac, "-cp", desktop, "-d", work, ROOT / "ci/java/MutateBindingFixture.java")
    mutation_source = ROOT / "downloads/waze-5.24.5.0-original-arm64.apkm"
    if not mutation_source.exists() and version == "5.24.5.0":
        mutation_source = source
    fixture_identity = next(f for f in json.loads((ROOT / "ci/compatibility_fixtures.json").read_text()) if f["version"] == "5.24.5.0")
    if sha(mutation_source) != fixture_identity["sha256"]:
        raise ValueError("Obfuscation test requires the pinned original fixture")
    for mode in ("renamed", "ambiguous"):
        synthetic = work / f"{mode}.apkm"
        run(java, "-Xmx4g", "-cp", validation_cp, "MutateBindingFixture", mutation_source, synthetic, mode)
        synthetic_apk = work / f"{mode}-patched.apk"
        synthetic_report = work / f"{mode}-patch-report.json"
        command = [java, "-Xmx4g", "-jar", desktop, "patch", "--force", "--unsigned", "--bytecode-mode", "STRIP_SAFE",
                   "--striplibs", "arm64-v8a", "-p", bundle, "-o", synthetic_apk, "-r", synthetic_report]
        if mode == "renamed":
            run(*command, synthetic)
            applied = json.loads(synthetic_report.read_text())
            if applied.get("failedPatches") or {x["name"] for x in applied.get("appliedPatches", [])} != OPTIONS:
                raise ValueError("Renamed fixture did not apply all eight patches")
            run(java, "-cp", validation_cp, "ValidatePatchSelection", synthetic_apk, "true", "true", "true", "true", "true", 1030732)
            run(java, "-Xmx2g", "-cp", mood_cp, "ValidateMoodBinding", synthetic_apk, "--patched")
        else:
            result = subprocess.run([str(x) for x in command + ["--exclusive", "-e", "Selectable map themes", synthetic]],
                                    text=True, encoding="utf-8", stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            (work / "ambiguous.log").write_text(result.stdout)
            if result.returncode == 0 or "resource preparation matched 2 candidates" not in result.stdout:
                raise ValueError("Ambiguous resource hook was not rejected for the expected reason")
            print("PASS: ambiguous resource hook rejected before publishing", flush=True)
    aligned = work / "patched-aligned.apk"
    run(align, "-f", "-P", "16", "4", unsigned, aligned)
    # apksig prioritises existing local ZIP alignment hints over its page-size setting.
    print(f"Updated {normalise_native_alignment(aligned)} native alignment hints before signing", flush=True)
    patched = output / f"waze-{version}-patched-arm64.apk"
    run(javac, "-cp", desktop, "-d", work, ROOT / "ci/java/SignRelease.java")
    run(java, "-cp", os.pathsep.join([str(work), str(desktop)]), "SignRelease",
        args.keystore.resolve(), args.alias, aligned, patched)
    run(align, "-c", "-P", "16", "4", patched)
    identity = inspect_apk(patched, aapt, signer)
    if identity["package"] != "com.waze" or identity["version"] != version or identity["code"] <= metadata["version_code"]:
        raise ValueError("Patched package identity/version is incorrect")
    expected_cert = os.environ.get("WAZE_RELEASE_CERT_SHA256")
    if expected_cert and identity["certificates"] != [expected_cert.lower()]:
        raise ValueError("Release signing certificate changed")
    with zipfile.ZipFile(patched) as archive:
        embedded = archive.read("assets/morphe/installer/waze-aa-installer.apk")
        if hashlib.sha256(embedded).hexdigest() != COMPANION_HASH:
            raise ValueError("Embedded Android Auto installer mismatch")
    original = output / f"waze-{version}-original-arm64{source.suffix}"
    shutil.copyfile(source, original)
    metadata.update(bundle_version=bundle_version, patched=identity, changes=RELEASE_NOTES, compatible_versions=verified_versions,
                    source_commit=run("git", "rev-parse", "HEAD", capture=True).strip(),
                    validation="Semantic bytecode and native resource discovery, direct context bridges, data-flow and palette fixtures, nine-class/twenty-method synthetic obfuscation, ambiguity rejection, native ELF and branch validation, 2023/January seven-patch and April/July/full pinned regressions, missing/mismatched icon fallbacks and schema rejection, all 256 option combinations, independent feature APKs, signatures, package metadata, 16 KiB ZIP alignment. No device runtime test in CI.")
    (output / "build-info.json").write_text(json.dumps(metadata, indent=2) + "\n")
    (output / "SHA256SUMS.txt").write_text("".join(f"{sha(p)}  {p.name}\n" for p in sorted(output.iterdir()) if p.is_file()))
    print(f"Release ready: {output}")


if __name__ == "__main__":
    main()
