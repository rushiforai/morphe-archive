#!/usr/bin/env python3
"""Clipboard pinned-clip reorder end-to-end check (emulator only).

Flow: open a text field, copy three distinct clips, open the keyboard
clipboard, pin all three, then:
  1. hold still on a pinned clip   -> stock Pin/Delete menu must appear
  2. hold, then move to another row -> menu must NOT stay open, order changes
  3. close and reopen clipboard     -> new pinned order persists
  4. no FATAL/ANR for the package in logcat
Every step saves a screenshot and a UI dump to clip-artifacts/.
Exit code 0 = all checks passed; 1 = a check failed; 2 = could not drive UI.
"""
import os, re, subprocess, sys, time, json
import xml.etree.ElementTree as ET

PKG = os.environ.get("PACKAGE_NAME", "com.aidev2024.ramblerbangla")
OUT = "clip-artifacts"
os.makedirs(OUT, exist_ok=True)
STEP = [0]
RESULTS = {}
CLIPS = ["alphaclip", "bravoclip", "charlieclip"]


def log(*a):
    msg = " ".join(str(x) for x in a)
    print(msg, flush=True)
    with open(os.path.join(OUT, "driver.log"), "a") as f:
        f.write(msg + "\n")


def sh(cmd, check=False, timeout=60):
    r = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=timeout)
    if check and r.returncode != 0:
        log("CMD FAIL", cmd, r.stdout, r.stderr)
    return r.stdout


def adb(args, timeout=60):
    return sh("adb " + args, timeout=timeout)


def snap(name):
    STEP[0] += 1
    base = os.path.join(OUT, "%02d-%s" % (STEP[0], name))
    sh("adb exec-out screencap -p > '%s.png'" % base)
    xml = ""
    for flag in ("--windows ", ""):
        adb("shell rm -f /sdcard/d.xml")
        adb("shell uiautomator dump %s/sdcard/d.xml" % flag)
        xml = adb("exec-out cat /sdcard/d.xml")
        if "<hierarchy" in xml:
            break
    with open(base + ".xml", "w") as f:
        f.write(xml)
    return xml


def nodes(xml):
    out = []
    if "<hierarchy" not in xml:
        return out
    xml = xml[xml.index("<"):]
    try:
        root = ET.fromstring(xml[: xml.rindex(">") + 1])
    except ET.ParseError as e:
        log("xml parse error", e)
        return out
    for n in root.iter("node"):
        b = re.findall(r"\d+", n.get("bounds", ""))
        if len(b) != 4:
            continue
        x1, y1, x2, y2 = map(int, b)
        out.append({"text": n.get("text", ""), "desc": n.get("content-desc", ""),
                    "cls": n.get("class", ""), "pkg": n.get("package", ""),
                    "res": n.get("resource-id", ""), "focused": n.get("focused") == "true",
                    "b": (x1, y1, x2, y2), "cx": (x1 + x2) // 2, "cy": (y1 + y2) // 2})
    return out


def find(ns, pat, fields=("text", "desc"), pkg=None):
    rx = re.compile(pat, re.I)
    for n in ns:
        if pkg and n["pkg"] != pkg:
            continue
        if any(rx.search(n[f] or "") for f in fields):
            return n
    return None


def tap(x, y):
    adb("shell input tap %d %d" % (x, y))
    time.sleep(1.0)


def hold(x, y, secs, to=None, steps=8):
    adb("shell input motionevent DOWN %d %d" % (x, y))
    time.sleep(secs)
    if to:
        tx, ty = to
        for i in range(1, steps + 1):
            adb("shell input motionevent MOVE %d %d" % (x + (tx - x) * i // steps, y + (ty - y) * i // steps))
            time.sleep(0.08)
        time.sleep(0.4)
    adb("shell input motionevent UP %d %d" % (to or (x, y)))
    time.sleep(1.2)


def fail(code, why):
    log("RESULT FAIL:", why)
    RESULTS["failure"] = why
    finish(code)


def finish(code):
    sh("adb logcat -d -v threadtime > %s/logcat.txt" % OUT)
    lc = open(os.path.join(OUT, "logcat.txt"), errors="replace").read()
    fatal = re.search(r"FATAL EXCEPTION[^\n]*\n[^\n]*Process: " + re.escape(PKG), lc)
    anr = ("ANR in " + PKG) in lc
    RESULTS["fatal"] = bool(fatal)
    RESULTS["anr"] = anr
    if (fatal or anr) and code == 0:
        code = 1
        RESULTS["failure"] = "fatal/anr in logcat"
    RESULTS["exit"] = code
    with open(os.path.join(OUT, "results.json"), "w") as f:
        json.dump(RESULTS, f, indent=2)
    log("RESULTS", json.dumps(RESULTS))
    # Public run annotations: results and app debug lines are readable without downloading the artifact.
    print("::notice title=clipboard-e2e results::" + json.dumps(RESULTS).replace("%", "%25"), flush=True)
    dbg = [l[31:].strip() for l in lc.splitlines() if " RamblerClip: " in l][-8:]
    for l in dbg:
        print("::notice title=RamblerClip::" + l[:400].replace("%", "%25"), flush=True)
    sys.exit(code)


def ime_nodes():
    return [n for n in nodes(snap("ime")) if n["pkg"] == PKG]


def open_field():
    # Contacts "Create contact" form: stable on google_apis images; can take a while on first launch.
    adb("shell am start -W -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact")
    for attempt in range(12):
        time.sleep(3)
        ns = nodes(snap("field"))
        anr = find(ns, r"isn't responding")
        if anr:
            # emulator boot flake (usually Pixel Launcher): wait it out, then retry the form
            w = find(ns, r"^wait$", fields=("text",))
            log("system ANR dialog:", anr["text"])
            if w:
                tap(w["cx"], w["cy"])
            adb("shell am start -W -a android.intent.action.INSERT -t vnd.android.cursor.dir/contact")
            continue
        edits = [n for n in ns if n["cls"].endswith("EditText") and n["pkg"] != PKG]
        log("field attempt", attempt, "edits", len(edits))
        if edits:
            e = find(edits, r"^first name$", fields=("text",)) or edits[0]
            tap(e["cx"], e["cy"])
            time.sleep(1.5)
            return e
    return None

def open_clipboard(field):
    tap(field["cx"], field["cy"])
    time.sleep(1.0)
    ns = ime_nodes()
    if not ns:
        fail(2, "IME window not visible in UI dump")
    if find(ns, r"^hide clipboard$", pkg=PKG):
        return ns
    clip = find(ns, r"^clipboard$", pkg=PKG)
    if not clip:
        more = find(ns, r"open features menu", pkg=PKG)
        if more:
            tap(more["cx"], more["cy"])
            ns = ime_nodes()
            clip = find(ns, r"^clipboard$", pkg=PKG)
    if not clip:
        fail(2, "clipboard entry point not found")
    tap(clip["cx"], clip["cy"])
    return ime_nodes()


def main():
    ime = ""
    for attempt in range(20):  # package manager / IMMS can lag right after boot + install
        ime = sh("adb shell ime list -a -s | tr -d '\\r' | grep -m1 '^%s/'" % PKG).strip()
        if ime:
            break
        time.sleep(3)
    if not ime:
        fail(2, "IME not registered")
    adb("shell ime enable " + ime)
    adb("shell ime set " + ime)
    adb("logcat -c")
    field = open_field()
    if not field:
        fail(2, "no text field found")
    # Clipboard must be on before copying, or copies are not saved.
    ns = open_clipboard(field)
    on = find(ns, r"^turn on clipboard$", fields=("text",), pkg=PKG) or find(ns, r"turn on clipboard", pkg=PKG)
    if on:
        tap(on["cx"], on["cy"])
        RESULTS["clipboard_enabled_by_driver"] = True
        ns = ime_nodes()
    hide = find(ns, r"^hide clipboard$", pkg=PKG)
    if hide:
        tap(hide["cx"], hide["cy"])
    # Seed clips: type, select-all, cut (hardware key combos reach the focused field).
    for c in CLIPS:
        adb("shell input text " + c)
        time.sleep(0.5)
        adb("shell input keycombination 113 29")  # ctrl+A
        time.sleep(0.4)
        adb("shell input keycombination 113 52")  # ctrl+X
        time.sleep(1.5)
    snap("after-seed")
    ns = open_clipboard(field)
    if find(ns, r"turn on clipboard", pkg=PKG):
        fail(2, "clipboard still off after enabling")
    for c in CLIPS:
        if not find(ns, "^" + c + "$", pkg=PKG):
            log("clip missing", c)
    present = [c for c in CLIPS if find(ns, "^" + c + "$", pkg=PKG)]
    RESULTS["clips_seen"] = present
    if len(present) < 3:
        fail(2, "not all seeded clips visible in clipboard")
    # Pin each via stock long-press menu.
    for c in CLIPS:
        n = find(ime_nodes(), "^" + c + "$", pkg=PKG)
        hold(n["cx"], n["cy"], 1.2)
        m = find(ime_nodes(), r"^pin$", pkg=PKG)
        if not m:
            fail(2, "Pin menu item not found for " + c)
        tap(m["cx"], m["cy"])
    order = pinned_order()
    RESULTS["pinned_order_initial"] = order
    if len(order) != 3:
        fail(2, "expected 3 pinned clips, saw %r" % order)
    # Check 1: hold still shows stock menu.
    n = find(ime_nodes(), "^" + order[0] + "$", pkg=PKG)
    hold(n["cx"], n["cy"], 1.2)
    ns = ime_nodes()
    menu = bool(find(ns, r"^(unpin|delete)$", pkg=PKG))
    RESULTS["hold_still_menu"] = menu
    if not menu:
        fail(1, "hold-still did not show stock menu")
    # Dismiss the stock menu by tapping its scrim away from the menu items
    # (the Back key would close the whole keyboard).
    ns = ime_nodes()
    scrim = find(ns, r"hide detailed information", pkg=PKG)
    if scrim:
        tap(scrim["b"][0] + 200, scrim["b"][3] - 150)
    if find(ime_nodes(), r"^(unpin|delete)$", pkg=PKG):
        fail(2, "could not dismiss stock menu after hold-still")
    # Check 2: hold then move first pinned clip onto the last pinned clip.
    ns = ime_nodes()
    a = find(ns, "^" + order[0] + "$", pkg=PKG)
    z = find(ns, "^" + order[-1] + "$", pkg=PKG)
    if not a or not z:
        fail(2, "pinned clips not visible before drag")
    hold(a["cx"], a["cy"], 0.9, to=(z["cx"], z["cy"] + 5), steps=12)
    ns = ime_nodes()
    RESULTS["menu_after_drag"] = bool(find(ns, r"^(unpin|delete)$", pkg=PKG))
    new = pinned_order(ns)
    RESULTS["pinned_order_after_drag"] = new
    if RESULTS["menu_after_drag"]:
        fail(1, "stock menu stayed open after hold+move")
    if new == order or sorted(new) != sorted(order):
        fail(1, "order did not change after drag: %r -> %r" % (order, new))
    # Check 3: persistence across close/reopen.
    adb("shell input keyevent 4")
    time.sleep(1.5)
    open_clipboard(field)
    again = pinned_order()
    RESULTS["pinned_order_after_reopen"] = again
    if again != new:
        fail(1, "order not persisted: %r -> %r" % (new, again))
    log("RESULT PASS")
    finish(0)


def pinned_order(ns=None):
    ns = ns if ns is not None else ime_nodes()
    hits = [n for n in ns if n["pkg"] == PKG and (n["text"] in CLIPS or n["desc"] in CLIPS)]
    for n in hits:
        n["text"] = n["text"] if n["text"] in CLIPS else n["desc"]
    # Staggered grid: reading order = row (top) then column (left).
    hits.sort(key=lambda n: (n["b"][1] // 40, n["b"][0]))
    seen = []
    for n in hits:
        if n["text"] not in seen:
            seen.append(n["text"])
    return seen


if __name__ == "__main__":
    try:
        main()
    except SystemExit:
        raise
    except Exception as e:
        import traceback
        log("DRIVER EXCEPTION", traceback.format_exc())
        RESULTS["failure"] = "driver exception: %r" % e
        finish(2)
