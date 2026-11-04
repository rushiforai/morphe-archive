"""A Gradle publish rebuild must be validated before the GitHub upload hook."""
import json
from pathlib import Path
import unittest


class ReleaseOrderTest(unittest.TestCase):
    def test_final_bundle_gates_run_after_rebuild_and_before_upload(self):
        config = json.loads((Path(__file__).resolve().parents[2] / '.releaserc').read_text())
        plugins = [(p[0], p[1]) if isinstance(p, list) else (p, {}) for p in config['plugins']]
        names = [name for name, _ in plugins]
        rebuild = names.index('gradle-semantic-release-plugin')
        gate = names.index('@semantic-release/exec')
        upload = names.index('@semantic-release/github')
        self.assertLess(rebuild, gate)
        self.assertLess(gate, upload)
        command = plugins[gate][1].get('publishCmd', '')
        for app in ['finamp', 'mihon', 'calendar']:
            self.assertIn(f'tests/{app}/validate_bundle.py', command)
        self.assertIn('patches-${nextRelease.version}.mpp', command)
        # exec.publishCmd treats stdout as optional release-result JSON.
        for verifier in command.split(' && '):
            self.assertTrue(verifier.rstrip().endswith('>&2'))
        calendar = next(part for part in command.split(' && ') if 'tests/calendar/validate_bundle.py' in part)
        self.assertIn('$CALENDAR_ORIGINAL_120', calendar)
        self.assertIn('$CALENDAR_ORIGINAL_121', calendar)
        self.assertIn('$MORPHE_DESKTOP_JAR', calendar)
        self.assertIn('tests/calendar/validate_bundle.py', plugins[gate][1]['prepareCmd'])


if __name__ == '__main__': unittest.main()
