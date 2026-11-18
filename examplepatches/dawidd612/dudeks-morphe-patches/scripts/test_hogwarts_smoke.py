import unittest
from contextlib import redirect_stdout
from io import StringIO

from hogwarts_smoke import SmokeError, replay, status_report, validate_route


SIZE = (320, 240)


def row(text, x=16, y=20):
    return {"text": text, "x": x, "y": y}


class FakeDevice:
    def __init__(self, *frames):
        self.frames = iter(frames)
        self.observations = 0
        self.taps = []

    def observe(self):
        self.observations += 1
        return next(self.frames)

    def tap(self, x, y):
        self.taps.append((x, y))


class HogwartsSmokeTest(unittest.TestCase):
    def test_status_reports_only_exact_allowlisted_labels(self):
        rows = [row("  Rowan  "), row("Player 6247844"), row("Talk with Rowan")]
        report = status_report(rows, SIZE, ["ROWAN"])
        self.assertEqual(
            report,
            {"status": "KNOWN_LABELS", "size": [320, 240], "labels": [row("ROWAN")]},
        )

    def test_unknown_screen_stops_at_retry_or_frame_limit_without_tapping(self):
        frame = [row("Talk now"), row("Continue")], SIZE
        route = [{"expect": ["Talk"], "tap": "Continue"}]
        for attempts, budget in [(2, 5), (5, 2)]:
            with self.subTest(attempts=attempts, budget=budget):
                device = FakeDevice(frame, frame)
                with self.assertRaises(SmokeError):
                    replay(device, route, attempts, 0, budget)
                self.assertEqual(device.observations, 2)
                self.assertEqual(device.taps, [])

    def test_account_and_purchase_screens_block_even_a_recognized_target(self):
        route = [{"expect": ["Continue"], "tap": "Continue"}]
        for sensitive in ["Account Info", "Sign in with Google", "Confirm purchase"]:
            with self.subTest(sensitive=sensitive):
                rows = [row("Continue"), row(sensitive)]
                device = FakeDevice((rows, SIZE))
                with self.assertRaises(SmokeError):
                    replay(device, route, 3, 0, 10)
                self.assertEqual(device.taps, [])
                report = status_report(rows, SIZE, ["Continue"])
                self.assertEqual(report["status"], "BLOCKED_SCREEN")
                self.assertEqual(report["labels"], [])
        with self.assertRaises(SmokeError):
            validate_route([{"expect": ["Talk"], "tap": "Buy"}])

    def test_coordinate_tap_requires_calibrated_resolution(self):
        route = [{"expect": ["Talk"], "point": [19, 22], "size": [320, 240]}]
        device = FakeDevice(([row("Talk")], (320, 241)))
        validate_route(route)
        with self.assertRaises(SmokeError):
            replay(device, route, 1, 0, 1)
        self.assertEqual(device.taps, [])
        with self.assertRaises(SmokeError):
            validate_route([{"expect": ["Talk"], "point": [19, 22]}])

    def test_duplicate_screen_markers_or_targets_are_ambiguous(self):
        route = [{"expect": ["Talk"], "tap": "Continue"}]
        for duplicate in ["Talk", "Continue"]:
            with self.subTest(duplicate=duplicate):
                rows = [row("Talk"), row("Continue"), row(duplicate, 50, 90)]
                device = FakeDevice((rows, SIZE))
                with self.assertRaises(SmokeError):
                    replay(device, route, 1, 0, 1)
                self.assertEqual(device.taps, [])

    def test_safe_route_taps_the_expected_targets_and_confirms_the_result(self):
        route = [
            {"expect": ["Rowan"], "tap": "Continue"},
            {"expect": ["Choose your character"], "point": [75, 120], "size": [320, 240]},
            {"expect": ["Wardrobe"]},
        ]
        device = FakeDevice(
            ([row("Rowan"), row("Continue", 110, 40)], SIZE),
            ([row("Choose your character")], SIZE),
            ([row("Wardrobe")], SIZE),
        )
        validate_route(route)
        with redirect_stdout(StringIO()):
            frames = replay(device, route, 1, 0, 3)
        self.assertEqual(frames, 3)
        self.assertEqual(device.taps, [(110, 40), (75, 120)])


    def test_resumed_route_requires_the_current_step_marker(self):
        route = [
            {"expect": ["Rowan"], "tap": "Continue"},
            {"expect": ["You"]},
        ]
        with self.assertRaises(SmokeError):
            replay(FakeDevice(([row("Rowan")], SIZE)), route, 1, 0, 1, first_step=2)
        device = FakeDevice(([row("You")], SIZE))
        with redirect_stdout(StringIO()) as output:
            frames = replay(device, route, 1, 0, 1, first_step=2)
        self.assertEqual(frames, 1)
        self.assertEqual(device.taps, [])
        self.assertIn("Step 2 confirmed", output.getvalue())


if __name__ == "__main__":
    unittest.main()
