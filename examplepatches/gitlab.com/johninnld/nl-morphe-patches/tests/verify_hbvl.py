"""Verify HBVL 22.0.0 using the independently identical Mediahuis One contracts.

All 1,181 pinned Nieuwsblad method bodies and the complete RN bundle matched
HBVL's original shipped APK. Reuse those fixed pins rather than duplicate them.
"""
import argparse
import json
from pathlib import Path

from mediahuis_contracts import ADS, CONSENT, TRACKING
from mediahuis_shop_promo import verify_shop_promo
from verify_mediahuis import SNAPSHOTS, SWITCHES, verify

SNAPSHOTS["hbvl"] = {**SNAPSHOTS["nieuwsblad"], "package": "be.concentra.hbvl.MediaApp"}
SWITCHES["hbvl"] = SWITCHES["nieuwsblad"]


def hbvl_shop_fixtures():
    # The same CMS/renderer contract with HBVL's shipped domain_host_4. These
    # are synthetic own-brand adaptations, not captured HBVL server widgets.
    path = Path(__file__).with_name("fixtures") / "mediahuis_shop_promo.json"
    text = path.read_text().replace("interactief.nieuwsblad.be", "interactief.hbvl.be")
    return json.loads(text)["cases"]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", type=Path)
    parser.add_argument("-e", "--enable", action="append", default=[])
    args = parser.parse_args()
    selected = set(args.enable)
    verify(args.root, selected, "hbvl")
    verify_shop_promo(args.root, bool(selected & {ADS, TRACKING, CONSENT}), hbvl_shop_fixtures())
    print("PASS HBVL own-brand Shop host and near-match/editorial fixtures")


if __name__ == "__main__":
    main()
