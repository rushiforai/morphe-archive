#!/usr/bin/env python3
"""Turns the Waze Mod's smali hooks into data the Morphe patch can apply.

  python tools/waze_hooks_gen.py <stock_smali> <modded_smali> <out hooks.txt>

<stock_smali> is a decode of the stock Waze 5.27.90.900 base.apk, <modded_smali> the decoded Mod (ae_clean/smali),
both with the classesN directories. Every class that differs is compared method by method. A method whose only
change is inserted lines becomes one entry per insert: the stock instruction index, the opcode expected there (the
patch refuses to run on a build where it is different), the lines, the labels of the stock method they jump to and
the catch ranges. Anything else (register count changes, removed lines, added methods or fields) is printed and left
to the patch's hand-written code.

Only the lines the Mod added are written out, never a line of Waze's code (an opcode name is the only stock text).
"""
import difflib
import json
import os
import re
import sys

BLOCKS = {".annotation": ".end annotation", ".packed-switch": ".end packed-switch",
          ".sparse-switch": ".end sparse-switch", ".array-data": ".end array-data",
          ".param": ".end param", ".subannotation": ".end subannotation"}


def find(root, cls):
    for d in sorted(os.listdir(root)):
        p = os.path.join(root, d, cls.replace("/", os.sep))
        if os.path.exists(p):
            return p
    return None


def split_methods(text):
    parts = re.split(r"(?m)^(?=\.method )", text)
    methods = {}
    for part in parts[1:]:
        methods[part.split("\n", 1)[0][len(".method "):].strip()] = part
    return parts[0], methods


def code_lines(method):
    """The method's lines without .line markers and comments, stripped."""
    return [l.strip() for l in method.split("\n") if l.strip() and not l.strip().startswith((".line", "#"))]


def index_stock(lines):
    """For every line: the number of instructions before it; and label name -> index of the instruction it marks."""
    before, labels, count, skip = [], {}, 0, None
    for l in lines:
        before.append(count)
        if skip:
            if l.startswith(skip):
                skip = None
            continue
        head = l.split(" ", 1)[0]
        if head in BLOCKS:
            skip = BLOCKS[head]
            continue
        if l.startswith(":"):
            labels[l] = count
        elif not l.startswith("."):
            count += 1
    return before, labels


def snippet_info(lines):
    """Strips .catch lines out of an insert; returns (lines, defined label offsets, catches)."""
    body, offsets, catches, count = [], {}, [], 0
    for l in lines:
        if l.startswith(".catch"):
            m = re.match(r"\.catch(?:all)?\s*(\S*)\s*\{(:\S+)\s*\.\.\s*(:\S+)\}\s*(:\S+)", l)
            catches.append((m.group(1) or "", m.group(2), m.group(3), m.group(4)))
            continue
        body.append(l)
        if l.startswith(":"):
            offsets[l] = count
        elif not l.startswith("."):
            count += 1
    return body, offsets, catches, count


def signature(header):
    m = re.search(r"([\w$<>]+\(.*)$", header)
    return m.group(1)


def main():
    stock, mod, out = sys.argv[1:4]
    skipped, entries, total_inserts = [], [], 0
    changed = []
    for d in sorted(os.listdir(mod)):
        pass
    seen = {}
    for droot in sorted(os.listdir(mod)):
        base = os.path.join(mod, droot)
        for d, _, fs in os.walk(base):
            rel_dir = os.path.relpath(d, base).replace("\\", "/")
            if rel_dir.startswith("com/waze/gw") or rel_dir.startswith("com/kaibatech"):
                continue
            for f in fs:
                if f.endswith(".smali"):
                    seen[rel_dir + "/" + f] = os.path.join(d, f)
    for cls, mod_path in sorted(seen.items()):
        stock_path = find(stock, cls)
        if not stock_path:
            skipped.append((cls, "", "class missing in stock"))
            continue
        a_text = open(stock_path, encoding="utf-8").read().replace("\r\n", "\n")
        b_text = open(mod_path, encoding="utf-8").read().replace("\r\n", "\n")
        if a_text == b_text:
            continue
        head_a, ms = split_methods(a_text)
        head_b, mm = split_methods(b_text)
        if head_a != head_b:
            skipped.append((cls, "<fields>", "class header changed"))
        for header, body in mm.items():
            if header not in ms:
                skipped.append((cls, header, "added method"))
                continue
            if body == ms[header]:
                continue
            a, b = code_lines(ms[header]), code_lines(body)
            before, labels = index_stock(a)
            ops = [o for o in difflib.SequenceMatcher(None, a, b, autojunk=False).get_opcodes() if o[0] != "equal"]
            if any(o[0] != "insert" for o in ops):
                skipped.append((cls, header, "changes more than inserts: " + ",".join(o[0] for o in ops)))
                continue
            if not ops:
                continue
            # An insert that is only labels (a jump target the other inserts of the method use) is not an insert:
            # the others jump to the stock instruction behind it.
            label_only = {}
            for _, i1, _, j1, j2 in ops:
                if b[j1:j2] and all(l.startswith(":") for l in b[j1:j2]) and i1 < len(a):
                    for l in b[j1:j2]:
                        label_only[l] = before[i1]
            inserts = []
            for _, i1, _, j1, j2 in ops:
                if i1 < len(a) and b[j1:j2] and all(l in label_only for l in b[j1:j2]):
                    continue
                if i1 >= len(a):
                    skipped.append((cls, header, "insert at end of method"))
                    inserts = None
                    break
                nxt = a[i1]
                if nxt.startswith(":"):                       # a label: the instruction it marks is next
                    nxt_index = before[i1]
                else:
                    nxt_index = before[i1]
                instr = [l for l in a[i1:] if not l.startswith((".", ":"))]
                if not instr:
                    skipped.append((cls, header, "insert with no stock instruction after it"))
                    inserts = None
                    break
                prev = a[i1 - 1] if i1 > 0 else ""
                body_lines, offsets, catches, count = snippet_info(b[j1:j2])
                defined = set(offsets)
                # a label operand follows a space, comma or brace; the ':' of a field spec (a:Lx;) follows a name
                refs = {":" + n for n in re.findall(r"(?:^|[\s,{]):([A-Za-z_]\w*)",
                                                    "\n".join(l for l in body_lines if not l.startswith(":")))}
                external = {}
                for ref in sorted(refs - {x for x in defined}):
                    if ref in labels:
                        external[ref] = labels[ref]
                    elif ref in label_only:
                        external[ref] = label_only[ref]
                    else:
                        external = None
                        skipped.append((cls, header, "label %s is not in the stock method" % ref))
                        break
                if external is None:
                    inserts = None
                    break
                inserts.append(dict(index=nxt_index, opcode=instr[0].split(" ", 1)[0], at_label=prev.startswith(":"),
                                    lines=body_lines, external=external, catches=catches, offsets=offsets, count=count))
            if inserts is None:
                continue
            entries.append((cls[:-6], signature(header), inserts))
            total_inserts += len(inserts)
    with open(out, "w", encoding="utf-8", newline="\n") as w:
        w.write("# Generated by tools/waze_hooks_gen.py from the Waze Mod's smali; do not edit by hand.\n")
        for cls, sig, inserts in entries:
            w.write("@method %s %s\n" % (cls, sig))
            for ins in inserts:
                w.write("@insert %d %s %d %d\n" % (ins["index"], ins["opcode"], 1 if ins["at_label"] else 0, ins["count"]))
                for name, idx in ins["external"].items():
                    w.write("@external %s %d\n" % (name, idx))
                for t, s, e, h in ins["catches"]:
                    w.write("@catch %s %d %d %d\n" % (t or "-", ins["offsets"][s], ins["offsets"][e], ins["offsets"][h]))
                for l in ins["lines"]:
                    w.write(l + "\n")
                w.write("@end\n")
    print("methods:", len(entries), "inserts:", total_inserts)
    print("left to hand-written code:")
    for cls, header, why in skipped:
        print("  %s  %s  -- %s" % (cls, header[:90], why))


if __name__ == "__main__":
    main()
