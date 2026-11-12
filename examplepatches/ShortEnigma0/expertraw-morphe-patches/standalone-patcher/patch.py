#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2026 ShortEnigma0
# Part of expertraw-morphe-patches standalone patcher. See LICENSE in the repository root.
"""
Expert RAW "Disable post-processing" patcher.

Takes YOUR copy of Samsung Expert RAW (com.samsung.android.app.galaxyraw) and produces a re-signed APK
with a Settings -> Pictures -> "Disable post-processing" switch (single-frame capture, instant save),
plus the compatibility patches a re-signed (non-Samsung-signed) build needs to run on a stock phone.

No Samsung code is shipped with this tool: it only edits the APK you supply.

Usage:
    python3 patch.py ExpertRAW.apk [-o out.apk] [--ks key.jks --ks-pass pass --ks-alias alias] [--force]

Requires: Java 17+, apktool 2.9+/3.x, Android build-tools 35+ (zipalign, apksigner).

Legal & DMCA:
    This tool is an independent open-source utility licensed under GPL-3.0-only.
    Not affiliated with or endorsed by Samsung Electronics Co., Ltd.
    See DMCA.md for full copyright compliance and legal policies.
"""
import argparse
import glob
import hashlib
import os
import re
import shutil
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
MOD_SMALI = os.path.join(HERE, "smali")
PKG = "com.samsung.android.app.galaxyraw"
APP = "com/samsung/android/app/galaxyraw"
MOD = f"L{APP}/mod"

# Builds this patch set was developed and verified against (versionName -> sha256 of the apkmirror APK).
KNOWN = {
    "6.0.02.8": "3737f63abc2fb62889e8a6ae140d074eee28445f3f41058f09d6c34ea1e937f7",
}

# ----------------------------------------------------------------------------------------------- utils

class PatchError(Exception):
    pass


def log(msg):
    print(f"[patch] {msg}", flush=True)


def run(cmd, **kw):
    log("$ " + " ".join(cmd))
    r = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, **kw)
    if r.returncode != 0:
        print(r.stdout)
        raise PatchError(f"command failed: {cmd[0]}")
    return r.stdout


def find_class(root, cls):
    """Return path of the smali file for class 'a/b/C' across smali*/ dirs."""
    hits = glob.glob(os.path.join(root, "smali*", cls + ".smali"))
    if len(hits) != 1:
        raise PatchError(f"class {cls} not found (hits={len(hits)})")
    return hits[0]


def read(p):
    with open(p, encoding="utf-8") as f:
        return f.read()


def write(p, s):
    with open(p, "w", encoding="utf-8") as f:
        f.write(s)


def method_span(s, header_regex, path):
    m = re.search(header_regex, s, re.M)
    if not m:
        raise PatchError(f"{os.path.basename(path)}: method not found: {header_regex}")
    end = s.index(".end method", m.start())
    return m.start(), end


def insert_after_locals(root, cls, header_regex, code, tag):
    """Insert code right after the .locals line of a method."""
    p = find_class(root, cls)
    s = read(p)
    if f"# MOD:{tag}" in s:
        return
    a, b = method_span(s, header_regex, p)
    lm = re.compile(r"^\s*\.locals (\d+)\n", re.M).search(s, a, b)
    if not lm:
        raise PatchError(f"{cls}: .locals not found")
    s = s[: lm.end()] + f"\n    # MOD:{tag}\n" + code + s[lm.end():]
    write(p, s)
    log(f"patched {cls} ({tag})")


def replace_once(root, cls, old, new, tag, within=None):
    p = find_class(root, cls)
    s = read(p)
    if f"# MOD:{tag}" in s:
        return
    a, b = (0, len(s)) if within is None else method_span(s, within, p)
    seg = s[a:b]
    if seg.count(old) != 1:
        raise PatchError(f"{cls} ({tag}): anchor found {seg.count(old)}x, expected 1")
    seg = seg.replace(old, f"    # MOD:{tag}\n" + new)
    write(p, s[:a] + seg + s[b:])
    log(f"patched {cls} ({tag})")


def app_smali_files(root):
    for f in glob.glob(os.path.join(root, "smali*", APP, "**", "*.smali"), recursive=True):
        if os.sep + "mod" + os.sep not in f:
            yield f


# --------------------------------------------------------------------------------------------- patches

def p_copy_mod_classes(root):
    dst = os.path.join(root, "smali_classes3", APP, "mod")
    if not os.path.isdir(os.path.dirname(dst)):
        dst = os.path.join(glob.glob(os.path.join(root, "smali*", APP))[0], "mod")
    os.makedirs(dst, exist_ok=True)
    for f in glob.glob(os.path.join(MOD_SMALI, "*.smali")):
        shutil.copy(f, dst)
    log(f"copied {len(os.listdir(dst))} mod classes")


def p_feature(root):
    # 1) 12MP / 24MP makers: force Samsung's own single-frame path when the switch is on.
    insert_after_locals(root, f"{APP}/core2/maker/ExpertRawPhotoMaker",
        r"^\.method public isSingleFrameCondition\(\)Z", f"""\
    iget-object v0, p0, L{APP}/core2/maker/MakerBase;->mContext:Landroid/content/Context;
    invoke-static {{v0}}, {MOD}/PpBypass;->forceSingleFrame(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :mod_pp_continue
    return v0
    :mod_pp_continue
""", "single-frame")
    # 2) 50MP (ArcSoft high-res) maker.
    call = f"    invoke-direct {{p0, p3}}, L{APP}/core2/maker/ArcHighResExpertRawPhotoMaker;->updateEvList(Z)I\n"
    replace_once(root, f"{APP}/core2/maker/ArcHighResExpertRawPhotoMaker", call, f"""\
    iget-object p1, p0, L{APP}/core2/maker/MakerBase;->mContext:Landroid/content/Context;
    invoke-static {{p1}}, {MOD}/PpBypass;->forceSingleFrame(Landroid/content/Context;)Z
    move-result p1
    or-int/2addr p3, p1
""" + call, "single-frame-arc",
        within=r"^\.method public declared-synchronized takePostProcessingPicture\(")


def p_settings_ui(root):
    p = os.path.join(root, "res", "xml", "setting.xml")
    s = read(p)
    if "PpBypassPreference" not in s:
        anchor = 'android:key="@string/key_labs_feature"'
        i = s.index(anchor)
        start = s.rindex("<", 0, i)
        pref = (f'<{PKG}.mod.PpBypassPreference android:persistent="false" '
                'android:title="@string/mod_disable_pp_title" android:key="mod_disable_post_processing" '
                'android:summary="@string/mod_disable_pp_summary" android:dependency="@string/dep_pictures"/>\n        ')
        write(p, s[:start] + pref + s[start:])
        log("added settings switch")
    p = os.path.join(root, "res", "values", "strings.xml")
    s = read(p)
    if "mod_disable_pp_title" not in s:
        add = ('    <string name="mod_disable_pp_title">Disable post-processing</string>\n'
               '    <string name="mod_disable_pp_summary">Capture a single frame instead of a multi-frame burst. '
               'Skips multi-frame merge/HDR stacking for RAW and JPEG. Restart the app to apply changes.</string>\n</resources>\n')
        s = s.rstrip()
        if not s.endswith("</resources>"):
            raise PatchError("strings.xml: unexpected ending")
        write(p, s[: -len("</resources>")] + add)
        log("added strings")


def p_signature_compat(root):
    # Calls that need Samsung-signature permissions -> safe wrappers.
    replace_once(root, f"{APP}/CameraApplication",
        "    invoke-virtual {v0, v1, v2}, Landroid/app/SemActivityTaskManager;->getCameraCutoutSetting(ILjava/lang/String;)I\n",
        f"    invoke-static {{v0, v1, v2}}, {MOD}/PpBypass;->safeCutout(Landroid/app/SemActivityTaskManager;ILjava/lang/String;)I\n",
        "cutout")
    replace_once(root, f"{APP}/core2/util/SemWrapper",
        "    invoke-static {}, Landroid/app/ActivityManager;->semGetCurrentUser()I\n",
        "    invoke-static {}, Landroid/os/UserHandle;->semGetMyUserId()I\n", "current-user")
    # MANAGE_EXTERNAL_STORAGE can only be granted via appops to a re-signed app; drop it from the gate.
    p = find_class(root, f"{APP}/util/PermissionUtils")
    s = read(p)
    s2 = re.sub(r'const-string (v\d+), "android\.permission\.MANAGE_EXTERNAL_STORAGE"',
                r'const-string \1, "android.permission.CAMERA"', s)
    if s2 != s:
        write(p, s2)
        log("patched PermissionUtils (MANAGE_EXTERNAL_STORAGE)")
    # App code startup gate checks Environment.isExternalStorageManager() -> bypass so GalaxyRaw reaches onResume.
    for cls in [f"{APP}/util/PermissionUtils", f"{APP}/RequestPermissionActivity"]:
        p_cls = find_class(root, cls)
        s_cls = read(p_cls)
        s_cls2 = re.sub(r'invoke-static\s*\{\},\s*Landroid/os/Environment;->isExternalStorageManager\(\)Z\s+move-result\s+([vp]\d+)',
                        r'const/4 \1, 0x1', s_cls)
        if s_cls2 != s_cls:
            write(p_cls, s_cls2)
            log(f"patched {cls} (isExternalStorageManager)")
    # GPPM (Gallery post-processing manager) is unreachable -> report disabled. Class is obfuscated; find by string.
    hits = [f for f in glob.glob(os.path.join(root, "smali*", "**", "*.smali"), recursive=True)
            if '"ENABLE_GPPM"' in read(f)]
    if len(hits) != 1:
        raise PatchError(f"GPPM provider class not found (hits={len(hits)})")
    rel = os.path.relpath(hits[0], root).split(os.sep)  # smali_classesN/<pkg>/<Cls>.smali
    cls = "/".join(rel[1:])[: -len(".smali")]
    insert_after_locals(root, cls, r"^\.method public final c\(Landroid/content/Context;\)Z",
                        "    const/4 v0, 0x1\n    return v0\n", "gppm-disabled")
    # /data/sec is SELinux-restricted to platform-signed apps -> app-private storage.
    root_dir = f"/data/user/0/{PKG}/files/sec"
    for cls, old, new in [
        (f"{APP}/core2/util/FileUtils", 'const-string v2, "/data/sec"\n', f'const-string v2, "{root_dir}"\n'),
        (f"{APP}/util/Util", 'const-string v0, "/data/sec"\n', f'const-string v0, "{root_dir}"\n'),
        (f"{APP}/util/StorageUtils", 'const-string v1, "/data/sec/camera/galaxyraw"', f'const-string v1, "{root_dir}/camera/galaxyraw"'),
        (f"{APP}/core2/processor/util/PLog", 'const-string v1, "/data/sec/log"', f'const-string v1, "{root_dir}/log"'),
        (f"{APP}/core2/processor/PostProcessDBHelper", 'const-string v0, "/data/sec"\n', 'const-string v0, "/data/use"\n'),
    ]:
        p = find_class(root, cls)
        s = read(p)
        if new in s:
            continue
        if s.count(old) != 1:
            raise PatchError(f"{cls}: /data/sec anchor found {s.count(old)}x")
        write(p, s.replace(old, new))
        log(f"patched {cls} (/data/sec)")


SAFECR_SIGS = [
    ("applyBatch", "Ljava/lang/String;Ljava/util/ArrayList;", "[Landroid/content/ContentProviderResult;"),
    ("call", "Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;", "Landroid/os/Bundle;"),
    ("delete", "Landroid/net/Uri;Landroid/os/Bundle;", "I"),
    ("delete", "Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;", "I"),
    ("insert", "Landroid/net/Uri;Landroid/content/ContentValues;", "Landroid/net/Uri;"),
    ("query", "Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;Landroid/os/CancellationSignal;", "Landroid/database/Cursor;"),
    ("query", "Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;", "Landroid/database/Cursor;"),
    ("registerContentObserver", "Landroid/net/Uri;ZLandroid/database/ContentObserver;", "V"),
    ("update", "Landroid/net/Uri;Landroid/content/ContentValues;Landroid/os/Bundle;", "I"),
    ("update", "Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;", "I"),
]

# Index = wrapper number in SafeSys.smali (w<i>_<name>). Keep order in sync with smali/SafeSys.smali.
SAFESYS = [
    ("Lcom/samsung/android/view/SemWindowManager;", "registerSystemKeyEvent", "ILandroid/content/ComponentName;I", "V", False),
    ("Lcom/samsung/android/view/SemWindowManager;", "unregisterSystemKeyEvent", "ILandroid/content/ComponentName;", "V", False),
    ("Lcom/samsung/android/view/SemWindowManager;", "setForcedDefaultDisplayDevice", "I", "V", False),
    ("Lcom/samsung/android/hardware/display/SemMdnieManager;", "setContentMode", "I", "Z", False),
    ("Lcom/samsung/android/tsp/SemTspStateManager;", "setDeadZone", "Landroid/view/View;Landroid/os/Bundle;", "V", True),
    ("Lcom/samsung/android/os/SemDvfsManager;", "acquire", "", "V", False),
    ("Lcom/samsung/android/os/SemDvfsManager;", "acquire", "I", "V", False),
    ("Lcom/samsung/android/os/SemDvfsManager;", "setHint", "I", "V", False),
    ("Lcom/samsung/android/os/SemDvfsManager;", "release", "", "V", False),
    ("Landroid/provider/Settings$System;", "putInt", "Landroid/content/ContentResolver;Ljava/lang/String;I", "Z", True),
    ("Landroid/os/PowerManager;", "semSetAutoBrightnessLimit", "FF", "V", False),
    ("Landroid/os/PowerManager;", "semGoToSleep", "J", "V", False),
    ("Landroid/media/AudioManager;", "setParameters", "Ljava/lang/String;", "V", False),
    ("Lcom/samsung/android/camera/mic/SemMultiMicManager;", "setMode", "I", "Z", False),
    ("Landroid/hardware/display/DisplayManager;", "semGetWifiDisplayStatus", "", "Landroid/hardware/display/SemWifiDisplayStatus;", False),
    ("Landroid/app/ActivityManager;", "getRunningTasks", "I", "Ljava/util/List;", False),
]


def p_wrap_call_sites(root):
    """Route ContentResolver / privileged framework calls in app code through SafeCR / SafeSys."""
    rules = []
    for name, args, ret in SAFECR_SIGS:
        rules.append((re.compile(r"invoke-virtual(/range)? (\{[^}]*\}), Landroid/content/ContentResolver;->"
                                 + re.escape(f"{name}({args}){ret}")),
                      f"{MOD}/SafeCR;->{name}(Landroid/content/ContentResolver;{args}){ret}"))
    for i, (c, n, a, r, st) in enumerate(SAFESYS):
        wargs = a if st else c + a
        rules.append((re.compile(r"invoke-(?:static|virtual)(/range)? (\{[^}]*\}), " + re.escape(f"{c}->{n}({a}){r}")),
                      f"{MOD}/SafeSys;->w{i}_{n}({wargs}){r}"))
    rules.append((re.compile(r"invoke-virtual(/range)? (\{[^}]*\}), Landroid/telephony/TelephonyManager;->registerTelephonyCallback\(Ljava/util/concurrent/Executor;Landroid/telephony/TelephonyCallback;\)V"),
                  f"{MOD}/SafeSys;->safeRegisterTelephonyCallback(Landroid/telephony/TelephonyManager;Ljava/util/concurrent/Executor;Landroid/telephony/TelephonyCallback;)V"))
    rules.append((re.compile(r"invoke-virtual(/range)? (\{[^}]*\}), Lcom/samsung/android/speech/SemSpeechRecognizer;->startRecognition\(I\)V"),
                  f"{MOD}/SafeSys;->noSpeechStart(Lcom/samsung/android/speech/SemSpeechRecognizer;I)V"))
    total = 0
    for f in app_smali_files(root):
        s = read(f)
        o = s
        for pat, target in rules:
            s, k = pat.subn(lambda m: f"invoke-static{m.group(1) or ''} {m.group(2)}, {target}", s)
            total += k
        if s != o:
            write(f, s)
    if total < 50:
        raise PatchError(f"only {total} call sites rewired; unexpected app version?")
    log(f"rewired {total} call sites")


def p_instant(root):
    # Process 1-frame requests now instead of waiting for the camera to go to background.
    cast = f"    check-cast v0, L{APP}/core2/processor/request/PostProcessRequest;\n"
    p = find_class(root, f"{APP}/core2/processor/PostProcessThread")
    s = read(p)
    if "# MOD:process-now" not in s:
        a, b = method_span(s, r"^\.method private waitRequest\(\)Z", p)
        body = s[a:b]
        if body.count(cast) != 1:
            raise PatchError("PostProcessThread.waitRequest anchor not found")
        body = body.replace(cast, cast + f"""    # MOD:process-now
    invoke-static {{v0}}, {MOD}/PpImmediate;->processNow(L{APP}/core2/processor/request/ProcessRequestImpl;)Z
    move-result v1
    if-nez v1, :mod_process_now
""") + f"""
    :mod_process_now
    iget-object v0, p0, L{APP}/core2/processor/PostProcessThread;->mSequenceStackLock:Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {{v0}}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
    const/4 v0, 0x1
    return v0
"""
        write(p, s[:a] + body + s[b:])
        log("patched PostProcessThread (process-now)")
    # No "Refining image" notification for those shots.
    insert_after_locals(root, f"{APP}/core2/processor/PostProcessNotificationManager",
        r"^\.method private sendMessage\(L[^;]+\$PostProcessServiceMsg;II\)V", f"""\
    invoke-static {{p1}}, {MOD}/PpImmediate;->suppressNotification(Ljava/lang/Enum;)Z
    move-result v0
    if-eqz v0, :mod_send
    return-void
    :mod_send
""", "quiet-notification")
    # Refresh the camera thumbnail once MediaScanner has indexed the saved file.
    insert_after_locals(root, f"{APP}/core2/processor/PostProcessDBHelper",
        r"^\.method private static synthetic lambda\$scanFile\$\d+\(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;Ljava/lang/String;Landroid/net/Uri;\)V",
        f"    invoke-static {{p2, p3}}, {MOD}/PpRefresh;->onScanned(Ljava/lang/String;Landroid/net/Uri;)V\n", "thumb-refresh")
    insert_after_locals(root, f"{APP}/GalaxyRaw", r"^\.method public onResume\(\)V",
        f"    invoke-static {{p0}}, {MOD}/PpRefresh;->attach(Ljava/lang/Object;)V\n", "thumb-attach")
    # Gallery must get a standard MediaStore uri (a secmedia uri can't be granted by a re-signed app).
    old = f"    iget-object v0, p0, L{APP}/LatestMediaContent;->mSecMpUri:Landroid/net/Uri;\n"
    replace_once(root, f"{APP}/LatestMediaContent", old, f"""\
    iget-object v0, p0, L{APP}/LatestMediaContent;->mMpUri:Landroid/net/Uri;
    if-nez v0, :mod_have_uri
""" + old + "    :mod_have_uri\n", "mediastore-uri",
        within=r"^\.method public declared-synchronized getUri\(\)Landroid/net/Uri;")


PATCHES = [p_copy_mod_classes, p_feature, p_settings_ui, p_signature_compat, p_wrap_call_sites, p_instant]

# --------------------------------------------------------------------------------------------- build

def find_build_tool(name, explicit):
    if explicit:
        return explicit
    w = shutil.which(name)
    if w:
        return w
    sdk = os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT") or os.path.expanduser(
        "~/Library/Android/sdk" if sys.platform == "darwin" else "~/Android/Sdk")
    vers = sorted(glob.glob(os.path.join(sdk, "build-tools", "*")),
                  key=lambda p: [int(x) if x.isdigit() else 0 for x in re.split(r"[.-]", os.path.basename(p))])
    for v in reversed(vers):
        for cand in (name, name + ".bat", name + ".exe"):
            p = os.path.join(v, cand)
            if os.path.exists(p):
                return p
    raise PatchError(f"{name} not found; install Android build-tools 35+ or pass --{name}")


def ensure_keystore(args, workdir):
    if args.ks:
        return args.ks, args.ks_pass, args.ks_alias
    ks = os.path.join(HERE, "patcher-key.jks")
    if not os.path.exists(ks):
        log("creating signing key patcher-key.jks (keep it: future updates must use the same key)")
        run(["keytool", "-genkeypair", "-keystore", ks, "-storepass", "expertraw", "-keypass", "expertraw",
             "-alias", "expertraw", "-keyalg", "RSA", "-keysize", "2048", "-validity", "10000",
             "-dname", "CN=ExpertRAW Patcher"])
    return ks, "expertraw", "expertraw"


LEGAL_NOTICE = """
Legal & DMCA Notice:
  This tool does not host, bundle, or distribute any proprietary code or binaries of Samsung
  Electronics Co., Ltd. It performs local, client-side differential modifications only on an APK
  supplied by the user. "Samsung", "Galaxy", "Galaxy Store", and "Expert RAW" are registered
  trademarks of Samsung Electronics Co., Ltd., used strictly under nominative fair use.
  Not affiliated with, sponsored by, or endorsed by Samsung Electronics Co., Ltd.
  Licensed under GPL-3.0-only without warranty. See DMCA.md for full policies.
"""


def main():
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=LEGAL_NOTICE,
    )
    ap.add_argument("apk", help="original Expert RAW APK (your own copy)")
    ap.add_argument("-o", "--out", default=None, help="output APK (default: ExpertRAW-noPP-<version>.apk)")
    ap.add_argument("--apktool", default=shutil.which("apktool") or "apktool")
    ap.add_argument("--zipalign", default=None)
    ap.add_argument("--apksigner", default=None)
    ap.add_argument("--ks", default=None, help="keystore (default: auto-generated patcher-key.jks)")
    ap.add_argument("--ks-pass", default=None)
    ap.add_argument("--ks-alias", default=None)
    ap.add_argument("--keep-work", action="store_true", help="keep decoded project for inspection")
    ap.add_argument("--force", action="store_true", help="try even if the APK hash is not a tested build")
    args = ap.parse_args()

    if args.ks and not (args.ks_pass and args.ks_alias):
        ap.error("--ks needs --ks-pass and --ks-alias")
    if not os.path.isfile(args.apk):
        ap.error(f"not a file: {args.apk}")

    sha = hashlib.sha256(open(args.apk, "rb").read()).hexdigest()
    tested = [v for v, h in KNOWN.items() if h == sha]
    if tested:
        log(f"input is tested build {tested[0]}")
    elif not args.force:
        raise PatchError("APK hash does not match a tested build (" + ", ".join(KNOWN) + "). "
                         "Re-run with --force to try anyway; every patch checks its anchor and stops if it doesn't fit.")
    else:
        log("WARNING: untested build, continuing because of --force")

    zipalign = find_build_tool("zipalign", args.zipalign)
    apksigner = find_build_tool("apksigner", args.apksigner)
    work = tempfile.mkdtemp(prefix="expertraw-patch-")
    dec = os.path.join(work, "dec")
    try:
        run([args.apktool, "d", "-f", "-o", dec, args.apk])
        man = read(os.path.join(dec, "AndroidManifest.xml"))
        if f'package="{PKG}"' not in man:
            raise PatchError("this is not Samsung Expert RAW")
        ver = (re.search(r"versionName: (\S+)", read(os.path.join(dec, "apktool.yml"))) or [None, "unknown"])[1]
        for patch in PATCHES:
            patch(dec)
        unsigned = os.path.join(work, "unsigned.apk")
        aligned = os.path.join(work, "aligned.apk")
        out = args.out or os.path.join(os.getcwd(), f"ExpertRAW-noPP-{ver}.apk")
        run([args.apktool, "b", dec, "-o", unsigned])
        run([zipalign, "-f", "-P", "16", "4", unsigned, aligned])
        ks, kp, ka = ensure_keystore(args, work)
        run([apksigner, "sign", "--ks", ks, "--ks-pass", "pass:" + kp, "--key-pass", "pass:" + kp,
             "--ks-key-alias", ka, "--out", out, aligned])
        idsig = out + ".idsig"
        if os.path.exists(idsig):
            os.remove(idsig)
        log(f"done: {out}")
        print("""
Next steps (see README.md):
  1. Uninstall the Galaxy Store version of Expert RAW (signatures differ).
  2. Install "{0}" (adb install -r --user 0 "{0}" or install directly on device).
  3. Open the app, allow permissions, and toggle ON "All files access" when prompted.
  4. Go to Settings -> Pictures -> Disable post-processing (confirm the restart prompt).
""".format(out))
    finally:
        if args.keep_work:
            log(f"work dir kept: {work}")
        else:
            shutil.rmtree(work, ignore_errors=True)


if __name__ == "__main__":
    try:
        main()
    except PatchError as e:
        print(f"[patch] ERROR: {e}", file=sys.stderr)
        sys.exit(1)
