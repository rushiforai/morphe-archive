"""Execute automatic/manual OSB consent paths in actual native instructions."""
import argparse
import hashlib
from pathlib import Path
from zipfile import ZipFile
from tvgids_consent_native_vm import verify_consent_callers, verify_consent_mutations
from tvgids_native_contracts import ORIGINAL_SHA, NATIVE_SHA


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--original', required=True, type=Path)
    parser.add_argument('--patched', type=Path)
    parser.add_argument('--consent-skipped', action='store_true')
    parser.add_argument('--mutations', action='store_true')
    args = parser.parse_args()
    assert hashlib.sha256(args.original.read_bytes()).hexdigest() == ORIGINAL_SHA
    with ZipFile(args.original) as before, ZipFile(args.patched or args.original) as after:
        for abi in NATIVE_SHA:
            name = f'lib/{abi}/libapp.so'
            n = verify_consent_callers(abi, before.read(name), after.read(name), args.consent_skipped)
            print(f'PASS {abi}: {n} original consent/cave/manual navigation assertions')
            if args.mutations:
                assert args.consent_skipped, 'Mutation checks require a consent-patched output'
                mutations = verify_consent_mutations(abi, before.read(name), after.read(name))
                print(f'PASS {abi}: {mutations} rejected consent mutations')


if __name__ == '__main__':
    main()
