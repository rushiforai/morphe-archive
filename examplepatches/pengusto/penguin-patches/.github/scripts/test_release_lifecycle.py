"""Check the actual release commands across Gradle's publish rebuild."""
import json
import os
import re
from pathlib import Path
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[2]


class ReleaseLifecycleTests(unittest.TestCase):
    def setUp(self):
        config = json.loads((ROOT / '.releaserc').read_text())
        execution = next(plugin[1] for plugin in config['plugins']
                         if isinstance(plugin, list) and plugin[0] == '@semantic-release/exec')
        prepare = execution['prepareCmd'].replace('${nextRelease.version}', '9.9.9').split(' && ')
        publish = execution['publishCmd'].replace('${nextRelease.version}', '9.9.9').split(' && ')
        self.stage = next(command for command in prepare if command.startswith('cp patches/build/libs/patches-combined-'))
        self.record = next(command for command in prepare if command.startswith('sha256sum patches/build/libs/patches-combined-'))
        self.check = next(command for command in publish if command.startswith('sha256sum -c '))
        self.restore = next(command for command in publish if command.startswith('mv -f patches/build/libs/patches-combined-'))
        self.assertLess(publish.index(self.check), publish.index(self.restore))
        self.assertTrue(any('tests/finamp/validate_bundle.py --bundle patches/build/libs/patches-finamp-individual-' in c for c in prepare))
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.assets = self.root / 'patches/build/libs'
        self.assets.mkdir(parents=True)
        self.env = dict(os.environ, RUNNER_TEMP=str(self.root))
        self.combined = self.assets / 'patches-combined-9.9.9.mpp'
        self.individual = self.assets / 'patches-finamp-individual-9.9.9.mpp'
        self.default = self.assets / 'patches-9.9.9.mpp'
        self.combined.write_bytes(b'compact combined')
        self.individual.write_bytes(b'individual selections')

    def run_command(self, command):
        return subprocess.run(command, shell=True, cwd=self.root, env=self.env,
                              stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    def test_release_guard_matches_compact_patch_and_tests_final_metadata(self):
        config = json.loads((ROOT / '.releaserc').read_text())
        execution = next(plugin[1] for plugin in config['plugins']
                         if isinstance(plugin, list) and plugin[0] == '@semantic-release/exec')
        prepare = execution['prepareCmd']
        self.assertIn('python3 -B .github/scripts/finamp_catalogue.py --metadata patches-list.json', prepare)
        self.assertLess(prepare.index('generatePatchesListFromBundle'), prepare.index('finamp_catalogue.py --metadata'))
        self.assertLess(prepare.index('generatePatchesListFromBundle'), prepare.index('sync_finamp_readme_locales.py'))
        self.assertLess(prepare.index('sync_finamp_readme_locales.py'), prepare.index("unittest discover -s .github/scripts"))
        assets = next(plugin[1]['assets'] for plugin in config['plugins']
                      if isinstance(plugin, list) and plugin[0] == '@semantic-release/git')
        self.assertIn('docs/readme/README.*.md', assets)

    def test_preflight_checks_feature_prs_and_dev_pushes_without_bot_main_pr_approval(self):
        workflow = (ROOT / ".github/workflows/preflight.yml").read_text()
        self.assertRegex(workflow, r"(?m)^  pull_request:\n    branches: \[dev\]$")
        self.assertRegex(workflow, r"(?m)^  push:\n    branches: \[dev\]$")

    def test_restores_compact_bundle_after_gradle_rebuild(self):
        self.assertEqual(self.run_command(self.stage).returncode, 0)
        self.assertEqual(self.default.read_bytes(), self.combined.read_bytes())
        self.assertEqual(self.run_command(self.record).returncode, 0)
        self.default.write_bytes(b'rebuilt full bundle')
        self.assertEqual(self.run_command(self.check).returncode, 0)
        self.assertEqual(self.run_command(self.restore).returncode, 0)
        self.assertEqual(self.default.read_bytes(), b'compact combined')
        self.assertFalse(self.combined.exists())

    def test_changed_release_assets_fail_before_restore(self):
        for name in ('combined', 'individual'):
            with self.subTest(asset=name):
                self.combined.write_bytes(b'compact combined')
                self.individual.write_bytes(b'individual selections')
                self.assertEqual(self.run_command(self.record).returncode, 0)
                getattr(self, name).write_bytes(b'changed')
                self.assertNotEqual(self.run_command(self.check).returncode, 0)


if __name__ == '__main__':
    unittest.main()
