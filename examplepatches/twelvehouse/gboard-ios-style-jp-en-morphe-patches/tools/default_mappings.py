"""Resolve the key mappings of a Gboard keyboard definition for one environment.

Follows <include href> recursively and evaluates <if>/<else_if>/<else>/<ifnot> for a phone in
normal mode with the given language (default en-US); any other condition counts as false.
Prints, per state, view id -> softkey id -> the data/label of that softkey.

Usage: python -I tools/default_mappings.py <decoded_res_dir> <keyboard def xml id> [language]
"""
import os
import sys
import xml.etree.ElementTree as ET

ENV = {"device": "phone", "keyboard_mode": "normal", "variant": "qwerty", "orientation": "portrait"}
LANGUAGE = "en-US"


def attr_true(name, value):
    alternatives = [v.strip() for v in value.split("|")]
    if name == "language":
        return any(LANGUAGE == a or LANGUAGE.startswith(a + "-") for a in alternatives)
    if name in ENV:
        return ENV[name] in alternatives
    return False


def cond_true(el):
    attrs = dict(el.attrib)
    if not attrs:
        # <if> with <any_of>/<all_of> children is not modelled.
        return False
    return all(attr_true(k, v) for k, v in attrs.items())


def ref_to_file(res, ref):
    # @xml/NAME -> res/xml/NAME.xml
    return os.path.join(res, "xml", ref.split("/", 1)[1] + ".xml")


def walk(res, path, mappings, softkey_files, seen):
    if path in seen or not os.path.exists(path):
        return
    seen.add(path)
    root = ET.parse(path).getroot()

    def visit(el):
        chain_taken = None  # None: no open if-chain; True/False: whether a branch was taken
        for child in el:
            if child.tag == "if":
                chain_taken = cond_true(child)
                if chain_taken:
                    visit(child)
                continue
            if child.tag == "else_if":
                if chain_taken is False and cond_true(child):
                    chain_taken = True
                    visit(child)
                continue
            if child.tag == "else":
                if chain_taken is False:
                    visit(child)
                chain_taken = None
                continue
            if child.tag == "ifnot":
                if not cond_true(child):
                    visit(child)
                continue
            chain_taken = None
            if child.tag == "include" and child.get("href", "").startswith("@xml/"):
                walk(res, ref_to_file(res, child.get("href")), mappings, softkey_files, seen)
            elif child.tag == "softkeys" and child.get("href", "").startswith("@xml/"):
                softkey_files.append(ref_to_file(res, child.get("href")))
            elif child.tag == "key_mapping":
                state = child.get("state", "")
                for m in child.iter("mapping"):
                    mappings.setdefault(state, {})[m.get("view_id")] = m.get("key_id")
            else:
                visit(child)

    visit(root)


def softkey_text(res, files):
    out = {}
    pending = list(files)
    seen = set()
    while pending:
        path = pending.pop()
        if path in seen or not os.path.exists(path):
            continue
        seen.add(path)
        root = ET.parse(path).getroot()
        for inc in root.iter("include"):
            if inc.get("href", "").startswith("@xml/"):
                pending.append(ref_to_file(res, inc.get("href")))
        for sk in root.iter("softkey"):
            sid = sk.get("id")
            if not sid or sid in out:
                continue
            action = sk.find("action")
            label = sk.find("label")
            text = (action.get("data") if action is not None else None) or sk.get("press_data") \
                or (label.get("value") if label is not None else None) or sk.get("label_value") or "?"
            out[sid] = text
    return out


def main(res, def_id, language=None):
    global LANGUAGE
    if language:
        LANGUAGE = language
    sys.stdout.reconfigure(encoding="utf-8")
    mappings, softkey_files = {}, []
    walk(res, os.path.join(res, "xml", f"APKTOOL_RENAMED_{def_id}.xml"), mappings, softkey_files, set())
    texts = softkey_text(res, softkey_files)
    xml_dir = os.path.join(res, "xml")
    fallback = softkey_text(res, [os.path.join(xml_dir, f) for f in sorted(os.listdir(xml_dir))])
    texts = {**fallback, **texts}
    for state, views in mappings.items():
        print(f"== state={state or '(default)'}")
        for view, key in sorted(views.items()):
            short = lambda s: s.replace("@id/APKTOOL_RENAMED_", "").replace("@id/", "")
            print(f"  {short(view):28s} {short(key):12s} {texts.get(key, '?')}")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else None)
