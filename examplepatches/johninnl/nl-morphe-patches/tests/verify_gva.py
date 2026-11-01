"""Verify GVA 22.0.0 against its independently inspected Mediahuis contracts.

All 1,181 original method bodies, three switch maps and the complete Twipe
bundle matched the sibling baseline before the GVA snapshot was recorded.
"""
import argparse
import json
from pathlib import Path

from mediahuis_contracts import ADS, CONSENT, TRACKING
from mediahuis_shop_promo import verify_shop_promo
from verify_mediahuis import SNAPSHOTS, SWITCHES, verify

# GVA base.apk SHA-256:
# 25ebec0cd26fc16375907b5d78e9607fd9faac03a1492d1e0e9ed067d1b136d4
# All method bodies, switch maps and the full reader asset were compared to
# the pristine publisher APK before reusing these identical baseline pins.
SNAPSHOTS["gva"] = {**SNAPSHOTS["nieuwsblad"], "package": "be.concentra.gva.MediaApp"}
SWITCHES["gva"] = SWITCHES["nieuwsblad"]


def gva_shop_fixtures():
    # Synthetic adaptations to GVA's shipped domain_host_4; these do not claim
    # to be captured publisher server widgets.
    path = Path(__file__).with_name("fixtures") / "mediahuis_shop_promo.json"
    text = path.read_text().replace("interactief.nieuwsblad.be", "interactief.gva.be")
    return json.loads(text)["cases"]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", type=Path)
    parser.add_argument("-e", "--enable", action="append", default=[])
    args = parser.parse_args()
    selected = set(args.enable)
    verify(args.root, selected, "gva")
    verify_shop_promo(args.root, bool(selected & {ADS, TRACKING, CONSENT}), gva_shop_fixtures())
    print("PASS GVA own-brand Shop host and near-match/editorial fixtures")


if __name__ == "__main__":
    main()
