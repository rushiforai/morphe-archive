#!/usr/bin/env python3
"""Static regression checks against REAL 9GAG 8.26.1 APKs (no device/mocks).

Usage:
  python3 scripts/verify_ninegag.py ORIGINAL.apk PATCHED.apk \
    --cli-jar /path/to/morphe-desktop-all.jar --java /path/to/jdk21/bin/java
  # Add --analytics only when the optional analytics patch was selected.

Requires Python stdlib, JDK 21+, apktool (tested with 2.7), and a Morphe CLI
fat jar containing dexlib2 + apksig. JAVA/JAVA_HOME and MORPHE_CLI_JAR are
accepted. Exit 0 = every invariant passes; 1 = regression; 2 = tool/input error.
--work-dir retains content-addressed DEX snapshots and decoded resources.
These checks deliberately require patch effects, not patcher exit status: an
unmodified/re-signed APK with zero patches selected must fail. This is static
verification, not proof of device/runtime ad suppression or network behavior.
"""
import argparse
from collections import Counter
from copy import deepcopy
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
from urllib.parse import urlsplit
import xml.etree.ElementTree as ET
import zipfile

A = "{http://schemas.android.com/apk/res/android}"
DISPLAY = "Ld44;->j(ILjava/lang/String;Z)Ljava/util/List;"
DATABASE = "Ld44;->d(Ljava/lang/String;IIIZ)Lqy7;"
BANNER = "Lg3b;->f(Landroid/widget/FrameLayout;Li04;)V"
POLICY = "Lgb;->b(ZLo57;Lib;)Lfa;"
GATE_CALLERS = ("Lgb;->a(ZZLo57;ZLib;)Lfa;", "Lgb;->c()Lfa;",
                "Lgb;->d()Z", "Lja;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;")
LAYOUTS = tuple("res/layout/" + n + ".xml" for n in (
    "activity_home_v2", "activity_simple_fragment_holder",
    "activity_standalone_swipe", "activity_swipe_post_comment"))
ANALYTICS = "firebase_analytics_collection_deactivated"
ROOT = Path(__file__).resolve().parents[1]


def digest(path):
    with open(path, "rb") as f:
        return hashlib.file_digest(f, "sha256").hexdigest()


def run(command):
    result = subprocess.run([str(x) for x in command], text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if result.returncode:
        raise RuntimeError(f"Command failed ({result.returncode}): {' '.join(map(str, command))}\n"
                           + result.stdout + result.stderr)
    return result.stdout


def snapshot(apk, args, work, hosts):
    source = ROOT / "scripts/NinegagVerifier.java"
    key = hashlib.sha256((digest(apk) + digest(source) + digest(args.cli_jar)
                          + digest(hosts)).encode()).hexdigest()
    destination = work / ("dex-" + key + ".json")
    if not destination.exists():
        output = run([args.java, "-Xmx3g", "--class-path", args.cli_jar,
                      source, apk, hosts])
        json.loads(output)  # Never cache failed/partial extractor output.
        destination.write_text(output)
    return json.loads(destination.read_text())


def decode(apk, args, work):
    # Cache only complete resource decodes of this exact APK + apktool version.
    version = run([args.apktool, "--version"]).strip()
    key = hashlib.sha256((digest(apk) + version).encode()).hexdigest()
    destination = work / ("resources-" + key)
    marker = destination / ".complete"
    if not marker.exists():
        run([args.apktool, "d", "-f", "-s", "-o", destination, apk])
        marker.write_text(key)
    return destination


def canonical(element):
    return (element.tag, tuple(sorted(element.attrib.items())),
            (element.text or "").strip(), (element.tail or "").strip(),
            tuple(canonical(c) for c in element))


def xml(path):
    return ET.parse(path).getroot()


def banner_frame(tree):
    candidates = [e for e in tree.iter("FrameLayout")
                  if e.get(A + "id", "").split("/")[-1] == "adview_adhesion_banner_container"]
    if len(candidates) != 1:
        raise ValueError(f"Expected one banner FrameLayout, found {len(candidates)}")
    return candidates[0]


def blocked_host(value, hosts):
    try:
        host = urlsplit(value if "://" in value else "http://" + value).hostname
        host = host.lower() if host else None
        while host:
            if host in hosts:
                return urlsplit(value if "://" in value else "http://" + value).hostname
            host = host.partition(".")[2]
    except ValueError:
        pass
    return None


def verify(args, work):
    failures = []
    checks = []

    def check(ok, message, detail=""):
        checks.append(message)
        print(("PASS " if ok else "FAIL ") + message + (": " + detail if detail else ""), flush=True)
        if not ok:
            failures.append(message)

    hosts_source = ROOT / "patches/src/main/kotlin/app/template/patches/ninegag/ad/Hosts.kt"
    match = re.search(r'AD_HOSTS\s*=\s*"""(.*?)"""', hosts_source.read_text(), re.S)
    if not match:
        raise ValueError("Cannot read AD_HOSTS from " + str(hosts_source))
    hosts = {s.strip() for s in match.group(1).splitlines() if s.strip()}
    hostfile = work / ("hosts-" + hashlib.sha256("\n".join(sorted(hosts)).encode()).hexdigest() + ".txt")
    hostfile.write_text("\n".join(sorted(hosts)) + "\n")
    print("INPUT original_sha256=" + digest(args.original), flush=True)
    print("INPUT patched_sha256=" + digest(args.patched), flush=True)
    before = snapshot(args.original, args, work, hostfile)
    after = snapshot(args.patched, args, work, hostfile)
    check(after["signature_verified"], "output APK signature verifies", after["signature_errors"] if not after["signature_verified"] else "")
    check(before["dex_count"] > 0 and after["dex_count"] > 0, "input and output contain DEX")
    check(all(v == 1 for v in before["classes"].values()), "original has no duplicate class definitions")
    duplicates = [c for c, count in after["classes"].items() if count != 1]
    check(not duplicates, "output has no duplicate class definitions", str(duplicates[:8]) if duplicates else "")
    missing = sorted(set(before["classes"]) - set(after["classes"]))
    added = sorted(set(after["classes"]) - set(before["classes"]))
    check(not missing and not added, "all class definitions preserved exactly",
          f"original={len(before['classes'])} output={len(after['classes'])} missing={len(missing)} added={len(added)}")
    changed_schemas = [c for c, schema in before["schemas"].items()
                       if after["schemas"].get(c) != schema]
    check(not changed_schemas, "class flags, hierarchy, fields and method signatures preserved",
          str(changed_schemas[:8]) if changed_schemas else "")
    for target in (DISPLAY, DATABASE, BANNER, POLICY, *GATE_CALLERS):
        if target not in before["methods"] or target not in after["methods"]:
            raise ValueError("Required 8.26.1 method missing: " + target)
    original_display = before["methods"][DISPLAY]
    patched_display = after["methods"][DISPLAY]
    check(original_display["registers"] == 10 and len(original_display["instructions"]) == 30
          and original_display["access"] == 17, "original display query matches validated 8.26.1 shape")
    expected_display = deepcopy(original_display)
    expected_display["instructions"].insert(0, {"opcode": "CONST_4", "RegisterA": 9,
                                               "NarrowLiteral": 1, "WideLiteral": 1})
    check(patched_display == expected_display,
          "display query forces p3=true and preserves every original instruction",
          "expected const/4 v9, 0x1 prefix; " + str(len(patched_display["instructions"])) + " instructions")
    check(before["methods"][DATABASE] == after["methods"][DATABASE],
          "shared database query unchanged (registers, instructions, operands, try/catch)")
    original_banner = before["methods"][BANNER]
    patched_banner = after["methods"][BANNER]
    check(original_banner["access"] == 25 and original_banner["registers"] == 11
          and len(original_banner["instructions"]) == 54,
          "original banner initializer matches validated 8.26.1 shape")
    prefix = [
        {"opcode": "MOVE_OBJECT_FROM16", "RegisterA": 1, "RegisterB": 9},
        {"opcode": "CONST_16", "RegisterA": 0, "NarrowLiteral": 8, "WideLiteral": 8},
        {"opcode": "INVOKE_VIRTUAL", "RegisterCount": 2, "RegisterC": 1, "RegisterD": 0,
         "RegisterE": 0, "RegisterF": 0, "RegisterG": 0, "ReferenceType": 3,
         "Reference": "Landroid/view/View;->setVisibility(I)V"},
        {"opcode": "INVOKE_VIRTUAL", "RegisterCount": 1, "RegisterC": 1, "RegisterD": 0,
         "RegisterE": 0, "RegisterF": 0, "RegisterG": 0, "ReferenceType": 3,
         "Reference": "Landroid/view/ViewGroup;->removeAllViews()V"},
        {"opcode": "RETURN_VOID"},
    ]
    expected_banner = deepcopy(original_banner)
    expected_banner["instructions"] = prefix + original_banner["instructions"]
    # This inspected method has no try blocks, so prefix injection requires no
    # handler-address adjustment; do not silently normalize altered handlers.
    check(patched_banner == expected_banner,
          "banner hides frame, removes children, returns before original initializer",
          f"expected five-instruction prefix; {len(patched_banner['instructions'])} instructions")
    original_policy = before["methods"][POLICY]
    check(original_policy["registers"] == 3 and original_policy["access"] == 25
          and len(original_policy["instructions"]) == 22,
          "original nullable ad-block policy matches validated 8.26.1 shape")
    expected_policy = deepcopy(original_policy)
    expected_policy["instructions"] = [
        {"opcode": "SGET_OBJECT", "RegisterA": 0, "ReferenceType": 2,
         "Reference": "Lfa;->a:Lfa;"},
        {"opcode": "RETURN_OBJECT", "RegisterA": 0},
    ] + original_policy["instructions"]
    check(after["methods"][POLICY] == expected_policy,
          "ad policy returns real non-null NotInitialized blocker before original body")
    check(all(before["methods"][m] == after["methods"][m] for m in GATE_CALLERS),
          "synchronous/reactive ad-gate callers and entitlement reads unchanged")
    expected_rewrites = {}
    for location, value in before["strings"].items():
        host = blocked_host(value, hosts)
        if host:
            expected_rewrites[location] = re.sub(re.escape(host), "0.0.0.0", value, flags=re.I)
    check(bool(expected_rewrites), "original contains referenced blocked hosts (non-vacuous)",
          f"{len(expected_rewrites)} field/instruction references")
    bad_rewrites = [location for location, value in expected_rewrites.items()
                    if after["strings"].get(location) != value]
    check(not bad_rewrites, "every blocked field/instruction host reference rewritten to 0.0.0.0",
          f"missing/incorrect={len(bad_rewrites)} of {len(expected_rewrites)}")
    remaining = [(k, v) for k, v in after["strings"].items() if blocked_host(v, hosts)]
    check(not remaining, "no blocked host references remain in executable DEX or string fields",
          f"remaining={len(remaining)}")
    # Raw DEX string pools intentionally aren't checked: unused original strings
    # may remain in a rebuilt DEX. Actual references are the security boundary.
    with zipfile.ZipFile(args.original) as source, zipfile.ZipFile(args.patched) as output:
        duplicates = [n for n, count in Counter(output.namelist()).items() if count > 1]
        check(not duplicates, "output APK has no duplicate ZIP entries", str(duplicates[:8]) if duplicates else "")
        stable = [n for n in source.namelist() if n.startswith(("lib/", "assets/")) and not n.endswith("/")]
        altered = [n for n in stable if n not in output.namelist() or source.read(n) != output.read(n)]
        check(not altered, "original native libraries and assets preserved byte-for-byte",
              f"checked={len(stable)} changed/missing={len(altered)}")
    source_res = decode(args.original, args, work)
    output_res = decode(args.patched, args, work)
    manifest_before = xml(source_res / "AndroidManifest.xml")
    manifest_after = xml(output_res / "AndroidManifest.xml")
    # apktool moves versionName/versionCode out of XML into apktool.yml.
    def versions(directory):
        text = (directory / "apktool.yml").read_text()
        return tuple(re.search(r"^  " + key + r":\s*(.*?)\s*$", text, re.M).group(1).strip("'\"")
                     for key in ("versionName", "versionCode"))
    original_version, output_version = versions(source_res), versions(output_res)
    check(manifest_before.get("package") == "com.ninegag.android.app"
          and original_version == ("8.26.1", "80260100"),
          "original package and version are 9GAG 8.26.1")
    check(original_version == output_version, "manifest versionName and versionCode preserved")
    app = manifest_after.find("application")
    if app is None:
        raise ValueError("Output has no application element")
    entries = [e for e in app.findall("meta-data") if e.get(A + "name") == ANALYTICS]
    if args.analytics:
        check(len(entries) == 1 and entries[0].get(A + "value") == "true"
              and A + "resource" not in entries[0].attrib,
              "optional Firebase Analytics opt-out is exactly one literal true")
        for e in entries:
            app.remove(e)
        original_app = manifest_before.find("application")
        for e in list(original_app):
            if e.tag == "meta-data" and e.get(A + "name") == ANALYTICS:
                original_app.remove(e)
    else:
        check(not entries, "default build does not enable optional analytics opt-out")
    check(canonical(manifest_before) == canonical(manifest_after),
          "entire manifest preserved except explicitly selected analytics metadata")
    for tag in ("activity", "activity-alias", "service", "receiver", "provider"):
        left = Counter(repr(canonical(e)) for e in manifest_before.iter(tag))
        right = Counter(repr(canonical(e)) for e in manifest_after.iter(tag))
        check(left == right, f"manifest {tag} components preserved", f"original={sum(left.values())} output={sum(right.values())}")
    permissions = lambda tree: Counter(repr(canonical(e)) for e in tree
                                       if e.tag.startswith("uses-permission") or e.tag in ("permission", "permission-group", "permission-tree"))
    check(permissions(manifest_before) == permissions(manifest_after), "manifest permissions preserved")
    for layout in LAYOUTS:
        left, right = xml(source_res / layout), xml(output_res / layout)
        source_frame, frame = banner_frame(left), banner_frame(right)
        check(frame.get(A + "visibility") == "gone" and
              bool(re.fullmatch(r"0(?:\.0+)?(?:dp|dip)", frame.get(A + "layout_height", ""))),
              layout + " banner is zero-height and gone")
        for attr in (A + "layout_height", A + "visibility"):
            source_frame.attrib.pop(attr, None)
            frame.attrib.pop(attr, None)
        check(canonical(left) == canonical(right), layout + " otherwise preserved")
    source_files = {p.relative_to(source_res).as_posix() for p in (source_res / "res").rglob("*") if p.is_file()}
    output_files = {p.relative_to(output_res).as_posix() for p in (output_res / "res").rglob("*") if p.is_file()}
    check(source_files == output_files, "decoded resource file inventory preserved",
          f"original={len(source_files)} output={len(output_files)}")
    changed = []
    for name in sorted(source_files & output_files - set(LAYOUTS)):
        left, right = source_res / name, output_res / name
        if left.read_bytes() == right.read_bytes():
            continue
        if name == "res/values/public.xml":
            # ARSCLib may reorder declarations; IDs and every declaration must
            # remain identical, not their presentation order in apktool XML.
            if Counter(repr(canonical(e)) for e in xml(left)) == Counter(repr(canonical(e)) for e in xml(right)):
                continue
        if name.endswith(".xml") and canonical(xml(left)) == canonical(xml(right)):
            continue
        changed.append(name)
    check(not changed, "all other decoded resources and public resource IDs preserved",
          str(changed[:12]) if changed else "")
    result = {"original_sha256": digest(args.original), "patched_sha256": digest(args.patched),
              "analytics": args.analytics, "checks": len(checks), "failures": failures}
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(result, indent=2) + "\n")
    print(f"RESULT {'FAIL' if failures else 'PASS'}: {len(failures)} failures / {len(checks)} checks", flush=True)
    return 1 if failures else 0


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("original", type=Path)
    parser.add_argument("patched", type=Path)
    parser.add_argument("--analytics", action="store_true", help="Require the optional manifest analytics opt-out")
    parser.add_argument("--cli-jar", type=Path, default=os.getenv("MORPHE_CLI_JAR"))
    parser.add_argument("--java", default=os.getenv("JAVA") or (str(Path(os.environ["JAVA_HOME"]) / "bin/java") if os.getenv("JAVA_HOME") else "java"))
    parser.add_argument("--apktool", default="apktool")
    parser.add_argument("--work-dir", type=Path)
    parser.add_argument("--report", type=Path, help="Write machine-readable regression results")
    args = parser.parse_args()
    if args.cli_jar is None:
        parser.error("--cli-jar or MORPHE_CLI_JAR is required")
    try:
        if args.work_dir:
            args.work_dir.mkdir(parents=True, exist_ok=True)
            return verify(args, args.work_dir)
        with tempfile.TemporaryDirectory(prefix="verify-ninegag-") as tmp:
            return verify(args, Path(tmp))
    except (OSError, ValueError, RuntimeError, ET.ParseError, zipfile.BadZipFile) as error:
        print("ERROR " + str(error), file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
