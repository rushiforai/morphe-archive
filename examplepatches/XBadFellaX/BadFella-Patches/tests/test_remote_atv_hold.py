"""The hold patch must compose with swipe lock without changing its default output."""
import json
from pathlib import Path
import unittest

from verify_remote_atv_output import STATUS, undo_native_edits

ROOT = Path(__file__).resolve().parents[1]


class RemoteAtvHoldTests(unittest.TestCase):
    def test_optional_and_pinned(self):
        catalog = json.loads((ROOT / "patches-list.json").read_text())
        patch = next(p for p in catalog["patches"] if p["name"] == "Increase D-pad hold tolerance")
        self.assertFalse(patch["default"])
        package, = patch["compatiblePackages"]
        self.assertEqual(package["packageName"], "tech.simha.androidtvremote")
        target, = package["targets"]
        self.assertEqual(target["version"], "6.1.0")
        self.assertEqual(set(target["versionCodes"].values()), {45})

    def test_all_abis_chain_after_swipe_lock(self):
        for abi in STATUS:
            with self.subTest(abi=abi):
                def rows(kind):
                    path = ROOT / f"patches/src/main/resources/remoteatv/{kind}-6.1.0-{abi}.tsv"
                    return [line.split('\t') for line in path.read_text().splitlines()
                            if line and not line.startswith('#')]
                swipes, hold = rows("swipes"), rows("hold")
                self.assertEqual(hold[0][0], swipes[0][1])
                self.assertRegex(hold[0][1], r"^[0-9a-f]{64}$")
                spans = []
                for offset, old, new in hold[1:]:
                    offset, old, new = int(offset, 16), bytes.fromhex(old), bytes.fromhex(new)
                    self.assertEqual(len(old), len(new))
                    self.assertNotEqual(old, new)
                    spans.append((offset, offset + len(old)))
                spans.sort()
                self.assertTrue(all(a[1] <= b[0] for a, b in zip(spans, spans[1:])))
                with self.assertRaisesRegex(AssertionError, "Wrong D-pad hold output"):
                    undo_native_edits(ROOT, abi, bytes(128), "hold", "D-pad hold")
