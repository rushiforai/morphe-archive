"""Build the standard MPP layout using the public Morphe Desktop runtime.

This alternative to Gradle requires no GitHub Packages token. No APK is downloaded,
patched, signed, installed or uploaded by this script.
"""
from pathlib import Path
import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
import zipfile

ROOT = Path(__file__).resolve().parents[1]
TOOLS = ROOT / ".tools"
BUILD = ROOT / "build" / "standalone"
VERSION = "0.1.18-dev"


def run(args):
    subprocess.run([str(arg) for arg in args], cwd=ROOT, check=True)


def tool_paths():
    candidates = list((TOOLS / "java").glob("*/bin/java.exe"))
    if os.environ.get("JAVA_HOME"):
        candidates.append(Path(os.environ["JAVA_HOME"]) / "bin" / "java.exe")
    if not candidates:
        raise SystemExit("JDK 21 is required. Run scripts/bootstrap.ps1 first.")
    java = candidates[0]
    android = TOOLS / "android-sdk/platforms/android-35/android.jar"
    r8 = TOOLS / "android-sdk/build-tools/35.0.0/lib/d8.jar"
    runtime = TOOLS / "morphe-desktop.jar"
    compiler = TOOLS / "kotlin/kotlinc/lib"
    for path in (java, android, r8, runtime, compiler / "kotlin-compiler.jar"):
        if not path.exists():
            raise SystemExit(f"Missing {path}. Run scripts/bootstrap.ps1 first.")
    return java, android, r8, runtime, compiler


def zip_tree(target, directory, extra=None):
    with zipfile.ZipFile(target, "w", zipfile.ZIP_DEFLATED) as archive:
        def write(name, content):
            entry = zipfile.ZipInfo(name, (1980, 1, 1, 0, 0, 0))
            entry.compress_type = zipfile.ZIP_DEFLATED
            entry.external_attr = 0o644 << 16
            archive.writestr(entry, content)
        for path in sorted(directory.rglob("*")):
            if path.is_file():
                write(path.relative_to(directory).as_posix(), path.read_bytes())
        for name, data in (extra or {}).items():
            write(name, data)


def build(test_only=False):
    java, android, r8, runtime, compiler = tool_paths()
    javac = java.with_name("javac.exe")
    BUILD.mkdir(parents=True, exist_ok=True)
    tests = BUILD / "tests"
    tests.mkdir(exist_ok=True)
    core = ROOT / "extensions/extension/src/main/java/app/linenotifications/extension/core/NotificationPolicy.java"
    run([javac, "-encoding", "UTF-8", "--release", "8", "-d", tests, core, ROOT / "tests/core/NotificationPolicyTest.java"])
    run([java, "-cp", tests, "NotificationPolicyTest"])

    runtime_src = BUILD / "runtime-tests-src"
    runtime_classes = BUILD / "runtime-tests"
    for path in (runtime_src, runtime_classes):
        path.mkdir(exist_ok=True)
        for file in path.rglob("*"):
            if file.is_file():
                file.unlink()
    shim_pkg = runtime_src / "app/linenotifications/extension"
    shim_pkg.mkdir(parents=True, exist_ok=True)
    settings_raw = (ROOT / "extensions/extension/src/main/java/app/linenotifications/extension/Settings.java").read_text(encoding="utf-8")
    settings_shim, patched_flags = re.subn(
        r"(public static boolean \w+Included\(\)\s*\{\s*)return false;(\s*\})",
        r"\1return true;\2",
        settings_raw,
    )
    if patched_flags != 5:
        raise SystemExit(f"Expected 5 included flags in Settings.java, found {patched_flags}")
    (shim_pkg / "Settings.java").write_text(settings_shim, encoding="utf-8")
    (shim_pkg / "NotificationContinuation.java").write_text(
        "package app.linenotifications.extension;\n"
        "import kotlin.coroutines.Continuation;\n"
        "public final class NotificationContinuation extends dt8.d {\n"
        "    public NotificationContinuation(Object completion) { super((Continuation) completion); }\n"
        "    @Override public Object invokeSuspend(Object result) { return result; }\n"
        "}\n",
        encoding="utf-8",
    )
    ext_java = [
        p for p in sorted((ROOT / "extensions/extension/src/main/java/app/linenotifications").rglob("*.java"))
        if p.name not in {"Settings.java", "NotificationContinuation.java"}
    ]
    runtime_sources = (
        ext_java
        + [shim_pkg / "Settings.java", shim_pkg / "NotificationContinuation.java"]
        + sorted((ROOT / "tests/runtime").rglob("*.java"))
    )
    runtime_args = BUILD / "runtime-test-sources.txt"
    runtime_args.write_text("\n".join('"' + str(p).replace("\\", "/") + '"' for p in runtime_sources), encoding="utf-8")
    run([javac, "-encoding", "UTF-8", "-source", "11", "-target", "11", "-classpath", android,
         "-d", runtime_classes, "@" + str(runtime_args)])
    run([java, "-cp", os.pathsep.join([str(runtime_classes), str(android)]),
         "app.linenotifications.extension.ExtensionRuntimeTest"])

    run([sys.executable, "-m", "unittest", "discover", "-s", "tests", "-p", "test_*.py", "-v"])
    if test_only:
        return
    extensions = BUILD / "extension-classes"
    patches = BUILD / "patch-classes"
    extension_dex = BUILD / "extension-dex"
    patch_dex = BUILD / "patch-dex"
    for path in (extensions, patches, extension_dex, patch_dex):
        path.mkdir(exist_ok=True)
        # Remove only previously generated files within this script's exact output directories.
        for file in path.rglob("*"):
            if file.is_file():
                file.unlink()
    java_sources = sorted((ROOT / "extensions/extension/src/main/java/app/linenotifications").rglob("*.java"))
    args_file = BUILD / "extension-sources.txt"
    args_file.write_text("\n".join('"' + str(p).replace("\\", "/") + '"' for p in java_sources), encoding="utf-8")
    run([javac, "-encoding", "UTF-8", "-source", "11", "-target", "11", "-classpath", android,
         "-d", extensions, "@" + str(args_file)])
    extension_jar = BUILD / "extension.jar"
    zip_tree(extension_jar, extensions)
    run([java, "-cp", r8, "com.android.tools.r8.D8", "--release", "--min-api", "30",
         "--lib", android, "--output", extension_dex, extension_jar])
    if sorted(p.name for p in extension_dex.glob("*.dex")) != ["classes.dex"]:
        raise SystemExit("Expected one extension DEX; refusing to truncate a multidex extension")
    # util/PatchListGenerator is a Gradle release helper, not part of the patch bundle.
    kotlin_sources = sorted((ROOT / "patches/src/main/kotlin/app").rglob("*.kt"))
    compiler_cp = os.pathsep.join(str(p) for p in compiler.glob("*.jar"))
    compile_cp = os.pathsep.join([str(runtime), str(compiler / "kotlin-stdlib.jar")])
    run([java, "-Xmx2g", "-cp", compiler_cp, "org.jetbrains.kotlin.cli.jvm.K2JVMCompiler",
         "-no-stdlib", "-no-reflect", "-jvm-target", "11", "-language-version", "2.0", "-api-version", "2.0", "-classpath", compile_cp,
         "-d", patches, *kotlin_sources])
    patch_jar = BUILD / "patches-jvm.jar"
    zip_tree(patch_jar, patches)
    run([java, "-Xmx2g", "-cp", r8, "com.android.tools.r8.D8", "--release", "--min-api", "26",
         "--lib", android, "--classpath", runtime, "--output", patch_dex, patch_jar])
    manifest = ("Manifest-Version: 1.0\r\nName: LINE notification patches\r\n"
                "Description: Experimental local notification controls for LINE\r\n"
                f"Version: {VERSION}\r\nPatcher-Version: 2.3.0\r\nLicense: GPLv3\r\n\r\n")
    out = ROOT / "patches/build/libs"
    out.mkdir(parents=True, exist_ok=True)
    bundle = out / f"line-notification-patches-{VERSION}.mpp"
    additions = {"META-INF/MANIFEST.MF": manifest.encode(),
                 "extensions/extension.mpe": (extension_dex / "classes.dex").read_bytes(),
                 "LICENSE": (ROOT / "LICENSE").read_bytes(),
                 "NOTICE": (ROOT / "NOTICE").read_bytes(),
                 "THIRD_PARTY_NOTICES.md": (ROOT / "THIRD_PARTY_NOTICES.md").read_bytes()}
    additions.update({p.name: p.read_bytes() for p in patch_dex.glob("*.dex")})
    candidate = BUILD / "candidate.mpp"
    zip_tree(candidate, patches, additions)
    run([java, "-jar", runtime, "list-patches", "--patches", candidate, "-v", "-x"])
    os.replace(candidate, bundle)
    report = {"bundle": bundle.name, "sha256": hashlib.sha256(bundle.read_bytes()).hexdigest(),
              "morpheDesktop": "2.1.1", "patcher": "2.3.0", "kotlin": "2.4.21", "deviceTested": False}
    (out / "build-report.json").write_text(json.dumps(report, indent=2), encoding="utf-8")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--test-only", action="store_true")
    build(parser.parse_args().test_only)
