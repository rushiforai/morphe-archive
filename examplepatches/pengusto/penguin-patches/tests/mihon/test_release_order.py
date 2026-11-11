"""Validated release assets must survive the Gradle rebuild before upload."""
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

        prepare = plugins[gate][1]['prepareCmd'].split(' && ')
        final_individual = next(i for i, part in enumerate(prepare)
                                if 'tests/finamp/validate_bundle.py' in part
                                and '--bundle patches/build/libs/patches-finamp-individual-' in part)
        record = next(i for i, part in enumerate(prepare) if part.startswith('sha256sum patches/build/libs/patches-combined-'))
        self.assertLess(final_individual, record)
        self.assertIn('patches-finamp-individual-${nextRelease.version}.mpp', prepare[record])
        self.assertIn('$RUNNER_TEMP/penguin-release-assets.sha256', prepare[record])

        command = plugins[gate][1].get('publishCmd', '')
        steps = command.split(' && ')
        checksum = next(i for i, part in enumerate(steps) if part.startswith('sha256sum -c '))
        restore = next(i for i, part in enumerate(steps) if part.startswith('mv -f patches/build/libs/patches-combined-'))
        self.assertIn('$RUNNER_TEMP/penguin-release-assets.sha256', steps[checksum])
        self.assertLess(checksum, restore)
        for app in ['mihon', 'calendar']:
            index = next(i for i, part in enumerate(steps) if f'tests/{app}/validate_bundle.py' in part)
            self.assertLess(restore, index)
        compact = [part for part in steps if 'tests/finamp/verify_compact.py' in part]
        self.assertEqual(len(compact), 2)
        self.assertTrue(all(steps.index(part) > restore for part in compact))
        self.assertTrue(any('--bundle patches/build/libs/patches-${nextRelease.version}.mpp' in part for part in compact))
        self.assertTrue(any('--bundle patches/build/libs/patches-finamp-${nextRelease.version}.mpp' in part for part in compact))
        # exec.publishCmd treats stdout as optional release-result JSON.
        for verifier in steps:
            if verifier.startswith(('python3 ', 'sha256sum ')):
                self.assertTrue(verifier.rstrip().endswith('>&2'))
        calendar = next(part for part in steps if 'tests/calendar/validate_bundle.py' in part)
        self.assertIn('$CALENDAR_ORIGINAL_120', calendar)
        self.assertIn('$CALENDAR_ORIGINAL_121', calendar)
        self.assertIn('$CALENDAR_ORIGINAL_122', calendar)
        self.assertIn('$MORPHE_DESKTOP_JAR', calendar)
        self.assertIn('tests/calendar/validate_bundle.py', plugins[gate][1]['prepareCmd'])


if __name__ == '__main__': unittest.main()
