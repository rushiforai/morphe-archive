import importlib.util
from pathlib import Path
import unittest

spec = importlib.util.spec_from_file_location('warning_latency', Path(__file__).resolve().parents[1] / 'scripts/navigation-alerts/summarize_latency.py')
latency = importlib.util.module_from_spec(spec)
spec.loader.exec_module(latency)


def row(sequence, stage, elapsed, **extra):
    return dict(provider_session='fixture-session', sequence=sequence, stage=stage,
                issued_ms=1000, elapsed_ms=elapsed, **extra)


class WarningLatencySummaryTest(unittest.TestCase):
    def test_queue_and_completion_are_not_fabricated_start_samples(self):
        result = latency.summarize([row(1, 'RECEIVER_ACCEPTED', 1010), row(1, 'SCHEDULER_QUEUED', 1011), row(1, 'SCHEDULER_COMPLETED', 1100)])
        self.assertEqual(1, result['native_issue_to_receiver']['samples'])
        self.assertEqual(0, result['receiver_to_started']['samples'])
        self.assertEqual('inconclusive', result['receiver_to_started']['sample_status'])

    def test_distinct_events_and_nearest_rank_percentiles(self):
        rows = []
        for i in range(1, 101):
            rows += [row(i, 'RECEIVER_ACCEPTED', 1000 + i), row(i, 'SCHEDULER_STARTED', 1100 + i)]
        result = latency.summarize(rows + rows)
        self.assertEqual(100, result['unique_transport_events'])
        self.assertEqual(95, result['native_issue_to_receiver']['p95_ms'])
        self.assertEqual(99, result['native_issue_to_receiver']['p99_ms'])
        self.assertEqual(100, result['receiver_to_started']['p99_ms'])
        self.assertEqual('sufficient', result['receiver_to_started']['sample_status'])

    def test_synthetic_preview_is_excluded(self):
        result = latency.summarize([row(1, 'RECEIVER_ACCEPTED', 1001, preview=True), row(1, 'SCHEDULER_STARTED', 1002, preview=True)])
        self.assertEqual(0, result['unique_transport_events'])

    def test_missing_retained_acceptance_is_reported_without_zero_fill(self):
        result = latency.summarize([row(1, 'SCHEDULER_STARTED', 1050)])
        self.assertEqual(1, result['started_without_retained_acceptance'])
        self.assertIsNone(result['receiver_to_started']['p95_ms'])

    def test_clock_and_identity_conflicts_fail(self):
        with self.assertRaises(ValueError):
            latency.summarize([row(1, 'RECEIVER_ACCEPTED', 999)])
        changed = row(1, 'SCHEDULER_STARTED', 1100)
        changed['issued_ms'] = 1001
        with self.assertRaises(ValueError):
            latency.summarize([row(1, 'RECEIVER_ACCEPTED', 1010), changed])
        with self.assertRaises(ValueError):
            latency.summarize([row(1, 'RECEIVER_ACCEPTED', 1100), row(1, 'SCHEDULER_STARTED', 1050)])
