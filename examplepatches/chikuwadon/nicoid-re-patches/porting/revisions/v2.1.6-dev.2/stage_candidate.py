#!/usr/bin/env python3
"""Build a private v2.1.6-dev.2 candidate on the exact published v2.1.5 MPP.

Never substitute the old Gradle helper payload or alter the released asset.
Patch only the reviewed runtime owners and preserve every native/resource byte.
"""
from __future__ import annotations

import argparse
from copy import copy
import hashlib
import os
from pathlib import Path
import re
import sys
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
sys.path.insert(0, str(ROOT / "porting/revisions/v2.1.0-release"))
sys.path.insert(0, str(ROOT / ".github/scripts"))
from stage_verified import assemble, disassemble, require, run
from verify_android_mpp import validate_mpp

VERSION = "2.1.6-dev.2"
PREVIOUS = "2.1.5"
APPROVED_SHA256 = "51a52358d568eb530075644e65ec7b3b2346c793bdf91a6ae3e93ba3fcfb700b"
HELPERS = "nicoid/helpers.mpe"
EXTENSION = "extensions/extension.mpe"
MANIFEST = "META-INF/MANIFEST.MF"
OWNER = Path("e/e/a")


def android_tools():
    home = os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT")
    require(bool(home), "Android SDK is missing")
    sdk = Path(home)
    def platform_key(p):
        match = re.fullmatch(r"android-(\d+)(?:-ext(\d+))?", p.parent.name)
        return (int(match.group(1)), int(match.group(2) or 0)) if match else (0, 0)
    jars = sorted((p for p in (sdk / "platforms").glob("android-*/android.jar")
                   if platform_key(p)[0]), key=platform_key)
    d8s = sorted((p for p in (sdk / "build-tools").glob("*/d8")),
                 key=lambda p: tuple(int(x) for x in re.findall(r"\d+", p.parent.name)))
    require(jars and d8s, "Android platform JAR or d8 is missing")
    return jars[-1], d8s[-1]


def replace(directory, name, old, new, expected=1):
    source = directory / name
    content = source.read_text(encoding="utf-8")
    require(content.count(old) == expected, "Missing/ambiguous runtime anchor: " + str(name))
    source.write_text(content.replace(old, new), encoding="utf-8")


def compile_sources(temp, tools):
    android, d8 = android_tools()
    classes = temp / "compiled"
    classes.mkdir()
    run("javac", "--release", "8", "-encoding", "UTF-8",
        "-cp", android, "-d", classes,
        HERE.parent / "v2.1.6-dev.1" / "Media3Diagnostics276.java",
        HERE.parent / "v2.1.6-dev.1" / "SettingsDisplay216.java",
        HERE.parent / "v2.1.6-dev.1" / "LayoutRepair216.java",
        HERE / "PopupSwitch216.java")
    compiled = temp / "compiled-dex"
    compiled.mkdir()
    run(d8, "--min-api", "28", "--lib", android, "--output", compiled,
        *sorted(classes.rglob("*.class")))
    result = disassemble(compiled / "classes.dex", temp / "compiled-smali", tools)
    allowed = ("Media3Diagnostics276", "SettingsDisplay216", "LayoutRepair216", "PopupSwitch216")
    selected = {path: data for path, data in result.items()
                if path.parent == OWNER and path.stem.startswith(allowed)}
    unexpected = set(result) - set(selected)
    require(unexpected <= {Path("com/android/tools/r8/annotations/LambdaMethod.smali")},
            "New code unexpectedly generated unrelated classes: " + str(unexpected))
    for name in allowed:
        require(OWNER / (name + ".smali") in selected, "Java class missing: " + name)
    return selected


def patch_runtime(directory):
    tools_class = OWNER / "SettingsTools.smali"
    anchor = ("    invoke-static {p0}, Le/e/a/SettingsIntegrity;->"
              "stripSummaries(Landroid/preference/PreferenceActivity;)V")
    inject = ("    invoke-static {p0}, Le/e/a/SettingsDisplay216;"
              "->install(Landroid/preference/PreferenceActivity;)V")
    # The final settings UI installer runs after built-in localization and categories.
    replace(directory, tools_class, anchor, anchor + "\n\n" + inject)

    state = OWNER / "DirectBackground235$State.smali"
    # Hook after the panel is claimed, before the first native measure.
    # Earlier builds changed the instructions around FrameLayout.addView,
    # so match the uniquely owned PlaybackPanels claim rather than registers.
    content = (directory / state).read_text(encoding="utf-8")
    method_start = content.index(".method attach(Landroid/app/Activity;)V")
    method_end = content.index(".end method", method_start)
    part = content[method_start:method_end]
    import re
    claim = re.search(
        r"(?m)^    invoke-static [^\n]+Le/e/a/PlaybackPanels113;->claim"
        r"\(Landroid/app/Activity;Landroid/view/View;Landroid/view/View;"
        r"ILjava/lang/Object;\)V\n", part)
    require(claim is not None, "Mini-player panel claim hook missing")
    hook = (
        "    iget-object v0, p0, Le/e/a/DirectBackground235$State;"
        "->panel:Landroid/widget/FrameLayout;\n\n"
        "    invoke-static {v0}, Le/e/a/LayoutRepair216;"
        "->sanitize(Landroid/view/View;)V\n"
    )
    part = part[:claim.end()] + "\n" + hook + part[claim.end():]
    content = content[:method_start] + part + content[method_end:]
    (directory / state).write_text(content, encoding="utf-8")
    # The original host's ViewGroup must own the correct LayoutParams class.
    insertion = (
        "    iget-object v3, p0, Le/e/a/DirectBackground235$State;"
        "->params:Landroid/view/ViewGroup$LayoutParams;\n\n"
        "    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;"
        "->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V"
    )
    replacement = insertion.replace(
        "\n\n    invoke-virtual",
        "\n\n    invoke-static {v0, v3}, Le/e/a/LayoutRepair216;"
        "->compatible(Landroid/view/ViewGroup;Landroid/view/ViewGroup$LayoutParams;)"
        "Landroid/view/ViewGroup$LayoutParams;\n\n"
        "    move-result-object v3\n\n    invoke-virtual",
        1)
    replace(directory, state, insertion, replacement)

    # Attach only to a confirmed app-background transition.
    # The helper preserves the running service VideoView/decoder; screen-off
    # transitions and in-app navigation remain handled by the old policy.
    owner = OWNER / "AppResume253.smali"
    src = (directory / owner).read_text(encoding="utf-8")
    signature = re.search(
        r"(?m)^\.method [^\n]* left\(Landroid/content/Context;\)V\n"
        r"    \.(?:registers|locals) \d+\n", src)
    require(signature is not None, "AppResume253.left() stable lifecycle hook missing")
    caller = ("    invoke-static {p0}, Le/e/a/PopupSwitch216;"
              "->left(Landroid/content/Context;)V\n")
    src = src[:signature.end()] + "\n" + caller + src[signature.end():]
    (directory / owner).write_text(src, encoding="utf-8")



def stage(compiled: Path, approved: Path, output: Path, tools: Path):
    require(compiled.resolve() != output.resolve(), "Cannot overwrite the Gradle MPP")
    validate_mpp(compiled, VERSION)
    require(hashlib.sha256(approved.read_bytes()).hexdigest() == APPROVED_SHA256,
            "Published v2.1.5 MPP fingerprint mismatch")
    validate_mpp(approved, PREVIOUS)
    with TemporaryDirectory(prefix="nicoid-216-candidate-") as temp_name, ZipFile(approved) as base:
        temp = Path(temp_name)
        source = temp / "approved-helpers.dex"
        source.write_bytes(base.read(HELPERS))
        baseline = disassemble(source, temp / "approved-smali", tools)
        require(len(baseline) >= 7400, "Published helper DEX is unexpectedly incomplete")
        smali = temp / "approved-smali"

        replace(smali, OWNER / "PatchVersion237.smali", '"2.1.5"', '"2.1.6-dev.2"')
        replace(smali, OWNER / "ModernShorts.smali",
                '"v2.1.5 @chikuwadon"', '"v2.1.6-dev.2 @chikuwadon"', 2)
        patch_runtime(smali)
        new = compile_sources(temp, tools)
        added = set(new) - set(baseline)
        require(OWNER / "Media3Diagnostics276$NetworkRetry.smali" in added,
                "Network retry helper missing")
        for path, contents in new.items():
            (smali / path).write_bytes(contents)
        helper_dex = temp / "helpers-revised.dex"
        assemble(smali, helper_dex, tools)
        checked = disassemble(helper_dex, temp / "helpers-checked", tools)
        require(checked.keys() == baseline.keys() | added, "Unexpected helper class set")
        changed = {path for path in baseline if checked[path] != baseline[path]}
        expected = {
            OWNER / "PatchVersion237.smali",
            OWNER / "ModernShorts.smali",
            OWNER / "SettingsTools.smali",
            OWNER / "DirectBackground235$State.smali",
            OWNER / "Media3Diagnostics276.smali",
            OWNER / "Media3Diagnostics276$Probe.smali",
            OWNER / "Media3Diagnostics276$Attempt.smali",
            OWNER / "AppResume253.smali",
        }
        require(changed == expected, "Unreviewed runtime changes: " + str(changed ^ expected))
        require(b"LayoutRepair216;->sanitize" in checked[OWNER / "DirectBackground235$State.smali"]
                and b"LayoutRepair216;->compatible" in checked[OWNER / "DirectBackground235$State.smali"],
                "Mini-player layout contracts not installed")
        require(b"SettingsDisplay216;->install" in checked[OWNER / "SettingsTools.smali"],
                "Settings summary observer not installed")
        require(b"PopupSwitch216;->left" in checked[OWNER / "AppResume253.smali"],
                "Service-backed app switch to popup not installed")
        require(b"NetworkRetry" in checked[OWNER / "Media3Diagnostics276.smali"],
                "Media3 network recovery not installed")

        ext_source = temp / "approved-extension.dex"
        ext_source.write_bytes(base.read(EXTENSION))
        before = disassemble(ext_source, temp / "extension-smali", tools)
        replace(temp / "extension-smali", OWNER / "ModernShorts.smali",
                '"v2.1.5 @chikuwadon"', '"v2.1.6-dev.2 @chikuwadon"', 2)
        ext_dex = temp / "extension-revised.dex"
        assemble(temp / "extension-smali", ext_dex, tools)
        ext_checked = disassemble(ext_dex, temp / "extension-checked", tools)
        require(ext_checked.keys() == before.keys(), "Unexpected extension class set")
        require({p for p in before if ext_checked[p] != before[p]} ==
                {OWNER / "ModernShorts.smali"}, "Unexpected extension bytecode change")

        original_manifest = base.read(MANIFEST)
        before_version = ("Version: " + PREVIOUS + "\r\n").encode()
        require(original_manifest.count(before_version) == 1, "Missing manifest version")
        new_manifest = original_manifest.replace(
            before_version, ("Version: " + VERSION + "\r\n").encode())
        replacements = {HELPERS: helper_dex.read_bytes(),
                        EXTENSION: ext_dex.read_bytes(),
                        MANIFEST: new_manifest}
        output.parent.mkdir(parents=True, exist_ok=True)
        with ZipFile(output, "w") as candidate:
            for info in base.infolist():
                candidate.writestr(copy(info),
                                   replacements.get(info.filename, base.read(info.filename)))
        with ZipFile(output) as candidate:
            require(candidate.testzip() is None
                    and candidate.namelist() == base.namelist(), "MPP entry integrity failed")
            for name in base.namelist():
                if name not in replacements:
                    require(candidate.read(name) == base.read(name),
                            "Unexpected modification to published resource: " + name)
    validate_mpp(output, VERSION)
    print("PASS: v2.1.6-dev.2 MPP staged, native hooks and resources preserved")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiled", type=Path, required=True)
    parser.add_argument("--approved", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--tools", type=Path, required=True)
    args = parser.parse_args()
    stage(args.compiled, args.approved, args.output, args.tools)


if __name__ == "__main__":
    main()
