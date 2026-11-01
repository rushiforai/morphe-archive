"""Release formatting tests; no GitHub writes, APKs or credentials required."""
import unittest
from unittest.mock import patch

from tools import release_title as release


class ReleaseTitleTests(unittest.TestCase):
    def test_peptalk_notes_and_idempotence(self):
        original = '## 1.4.0 (2026-10-31)\n\n### New Features\n\n* **peptalk:** add extended free reading patch ddf9b35\n'
        title, body = release.release_text('v1.4.0', [release.APP_NAMES['peptalk']], original)
        self.assertEqual(title, 'v1.4.0 - Pep Talk')
        self.assertTrue(body.startswith('## BadFella Patches v1.4.0\n\n'))
        self.assertIn('**Pep Talk:**', body)
        self.assertIn('ddf9b35', body)
        self.assertEqual(release.release_text('v1.4.0', [release.APP_NAMES['peptalk']], body), (title, body))

    def test_preview_and_historical_details_preserved(self):
        notes = '## Development preview\r\n\r\nKeep `code`, [links](https://example.com) and device caveats.\r\n'
        title, body = release.release_text('v1.3.0-dev.1', ['Pep Talk'], notes)
        self.assertEqual(title, 'v1.3.0-dev.1 - Pep Talk preview')
        self.assertIn('Keep `code`, [links](https://example.com) and device caveats.', body)
        self.assertEqual(release.release_text('v1.4.1', [], 'Maintenance.')[0],
                         'v1.4.1 - BadFella Patches')

    def test_fix_only_release_and_numeric_previous_version(self):
        catalog = {'Reading': {'compatiblePackages': [{'name': 'Pep Talk'}]}}
        with patch.object(release, 'catalog', return_value=catalog) as read, \
             patch.object(release, 'git', side_effect=[
                 'v1.9.0 v1.10.0 v1.11.0 v1.11.1-dev.1',
                 'patches/src/main/kotlin/app/badfella/patches/peptalk/PepTalkPatch.kt',
             ]) as git:
            self.assertEqual(release.release_apps('.', 'v1.11.0'), [release.APP_NAMES['peptalk']])
            self.assertEqual(read.call_args_list[0].args, ('.', 'v1.10.0'))
            self.assertEqual(git.call_args_list[1].args, ('.', 'diff', '--name-only', 'v1.10.0', 'v1.11.0'))

    def test_new_apps_are_expanded_deduplicated_and_all_packages_included(self):
        new = {'Reading': {'compatiblePackages': [{'name': 'Pep Talk'}, {'name': 'TickTick'}]}}
        with patch.object(release, 'catalog', return_value=new), \
             patch.object(release, 'git', return_value=''):
            self.assertEqual(release.release_apps('.', 'v1.0.0'),
                             [release.APP_NAMES['peptalk'], 'TickTick'])
        with self.assertRaises(ValueError):
            release.release_apps('.', '--invalid-tag')

    def test_workflow_applies_template_only_after_publication(self):
        from pathlib import Path
        workflow = (Path(__file__).resolve().parents[1] / '.github/workflows/release.yml').read_text()
        step = workflow.split('- name: Apply shared release title and notes template')[1].split('- name: Attest')[0]
        self.assertIn("if: steps.release.outputs.new_release_published == 'true'", step)
        self.assertIn('python3 tools/release_title.py "$RELEASE_TAG" --repo "$GITHUB_REPOSITORY"', step)
