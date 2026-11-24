#!/usr/bin/env python3
"""Stage v2.1.9-dev.4 from the exact v2.1.9-dev.3 verification MPP.

Extract the MPP from the dev.3 verification ZIP supplied for device testing.
Prepare the locked assembler using porting/revisions/v2.1.0-release/prepare_smali_tools.py.
Run this script with --input and --output. Only the tested candidate is accepted.
"""
import argparse
from copy import copy
from hashlib import sha256
import os
from pathlib import Path
import re
import subprocess
import sys
from tempfile import TemporaryDirectory
from zipfile import ZipFile

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
TOOLS = ROOT / "porting/revisions/v2.0.0-dev.1/tools"
sys.path.insert(0, str(ROOT / ".github/scripts"))
from verify_android_mpp import validate_mpp

BASE_VERSION = "2.1.9-dev.3"
VERSION = "2.1.9-dev.4"
BASE_SHA = "efbcc32bcacbf5d9776d4f2720813a1dd0ab4eb55a6be7eaf4100e84eae33612"
PACKAGE = Path("e/e/a")
SETTINGS = Path("com/sauzask/nicoid/NicoidSetting.smali")
HELPERS = "nicoid/helpers.mpe"
EXTENSION = "extensions/extension.mpe"
DELTA = "nicoid/method-delta.dex"
MANIFEST = "META-INF/MANIFEST.MF"

MESSAGES = (
    ("サムネイルやタブのプレビューの一時キャッシュを削除します。キャッシュ済み動画、保存したMP4・MP3、設定、ログイン情報、視聴履歴は保持されます。次回表示時に画像を読み込み直す場合があります。",
     "サムネイルやタブのプレビューの一時キャッシュを削除します",
     "サムネイルの一時ファイルと、サムネイル・タブプレビューのメモリキャッシュを削除します。キャッシュ済み動画、保存したMP4・MP3、設定、ログイン情報、視聴履歴は保持されます。"),
    ("Clear temporary thumbnail and tab preview caches. Cached videos, saved MP4 and MP3 files, settings, sign-in and watch history are kept. Images may reload on your next visit.",
     "Clear temporary thumbnail and tab preview caches",
     "Remove temporary thumbnail files and clear thumbnails and tab previews from memory. Cached videos, saved MP4 and MP3 files, settings, sign-in and watch history are kept."),
    ("清除縮圖與分頁預覽的暫存快取。已快取影片、已儲存的 MP4 和 MP3、設定、登入狀態和觀看紀錄會保留。下次顯示時可能會重新載入圖片。",
     "清除縮圖與分頁預覽的暫存快取",
     "刪除縮圖暫存檔，並清除記憶體中的縮圖和分頁預覽。已快取影片、已儲存的 MP4 和 MP3、設定、登入狀態和觀看紀錄會保留。"),
)

def require(condition, message):
    if not condition:
        raise ValueError(message)

def once(source, start, replacement):
    require(source.count(start) == 1, "Missing or ambiguous source anchor: " + repr(start))
    return source.replace(start, replacement, 1)

def literal(message):
    return '"' + "".join(c if ord(c) < 128 else "\\u%04x" % ord(c) for c in message) + '"'

def patch_swipe(source):
    # v1 temporarily holds -width, then is reused for the animation preference.
    # Derive -width from the original width register after the branch instead.
    start = source.index(" move(Le/e/a/TabPager233$Drag;F)V")
    finish = source.index(".end method", start)
    method = source[start:finish]
    branch = (
        r"(?m)^([ \t]*:cond_[0-9a-f]+[ \t]*\n[ \t]*)move v0, v1"
        r"(?=\s*\n\s*:goto_[0-9a-f]+\s*\n\s*int-to-float p0, v0\b)"
    )
    fixed, matches = re.subn(branch, r"\g<1>neg-int v0, v0", method)
    require(matches == 1, "Expected one left neighbor translation branch")
    return source[:start] + fixed + source[finish:]

def patch_copy(source):
    signature = "Le/e/a/TemporaryCache221;->summary(Landroid/content/Context;)Ljava/lang/String;"
    expression = r"(?ms)^\.method private static summary\(Landroid/content/Context;\)Ljava/lang/String;\n.*?^\.end method"
    matches = re.findall(expression, source)
    require(len(matches) == 1, "Expected one cache list summary method")
    listing = matches[0]
    dialog = listing.replace("static summary(", "static confirmation(")
    for old, short, detail in MESSAGES:
        anchor = literal(old) if literal(old) in listing else '"' + old + '"'
        listing = once(listing, anchor, literal(short))
        dialog = once(dialog, anchor, literal(detail))
    source = once(source, matches[0], listing + "\n\n" + dialog)
    # The confirmation callback is the other summary caller. The install
    # method continues to use the brief list description.
    expression = r"(?ms)^\.method [^\n]+\n(?:(?!^\.end method).)*?->setMessage\(Ljava/lang/CharSequence;\)Landroid/app/AlertDialog\$Builder;(?:(?!^\.end method).)*?^\.end method"
    callers = [m for m in re.findall(expression, source) if signature in m]
    require(len(callers) == 1, "Expected one cache confirmation dialog")
    return once(source, callers[0],
        once(callers[0], signature, signature.replace("->summary(", "->confirmation(")))

def patch_language_change(source):
    signature = ".method public static updateLanguage(Landroid/preference/PreferenceActivity;)V"
    start = source.index(signature)
    finish = source.index(".end method", start)
    method = source[start:finish]
    guard = (
        r"(invoke-virtual \{p0\}, Landroid/preference/PreferenceActivity;->isDestroyed\(\)Z"
        r"\s+move-result v0\s+if-nez v0, :cond_[0-9a-f]+)"
    )
    refresh = "\n\n    invoke-static {p0}, Le/e/a/TemporaryCache221;->refreshLabels(Landroid/preference/PreferenceActivity;)V"
    method_after, matches = re.subn(guard, lambda match: match.group(0) + refresh, method)
    require(matches == 1, "Expected one settings activity lifecycle guard")
    return source[:start] + method_after + source[finish:]

def patch_resume(source):
    anchor = "    invoke-static {p0}, Le/e/a/CacheFolders;->summary(Landroid/preference/PreferenceActivity;)V"
    return once(source, anchor, anchor + "\n\n"
        "    invoke-static/range {p0 .. p0}, Le/e/a/TemporaryCache221;->refreshLabels(Landroid/preference/PreferenceActivity;)V")

def add_refresh(source):
    # The delta Activity is in another Java package. Keep its entry public
    # while leaving the implementation owned by the cache preference helper.
    source = once(source, ".class final Le/e/a/TemporaryCache221;", ".class public final Le/e/a/TemporaryCache221;")
    return source + """
.method public static refreshLabels(Landroid/preference/PreferenceActivity;)V
    .registers 1
    invoke-static {p0}, Le/e/a/TemporaryCache221;->install(Landroid/preference/PreferenceActivity;)V
    return-void
.end method
"""

def patch_version(source):
    require(source.count(BASE_VERSION) > 0, "Missing patch version literal")
    return source.replace(BASE_VERSION, VERSION)

def apply_overlay(directory, edits):
    for relative, transform in edits.items():
        file = directory / relative
        before = file.read_text(encoding="utf-8")
        after = transform(before)
        require(before != after, "No change to " + str(relative))
        file.write_text(after, encoding="utf-8", newline="\n")

def commands(tools):
    classpath = os.pathsep.join(str(tools / member) for member in (
        "assemble/*", "dexlib2.jar", "guava.jar"))
    return ["java", "-cp", classpath]

def disassemble(java, dex, directory):
    subprocess.run(java + ["org.jf.baksmali.Main", "disassemble",
        "--sequential-labels", str(dex), "-o", str(directory)], check=True)

def stage(baseline, output, tools):
    require(baseline.resolve() != output.resolve(), "Input and output must differ")
    require(sha256(baseline.read_bytes()).hexdigest() == BASE_SHA, "Expected the verified dev.3 MPP")
    validate_mpp(baseline, BASE_VERSION)
    edits = {
        HELPERS: {
            PACKAGE / "TabPager233.smali": patch_swipe,
            PACKAGE / "TemporaryCache221.smali": lambda src: add_refresh(patch_copy(src)),
            PACKAGE / "SettingsCategories241.smali": patch_language_change,
            PACKAGE / "PatchVersion237.smali": patch_version,
            PACKAGE / "ModernShorts.smali": patch_version,
        },
        EXTENSION: {PACKAGE / "ModernShorts.smali": patch_version},
        DELTA: {SETTINGS: patch_resume},
    }
    java = commands(tools)
    output.parent.mkdir(parents=True, exist_ok=True)
    with TemporaryDirectory(prefix="nicoid-dev219-") as temp, ZipFile(baseline) as old:
        work = Path(temp)
        assets = {}
        for number, (name, transforms) in enumerate(edits.items()):
            src = work / f"base-{number}.dex"
            src.write_bytes(old.read(name))
            folder = work / f"smali-{number}"
            disassemble(java, src, folder)
            apply_overlay(folder, transforms)
            dex = work / f"candidate-{number}.dex"
            subprocess.run(java + ["org.jf.smali.Main", "assemble", "-a", "28",
                str(folder), "-o", str(dex)], check=True)
            checked = work / f"verified-{number}"
            disassemble(java, dex, checked)
            expected = {p.relative_to(folder): p.read_bytes() for p in folder.rglob("*.smali")
                if p.relative_to(folder) not in transforms}
            actual = {p.relative_to(checked): p.read_bytes() for p in checked.rglob("*.smali")
                if p.relative_to(checked) not in transforms}
            require(actual == expected, "Unexpected change to an untouched class in " + name)
            require(all((checked / p).is_file() for p in transforms), "Missing modified class in " + name)
            assets[name] = dex.read_bytes()
        assets[MANIFEST] = once(old.read(MANIFEST),
            f"Version: {BASE_VERSION}\r\n".encode(), f"Version: {VERSION}\r\n".encode())
        candidate = output.with_name(output.name + ".staging")
        try:
            with ZipFile(candidate, "w") as bundle:
                for entry in old.infolist():
                    member = assets.get(entry.filename)
                    bundle.writestr(copy(entry), old.read(entry) if member is None else member)
            validate_mpp(candidate, VERSION)
            with ZipFile(candidate) as new:
                require(new.namelist() == old.namelist() and new.testzip() is None, "Invalid MPP")
                require(all(new.read(name) == old.read(name) for name in old.namelist()
                    if name not in assets), "Unexpected package change")
            candidate.replace(output)
        finally:
            candidate.unlink(missing_ok=True)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--tools", default=TOOLS, type=Path)
    args = parser.parse_args()
    stage(args.input, args.output, args.tools)
