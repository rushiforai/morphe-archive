"""Compare every KIJK method for any of its three independently selected controls."""
import argparse
import json
from pathlib import Path
from verify_kijk import verify, verify_payload
from npo_manifest import load_manifest
from kijk_mobile_manifest import verify as verify_manifest


def verify_selections(original, patched, ads=False, tracking=False, consent=False):
    # Skip consent screens depends on tracking, while ad removal stays optional.
    active = {'ads': ads, 'tracking': tracking or consent, 'consent': consent}
    root = Path(__file__).resolve().parent
    contracts = json.loads((root / 'kijk_mobile_contracts.json').read_text())
    contracts += json.loads((root / 'kijk_mobile_consent_contracts.json').read_text())
    selected = [dict(c, selection='tracking') for c in contracts if active[c['selection']]]
    verify(original, patched, tracking=True, contracts=selected)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--original', required=True, type=Path)
    parser.add_argument('--patched', required=True, type=Path)
    parser.add_argument('--ads', action='store_true')
    parser.add_argument('--tracking', action='store_true')
    parser.add_argument('--consent', action='store_true')
    parser.add_argument('-e', '--enable', action='append', choices=['Hide ads', 'Disable tracking', 'Skip consent screens'], default=[])
    parser.add_argument('--original-apk', type=Path)
    parser.add_argument('--patched-apk', type=Path)
    args = parser.parse_args()
    verify_selections(args.original, args.patched, args.ads or 'Hide ads' in args.enable,
                      args.tracking or 'Disable tracking' in args.enable,
                      args.consent or 'Skip consent screens' in args.enable)

    tracking = args.tracking or args.consent or bool({'Disable tracking', 'Skip consent screens'} & set(args.enable))
    verify_manifest(load_manifest(args.original), load_manifest(args.patched), tracking)
    if args.original_apk or args.patched_apk:
        assert args.original_apk and args.patched_apk, 'Provide both APK arguments'
        print(f'PASS: {verify_payload(args.original_apk, args.patched_apk)} original KIJK resource/asset/native payloads')
