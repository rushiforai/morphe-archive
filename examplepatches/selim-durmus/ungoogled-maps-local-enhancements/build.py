#!/usr/bin/env python3
"""Legacy (tag v1.3.1 and earlier): add Home/Work shortcuts, local map markers and labels to a patched Maps APK.

Uses only the Python standard library; external dependencies are documented in README.
No download, installation, key generation, or device-data operations are performed.
"""
import argparse
import copy
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parent
VERSION = "26.36.04.973607363"
VERSION_CODE = "1068763346"
PACKAGE = "org.ungoogled.android.apps.maps"
SIGNATURE = re.compile(r"META-INF/(MANIFEST\.MF|[^/]+\.(SF|RSA|DSA|EC))", re.I)
HOOK = "Lorg/ungoogled/ui/HomeWorkShortcuts;"


def run(*args, capture=False):
    result = subprocess.run([str(a) for a in args], check=True,
                            stdout=subprocess.PIPE if capture else None,
                            stderr=subprocess.STDOUT if capture else None, text=True)
    return result.stdout or ""


def sha256(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def lifecycle_hooks(text):
    if HOOK in text:
        raise ValueError("Home/Work hooks already present. Use a fresh upstream-patched APK.")
    for event, method in (("Resumed", "resume"), ("Paused", "pause"), ("Destroyed", "pause")):
        pattern = (r"(?m)^\.method public onActivity" + event
                   + r"\(Landroid/app/Activity;\)V\s*\n(?P<body>.*?)^\.end method")
        matches = list(re.finditer(pattern, text, re.S))
        if len(matches) != 1:
            raise ValueError("Missing or ambiguous lifecycle callback: " + event)
        match = matches[0]
        body = match.group("body")
        call = "    invoke-static {p1}, " + HOOK + "->" + method + "(Landroid/app/Activity;)V"
        call += "\n    invoke-static {p1}, Lorg/ungoogled/ui/LocalMarkers;->" + method + "(Landroid/app/Activity;)V"
        updated, count = re.subn(r"(?m)^(    \.locals \d+)[ \t]*$", r"\1\n\n" + call,
                                 body, count=1)
        if count != 1:
            raise ValueError("Unsupported lifecycle register declaration: " + event)
        text = text[:match.start("body")] + updated + text[match.end("body"):]
    return text


def label_hooks(decoded):
    bindings = {
        "atqs.smali": (".field public final a:Lnxb;", ".field public l:Lawvj;"),
        "atlg.smali": (".field public final a:Ljava/lang/Object;",),
        "awvj.smali": (".method public final declared-synchronized a()Ljava/io/Serializable;",),
        "oku.smali": (".method public final bz()Ljava/lang/String;", ".method public final p()Lbjap;", ".method public final q()Lbjaw;"),
    }
    for name, signatures in bindings.items():
        paths = list(decoded.glob("smali*/" + name))
        if len(paths) != 1 or not all(s in paths[0].read_text(encoding="utf-8") for s in signatures):
            raise ValueError("Native label binding changed: " + name)
    native = list(decoded.glob("smali*/atqq.smali"))
    chip = list(decoded.glob("smali*/areb.smali"))
    you = list(decoded.glob("smali*/org/ungoogled/ui/YouActivity.smali"))
    if len(native) != 1 or len(chip) != 1 or len(you) != 1:
        raise ValueError("Label action classes changed")
    text = native[0].read_text(encoding="utf-8")
    anchor = ".method public final a(Lbcio;)V\n    .locals 8"
    if text.count(anchor) != 1 or ".field public final synthetic a:Latqs;" not in text:
        raise ValueError("Native label action ABI changed")
    hook = """

    iget-object v0, p0, Latqq;->a:Latqs;
    invoke-static {v0}, Lorg/ungoogled/ui/LocalLabels;->editNative(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :ua_original_label
    return-void
    :ua_original_label
"""
    native[0].write_text(text.replace(anchor,anchor+hook),encoding="utf-8",newline="\n")
    text = chip[0].read_text(encoding="utf-8")
    anchor = "    check-cast v1, Latlg;"
    if text.count(anchor) != 1 or ".method public final onClick(Landroid/view/View;)V\n    .locals 9" not in text:
        raise ValueError("Native place-sheet label action ABI changed")
    hook = """

    iget-object v0, v1, Latlg;->a:Ljava/lang/Object;
    iget-object v2, p0, Lareb;->c:Ljava/lang/Object;
    invoke-static {v0, v2}, Lorg/ungoogled/ui/LocalLabels;->editNativePlace(Ljava/lang/Object;Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :ua_original_label_chip
    return-void
    :ua_original_label_chip
"""
    chip[0].write_text(text.replace(anchor,anchor+hook),encoding="utf-8",newline="\n")
    text = you[0].read_text(encoding="utf-8")
    pattern = r"(?ms)^\.method private labelDialog\(Lorg/ungoogled/ui/SavedStore\$Place;Ljava/lang/String;\)V.*?^\.end method"
    replacement = """.method private labelDialog(Lorg/ungoogled/ui/SavedStore$Place;Ljava/lang/String;)V
    .locals 0
    invoke-static {p0, p1, p2}, Lorg/ungoogled/ui/LocalLabels;->edit(Landroid/app/Activity;Lorg/ungoogled/ui/SavedStore$Place;Ljava/lang/String;)V
    return-void
.end method"""
    updated, count = re.subn(pattern,replacement,text)
    if count != 1: raise ValueError("Local saved label dialog ABI changed")
    you[0].write_text(updated,encoding="utf-8",newline="\n")
    return [native[0],chip[0],you[0]]


def next_dex(names):
    indices = [1 if n == "classes.dex" else int(re.fullmatch(r"classes(\d+)\.dex", n)[1])
               for n in names if re.fullmatch(r"classes(?:\d+)?\.dex", n)]
    if not indices:
        raise ValueError("APK contains no DEX files")
    return "classes" + str(max(indices) + 1) + ".dex"


def certificates(java, apksigner, apk):
    output = run(java, "-jar", apksigner, "verify", "--print-certs", apk, capture=True)
    certs = re.findall(r"Signer #\d+ certificate SHA-256 digest: ([0-9a-fA-F]+)", output)
    if not certs:
        raise ValueError("Could not read signing certificate from " + str(apk))
    return sorted(c.lower() for c in certs)


def jar_classes(destination, classes, pattern):
    files = sorted(p for pat in pattern.split("|") for p in classes.rglob(pat))
    if not files:
        raise ValueError("No compiled classes for " + pattern)
    with zipfile.ZipFile(destination, "w") as archive:
        for path in files:
            archive.write(path, path.relative_to(classes).as_posix())


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, required=True, help="Fresh upstream-patched APK")
    parser.add_argument("--apktool", type=Path, required=True, help="apktool 3.0.3 JAR")
    parser.add_argument("--sdk", type=Path, default=os.environ.get("ANDROID_SDK_ROOT") or os.environ.get("ANDROID_HOME"))
    parser.add_argument("--build-tools", default="36.0.0")
    parser.add_argument("--platform", default="android-36")
    parser.add_argument("--java", default="java")
    parser.add_argument("--javac", default="javac")
    parser.add_argument("--work-dir", type=Path, default=ROOT / "build")
    parser.add_argument("--output", type=Path, default=ROOT / "dist/ungoogled-maps-local-markers.apk")
    parser.add_argument("--keystore", type=Path, required=True)
    parser.add_argument("--password-file", type=Path, required=True,
                        help="Keystore password file; do not put passwords on command line")
    parser.add_argument("--key-password-file", type=Path)
    parser.add_argument("--key-alias", default="morphe")
    args = parser.parse_args()
    if not (ROOT / "src/org/ungoogled/ui/LocalMarkers.java").is_file():
        # Since 1.4.0 bearinmind's Offline saved places draws saved places and labels itself.
        raise SystemExit("This legacy post-patch builder adds our own markers and labels for upstream 1.3.0. "
                         "Run it from a checkout of tag v1.3.1.")
    if args.sdk is None:
        parser.error("Set --sdk or ANDROID_SDK_ROOT")
    args.sdk = args.sdk.resolve()
    for name in ("input", "apktool", "keystore", "password_file", "output", "work_dir"):
        setattr(args, name, getattr(args, name).resolve())
    bt = args.sdk / "build-tools" / args.build_tools
    extension = ".exe" if os.name == "nt" else ""
    aapt = bt / ("aapt2" + extension)
    zipalign = bt / ("zipalign" + extension)
    apksigner = bt / "lib/apksigner.jar"
    d8 = bt / "lib/d8.jar"
    android = args.sdk / "platforms" / args.platform / "android.jar"
    required = (args.input, args.apktool, args.keystore, args.password_file, aapt,
                zipalign, apksigner, d8, android)
    for path in required:
        if not path.is_file():
            parser.error("Missing dependency/input: " + str(path))
    if args.work_dir.exists() or args.output.exists() or args.output.with_suffix(".verification.json").exists():
        parser.error("Work directory/output must be new; keep old builds for rollback.")
    badging = run(aapt, "dump", "badging", args.input, capture=True)
    package = re.search(r"^package: name='([^']+)' versionCode='([^']+)' versionName='([^']+)'", badging, re.M)
    if not package or package.groups() != (PACKAGE, VERSION_CODE, VERSION):
        parser.error("Unsupported APK. Expected " + PACKAGE + " " + VERSION
                     + ". Port and review version-specific bindings before upgrading.")
    input_certs = certificates(args.java, apksigner, args.input)
    work = args.work_dir
    work.mkdir(parents=True)
    decoded = work / "decoded"
    print("Decoding and validating the upstream-patched APK...", flush=True)
    run(args.java, "-jar", args.apktool, "d", "-r", "-o", decoded, args.input)
    front_candidates = list(decoded.glob("smali*/org/ungoogled/ui/SavedPlaces$Front.smali"))
    if len(front_candidates) != 1:
        raise ValueError("Expected exactly one local-saved lifecycle class; upstream ABI changed")
    if list(decoded.glob("smali*/org/ungoogled/ui/HomeWorkShortcuts*.smali")):
        raise ValueError("Input already contains Home/Work extension; use fresh upstream output")
    front = front_candidates[0]
    smali_dir = front.relative_to(decoded).parts[0]
    if smali_dir == "smali":
        target_dex = "classes.dex"
    elif re.fullmatch(r"smali_classes\d+", smali_dir):
        target_dex = smali_dir.removeprefix("smali_") + ".dex"
    else:
        raise ValueError("Unexpected DEX directory: " + smali_dir)
    checks = {
        "SavedStore.smali": (".field static home:Lorg/ungoogled/ui/SavedStore$Place;",
                             ".field static work:Lorg/ungoogled/ui/SavedStore$Place;",
                             ".field static final labels:Ljava/util/Map;",
                             ".method static declared-synchronized labelsFor(Lorg/ungoogled/ui/SavedStore$Place;)Ljava/util/List;",
                             ".method static declared-synchronized setLabel(Landroid/content/Context;Ljava/lang/String;Lorg/ungoogled/ui/SavedStore$Place;)V",
                             ".method static declared-synchronized removeLabel(Landroid/content/Context;Ljava/lang/String;)V",
                             ".method static declared-synchronized setHome(Landroid/content/Context;Lorg/ungoogled/ui/SavedStore$Place;)V",
                             ".method static declared-synchronized setWork(Landroid/content/Context;Lorg/ungoogled/ui/SavedStore$Place;)V",
                             ".method static aliasOf(Lorg/ungoogled/ui/SavedStore$Place;)Lorg/ungoogled/ui/SavedStore$Place;",
                             ".method static declared-synchronized load(Landroid/content/Context;)V",
                             ".method static declared-synchronized allSaved()Ljava/util/List;"),
        "SavedStore$Place.smali": (".field lat:D", ".field lng:D", ".field name:Ljava/lang/String;",
                                  ".field ftid:Ljava/lang/String;", ".field final lists:Ljava/util/Set;"),
        "SavedPlaces.smali": (".method static directions(Landroid/content/Context;Lorg/ungoogled/ui/SavedStore$Place;)V",
                              ".method static dialogTheme(Landroid/content/Context;)I",
                              ".method static place(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/ungoogled/ui/SavedStore$Place;",
                              ".method static open(Landroid/content/Context;Lorg/ungoogled/ui/SavedStore$Place;)V"),
    }
    for name, signatures in checks.items():
        text = (front.parent / name).read_text(encoding="utf-8")
        if not all(signature in text for signature in signatures):
            raise ValueError("Saved-places ABI changed: " + name)
    baseline = {p.relative_to(decoded).as_posix(): sha256(p) for p in decoded.rglob("*.smali")}
    front.write_text(lifecycle_hooks(front.read_text(encoding="utf-8")), encoding="utf-8", newline="\n")
    label_changes = label_hooks(decoded)
    changed = [p.relative_to(decoded).as_posix() for p in decoded.rglob("*.smali")
               if baseline.get(p.relative_to(decoded).as_posix()) != sha256(p)]
    if set(changed) != {p.relative_to(decoded).as_posix() for p in [front] + label_changes}:
        raise ValueError("Unexpected original-class changes: " + repr(changed))
    target_dexes = {"classes.dex" if p.split("/")[0] == "smali" else p.split("/")[0].removeprefix("smali_") + ".dex" for p in changed}
    classes = work / "classes"
    classes.mkdir()
    sources = sorted(p for folder in ("src", "stubs", "tests") for p in (ROOT / folder).rglob("*.java"))
    run(args.javac, "-encoding", "UTF-8", "--release", "8", "-cp", android, "-d", classes, *sources)
    run(args.java, "-cp", str(classes) + os.pathsep + str(android), "org.ungoogled.ui.RouteGuardTest")
    run(args.java, "-cp", classes, "org.ungoogled.ui.MarkerGeometryTest")
    run(args.java, "-cp", classes, "org.ungoogled.ui.LabelIndexTest")
    jar_classes(work / "helper.jar", classes, "HomeWorkShortcuts*.class|LocalMarkers*.class|LocalLabels*.class|LabelIndex.class|MarkerGeometry.class|MarkerGeometry$*.class|MarkerTouchRouter*.class")
    jar_classes(work / "stubs.jar", classes, "Saved*.class")
    dex_dir = work / "helper-dex"
    dex_dir.mkdir()
    run(args.java, "-cp", d8, "com.android.tools.r8.D8", "--min-api", "28", "--lib", android,
        "--classpath", work / "stubs.jar", "--output", dex_dir, work / "helper.jar")
    run(args.java, "-jar", args.apktool, "b", decoded, "-o", work / "rebuilt.apk")
    unsigned = work / "unsigned.apk"
    print("Preserving original resources, manifest, native libraries and other DEX files...", flush=True)
    with zipfile.ZipFile(args.input) as original, zipfile.ZipFile(work / "rebuilt.apk") as rebuilt:
        names = original.namelist()
        if len(names) != len(set(names)):
            raise ValueError("Duplicate APK entries are not supported")
        extra = next_dex(names)
        with zipfile.ZipFile(unsigned, "w") as patched:
            for entry in original.infolist():
                if SIGNATURE.fullmatch(entry.filename):
                    continue
                data = rebuilt.read(entry.filename) if entry.filename in target_dexes else original.read(entry.filename)
                patched.writestr(copy.copy(entry), data)
            patched.write(dex_dir / "classes.dex", extra, compress_type=zipfile.ZIP_DEFLATED)
        with zipfile.ZipFile(unsigned) as patched:
            changed_entries = [n for n in names if n in patched.namelist() and original.read(n) != patched.read(n)]
            if set(changed_entries) != target_dexes or set(patched.namelist()) - set(names) != {extra}:
                raise ValueError("APK entry preservation check failed")
    aligned = work / "aligned.apk"
    signed = work / "signed.apk"
    run(zipalign, "-f", "-P", "16", "4", unsigned, aligned)
    sign_args = [args.java, "-jar", apksigner, "sign", "--ks", args.keystore,
                 "--ks-pass", "file:" + str(args.password_file), "--ks-key-alias", args.key_alias]
    if args.key_password_file:
        sign_args.extend(("--key-pass", "file:" + str(args.key_password_file.resolve())))
    run(*sign_args, "--out", signed, aligned)
    output_certs = certificates(args.java, apksigner, signed)
    if output_certs != input_certs:
        raise ValueError("Signing certificate differs from input. Output not exported; use the original key.")
    run(zipalign, "-c", "-P", "16", "4", signed)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(signed, args.output)
    report = {"package": PACKAGE, "version": VERSION, "input_sha256": sha256(args.input),
              "output_sha256": sha256(args.output), "certificate_sha256": output_certs,
              "modified_original_classes": changed, "replaced_apk_entries": sorted(target_dexes),
              "added_apk_entries": [extra], "route_ownership_checks": 12,
              "marker_geometry_10000_points": "passed", "label_matching": "passed",
              "installed": False, "runtime_verified": False}
    args.output.with_suffix(".verification.json").write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print("Built:", args.output)
    print("SHA-256:", report["output_sha256"])
    print("Signature and APK-entry preservation checked. Device smoke test still required.")


if __name__ == "__main__":
    main()
