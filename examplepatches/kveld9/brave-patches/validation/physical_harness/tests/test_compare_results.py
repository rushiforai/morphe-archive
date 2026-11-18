"""
Regression tests for the physical validation report comparator.

Focus: the comparator must never report PASS when the vanilla run carries no
baseline evidence (dead test), and must never invent a run count.
"""

from __future__ import annotations

import importlib.util
import json
import tempfile
import unittest
from pathlib import Path

SCRIPTS_DIR = Path(__file__).resolve().parents[1] / "scripts"


def _load_compare_module():
    spec = importlib.util.spec_from_file_location(
        "compare_results", SCRIPTS_DIR / "compare_results.py"
    )
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


compare_results = _load_compare_module()


class CompareSyncTest(unittest.TestCase):
    def _run(self, v_sync: dict, p_sync: dict) -> str:
        with tempfile.TemporaryDirectory() as tmp:
            base = Path(tmp)
            (base / "vanilla").mkdir()
            (base / "patched").mkdir()
            (base / "vanilla" / "sync_vanilla_result.json").write_text(
                json.dumps(v_sync), encoding="utf-8"
            )
            (base / "patched" / "sync_patched_result.json").write_text(
                json.dumps(p_sync), encoding="utf-8"
            )
            report = compare_results.compare_runs(base)
        return next(line for line in report.splitlines() if "BackgroundSyncPatch" in line)

    def test_absent_patched_job_without_vanilla_baseline_is_inconclusive(self):
        line = self._run(
            {"job_scheduling_state": "JOB_NOT_SCHEDULED", "execution_state": "JOB_NOT_EXECUTED"},
            {"job_scheduling_state": "JOB_NOT_SCHEDULED", "execution_state": "JOB_NOT_EXECUTED"},
        )
        self.assertIn("INCONCLUSIVE", line)
        self.assertNotIn("PASS", line)

    def test_scheduled_vanilla_and_absent_patched_job_passes(self):
        line = self._run(
            {"job_scheduling_state": "JOB_SCHEDULED", "execution_state": "JOB_EXECUTED"},
            {"job_scheduling_state": "JOB_NOT_SCHEDULED", "execution_state": "JOB_NOT_EXECUTED"},
        )
        self.assertIn("PASS", line)

    def test_missing_fields_are_inconclusive(self):
        line = self._run({}, {})
        self.assertIn("INCONCLUSIVE", line)


class CompareSmokeTest(unittest.TestCase):
    def _run(self, v_smoke: dict, p_smoke: dict) -> str:
        with tempfile.TemporaryDirectory() as tmp:
            base = Path(tmp)
            (base / "vanilla").mkdir()
            (base / "patched").mkdir()
            (base / "vanilla" / "smoke_vanilla_result.json").write_text(
                json.dumps(v_smoke), encoding="utf-8"
            )
            (base / "patched" / "smoke_patched_result.json").write_text(
                json.dumps(p_smoke), encoding="utf-8"
            )
            report = compare_results.compare_runs(base)
        return next(line for line in report.splitlines() if "Smoke Launch Gate" in line)

    def test_run_count_is_not_invented(self):
        line = self._run({"crash_detected": False}, {"crash_detected": False})
        self.assertIn("PASS", line)
        self.assertNotIn("5 warm runs", line)
        self.assertIn("run count not recorded", line)

    def test_recorded_run_count_is_reported(self):
        line = self._run(
            {"crash_detected": False, "runs": 5},
            {"crash_detected": False, "runs": 5},
        )
        self.assertIn("across 5 recorded runs", line)

    def test_patched_crash_fails(self):
        line = self._run({"crash_detected": False}, {"crash_detected": True})
        self.assertIn("FAIL", line)


if __name__ == "__main__":
    unittest.main()