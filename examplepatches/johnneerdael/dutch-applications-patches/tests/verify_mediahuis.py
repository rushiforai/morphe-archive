"""Independent original and emitted checks for the two Mediahuis One apps."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET

from mediahuis_contracts import (ADS, CONSENT, DISABLED, META, NAMES, ONBOARDING,
                                PERMISSIONS, PREMIUM, TARGETS, TRACKING)
from mediahuis_emitted import (code, digest, locals_count, remove_instructions,
                              run_boundary, source, verify_menu_subscription,
                              verify_onboarding, verify_rn)
from mediahuis_switches import switch_semantics
from mediahuis_sponsored_groups import GROUP_GATE, verify_sponsored_groups
from mediahuis_nyt_promo import verify_nyt_promo
from mediahuis_group_promotions import GROUP_COMPONENTS, verify_group_promotions
from mediahuis_shop_promo import verify_shop_promo

A = "{http://schemas.android.com/apk/res/android}"
SNAPSHOTS = json.loads(Path(__file__).with_name("mediahuis_originals.json").read_text())
SWITCHES = json.loads(Path(__file__).with_name("mediahuis_switches.json").read_text())


def verify(root, selected, app):
    assert selected <= NAMES, selected - NAMES
    enabled = {
        ADS: bool(selected & {ADS, TRACKING, CONSENT}),
        TRACKING: bool(selected & {TRACKING, CONSENT}),
        CONSENT: CONSENT in selected,
        PREMIUM: PREMIUM in selected,
    }
    original = SNAPSHOTS[app]
    verify_menu_subscription(root, enabled[PREMIUM], original["methods"])
    verify_sponsored_groups(root, enabled[ADS], original["methods"])
    nyt_fixtures = json.loads(Path(__file__).with_name("fixtures").joinpath("mediahuis_nyt_promo.json").read_text())["cases"]
    verify_nyt_promo(root, enabled[ADS], nyt_fixtures)
    verify_group_promotions(root, enabled[ADS], original["methods"])
    shop_fixtures = json.loads(Path(__file__).with_name("fixtures").joinpath("mediahuis_shop_promo.json").read_text())["cases"]
    verify_shop_promo(root, enabled[ADS], shop_fixtures)
    manifest = ET.parse(root / "AndroidManifest.xml")
    assert manifest.getroot().get("package") == original["package"]
    targets = {(cls, sig): (kind, control) for cls, sig, kind, control in TARGETS}
    switch_pins = {(row["class"], row["signature"]): row["switches"] for row in SWITCHES[app]}
    assert len(targets) == len(TARGETS), "Unique verifier targets"
    for row in original["methods"]:
        cls, sig, expected_hash = row
        if (cls, sig) in {GROUP_GATE, GROUP_COMPONENTS}:
            # The conditional prefix and the full retained tail are checked above.
            continue
        if (cls, sig) == ONBOARDING:
            verify_onboarding(root, enabled[CONSENT], expected_hash)
            if (cls, sig) in switch_pins:
                lines = code(root, cls, sig)
                index = next(i for i, line in enumerate(lines) if "->getOnboardingCompleted()Z" in line)
                removed = [(index - 2, 2)] if enabled[CONSENT] else []
                assert switch_semantics(root, cls, sig, removed) == switch_pins[(cls, sig)], (cls, sig, "original switch cases")
            continue
        lines = code(root, cls, sig)
        spec = targets.get((cls, sig))
        removed = []
        if spec and enabled[spec[1]]:
            kind, control = spec
            lengths = {"void": 1, "false": 2, "null": 2, "empty": 3, "ad": 2, "argfalse": 1, "gaid": 5}
            count = lengths[kind]
            prefix = lines[:count]
            if kind == "argfalse":
                assert prefix == ["const/4 r" + str(locals_count(root, cls, sig) + 1) + ", 0x0"], (cls, sig, "force actual boolean parameter false")
            else:
                try:
                    value = run_boundary(prefix)
                except AssertionError as error:
                    raise AssertionError((cls, sig, "emitted " + kind + " boundary", str(error))) from error
                if kind == "void":
                    assert value is None and prefix == ["return-void"], (cls, sig)
                elif kind == "false":
                    assert value == 0 and prefix[1].startswith("return "), (cls, sig)
                elif kind == "null":
                    assert value == 0 and prefix[1].startswith("return-object "), (cls, sig)
                elif kind == "empty":
                    assert value == [], (cls, sig, "typed empty partner list")
                elif kind == "ad":
                    assert value == {"singleton": DISABLED + "->INSTANCE:" + DISABLED}, (cls, sig, "real disabled Kaching result")
                elif kind == "gaid":
                    assert value == {"type": "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;", "id": "00000000-0000-0000-0000-000000000000", "limited": 1}, (cls, sig, "typed limited GAID without acquisition")
            lines = remove_instructions(lines, 0, count)
            removed = [(0, count)]
        assert digest(lines) == expected_hash, (cls, sig, "retained original body")
        if (cls, sig) in switch_pins:
            assert switch_semantics(root, cls, sig, removed) == switch_pins[(cls, sig)], (cls, sig, "original switch keys/case targets")
    for key, expected in META.items():
        values = [node.get(A + "value") for node in manifest.iter("meta-data") if node.get(A + "name") == key]
        assert values == ([expected] if enabled[TRACKING] else []), (key, values)
    permissions = {node.get(A + "name") for node in manifest.iter("uses-permission")}
    for permission in PERMISSIONS:
        assert (permission in permissions) == (not enabled[TRACKING]), permission
    # Keep push delivery and its Android permission independently of analytics.
    assert "com.google.android.c2dm.permission.RECEIVE" in permissions
    assert "android.permission.POST_NOTIFICATIONS" in permissions
    bundle = (root / "assets/index.android.bundle").read_text()
    verify_rn(bundle, enabled[TRACKING])
    if not enabled[TRACKING]:
        assert hashlib.sha256(bundle.encode()).hexdigest() == original["rn_sha256"], "Original complete RN bundle"
    else:
        # Recover the original whole asset, proving only these four mutations.
        replacements = [
            ("_e.transportFactory=function(t,n){return B;switch(t){", "_e.transportFactory=function(t,n){switch(t){"),
            ("function*(e){return;var r=(0,n.isEmulatorSync)(),i=r?", "function*(e){var r=(0,n.isEmulatorSync)(),i=r?"),
            ("enableTracking:function(){f=!1}", "enableTracking:function(){f=!0}"),
            ("yield Promise.resolve()", "yield t.track(null,'','',R)"),
        ]
        for patched, old in replacements:
            assert bundle.count(patched) == 1, patched
            bundle = bundle.replace(patched, old)
        assert hashlib.sha256(bundle.encode()).hexdigest() == original["rn_sha256"], "Preserve complete reader/application JS outside telemetry stops"
    verify_premium_original_helpers(root)
    print(f"PASS {app}: {len(original['methods'])} original/retained method contracts; " + (", ".join(sorted(selected)) or "no controls"))


def verify_premium_original_helpers(root):
    cls = "com/mediahuis/oneapps/cueappsdk/toclean/articles/pagebuilders/paywall/CueCustomPaywallBuilder"
    body = code(root, cls, "buildPaywall(Lcom/mediahuis/oneapps/cueappsdk/data/cue/models/pages/article/CueDetailPage;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;")
    getter = next(i for i, line in enumerate(body) if "->isPaywallPopOverProtected()Z" in line)
    result_reg = body[getter + 1].split()[1]
    assert body[getter + 2].startswith("if-nez " + result_reg + ", @")
    assert body[getter + 3].startswith("return-object "), "Custom card uses the real disabled-aware helper"
    helper = code(root, cls, "isPaywallPopOverProtected_delegate$lambda$0(Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/pagebuilders/paywall/CueCustomPaywallBuilder;)Z")
    disabled = next(i for i, line in enumerate(helper) if "->disabled:Z" in line)
    reg = helper[disabled].split()[1].rstrip(",")
    branch = next(line for line in helper[disabled + 1:] if line.startswith("if-nez " + reg + ", @"))
    target = int(branch.split("@")[1])
    assert helper[target].startswith("return "), "Disabled path returns false"
    returned = helper[target].split()[1]
    assert any(line == "const/4 " + returned + ", 0x0" for line in helper[:target])


def main(app):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("root", type=Path)
    parser.add_argument("-e", "--enable", action="append", default=[])
    args = parser.parse_args()
    verify(args.root, set(args.enable), app)
