"""Map the symbols of the iOS "123" and "#+=" pages to Gboard symbol softkey ids.

Usage: python -I tools/symbol_keys.py <decoded_res_dir>/xml/<symbol softkeys xml>
"""
import sys
import xml.etree.ElementTree as ET

WANT = list("1234567890-/:;()$&@\".,?!'[]{}#%^*+=_\\|~<>€£¥•")


def main(path):
    sys.stdout.reconfigure(encoding="utf-8")
    found = {}
    for sk in ET.parse(path).iter("softkey"):
        sid = (sk.get("id") or "").replace("@id/APKTOOL_RENAMED_", "")
        action = sk.find("action")
        data = (action.get("data") if action is not None else None) or sk.get("press_data") or sk.get("data")
        if data is None:
            continue
        data = data.replace("\\", "") if data != "\\\\" else "\\"
        if data in WANT and data not in found:
            found[data] = sid
    for ch in WANT:
        print(f"{ch}\t{found.get(ch, '-')}")


if __name__ == "__main__":
    main(sys.argv[1])
