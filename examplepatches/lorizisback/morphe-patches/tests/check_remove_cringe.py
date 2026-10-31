#!/usr/bin/env python3
"""Validate the curated copy against the supplied Curve 5.63.0 resources."""
import json
import re
import sys
import xml.etree.ElementTree as ET
from pathlib import Path

root = Path(__file__).resolve().parents[1]
resources = Path(sys.argv[1]) if len(sys.argv) > 1 else root / "build/curve-5.63.0/jadx/resources/res"
catalog = json.loads((root / "patches/src/main/resources/curve/remove_cringe.json").read_text())
locales = {"en": "values", "de": "values-de-rDE", "es": "values-es-rES", "fr": "values-fr-rFR",
           "it": "values-it-rIT", "lt": "values-lt-rLT", "nb": "values-nb-rNO"}
assert set(catalog["strings"]) == set(locales) == set(catalog["titles"])
expected_keys = set(catalog["strings"]["en"])
protected = ("Go Back in Time", "Magic link", "magic link", "Fronted", "Flex")
for language, directory in locales.items():
    originals = {e.get("name"): "".join(e.itertext()).replace(r"\n", "\n").replace(r"\'", "'")
                 for e in ET.parse(resources / directory / "strings.xml").getroot()}
    strings = catalog["strings"][language]
    assert set(strings) == expected_keys, language
    for key, replacement in strings.items():
        assert isinstance(replacement, str) and replacement.strip(), (language, key)
        if key.startswith("morphe_"):
            continue
        original = originals[key]
        assert not re.search(r"gbit|go_back_in_time|magic_link|fronted|flex", key), key
        for term in protected:
            assert original.count(term) == replacement.count(term), (language, key, term)
        assert re.findall(r"%(?:\d+\$)?[sd]", original) == re.findall(r"%(?:\d+\$)?[sd]", replacement), (language, key)
    original_tail = "\n\n".join(originals["killer_fx_cashback_description"].split("\n\n")[-2:])
    assert strings["killer_fx_cashback_description"].endswith(original_tail), language
    for title, key in catalog["titles"][language].items():
        assert key in strings and not any(term in title for term in protected), (language, title)
print("PASS Remove Cringe catalog: seven languages, complete keys, protected names, format arguments and cashback timing/exclusions")
