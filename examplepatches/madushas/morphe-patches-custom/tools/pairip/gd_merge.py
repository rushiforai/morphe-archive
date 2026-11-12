#!/usr/bin/env python3
"""Merge the captured holder values into a `depairip_methods.tsv` for restorePairIpHolders.

Inputs : strings JSON {holder: [smali lines]}   (from gd_capture.py, heap dump of the
                                                 original signed app)
         methods JSON {holder: [[smali lines]]}  (from gd_methods.py, dex-derived
                                                 reflective-trampoline Method bindings)
Output : <type>\t<registerCount>\t<base64 of the full <clinit> body>
"""
import base64
import json
import sys


def main(strings_json, methods_json, out_tsv):
    strings = json.load(open(strings_json))
    methods = json.load(open(methods_json))

    holders = sorted(set(strings) | set(methods))
    lines = []
    ns = nm = 0
    for h in holders:
        body = []
        s = strings.get(h, [])
        body += s
        ns += len(s) // 2
        for snippet in methods.get(h, []):
            body += snippet
            nm += 1
        if not body:
            continue
        body.append('return-void')
        text = '\n'.join(body)
        lines.append(f"{h}\t5\t{base64.b64encode(text.encode()).decode()}")

    open(out_tsv, 'w').write('\n'.join(lines) + '\n')
    print(f"holders baked: {len(lines)} | string fields: {ns} | method bindings: {nm}")


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2], sys.argv[3])
