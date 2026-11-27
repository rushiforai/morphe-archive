#!/usr/bin/env python3
"""
dex_patch.py - fail-closed, fingerprint-guarded smali patcher for the
Rambler Bangla - guarded Gboard Rambler Lite Bengali script patch.

GPL-3.0. Derived work of PixelBoard (https://github.com/Akshayykadam/PixelBoard).

This is the reproducible local route used while the credentialed Morphe Gradle
plugin cannot resolve. It never edits bytes blindly: it disassembles the target
DEX with baksmali, verifies exact method anchors and SHA-256 string
fingerprints from a profile, derives the enabled-languages register by local
dataflow on the disassembly, inserts two runtime-hook calls in smali, and
reassembles. Any anchor or fingerprint mismatch aborts with no output.

Requires: a JDK on PATH (or JAVA_HOME), baksmali + smali fat jars.
No Google binaries are included in this repository; the user supplies a
lawfully obtained Gboard APK.
"""

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import zipfile

EXT_DEFAULT = ("Lcom/akshaykadam/pixelboard/extension/ramblerlite/"
               "GboardRamblerLiteScriptRuntime;")
RULE_HOOK = "selectHinglishOverrideRule"
PROMPT_HOOK = "rewriteCleanupPromptScriptGate"
STRING_REPLACE = ("Ljava/lang/String;->replace(Ljava/lang/CharSequence;"
                  "Ljava/lang/CharSequence;)Ljava/lang/String;")
DEX_MAGIC = b"dex\n"
REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


class PatchError(Exception):
    pass


# ---------------------------------------------------------------- smali utils

def run(cmd):
    proc = subprocess.run(cmd, capture_output=True, text=True)
    if proc.returncode != 0:
        raise PatchError("command failed: %s\n%s%s" % (
            " ".join(cmd), proc.stdout, proc.stderr))
    return proc.stdout


def java_cmd():
    home = os.environ.get("JAVA_HOME")
    return os.path.join(home, "bin", "java") if home else "java"


def smali_prefix(kind, jar):
    """Command prefix for smali/baksmali: fat classpath via SMALI_CP if set,
    else a main-class classpath of the two thin jars is NOT assumed; fall back
    to -jar with the given jar (works for the official fat jars)."""
    cp = os.environ.get("SMALI_CP")
    main = "org.jf.baksmali.Main" if kind == "baksmali" else "org.jf.smali.Main"
    if cp:
        return [java_cmd(), "-cp", cp, main]
    return [java_cmd(), "-jar", jar]


def smali_class_path(class_type):
    """Lcom/foo/Bar; -> com/foo/Bar.smali ; Lkfd; -> kfd.smali"""
    return class_type.strip()[1:-1] + ".smali"


UNICODE_ESC_RE = re.compile(r"[0-9a-fA-F]{4}")


def smali_unescape(s):
    out = []
    i = 0
    while i < len(s):
        c = s[i]
        if c != "\\":
            out.append(c)
            i += 1
            continue
        i += 1
        if i >= len(s):
            raise PatchError("trailing backslash in smali string")
        e = s[i]
        i += 1
        table = {"n": "\n", "r": "\r", "t": "\t", "b": "\b", "f": "\f",
                 "\\": "\\", '"': '"', "'": "'"}
        if e == "u":
            # Exactly four hex digits. int() alone would accept a short tail,
            # a sign or underscores and decode the wrong character.
            digits = s[i:i + 4]
            if not UNICODE_ESC_RE.fullmatch(digits):
                raise PatchError("malformed \\u escape in smali string: \\u%s"
                                 % digits)
            out.append(chr(int(digits, 16)))
            i += 4
        elif e in table:
            out.append(table[e])
        else:
            raise PatchError("unsupported smali escape: \\%s" % e)
    return "".join(out)


CONST_RE = re.compile(
    r'^(?P<indent>\s*)const-string(?:/jumbo)?\s+(?P<reg>[vp]\d+),\s*"(?P<body>(?:[^"\\]|\\.)*)"\s*$')


def parse_const_string(line):
    m = CONST_RE.match(line)
    if not m:
        return None
    return m.group("reg"), smali_unescape(m.group("body"))


INVOKE_RE = re.compile(
    r'^\s*invoke-\w+(?:/range)?\s*\{(?P<regs>[^}]*)\},\s*(?P<ref>\S+)\s*$')


RANGE_RE = re.compile(
    r'^\s*(?P<p0>[vp])(?P<n0>\d+)\s*\.\.\s*(?P<p1>[vp])(?P<n1>\d+)\s*$')


def parse_invoke(line):
    m = INVOKE_RE.match(line)
    if not m:
        return None
    body = m.group("regs")
    if ".." in body:
        # A range keeps its v/p prefix: {p1 .. p3} is p1,p2,p3, never v1..v3.
        # A mixed range cannot be expanded without the method's register
        # layout, so it aborts instead of guessing.
        r = RANGE_RE.match(body)
        if not r:
            raise PatchError("malformed register range {%s}" % body.strip())
        if r.group("p0") != r.group("p1"):
            raise PatchError("mixed v/p register range {%s}" % body.strip())
        n0, n1 = int(r.group("n0")), int(r.group("n1"))
        if n1 < n0:
            raise PatchError("descending register range {%s}" % body.strip())
        regs = ["%s%d" % (r.group("p0"), n) for n in range(n0, n1 + 1)]
    else:
        regs = [x.strip() for x in body.split(",") if x.strip()]
    return regs, m.group("ref")


def sha256_text(s):
    return hashlib.sha256(s.encode("utf-8")).hexdigest()


def method_bounds(lines, name, proto):
    start = None
    for i, line in enumerate(lines):
        if line.startswith(".method"):
            # Whole-token match: "d(...)V" must not match "xd(...)V".
            if line.split()[-1] == name + proto:
                if start is not None:
                    raise PatchError("duplicate method %s%s" % (name, proto))
                start = i
        elif start is not None and line.strip() == ".end method":
            return start, i
    raise PatchError("method %s%s not found" % (name, proto))


def param_slots(proto, is_static):
    params = proto[1:proto.index(")")]
    slots = 0 if is_static else 1
    i = 0
    while i < len(params):
        c = params[i]
        if c == "L":
            i = params.index(";", i) + 1
            slots += 1
        elif c == "[":
            # Arrays are one reference slot, whatever the element type.
            while params[i] == "[":
                i += 1
            if params[i] == "L":
                i = params.index(";", i) + 1
            else:
                i += 1
            slots += 1
        elif c in "JD":
            slots += 2
            i += 1
        else:
            slots += 1
            i += 1
    return slots


def bump_locals(lines, mstart, extra, proto, is_static):
    """Raise the method's local register window; returns first temp vN."""
    for i in range(mstart, len(lines)):
        s = lines[i].strip()
        if s.startswith(".locals"):
            n = int(s.split()[1])
            lines[i] = lines[i].replace(".locals %d" % n, ".locals %d" % (n + extra))
            return n
        if s.startswith(".registers"):
            n = int(s.split()[1])
            locals_n = n - param_slots(proto, is_static)
            lines[i] = lines[i][:len(lines[i]) - len(lines[i].lstrip())] \
                + ".locals %d" % (locals_n + extra)
            return locals_n
        if s.startswith(".end method"):
            break
    raise PatchError("no .locals/.registers in method")


# ------------------------------------------------------------------ profiling

class Profile:
    def __init__(self, path):
        with open(path, encoding="utf-8") as fh:
            self.raw = json.load(fh)
        self.methods = self.raw["methods"]
        self.fingerprints = self.raw["fingerprints"]
        self.anchors = self.raw["anchors"]
        self.ext_class = self.raw.get("extension_class", EXT_DEFAULT)

    def method(self, key):
        m = self.methods[key]
        return m["class"], m["name"], m["signature"]


# ------------------------------------------------------------------- analysis

def disassemble_all(apk, workdir, baksmali_jar):
    dexes = []
    with zipfile.ZipFile(apk) as zf:
        names = [n for n in zf.namelist()
                 if re.fullmatch(r"classes(\d*)\.dex", n)]
        names.sort(key=lambda n: (len(n), n))
        for name in names:
            out = os.path.join(workdir, name.replace(".dex", ""))
            data = zf.read(name)
            tmp = os.path.join(workdir, name)
            with open(tmp, "wb") as fh:
                fh.write(data)
            run(smali_prefix("baksmali", baksmali_jar) + ["d", tmp, "-o", out])
            dexes.append((name, out))
    if not dexes:
        raise PatchError("no classes*.dex entries in %s" % apk)
    return dexes


def scan_fingerprints(dexes, fingerprints):
    """Locate every const-string whose sha256 matches a known fingerprint."""
    hits = {k: [] for k in fingerprints}
    for dex_name, ddir in dexes:
        for root, _dirs, files in os.walk(ddir):
            for fn in files:
                if not fn.endswith(".smali"):
                    continue
                path = os.path.join(root, fn)
                with open(path, encoding="utf-8") as fh:
                    lines = fh.read().splitlines()
                mstart = None
                msig = None
                for idx, line in enumerate(lines):
                    if line.startswith(".method"):
                        mstart = idx
                        msig = line.split(None, 1)[1].strip()
                    elif line.strip() == ".end method":
                        mstart = None
                    parsed = parse_const_string(line)
                    if not parsed:
                        continue
                    _reg, value = parsed
                    try:
                        digest = sha256_text(value)
                    except UnicodeEncodeError as exc:
                        raise PatchError(
                            "cannot fingerprint the const-string at %s:%d: it "
                            "contains a surrogate escape that is not valid "
                            "Unicode text" % (path, idx + 1)) from exc
                    for key, fp in fingerprints.items():
                        if digest == fp["sha256"]:
                            hits[key].append({
                                "dex": dex_name, "file": path, "line": idx + 1,
                                "method": msig, "method_line": mstart,
                            })
    return hits


def analyze(apk, profile, workdir, baksmali_jar):
    dexes = disassemble_all(apk, workdir, baksmali_jar)
    hits = scan_fingerprints(dexes, profile.fingerprints)
    report = {"apk": apk, "dexes": [d for d, _ in dexes],
              "fingerprint_hits": hits, "methods": {}}
    for key in profile.methods:
        cls, name, proto = profile.method(key)
        found = None
        for dex_name, ddir in dexes:
            path = os.path.join(ddir, smali_class_path(cls))
            if not os.path.exists(path):
                continue
            with open(path, encoding="utf-8") as fh:
                lines = fh.read().splitlines()
            try:
                start, end = method_bounds(lines, name, proto)
            except PatchError:
                continue
            consts = []
            for i in range(start, end + 1):
                p = parse_const_string(lines[i])
                if p:
                    consts.append({"line": i + 1, "reg": p[0],
                                   "sha256": sha256_text(p[1]),
                                   "preview": p[1][:60]})
            found = {"dex": dex_name, "file": path,
                     "lines": [start + 1, end + 1], "const_strings": consts}
            break
        report["methods"][key] = found or {"error": "not found"}
    return report


# ------------------------------------------------------------------- patching

def find_enabled_languages_site(lines, mstart, mend, placeholder):
    """Locate .replace("{ENABLED_LANGUAGES}", langs); returns (langs_reg,
    result_reg, insert_after_index)."""
    const_idx = None
    const_reg = None
    for i in range(mstart, mend + 1):
        p = parse_const_string(lines[i])
        if p and p[1] == placeholder:
            const_idx, const_reg = i, p[0]
            break
    if const_idx is None:
        raise PatchError("placeholder const-string %r not found in method" % placeholder)
    for i in range(const_idx + 1, mend + 1):
        inv = parse_invoke(lines[i])
        if not inv:
            continue
        regs, ref = inv
        if ref == STRING_REPLACE and len(regs) == 3 and regs[1] == const_reg:
            langs_reg = regs[2]
            for j in range(i + 1, min(i + 4, mend + 1)):
                m = re.match(r"^\s*move-result-object\s+([vp]\d+)\s*$", lines[j])
                if m:
                    return langs_reg, m.group(1), j
            raise PatchError("no move-result-object after String.replace")
    raise PatchError("no String.replace using %s after placeholder load" % const_reg)


def hook_snippet(temp0, src_reg, langs_reg, ext, hook):
    return [
        "    move-object/from16 %s, %s" % (temp0, src_reg),
        "    move-object/from16 %s, %s" % ("v%d" % (int(temp0[1:]) + 1), langs_reg),
        "    invoke-static/range {%s .. %s}, %s->%s"
        "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;" % (
            temp0, "v%d" % (int(temp0[1:]) + 1), ext, hook),
        "    move-result-object %s" % temp0,
        "    move-object/from16 %s, %s" % (src_reg, temp0),
    ]


def patch_method(lines, profile, fingerprints_ok):
    cls, name, proto = profile.method("cleanup_builder")
    mstart, mend = method_bounds(lines, name, proto)
    header = lines[mstart]
    is_static = bool(re.search(r"\bstatic\b", header))
    body = lines[mstart:mend + 1]
    ext = profile.ext_class
    if any(ext in l for l in body):
        raise PatchError("method already references the extension runtime "
                         "(already patched?)")

    placeholder = profile.anchors["enabled_languages_placeholder"]
    langs_reg, result_reg, replace_end = find_enabled_languages_site(
        lines, mstart, mend, placeholder)
    if result_reg == langs_reg:
        # move-result-object has already overwritten the languages value, so
        # the save below would capture the prompt and hand it to both hooks
        # as "enabled languages". Abort before anything is rewritten.
        raise PatchError("String.replace result register %s is also the "
                         "enabled-languages register; the languages value is "
                         "overwritten before it can be saved. Aborting "
                         "fail-closed." % result_reg)

    rule_fp = profile.fingerprints["hinglish_override_rule"]["sha256"]
    rule_idx = None
    rule_reg = None
    for i in range(mstart, mend + 1):
        p = parse_const_string(lines[i])
        if p and sha256_text(p[1]) == rule_fp:
            rule_idx, rule_reg = i, p[0]
            break
    if rule_idx is None:
        raise PatchError("stock Hinglish override const-string not found in "
                         "kfd.d (fingerprint %s)" % rule_fp)
    if rule_idx < replace_end:
        raise PatchError("stock override rule loads BEFORE the "
                         "{ENABLED_LANGUAGES} substitution; this build's "
                         "control flow needs a different anchor order. "
                         "Aborting fail-closed; run analyze and adjust the "
                         "profile.")

    # Three temps: one dedicated save register for the enabled-languages
    # value (captured immediately after the String.replace so a later
    # const-string cannot clobber it), plus a contiguous invoke pair.
    base = bump_locals(lines, mstart, 3, proto, is_static)
    if base + 2 > 255:
        raise PatchError("method uses too many registers for 8-bit temps")
    saved_langs = "v%d" % base
    temp0 = "v%d" % (base + 1)

    # Insert Hook B first (later line index), then Hook A, so indices stay
    # valid. Hook B reads the SAVED languages register, not the (possibly
    # clobbered) original.
    snippet_b = hook_snippet(temp0, rule_reg, saved_langs, ext, RULE_HOOK)
    lines[rule_idx + 1:rule_idx + 1] = snippet_b
    snippet_a = (["    move-object/from16 %s, %s" % (saved_langs, langs_reg)]
                 + hook_snippet(temp0, result_reg, langs_reg, ext, PROMPT_HOOK))
    lines[replace_end + 1:replace_end + 1] = snippet_a
    return lines


def verify_prompt_owner(lines_by_class, profile):
    cls, name, proto = profile.method("prompt_owner")
    path_lines = lines_by_class.get(cls)
    if path_lines is None:
        raise PatchError("prompt owner class %s not found" % cls)
    mstart, mend = method_bounds(path_lines, name, proto)
    fp = profile.fingerprints["lite_cleanup_prompt"]["sha256"]
    for i in range(mstart, mend + 1):
        p = parse_const_string(path_lines[i])
        if p and sha256_text(p[1]) == fp:
            return True
    raise PatchError("Lite cleanup prompt fingerprint %s not found in %s->%s"
                     % (fp, cls, name))


def check_extension_dex(path):
    """Abort before any work if the --extension-dex input is unusable."""
    if path is None:
        return
    if not os.path.isfile(path):
        raise PatchError("--extension-dex %s is not a file" % path)
    try:
        with open(path, "rb") as fh:
            magic = fh.read(len(DEX_MAGIC))
    except OSError as exc:
        raise PatchError("--extension-dex %s cannot be read: %s" % (path, exc))
    if magic != DEX_MAGIC:
        raise PatchError("--extension-dex %s is not a DEX file" % path)


def check_workdir(workdir):
    """Refuse a scratch directory whose deletion would destroy something else.

    The workdir is removed and recreated on every run, so it must not be the
    current directory, the repository, the home directory, or any directory
    that contains one of them ("/" contains all three)."""
    wd = os.path.realpath(workdir)
    prefix = wd.rstrip(os.sep) + os.sep
    protected = (("current directory", os.getcwd()),
                 ("repository root", REPO_ROOT),
                 ("home directory", os.path.expanduser("~")))
    for label, path in protected:
        real = os.path.realpath(path)
        if real == wd or real.startswith(prefix):
            raise PatchError(
                "--workdir %s is or contains the %s (%s). The workdir is "
                "deleted on every run; use a dedicated scratch directory."
                % (workdir, label, real))


def write_output_apk(apk, out_apk, dex_name, new_dex, extension_dex=None,
                     extension_name=None):
    """Copy every entry of apk, swap in the patched dex and append the
    extension dex. The result is built in a sibling temp file and renamed
    over out_apk only on success, so a failed run never leaves a partial or
    half-merged APK at the output path."""
    tmp_out = "%s.partial-%d" % (out_apk, os.getpid())
    try:
        with zipfile.ZipFile(apk) as zin, \
                zipfile.ZipFile(tmp_out, "w", zipfile.ZIP_DEFLATED) as zout:
            for item in zin.infolist():
                if item.filename == dex_name:
                    with open(new_dex, "rb") as fh:
                        zout.writestr(item.filename, fh.read())
                else:
                    zout.writestr(item, zin.read(item.filename))
            if extension_dex is not None:
                with open(extension_dex, "rb") as fh:
                    zout.writestr(extension_name, fh.read())
        os.replace(tmp_out, out_apk)
    except BaseException:
        try:
            os.unlink(tmp_out)
        except OSError:
            pass
        raise


def patch(apk, out_apk, profile, workdir, baksmali_jar, smali_jar,
          extension_dex=None):
    check_extension_dex(extension_dex)
    dexes = disassemble_all(apk, workdir, baksmali_jar)

    # 1. Fail-closed fingerprint sweep across the whole APK.
    hits = scan_fingerprints(dexes, profile.fingerprints)
    for key, fp in profile.fingerprints.items():
        if not hits[key]:
            raise PatchError("fingerprint %s (%s) not found anywhere in the "
                             "APK; refusing to patch an unrecognized build"
                             % (fp["sha256"], key))

    # 2. Locate the cleanup-builder method's dex.
    cls, name, proto = profile.method("cleanup_builder")
    target = None
    for dex_name, ddir in dexes:
        path = os.path.join(ddir, smali_class_path(cls))
        if os.path.exists(path):
            with open(path, encoding="utf-8") as fh:
                lines = fh.read().splitlines()
            try:
                method_bounds(lines, name, proto)
            except PatchError:
                continue
            target = (dex_name, ddir, path, lines)
            break
    if target is None:
        raise PatchError("cleanup builder %s->%s%s not found" % (cls, name, proto))

    dex_name, ddir, path, lines = target

    # 3. Verify the prompt-owner fingerprint before touching anything.
    pcls, pname, pproto = profile.method("prompt_owner")
    plines = None
    for dn2, dd2 in dexes:
        ppath = os.path.join(dd2, smali_class_path(pcls))
        if os.path.exists(ppath):
            with open(ppath, encoding="utf-8") as fh:
                cand = fh.read().splitlines()
            try:
                method_bounds(cand, pname, pproto)
                plines = cand
            except PatchError:
                continue
    verify_prompt_owner({pcls: plines} if plines else {}, profile)

    # 4. Rewrite the cleanup builder.
    new_lines = patch_method(lines, profile, hits)
    with open(path, "w", encoding="utf-8") as fh:
        fh.write("\n".join(new_lines) + "\n")

    # 5. Reassemble only the touched dex.
    new_dex = os.path.join(workdir, "patched-" + dex_name)
    run(smali_prefix("smali", smali_jar) + ["a", ddir, "-o", new_dex])

    # 6. Repack: copy every entry, swap the patched dex, append extension dex.
    write_output_apk(apk, out_apk, dex_name, new_dex, extension_dex,
                     "classes%d.dex" % (len(dexes) + 1))
    return {"patched_dex": dex_name, "out": out_apk,
            "extension_dex": extension_dex}


# ----------------------------------------------------------------------- main

def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("command", choices=["analyze", "patch"])
    ap.add_argument("--apk", required=True)
    ap.add_argument("--out")
    ap.add_argument("--profile", required=True)
    ap.add_argument("--workdir", default="/tmp/dex-patch-work")
    ap.add_argument("--baksmali-jar", default=os.environ.get(
        "BAKSMALI_JAR", "tools/baksmali-2.5.2.jar"))
    ap.add_argument("--smali-jar", default=os.environ.get(
        "SMALI_JAR", "tools/smali-2.5.2.jar"))
    ap.add_argument("--extension-dex")
    args = ap.parse_args(argv)

    try:
        # Validate the inputs before the workdir is deleted or any tool runs.
        if args.command == "patch":
            if not args.out:
                ap.error("patch requires --out")
            check_extension_dex(args.extension_dex)
        check_workdir(args.workdir)

        profile = Profile(args.profile)
        if os.path.isdir(args.workdir):
            shutil.rmtree(args.workdir)
        os.makedirs(args.workdir)

        if args.command == "analyze":
            report = analyze(args.apk, profile, args.workdir,
                             args.baksmali_jar)
            print(json.dumps(report, indent=2, ensure_ascii=False))
            return 0
        result = patch(args.apk, args.out, profile, args.workdir,
                       args.baksmali_jar, args.smali_jar,
                       args.extension_dex)
        print(json.dumps(result, indent=2))
        return 0
    except PatchError as exc:
        print("FAIL-CLOSED ABORT: %s" % exc, file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
