"""Keep the N17a live paging evidence separate from frozen diagnostic claims."""
import json
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
DEVICE_PAGES = ROOT / "extensions/extension/src/test/resources/r29/device-230749-two-page-events.json"
N15R_MIRROR = ROOT / "scoreboard/results/n15r-paging-comparison.json"


class N17aPageLineMirrorTest(unittest.TestCase):
    def test_old_device_lines_are_retained_as_event_measurement(self):
        captured = json.loads(DEVICE_PAGES.read_text(encoding="utf-8"))
        events = captured["events"]
        self.assertEqual(captured["event_count"], len(events))
        self.assertEqual(45, len(events))
        for event in events:
            self.assertEqual(event["text"], event["old_page_1_text"] + event["old_page_2_text"])
            self.assertEqual(event["old_page_1_lines"], event["old_page_2_lines"])
        example = next(event for event in events if event["diagnostic_line_1"] == 300)
        self.assertEqual((example["diagnostic_line_1"], example["diagnostic_line_2"]), (300, 302))
        self.assertEqual(example["old_page_1_text"], "的印象，")
        self.assertEqual((example["old_page_1_lines"], example["old_page_2_lines"]), (3, 3))

    def test_new_paging_mirror_lines_are_page_scoped(self):
        mirror = json.loads(N15R_MIRROR.read_text(encoding="utf-8"))
        pages = [row for row in mirror["per_case_exceptions"] if "lines" in row]
        self.assertTrue(pages)
        self.assertTrue(all(1 <= page["lines"] <= 2 for page in pages))
        by_event = {}
        for page in pages:
            key = (page["block"], page["from"], page["to"])
            by_event.setdefault(key, set()).add(page["lines"])
        self.assertTrue(any(len(line_counts) > 1 for line_counts in by_event.values()))


if __name__ == "__main__":
    unittest.main()
