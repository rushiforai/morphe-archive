#!/usr/bin/env python3
"""Re-derive the PaywallScreen byte pattern for SkipOnboardingPaywallPatch after a
Waypoint update. Requires: pip install hermes-dec

Usage: python derive-paywall-pattern.py <path/to/index.android.bundle>

Prints the pattern[] and notes for the Kotlin patch, derived semantically:
string table -> 'completeOnboarding' sid -> selector function -> CreateClosure site.
"""
import sys

SELECTOR_STRING = "completeOnboarding"

def main(path):
    from hermes_dec.parsers import hbc_file_parser as fp

    f = open(path, "rb")
    r = fp.HBCReader()
    r.read_whole_file(f)
    data = open(path, "rb").read()
    strings = r.strings

    sid = strings.index(SELECTOR_STRING)

    # selector: LoadParam r0,1; GetById r0,r0,<sid>; Ret r0
    needle = bytes([0x6c, 0x00, 0x01, 0x37, 0x00, 0x00, 0x01]) + \
        sid.to_bytes(2, "little") + bytes([0x5c, 0x00])
    hits = [i for i in range(len(data) - 11) if data[i:i + 11] == needle]
    if len(hits) != 1:
        sys.exit(f"selector matches: {len(hits)} (expected 1) - layout changed?")

    off2fid = {h.offset: i for i, h in enumerate(r.function_headers)}
    fid = off2fid[hits[0]]

    # CreateClosure(dst, env, fid16) followed by Call2 + StoreToEnvironment(env match)
    fb = fid.to_bytes(2, "little")
    sites = []
    i = 0
    while True:
        i = data.find(fb, i + 1)
        if i < 0:
            break
        if i >= 3 and data[i - 3] == 0x64:
            c = i - 3
            w = data[c:c + 16]
            if w[5] == 0x53 and w[10] == 0x2a and w[2] == w[11]:
                sites.append(c)
    if len(sites) != 1:
        sys.exit(f"CreateClosure sites: {len(sites)} (expected 1)")

    c = sites[0]
    pattern = data[c:c + 24]

    # handleDone register: first CreateClosure in the ENCLOSING function
    enclosing = max(h.offset for h in r.function_headers if h.offset <= c)
    head = data[enclosing:enclosing + 16]
    hd_off = head.find(bytes([0x64]))
    if hd_off < 0:
        sys.exit("no CreateClosure at function head - layout changed")
    handle_reg = head[hd_off + 1]

    print("pattern = byteArrayOf(")
    print("    " + ", ".join(f"0x{b:02x}" for b in pattern[:12]) + ",")
    print("    " + ", ".join(f"0x{b:02x}" for b in pattern[12:]) + ",")
    print(")")
    print(f"replacement = byteArrayOf(0x76, 0x03, 0x51, 0x00, 0x{handle_reg:02x}, 0x03, 0x77, 0x00, 0x5c, 0x00)")
    print(f"# patch site (pattern start + 14) = 0x{c + 14:x}; handleDone reg = r{handle_reg}")

if __name__ == "__main__":
    main(sys.argv[1])
