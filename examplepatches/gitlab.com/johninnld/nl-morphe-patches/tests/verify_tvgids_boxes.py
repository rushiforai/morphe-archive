"""Verify exact native ad ownership and execute removed box-placement entries.

This intermediate verifier does not certify the complete Hide ads control.
"""
import argparse
import hashlib
from pathlib import Path
import zipfile
from tvgids_ads_vm import (verify_empty_boxes, run_sliver_extents, run_absent_ad_future,
                           run_home_factory, run_home_adslot)
from tvgids_native_contracts import verify_ad_output, ORIGINAL_SHA, NATIVE_SHA




def verify_native_ad_paths(original_apk, patched_apk, *, tracking=False, consent=False):
    assert hashlib.sha256(original_apk.read_bytes()).hexdigest() == ORIGINAL_SHA
    assertions = 0
    with zipfile.ZipFile(original_apk) as original, zipfile.ZipFile(patched_apk) as patched:
        for abi in NATIVE_SHA:
            name = f'lib/{abi}/libapp.so'
            before, after = original.read(name), patched.read(name)
            verify_ad_output(abi, before, after, NATIVE_SHA[abi], tracking=tracking, consent=consent)
            n = verify_empty_boxes(abi, before, after)
            for extents in ((250, 24, 12, 300), (0, 0, 0, 0), (float('inf'), 1, 2, 3),
                            (float('nan'), 12, -1, 800)):
                assert run_sliver_extents(abi, before, after, extents) == (0, 0, 0, 0), 'Ad sliver retained space'
                n += 5
            for cached in (False, True):
                n += run_absent_ad_future(abi, before, after, cached)
                n += run_home_adslot(abi, before, after, cached)
            for branded in (False, True):
                n += run_home_factory(abi, before, after, branded)
            assertions += n
            print(f'PASS {abi}: native ownership and {n} real box-placement assertions')
    print(f'SUCCESS TVgids intermediate native ad assertions={assertions}')
    return assertions


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--original', required=True, type=Path)
    parser.add_argument('--patched', required=True, type=Path)
    args = parser.parse_args()
    verify_native_ad_paths(args.original, args.patched)


if __name__ == '__main__':
    main()
