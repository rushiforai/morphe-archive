#!/usr/bin/env python3
"""splice_entry.py — replace one entry in an APK zip, byte-preserving all others.

Used by the W-rung hybrid pipeline: the smali-rebuilt classes3.dex is spliced
into the C1 substrate; everything else (manifest, arsc, other dexes, resources)
keeps its original bytes and per-entry compression, exactly like the
v131_binary_patch zip rewrite.
"""
import argparse
import zipfile


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--src', required=True, help='substrate apk')
    ap.add_argument('--entry', required=True, help='entry name to replace')
    ap.add_argument('--file', required=True, help='replacement file')
    ap.add_argument('--out', required=True)
    args = ap.parse_args()

    data = open(args.file, 'rb').read()
    zin = zipfile.ZipFile(args.src)
    if args.entry not in zin.namelist():
        raise SystemExit(f'entry not in substrate: {args.entry}')
    zout = zipfile.ZipFile(args.out, 'w')
    replaced = False
    for info in zin.infolist():
        nm = info.filename
        zi = zipfile.ZipInfo(nm, date_time=info.date_time)
        zi.compress_type = info.compress_type
        zi.external_attr = info.external_attr
        if nm == args.entry:
            zout.writestr(zi, data)
            replaced = True
        else:
            zout.writestr(zi, zin.read(nm))
    zout.close()
    if not replaced:
        raise SystemExit('replacement did not happen')
    print(f'spliced {args.entry}: {len(data)} bytes -> {args.out}')


if __name__ == '__main__':
    main()
