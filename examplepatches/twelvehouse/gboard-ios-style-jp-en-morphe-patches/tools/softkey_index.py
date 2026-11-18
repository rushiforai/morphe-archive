"""Index Gboard softkey definitions from an apktool-decoded resource tree.

Usage:
  python -I tools/softkey_index.py <decoded_res_dir> key <id-hex> [...]   # dump softkey definitions
  python -I tools/softkey_index.py <decoded_res_dir> view <view-id-name>  # who maps keys to a view position
"""
import os
import re
import sys
import xml.etree.ElementTree as ET


def load(res):
    xml_dir = os.path.join(res, "xml")
    docs = {}
    for name in os.listdir(xml_dir):
        if not name.endswith(".xml"):
            continue
        path = os.path.join(xml_dir, name)
        try:
            docs[name] = ET.parse(path)
        except ET.ParseError:
            pass
    return docs


def strings(res):
    out = {}
    path = os.path.join(res, "values", "strings.xml")
    for el in ET.parse(path).getroot():
        out["@string/" + el.get("name")] = "".join(el.itertext())
    return out


def resolve(text, strs):
    return re.sub(r"@string/[A-Za-z0-9_]+", lambda m: repr(strs.get(m.group(0), m.group(0))), text)


def dump_keys(res, ids):
    docs = load(res)
    strs = strings(res)
    for key in ids:
        target = "@id/APKTOOL_RENAMED_" + key if key.startswith("0x") else "@id/" + key
        for name, tree in sorted(docs.items()):
            for el in tree.iter():
                if el.tag in ("softkey", "softkey_template") and el.get("id") == target:
                    print(f"===== {key} in {name} <{el.tag}>")
                    print(resolve(ET.tostring(el, encoding="unicode"), strs))


def dump_view(res, view):
    docs = load(res)
    target = "@id/" + view
    for name, tree in sorted(docs.items()):
        parents = {c: p for p in tree.iter() for c in p}
        for el in tree.iter("mapping"):
            if el.get("view_id") == target:
                chain = []
                p = parents.get(el)
                while p is not None and p.tag != "framework":
                    attrs = " ".join(f'{k}="{v}"' for k, v in p.attrib.items())
                    chain.append(f"<{p.tag} {attrs}>".replace(" >", ">"))
                    p = parents.get(p)
                print(f"{name}: key={el.get('key_id')}  ctx={' < '.join(chain)}")


if __name__ == "__main__":
    res_dir, mode = sys.argv[1], sys.argv[2]
    if mode == "key":
        dump_keys(res_dir, sys.argv[3:])
    elif mode == "view":
        dump_view(res_dir, sys.argv[3])
