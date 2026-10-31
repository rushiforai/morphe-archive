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
        for app in ['finamp', 'mihon']:
            self.assertIn(f'tests/{app}/validate_bundle.py', command)
        self.assertIn('patches-${nextRelease.version}.mpp', command)
        # exec.publishCmd treats stdout as optional release-result JSON.
        for verifier in command.split(' && '):
            self.assertTrue(verifier.rstrip().endswith('>&2'))


if __name__ == '__main__': unittest.main()
