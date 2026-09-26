#!/usr/bin/env python3
"""
Check a patched APK against Glu's original, deterministically, before it goes near a device.

    python scripts/verify_apk.py ORIGINAL.apk PATCHED.apk
    python scripts/verify_apk.py ORIGINAL.apk PATCHED.apk --expect-libs DIR

Needs Python 3 with pyelftools, and apktool, aapt2 and apksigner on PATH (or ANDROID_BUILD_TOOLS
pointing at a build-tools directory). Exit code 0 = every check passed.

What it proves, per ABI and for the whole archive:
  * "Modern Android compatibility" is in place, and each other patch is applied wholly or not
    at all; the report ends with the patches it found
  * the native library differs from Glu's only in the words NativeEdits.kt lists for the
    patches found, plus, for "Unlimited currency", the cave, program headers and splice its
    plan describes; DT_TEXTREL is gone and no relocation targets a read-only segment
  * with --expect-libs DIR every patch must be on, and each library must be byte-identical to
    DIR/<abi>/libandroidplatformjni.so, the output of the separate Python patch chain
  * the manifest targets API 25, keeps minSdkVersion 7, declares org.apache.http.legacy as
    optional, and declares exactly Glu's permissions and components, or exactly those less
    the ones "Remove unused permissions" lists in UnusedPermissionsPatch.kt
  * every entry Glu stored uncompressed is still stored and byte-identical; the engine reads
    those through AssetFileDescriptor, and a deflated one kills the game long after launch.
    resources.arsc is the exception: a manifest edit makes the patcher re-encode it, so it is
    compared through aapt2 instead, and only the PUBLIC flag on id resources may differ
  * each bytecode edit of the patches found is present in the decoded smali, whichever dex
    file holds it; with "Stop requests to dead servers", every OpenFeint class is an empty
    shell, and exactly the ones whose superclasses reach Object through other shells keep a
    no-arg constructor that only calls super()
  * the APK carries v1 and v2 signatures (v1 is what Android before 7.0 checks)

A second dex file is a warning, not a failure: Android 5.0 and later load it, older versions
load only classes.dex. So is an ABI left out with Morphe's --striplibs; the ABIs still in the APK
are checked as usual.
"""
import io, os, re, shutil, struct, subprocess, sys, tempfile, zipfile
from elftools.elf.elffile import ELFFile
from elftools.elf.relocation import RelocationSection

HERE = os.path.dirname(os.path.abspath(__file__))
EDITS_KT = os.path.join(HERE, "..", "patches", "src", "main", "kotlin", "app", "ckzombies",
                        "patches", "nativelib", "NativeEdits.kt")
PATCHES_KT = os.path.join(os.path.dirname(EDITS_KT), "NativeLibraryPatches.kt")
UNUSED_KT = os.path.join(os.path.dirname(EDITS_KT), "..", "compat", "UnusedPermissionsPatch.kt")
EMPTY_KT = os.path.join(os.path.dirname(EDITS_KT), "..", "compat", "EmptyClasses.kt")
LIB = "libandroidplatformjni.so"
WORD_EDIT = r"WordEdit\(0x([0-9A-F]+), 0x([0-9A-F]+)L, 0x([0-9A-F]+)L\)"
COMPAT, CURRENCY, SOUND, UNUSED, DEAD = ("Modern Android compatibility", "Unlimited currency", "Smooth sound",
                                         "Remove unused permissions", "Stop requests to dead servers")
ALL_PATCHES = (COMPAT, CURRENCY, SOUND, UNUSED, DEAD)
failures = 0
warnings = 0


def check(ok, message):
    global failures
    print(("  [OK]   " if ok else "  [FAIL] ") + message)
    failures += not ok


def warn(message):
    global warnings
    print("  [WARN] " + message)
    warnings += 1


def tool(name):
    bt = os.environ.get("ANDROID_BUILD_TOOLS")
    if bt:
        for ext in ("", ".exe", ".bat"):
            p = os.path.join(bt, name + ext)
            if os.path.exists(p):
                return p
    found = shutil.which(name)
    if not found:
        raise SystemExit(f"{name} not found; put it on PATH or set ANDROID_BUILD_TOOLS")
    return found


def run(*args):
    # stdin closed: on Windows apktool.bat ends in a `pause` when run through `cmd /c`, which
    # waits forever for a key from a shell that leaves stdin open.
    return subprocess.run(args, capture_output=True, text=True, errors="replace", stdin=subprocess.DEVNULL).stdout


def table(name):
    """{abi: [(vaddr, old, new)]} for one map in NativeEdits.kt."""
    src = io.open(EDITS_KT, encoding="utf-8").read()
    block = re.search(r"val %s: Map<String, List<WordEdit>> = mapOf\((.*?)\n    \)" % name, src, re.S).group(1)
    out = {}
    for abi, body in re.findall(r'"([\w-]+)" to listOf\((.*?)\n\s*\),', block, re.S):
        out[abi] = [tuple(int(x, 16) for x in m) for m in re.findall(WORD_EDIT, body)]
    return out


def currency_plans():
    """{abi: plan} for the CURRENCY map in NativeEdits.kt, plus the flag size the patch claims."""
    src = io.open(EDITS_KT, encoding="utf-8").read()
    block = re.search(r"val CURRENCY: Map<String, CurrencyPlan> = mapOf\((.*?)\n    \)", src, re.S).group(1)
    flag_bytes = int(re.search(r"FLAG_BYTES = (\d+)", io.open(PATCHES_KT, encoding="utf-8").read()).group(1))
    plans = {}
    for abi, body in re.findall(r'"([\w-]+)" to CurrencyPlan\((.*?)\n        \),', block, re.S):
        def field(name):
            return re.search(r"\b%s = ([^,\n]+)," % name, body).group(1).strip()
        splice_at = field("spliceAtOffset")
        plans[abi] = {
            "cave": int(field("cave"), 16),
            "load1_end": int(field("load1End"), 16),
            "splice_at": None if splice_at == "null" else int(splice_at, 16),
            "splice_size": int(field("spliceSize"), 16),
            "cave_bytes": bytes.fromhex(field("caveBytes").strip('"')),
            "edits": [tuple(int(x, 16) for x in m) for m in re.findall(WORD_EDIT, body)],
            "flag_bytes": flag_bytes,
        }
    return plans


def native_patches(abi, a, b, plan):
    """Check one library for the native patches it carries; returns {patch: applied?}.

    Each patch must be there wholly or not at all. Every word of the loaded image that differs
    from Glu's must belong to a patch found, and when "Unlimited currency" is found, the
    program headers, e_shoff, the file size and the cave must be exactly what its plan does:
    an optional splice, the first PT_LOAD grown to load1End, the last one's memory grown by
    the flag, and the cave written where the first PT_LOAD used to end.
    """
    ea, wa = loaded_words(a)
    eb, wb = loaded_words(b)
    groups = {COMPAT: table("TEXT_RELOCATION")[abi] + table("JNI_GUARDS")[abi],
              CURRENCY: plan["edits"], DEAD: table("GSERVE_STALL")[abi] + table("DEAD_SERVERS")[abi]}
    state = {}
    for name, edits in groups.items():
        if not edits:
            raise SystemExit(f"NativeEdits.kt parsed to no {name} edits for {abi}; the parser is out of date")
        if all(wb.get(va) == new for va, _, new in edits):
            state[name] = True
        elif all(wb.get(va) == old for va, old, _ in edits):
            state[name] = False
        else:
            state[name] = None
    check(state[COMPAT] is True, f"{abi}: {COMPAT}: all {len(groups[COMPAT])} words in place")
    for name in (CURRENCY, DEAD):
        check(state[name] is not None, f"{abi}: {name}: " + {True: f"applied, all {len(groups[name])} words",
                                                             False: "not applied, every word Glu's",
                                                             None: "only partly applied"}[state[name]])
    currency = state[CURRENCY] is True
    splice = plan["splice_size"] if currency and plan["splice_at"] is not None else 0

    def moved(offset):
        return offset + splice if splice and offset >= plan["splice_at"] else offset

    ha, hb = dict(ea.header), dict(eb.header)
    check(all(ha[k] == hb[k] for k in ha if k != "e_shoff") and hb["e_shoff"] == moved(ha["e_shoff"]),
          f"{abi}: ELF header unchanged" + (" but for e_shoff, moved by the splice" if splice else ""))
    sa, sb = [dict(s.header) for s in ea.iter_segments()], [dict(s.header) for s in eb.iter_segments()]
    loads = [i for i, s in enumerate(sa) if s["p_type"] == "PT_LOAD"]
    first = sa[loads[0]]
    want = []
    for i, s in enumerate(sa):
        w = dict(s, p_offset=moved(s["p_offset"]))
        if currency and i == loads[0]:
            w["p_filesz"] = w["p_memsz"] = plan["load1_end"]
        if currency and i == loads[-1]:
            w["p_memsz"] = s["p_memsz"] + plan["flag_bytes"]
        want.append(w)
    fits = first["p_offset"] == first["p_vaddr"] == 0 and (not currency or first["p_filesz"] == plan["cave"])
    check(fits and sb == want, f"{abi}: program headers " + ("as the currency plan sets them" if currency else "unchanged"))
    check(len(b) == len(a) + splice, f"{abi}: size {len(a):,} -> {len(b):,} bytes" + (" (the splice)" if splice else ""))

    # The ELF and program headers sit at the start of the first PT_LOAD, so their words are in
    # the loaded image too; the two checks above already account for every one of them.
    header_end = hb["e_phoff"] + hb["e_phnum"] * hb["e_phentsize"]
    # A word a patch sets is never stray, even when its patch is only partly there: that is
    # reported above, and this check is left to catch words no patch touches.
    allowed = {va for edits in groups.values() for va, _, new in edits if wb.get(va) == new}
    changed = {va for va in wa if va in wb and wa[va] != wb[va]}
    stray = sorted(va for va in changed - allowed if va >= header_end)
    check(not stray, f"{abi}: {len(changed)} loaded words differ from Glu's, none outside the patches found"
          + (f" (also {[hex(v) for v in stray[:4]]})" if stray else ""))
    added = sorted(va for va in wb if va not in wa)
    if currency:
        cave, end = plan["cave"], plan["load1_end"]
        region = b[cave:end]  # the first PT_LOAD maps file offset = vaddr
        check(region == plan["cave_bytes"] + bytes(end - cave - len(plan["cave_bytes"])),
              f"{abi}: currency cave holds its {len(plan['cave_bytes'])} planned bytes, zeros after")
        check(all(cave <= va < end for va in added), f"{abi}: the image grew only by the cave page")
    else:
        check(not added, f"{abi}: the loaded image did not grow")
    check(has_textrel(ea) and not has_textrel(eb), f"{abi}: DT_TEXTREL present before, gone after")
    n = text_relocations(eb)
    check(n == 0 and text_relocations(ea) == 1, f"{abi}: text relocations 1 before, {n} after")
    return state


def loaded_words(data):
    e = ELFFile(io.BytesIO(data))
    words = {}
    for s in e.iter_segments():
        h = s.header
        if h.p_type != "PT_LOAD":
            continue
        for va in range((h.p_vaddr + 3) & ~3, h.p_vaddr + h.p_filesz - 3, 4):
            words[va] = struct.unpack_from("<I", data, h.p_offset + va - h.p_vaddr)[0]
    return e, words


def text_relocations(e):
    ro = [(s.header.p_vaddr, s.header.p_vaddr + s.header.p_memsz) for s in e.iter_segments()
          if s.header.p_type == "PT_LOAD" and not s.header.p_flags & 2]
    count = 0
    for sec in e.iter_sections():
        if isinstance(sec, RelocationSection) and sec.name.startswith(".rel"):
            for r in sec.iter_relocations():
                if r["r_info_type"] and any(a <= r["r_offset"] < b for a, b in ro):
                    count += 1
    return count


MANIFEST_TAGS = ("uses-permission", "permission", "activity", "receiver", "service", "provider")


def manifest_entries(aapt2, apk):
    """{(tag, android:name)} for the permissions and components the manifest declares."""
    tree = run(aapt2, "dump", "xmltree", "--file", "AndroidManifest.xml", apk)
    entries, element = set(), None
    for line in tree.splitlines():
        e = re.match(r"(\s*)E: (\S+)", line)
        if e:
            element = (e.group(2), len(e.group(1)))
            continue
        a = re.match(r'(\s*)A: http://schemas.android.com/apk/res/android:name\(0x01010003\)="([^"]*)"', line)
        if a and element and element[0] in MANIFEST_TAGS and len(a.group(1)) == element[1] + 2:
            entries.add((element[0], a.group(2)))
    if not entries:
        raise SystemExit(f"aapt2 xmltree gave no manifest entries for {apk}; the parser is out of date")
    return entries


def unused_entries(package):
    """{(tag, android:name)} the "Remove unused permissions" patch takes out, from its own source."""
    src = io.open(UNUSED_KT, encoding="utf-8").read()
    def block(name):
        return re.search(r"val %s = listOf\((.*?)\n\)" % name, src, re.S).group(1)
    entries = set(re.findall(r'"(\w[\w-]*)" to "([\w.]+)"', block("REMOVED_COMPONENTS")))
    for name in re.findall(r'"([\w.]+)"', block("REMOVED_PERMISSIONS")):
        entries.add(("uses-permission", package + name if name.startswith(".") else name))
    entries.add(("permission", package + ".permission.C2D_MESSAGE"))
    if len(entries) < 12:
        raise SystemExit(f"{UNUSED_KT} parsed to {len(entries)} entries; the parser is out of date")
    return entries


def openfeint_count():
    """How many OpenFeint classes the patch expects, from its own source."""
    src = io.open(EMPTY_KT, encoding="utf-8").read()
    return int(re.search(r"const val OPENFEINT_CLASSES = (\d+)", src).group(1))


def openfeint_shells(smali_trees):
    """{type: (flags, superclass, body)} for every OpenFeint class in the decoded dex files.

    body is what is left once the header lines are dropped: [] for a shell with nothing in it,
    the four lines of a constructor, or more for a class that still has its code."""
    out = {}
    for tree in smali_trees:
        for root, _, files in os.walk(os.path.join(tree, "com", "openfeint")):
            for f in files:
                lines = [l.strip() for l in io.open(os.path.join(root, f), encoding="utf-8")]
                lines = [l for l in lines if l and not l.startswith("#")]
                head = re.fullmatch(r"\.class\s+(.*?)\s*(L\S+;)", lines[0])
                superclass = next((l.split()[1] for l in lines if l.startswith(".super ")), None)
                body = [l for l in lines[1:] if not l.startswith((".super ", ".implements ", ".locals ", ".registers "))]
                out[head.group(2)] = (head.group(1).split(), superclass, body)
    return out


def has_textrel(e):
    return any(t.entry.d_tag == "DT_TEXTREL" for t in e.get_section_by_name(".dynamic").iter_tags())


def main():
    if len(sys.argv) not in (3, 5) or (len(sys.argv) == 5 and sys.argv[3] != "--expect-libs"):
        raise SystemExit(__doc__)
    original, patched = sys.argv[1], sys.argv[2]
    expect_libs = sys.argv[4] if len(sys.argv) == 5 else None
    zo, zp = zipfile.ZipFile(original), zipfile.ZipFile(patched)

    print("[native library]")
    found = {}
    # Morphe's --striplibs leaves out the other ABIs, which is fine: armeabi-v7a devices run
    # armeabi code. Every ABI still in the APK is checked, and at least one must be.
    abis = [abi for abi in sorted(table("TEXT_RELOCATION")) if f"lib/{abi}/{LIB}" in zp.namelist()]
    stripped = sorted(set(table("TEXT_RELOCATION")) - set(abis))
    if not abis:
        raise SystemExit(f"{patched} holds no {LIB} for any ABI")
    if stripped:
        warn(f"no library for {', '.join(stripped)} (patched with --striplibs); only {', '.join(abis)} is checked")
    if expect_libs:
        # Every native patch is on, so the libraries must come out as the separate Python patch
        # chain's own output, byte for byte.
        identical = []
        for abi in abis:
            want = open(os.path.join(expect_libs, abi, LIB), "rb").read()
            got = zp.read(f"lib/{abi}/{LIB}")
            identical.append(got == want)
            check(got == want, f"{abi}: identical to the patch chain's final library ({len(want):,} bytes)")
            e = ELFFile(io.BytesIO(got))
            check(not has_textrel(e) and text_relocations(e) == 0, f"{abi}: no text relocation left")
        # A library that is not the chain's says nothing about which native patches it carries.
        found.update(dict.fromkeys((COMPAT, CURRENCY, DEAD), True if all(identical) else None))
    else:
        plans = currency_plans()
        per_abi = [native_patches(abi, zo.read(f"lib/{abi}/{LIB}"), zp.read(f"lib/{abi}/{LIB}"), plans[abi])
                   for abi in abis]
        for name in (COMPAT, CURRENCY, DEAD):
            states = {s[name] for s in per_abi}
            if len(states) > 1:
                check(False, f"{name}: applied to some ABIs and not to others")
            found[name] = states.pop() if len(states) == 1 else None

    print("[manifest]")
    aapt2 = tool("aapt2")
    bo = run(aapt2, "dump", "badging", original)
    bp = run(aapt2, "dump", "badging", patched)
    check("targetSdkVersion:'25'" in bp, "targetSdkVersion 25")
    check("minSdkVersion:'7'" in bp, "minSdkVersion still 7")
    check("uses-library-not-required:'org.apache.http.legacy'" in bp, "org.apache.http.legacy declared, not required")
    pkg = lambda s: re.search(r"^package: .*$", s, re.M).group(0)
    check(pkg(bo) == pkg(bp), "package name, versionCode and versionName unchanged")
    package = re.search(r"^package: name='([^']+)'", bo, re.M).group(1)
    eo, ep = manifest_entries(aapt2, original), manifest_entries(aapt2, patched)
    gone, added = eo - ep, ep - eo
    listed = unused_entries(package)
    if not gone and not added:
        found[UNUSED] = False
        check(True, f"same {len(eo)} permissions and components as Glu's")
    elif gone == listed and not added:
        found[UNUSED] = True
        check(True, f"{UNUSED}: exactly its {len(listed)} permissions and components gone, the other "
                    f"{len(ep)} Glu's")
    else:
        found[UNUSED] = None
        check(False, "permissions and components differ from Glu's beyond what any patch removes: "
                     f"gone {sorted(gone - listed)}, kept {sorted(listed - gone)}, added {sorted(added)}")

    print("[archive]")
    left_out = tuple(f"lib/{abi}/" for abi in stripped)
    stored = [i for i in zo.infolist() if i.compress_type == zipfile.ZIP_STORED
              and not i.filename.startswith(("META-INF/",) + left_out)]
    pmap = {i.filename: i for i in zp.infolist()}
    lost = [i.filename for i in stored if i.filename not in pmap]
    deflated = [i.filename for i in stored if i.filename in pmap and pmap[i.filename].compress_type != zipfile.ZIP_STORED]
    differ = [i.filename for i in stored if i.filename in pmap and i.filename != "resources.arsc"
              and zp.read(i.filename) != zo.read(i.filename)]
    check(not lost and not deflated, f"all {len(stored)} stored entries still stored" +
          (f" (lost {lost[:3]}, deflated {deflated[:3]})" if lost or deflated else ""))
    check(not differ, "stored entries other than resources.arsc byte-identical" + (f" (differ: {differ[:3]})" if differ else ""))
    # A manifest edit makes the patcher re-encode the resource table. The only difference
    # allowed is the PUBLIC flag the encoder puts on id resources; every id and value stays.
    table_o = run(aapt2, "dump", "resources", original).splitlines()
    table_p = run(aapt2, "dump", "resources", patched).splitlines()
    flagged = sum(1 for a, b in zip(table_o, table_p) if a != b and b == a + " PUBLIC" and "id/" in a)
    same = len(table_o) == len(table_p) and all(a == b or (b == a + " PUBLIC" and "id/" in a) for a, b in zip(table_o, table_p))
    check(same and len(table_o) > 100, f"resource table identical apart from PUBLIC on {flagged} id resources ({len(table_o)} lines)")
    dex = sorted(n for n in pmap if re.fullmatch(r"classes\d*\.dex", n))
    if dex == ["classes.dex"]:
        check(True, "single dex, so Android before 5.0 loads every class")
    else:
        warn(f"{len(dex)} dex files ({', '.join(dex)}): runs on Android 5.0 and later only; "
             "patch with --bytecode-mode=FULL for older versions")
    others = sorted(n for n in zo.namelist() if not n.startswith(("META-INF/",) + left_out) and n not in pmap)
    check(not others, "no original entry dropped" + (f" ({others[:3]})" if others else ""))

    print("[bytecode]")
    work = tempfile.mkdtemp(prefix="ckz-verify-")
    try:
        for apk, name in ((patched, "out"), (original, "original")):
            subprocess.run([tool("apktool"), "d", "-r", "-f", "-o", os.path.join(work, name), apk],
                           capture_output=True, check=True, stdin=subprocess.DEVNULL)
        out = os.path.join(work, "out")
        # apktool writes one tree per dex: smali/ for classes.dex, smali_classes2/ and on for the
        # rest. With more than one dex a class the patches left alone can sit in any of them.
        smali_trees = sorted(os.path.join(out, d) for d in os.listdir(out) if re.fullmatch(r"smali(_classes\d+)?", d))

        def smali_file(cls):
            return next((p for p in (os.path.join(t, *cls.split("/")) + ".smali" for t in smali_trees)
                         if os.path.exists(p)), None)

        def method(cls, name):
            path = smali_file(cls)
            if path is None:
                return ""
            text = io.open(path, encoding="utf-8").read()
            m = re.search(r"\.method[^\n]* %s\(.*?\.end method" % re.escape(name), text, re.S)
            return re.sub(r"^\s*\.(line|local|end local|param|prologue)\b.*$\n?", "", m.group(0), flags=re.M) if m else ""

        body = method("com/glu/platform/android/resdl/GluUtil", "findResourceFile")
        check("GluDownloadResMgr;->createDummyPrimaryResource" in body and "const/4 v0, 0x0" not in body,
              "findResourceFile creates file.big instead of returning null")
        body = method("com/glu/android/zombsniper/ZombSniper", "onCreate")
        first = [l.strip() for l in body.splitlines()[1:] if l.strip() and not l.strip().startswith(".")]
        check(first and first[0].startswith("invoke-static {p0}, Lapp/ckzombies/extension/ExternalStorage;->prepare"),
              "onCreate calls ExternalStorage.prepare first")
        # The extension is merged whole, so its sound classes are there even without "Smooth sound".
        for name in ("ExternalStorage", "SndCache", "ShimPlayer", "PoolPlayer", "SoundBudget"):
            check(smali_file(f"app/ckzombies/extension/{name}") is not None, f"extension class {name} merged into the dex")
        body = method("com/glu/platform/android/GluPlatformActivity", "InitialiseSoundEvent")
        lines = [l.strip() for l in body.splitlines() if l.strip()]
        plain_player = any(l.startswith("new-instance") and "Landroid/media/MediaPlayer;" in l for l in lines)
        found[SOUND] = any("SndCache;" in l or "ShimPlayer;" in l for l in lines)
        if found[SOUND]:
            check(any("SndCache;->get(" in l for l in lines[:4]), "InitialiseSoundEvent asks the cache first")
            check(any("ShimPlayer;-><init>" in l for l in lines), "it builds a ShimPlayer instead of a MediaPlayer")
            check(not plain_player, "no plain MediaPlayer is built any more")
            prepare = next((i for i, l in enumerate(lines) if "MediaPlayer;->prepare()" in l), None)
            check(prepare is not None and "SndCache;->put(" in lines[prepare + 1],
                  "the prepared player goes into the cache")
        else:
            check(plain_player, f"{SOUND} not applied: InitialiseSoundEvent is Glu's own, building a MediaPlayer")
        body = method("com/glu/android/tools/community/GluOpenFeint", "initialize")
        first = [l.strip() for l in body.splitlines()[1:] if l.strip() and not l.strip().startswith(".")]
        check(first and first[0] == "return-void", "GluOpenFeint.initialize returns before starting OpenFeint")
        for name in ("startPublisherContentRequest", "startPublisherOpenRequest"):
            body = method("com/glu/android/GluPlayHaven", name)
            first = [l.strip() for l in body.splitlines()[1:] if l.strip() and not l.strip().startswith(".")]
            check(first and first[0] == "return-void", f"GluPlayHaven.{name} returns before reading device info")
        body = method("com/glu/platform/gwallet/GWalletJNI", "GetContent")
        first = [l.strip() for l in body.splitlines()[1:] if l.strip() and not l.strip().startswith(".")][:4]
        check(first[:2] == ['const-string v0, ""', "const/4 v1, 0x0"] and "onHandleResponse" in first[2]
              and first[3] == "return-void", "GWalletJNI.GetContent answers the callback and returns")
        for cls, name in (("com/glu/android/iap/GluGoogleIAP", "bindToMarketBillingService"),
                          ("com/android/vending/licensing/LicenseChecker", "checkAccess")):
            lines = [l.strip() for l in method(cls, name).splitlines() if l.strip()]
            i = next((k for k, l in enumerate(lines) if "Landroid/content/Intent;-><init>(Ljava/lang/String;)V" in l), None)
            ok = i is not None and lines[i + 1].startswith('const-string') and '"com.android.vending"' in lines[i + 1] \
                and "Landroid/content/Intent;->setPackage" in lines[i + 2]
            check(ok, f"{name}: setPackage(\"com.android.vending\") right after the Intent is built")

        # The Java half of the dead servers patch; the native half was found above.
        init = method("com/glu/tools/tapjoy/TapjoyInterface", "initialize")
        connects = "Lcom/tapjoy/TapjoyConnect;->requestTapjoyConnect" in init
        getter = [l.strip() for l in method("com/tapjoy/TapjoyConnect", "getTapjoyConnectInstance").splitlines()[1:]
                  if l.strip() and not l.strip().startswith(".")][:2]
        quiet = getter[:1] == ["sget-object v0, Lcom/tapjoy/TapjoyConnect;->tapjoyConnectInstance:Lcom/tapjoy/TapjoyConnect;"] \
            and getter[1:2] == ["return-object v0"]
        tapjoy = True if init and not connects and quiet else False if connects and not quiet else None

        # Its OpenFeint half. A shell keeps a constructor exactly when it is not an interface and
        # its superclasses reach Object through other shells, the rule EmptyClasses.kt follows.
        shells = openfeint_shells(smali_trees)
        memo = {}
        def constructible(t):
            if t not in memo:
                flags, superclass, _ = shells[t]
                memo[t] = "interface" not in flags and (superclass == "Ljava/lang/Object;" or
                                                        (superclass in shells and constructible(superclass)))
            return memo[t]
        def shape(t):
            _, superclass, body = shells[t]
            constructor = [".method public constructor <init>()V", f"invoke-direct {{p0}}, {superclass}-><init>()V",
                           "return-void", ".end method"]
            return "empty" if body == [] else "constructor" if body == constructor else "code"
        shapes = {t: shape(t) for t in shells}
        emptied = [t for t, s in shapes.items() if s != "code"]
        expected = openfeint_count()
        # Glu's build carries no debug info, so three of its classes already look like shells;
        # "not applied" therefore means the classes decode exactly as in the original.
        untouched = shells == openfeint_shells([os.path.join(work, "original", "smali")])
        openfeint = True if len(shells) == expected and len(emptied) == expected else False if untouched else None
        if openfeint:
            wrong = [t for t in shells if (shapes[t] == "constructor") != constructible(t)]
            check(not wrong, f"all {expected} OpenFeint classes are empty shells, with a constructor exactly where "
                  "super() reaches Object" + (f" ({len(wrong)} wrong, e.g. {wrong[0]})" if wrong else ""))
            game = [("com/glu/android/tools/community/GluOpenFeint", "Lcom/openfeint/api/OpenFeintDelegate;"),
                    ("com/glu/android/tools/community/GluOpenFeint$1", "Lcom/openfeint/api/resource/Achievement$ListCB;")]
            for cls, parent in game:
                path = smali_file(cls)
                text = io.open(path, encoding="utf-8").read() if path else ""
                check(f".super {parent}" in text and shapes.get(parent) == "constructor",
                      f"{cls.rsplit('/', 1)[1]} still extends {parent}, which keeps its constructor")

        java = tapjoy if tapjoy is not None and tapjoy == openfeint else None
        native = found.get(DEAD)
        if java is None:
            check(False, f"{DEAD}: Java part partly applied (Tapjoy connect call: {connects}, quiet getter: {quiet}; "
                  f"OpenFeint: {'untouched' if untouched else f'{len(emptied)} of {len(shells)} classes shells, {expected} expected'})")
            found[DEAD] = None
        elif native is not None and native != java:
            check(False, f"{DEAD}: native part {'on' if native else 'off'}, Java part {'on' if java else 'off'}")
            found[DEAD] = None
        elif java:
            check(True, "TapjoyInterface.initialize no longer connects, and the instance getter logs nothing")
            check("TapjoyInterface;->usedActivity" in init, "TapjoyInterface.initialize still stores the activity")
    finally:
        shutil.rmtree(work, ignore_errors=True)

    print("[signature]")
    sig = run(tool("apksigner"), "verify", "-v", patched)
    check("Verified using v1 scheme (JAR signing): true" in sig, "v1 signature")
    check("Verified using v2 scheme (APK Signature Scheme v2): true" in sig, "v2 signature")
    if expect_libs:
        for name in (SOUND, UNUSED, DEAD):
            check(found.get(name), f"{name} applied, as --expect-libs means every patch is on")

    print("[patches found]")
    for name in ALL_PATCHES:
        print(f"  {name}: " + {True: "applied", False: "not applied", None: "unclear, see the failures above"}[found.get(name)])

    print(f"\n{'PASS' if not failures else 'FAIL'}: {failures} failed check(s)" + (f", {warnings} warning(s)" if warnings else ""))
    sys.exit(1 if failures else 0)


if __name__ == "__main__":
    main()
