import importlib.util
from pathlib import Path
import unittest


spec = importlib.util.spec_from_file_location(
    'validate_waze', Path(__file__).resolve().parents[1] / 'scripts/validate_waze.py')
validator = importlib.util.module_from_spec(spec)
spec.loader.exec_module(validator)


class WazeReportTests(unittest.TestCase):
    def report(self):
        return {
            'success': True, 'packageName': 'com.waze', 'packageVersion': '5.26.90.901',
            'appliedPatches': ['Hide ads'], 'failedPatches': [],
            'stepResults': [{'step': 'PATCHING', 'success': True},
                            {'step': 'REBUILDING', 'success': True}],
        }

    def test_accepts_complete_run(self):
        validator.check_report(self.report(), ['Hide ads'])

    def test_rejects_cli_success_with_failed_patch(self):
        report = self.report()
        report['failedPatches'] = [{'name': 'All moods', 'error': 'No match'}]
        with self.assertRaises(ValueError):
            validator.check_report(report, ['Hide ads'])

    def test_rejects_missing_selected_patch(self):
        with self.assertRaises(ValueError):
            validator.check_report(self.report(), ['Hide ads', 'All moods'])

    def test_rejects_other_waze_version(self):
        report = self.report()
        report['packageVersion'] = '5.24.5.0'
        with self.assertRaises(ValueError):
            validator.check_report(report, ['Hide ads'])

    def test_rejects_absent_rebuild_evidence(self):
        report = self.report()
        report['stepResults'] = []
        with self.assertRaises(ValueError):
            validator.check_report(report, ['Hide ads'])
