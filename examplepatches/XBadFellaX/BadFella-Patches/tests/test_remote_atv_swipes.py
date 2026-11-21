"""The optional native patch must preserve its reviewed predecessor and architecture coverage."""
import json
from pathlib import Path
import unittest

from verify_remote_atv_output import STATUS, undo_page_swipes

ROOT = Path(__file__).resolve().parents[1]


class RemoteAtvSwipeTests(unittest.TestCase):
    def test_opt_in_and_exact_target(self):
        catalog = json.loads((ROOT / "patches-list.json").read_text())
        patch = next(p for p in catalog["patches"] if p["name"] == "Disable remote page swipes")
        self.assertFalse(patch["default"])
        package, = patch["compatiblePackages"]
        self.assertEqual(package["packageName"], "tech.simha.androidtvremote")
        target, = package["targets"]
        self.assertEqual(target["version"], "6.1.0")
        self.assertEqual(set(target["versionCodes"].values()), {45})

    def test_all_abis_and_nonoverlapping_edits(self):
        for abi, predecessor in STATUS.items():
            with self.subTest(abi=abi):
                path = ROOT / f"patches/src/main/resources/remoteatv/swipes-6.1.0-{abi}.tsv"
                lines = [line.split('\t') for line in path.read_text().splitlines()
                         if line and not line.startswith('#')]
                self.assertEqual(lines[0][0], predecessor)
                self.assertRegex(lines[0][1], r"^[0-9a-f]{64}$")
                spans = []
                for position, old, new in lines[1:]:
                    offset = int(position, 16)
                    old, new = bytes.fromhex(old), bytes.fromhex(new)
                    self.assertEqual(len(old), len(new))
                    self.assertNotEqual(old, new)
                    spans.append((offset, offset + len(old)))
                spans.sort()
                self.assertTrue(all(a[1] <= b[0] for a, b in zip(spans, spans[1:])))
                with self.assertRaisesRegex(AssertionError, "Wrong page-swipe output"):
                    undo_page_swipes(ROOT, abi, bytes(128))
