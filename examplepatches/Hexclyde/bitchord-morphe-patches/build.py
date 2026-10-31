#!/usr/bin/env python3
"""Build the patch bundle (.mpp)."""

from pathlib import Path
import os, subprocess, zipfile, hashlib, shutil, fcntl, tempfile, uuid

from buildenv import (
    BUNDLE_NAME,
    MORPHE_JAR as MORPHE,
    PATCHER_VERSION,
    ROOT,
    TDLIB as TD,
    TOOLS,
    VERSION,
    jdk,
)

JDK = jdk()
JAVA, JAVAC = str(JDK / "bin/java"), str(JDK / "bin/javac")
ANDROID = TOOLS / "android.jar"
R8 = TOOLS / "r8-latest.jar"
OUT = ROOT / "build"
OUT.mkdir(exist_ok=True)
lock = open(ROOT / ".build.lock", "w")
fcntl.flock(lock, fcntl.LOCK_EX)
ENV = dict(
    os.environ,
    JAVA_HOME=str(JDK),
    PATH=str(JDK / "bin") + os.pathsep + os.environ["PATH"],
)


def run(*args):
    subprocess.run([str(a) for a in args], check=True, env=ENV)


def jar(path, base):
    # Publish completed archives atomically; readers never see a partly written JAR/MPP.
    with tempfile.TemporaryDirectory(prefix="telegram-archive-") as temp:
        staged = Path(temp) / path.name
        with zipfile.ZipFile(staged, "w", zipfile.ZIP_DEFLATED) as z:
            for file in sorted(base.rglob("*")):
                if file.is_file() and not any(
                    part.startswith(".") for part in file.relative_to(base).parts
                ):
                    z.write(file, file.relative_to(base))
        with zipfile.ZipFile(staged) as z:
            if z.testzip() is not None:
                raise RuntimeError("Archive verification failed")
        pending = path.with_name("." + path.name + "." + uuid.uuid4().hex)
        shutil.copy2(staged, pending)
        pending.replace(path)


for name in (
    "extension-classes",
    "patch-classes",
    "extension-dex",
    "patch-dex",
    "bundle",
    "compile-api",
):
    shutil.rmtree(OUT / name, ignore_errors=True)
    (OUT / name).mkdir()
stdlib = TOOLS / "kotlinc/lib/kotlin-stdlib.jar"
run(
    JAVAC,
    "-J-Xshare:off",
    "--release",
    "8",
    "-Xlint:-options",
    "-cp",
    os.pathsep.join(map(str, [stdlib, ANDROID])),
    "-d",
    OUT / "compile-api",
    *sorted((ROOT / "compile-only").rglob("*.java")),
)
jar(OUT / "compile-api.jar", OUT / "compile-api")
sources = list((ROOT / "extensions/telegram/src/main/java").rglob("*.java")) + list(
    (TD / "src/main/java").rglob("*.java")
)
run(
    JAVAC,
    "-J-Xshare:off",
    "-encoding",
    "UTF-8",
    "--release",
    "8",
    "-Xlint:-options",
    "-cp",
    os.pathsep.join(
        map(str, [ANDROID, TOOLS / "annotation.jar", stdlib, OUT / "compile-api.jar"])
    ),
    "-d",
    OUT / "extension-classes",
    *sources,
)
jar(OUT / "extension.jar", OUT / "extension-classes")
run(
    JAVA,
    "-Xshare:off",
    "-Xmx3g",
    "-cp",
    R8,
    "com.android.tools.r8.D8",
    "--release",
    "--min-api",
    "26",
    "--lib",
    ANDROID,
    "--lib",
    stdlib,
    "--lib",
    OUT / "compile-api.jar",
    "--output",
    OUT / "extension-dex",
    OUT / "extension.jar",
)
run(
    TOOLS / "kotlinc/bin/kotlinc",
    "-Xskip-metadata-version-check",
    "-Xcontext-parameters",
    "-jvm-target",
    "11",
    "-cp",
    MORPHE,
    "-d",
    OUT / "patch-classes",
    *sorted((ROOT / "patches/src/main/kotlin").rglob("*.kt")),
)
jar(OUT / "patch.jar", OUT / "patch-classes")
run(
    JAVA,
    "-Xshare:off",
    "-Xmx2g",
    "-cp",
    R8,
    "com.android.tools.r8.D8",
    "--release",
    "--min-api",
    "26",
    "--lib",
    ANDROID,
    "--lib",
    MORPHE,
    "--output",
    OUT / "patch-dex",
    OUT / "patch.jar",
)
bundle = OUT / "bundle"
shutil.copytree(OUT / "patch-classes", bundle, dirs_exist_ok=True)
for dex in (OUT / "patch-dex").glob("*.dex"):
    shutil.copy2(dex, bundle / dex.name)
(bundle / "extensions").mkdir(exist_ok=True)
# Morphe's extension input may be a multidex ZIP; use one DEX here and fail if it grows.
dexes = list((OUT / "extension-dex").glob("*.dex"))
if len(dexes) != 1:
    raise RuntimeError("Expected one extension DEX")
shutil.copy2(dexes[0], bundle / "extensions/telegram.mpe")
for abi in ("arm64-v8a", "armeabi-v7a", "x86_64"):
    libs = bundle / "lib" / abi
    libs.mkdir(parents=True, exist_ok=True)
    for src in [
        TD / f"src/main/libs/30.0.16248370/android-24/{abi}/libtdjni.so",
        TD / f"openssl/30.0.16248370/android-24/{abi}/lib/libsslx.so",
        TD / f"openssl/30.0.16248370/android-24/{abi}/lib/libcryptox.so",
        TOOLS / "libcxx" / abi / "libc++_shared.so",
    ]:
        shutil.copy2(src, libs / src.name)
shutil.copytree(ROOT / "licenses", bundle / "licenses", dirs_exist_ok=True)
(bundle / "META-INF").mkdir(exist_ok=True)
(bundle / "META-INF/MANIFEST.MF").write_text(
    f"Manifest-Version: 1.0\nName: BitChord Morphe Patches\nVersion: {VERSION}\nPatcher-Version: {PATCHER_VERSION}\n\n"
)
output = OUT / BUNDLE_NAME
jar(output, bundle)
print(f"Built {output} ({output.stat().st_size:,} bytes)")
print(hashlib.sha256(output.read_bytes()).hexdigest())
