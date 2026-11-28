"""Behavior tests for verification failures; fixtures never mutate real reports or bundles."""
import hashlib
import importlib.util
import json
from pathlib import Path
import struct
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch
import zipfile
import zlib
import argparse
import shutil

import verify_current as current

spec = importlib.util.spec_from_file_location('bundle', current.ROOT / '.github/scripts/verify_bundle.py')
bundle = importlib.util.module_from_spec(spec)
spec.loader.exec_module(bundle)
EVIDENCE = None


def fixture_dex(strings):
    values = [s.encode() + b'\0' for s in strings]
    data = bytearray(112 + 4 * len(values))
    data[:8] = b'dex\n035\0'
    struct.pack_into('<II', data, 56, len(values), 112)
    for i, value in enumerate(values):
        struct.pack_into('<I', data, 112 + 4 * i, len(data))
        # Fixture strings are short ASCII (one-byte ULEB128).
        data.extend(bytes([len(value) - 1]) + value)
    struct.pack_into('<I', data, 32, len(data))
    data[12:32] = hashlib.sha1(data[32:]).digest()
    struct.pack_into('<I', data, 8, zlib.adler32(data[12:]))
    return bytes(data)


def fixture_bundle(path, ids):
    dex = fixture_dex(['NativeCaptionBridge', 'RebuildCueProjection', 'REBUILD_CUE_PROJECTION',
                       'RebuildController', 'CaptionDiagnostics'] + ids)
    with zipfile.ZipFile(path, 'w') as z:
        z.writestr('META-INF/MANIFEST.MF', f'Version: 1.5.8\nPatcher-Version: {bundle.PATCHER_VERSION}\nSource: YYDarlinker/morphe-ai-caption-translator\n')
        z.writestr('classes.dex', fixture_dex(['root']))
        z.writestr('extensions/extension.mpe', dex)
        z.writestr('captionlocales/index.txt', '\n'.join(f'locale{i}' for i in range(14)))
        for i in range(14):
            z.writestr(f'captionlocales/locale{i}/caption_addon_strings.xml', '<resources/>')
    return dex


class VerificationContract(unittest.TestCase):
    def setUp(self):
        # Repo-local temp even on CI; no writes to C: system temp on the maintainer machine.
        (current.ROOT / 'validation/runs').mkdir(parents=True, exist_ok=True)
        self.tmp = tempfile.TemporaryDirectory(prefix='verification-fixture-', dir=current.ROOT / 'validation/runs')
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.addCleanup(cleanup_fixture, self.root)
        if EVIDENCE:
            self.addCleanup(lambda: current.copy_reports(self.root, EVIDENCE / self._testMethodName))

    def receipt(self, tests=1):
        tasks = {}
        for i, task in enumerate(current.TEST_TASKS):
            folder = self.root / str(i)
            folder.mkdir()
            (folder / 'TEST-example.xml').write_text(f'<testsuite tests="{tests}" failures="0" errors="0" skipped="0"/>')
            tasks[task] = dict(executed=True, skipped=False, failure=False, xml=str(folder), html=str(folder / 'no-html'))
            compiler = task.removesuffix('testDebugUnitTest') + 'compileDebugUnitTestJavaWithJavac'
            tasks[compiler] = dict(executed=True, skipped=False, failure=False, test_output_reset=True)
        return dict(success=True, tasks=tasks)

    def test_stale_test_compilation_rejected_even_with_fresh_passing_xml(self):
        for changes in ({'test_output_reset': False},
                        {'skipped': True, 'skip_message': 'UP-TO-DATE'},
                        {'skipped': True, 'skip_message': 'FROM-CACHE'}):
            with self.subTest(changes=changes):
                fixture = self.root / str(len(list(self.root.iterdir())))
                fixture.mkdir()
                saved = self.root
                self.root = fixture
                try:
                    receipt = self.receipt()
                    compiler = current.TEST_TASKS[1].removesuffix('testDebugUnitTest') + 'compileDebugUnitTestJavaWithJavac'
                    receipt['tasks'][compiler].update(changes)
                    with self.assertRaisesRegex(ValueError, 'not freshly compiled'):
                        current.collect_tests(receipt, fixture / 'archive')
                finally:
                    self.root = saved

    def test_compiled_boundary_reads_windows_long_path(self):
        import verify_integration
        path = self.root / ('nested-' + 'x' * 150) / ('nested-' + 'y' * 100) / 'Boundary.class'
        current.long_path(path.parent).mkdir(parents=True)
        current.long_path(path).write_bytes(b'\xca\xfe\xba\xbe\x00\x00\x00\x37\x00\x01')
        self.assertGreater(len(str(path)), 260)
        self.assertEqual([], verify_integration.constants(path))

    def test_new_helper_dependencies_pass_reject_and_restore(self):
        import verify_integration as integration
        # Exercise the full source check in a private copy.
        fixture = self.root / 'source-copy'
        for area in integration.SOURCE_AREAS:
            for language in ('java', 'kotlin'):
                source = current.ROOT / area / 'src/main' / language
                if source.is_dir(): current.copy_reports(source, fixture / area / 'src/main' / language)
        for name in ('settings.gradle.kts', 'LICENSE', 'NOTICE'):
            shutil.copyfile(current.ROOT / name, fixture / name)
        package = 'app.yydarlinker.aicaptions'
        def source(area, name, body, language='java'):
            module = integration.EXTENSION if area in integration.EXTENSION_FOLDERS else area
            folder = Path(area) if module != area and language == 'java' else Path()
            path = fixture / module / 'src/main' / language / Path(*package.split('.')) / folder / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('package ' + package + ';\n' + body, encoding='utf-8')
            return path
        source('host', 'S2UnlistedHost.java', 'class S2UnlistedHost { static void run() {} }')
        source('settings', 'S2UnlistedView.java', 'class S2UnlistedView {}')
        shared = source('caption-shared', 'S2SharedValue.java', 'class S2SharedValue {}')
        source('caption-contracts', 'S2Port.java', 'interface S2Port {}')
        core = source('translation-core', 'S2NewPlanCache.java',
                      'class S2NewPlanCache { S2SharedValue value; S2Port port; }')
        source('translation-core', 'S2PlanForwarder.java', 'class S2PlanForwarder { S2NewPlanCache cache; }')
        presentation = source('overlay', 'S2ReadingPolicy.java',
                              'class S2ReadingPolicy { S2SharedValue value; S2Port port; }')
        ui = source('settings', 'S2ViewForwarder.java', 'class S2ViewForwarder { S2ReadingPolicy policy; }')
        source('overlay', 'S2Mentions.java', '''class S2Mentions {
          // S2NewPlanCache RebuildController
          /* S2UnlistedHost */
          String url = "https://example.invalid/RebuildController";
          String block = """\nS2NewPlanCache\n""";
        }''')
        records = []
        def inspect(label, rejected):
            with patch.object(integration, 'R', fixture): report = integration.inspect(source_only=True)
            current.write_json(self.root / (label + '.json'), report)
            records.append(dict(label=label, exit_code=int(bool(report['errors'])), errors=report['errors']))
            self.assertEqual(rejected, bool(report['errors']), report)
            return report
        inspect('legal', False)
        cases = [
            (core, 'class S2NewPlanCache { S2UnlistedHost host; }', 'S2UnlistedHost'),
            (core, 'class S2NewPlanCache { S2UnlistedView view; }', 'S2UnlistedView'),
            (core, 'import static ' + package + '.S2UnlistedHost.run; class S2NewPlanCache {}', 'S2UnlistedHost'),
            (presentation, 'class S2ReadingPolicy { S2NewPlanCache cache; }', 'S2NewPlanCache'),
            (ui, 'class S2ViewForwarder { S2NewPlanCache cache; }', 'S2NewPlanCache'),
            (shared, 'class S2SharedValue { S2NewPlanCache cache; }', 'S2NewPlanCache'),
        ]
        for i, (path, body, expected) in enumerate(cases):
            with self.subTest(edge=expected, file=path.name):
                original = path.read_bytes()
                path.write_text('package ' + package + ';\n' + body, encoding='utf-8')
                try:
                    report = inspect(f'violation-{i}', True)
                    self.assertTrue(any(expected in e and path.name in e for e in report['errors']))
                finally: path.write_bytes(original)
                inspect(f'restored-{i}', False)
        kotlin = source('caption-shared', 'S2Alias.kt',
                        'import ' + package + '.S2NewPlanCache as Cache\nclass S2Alias(val cache: Cache)', 'kotlin')
        inspect('kotlin-alias-violation', True)
        kotlin.unlink()
        inspect('kotlin-restored', False)
        current.write_json(self.root / 'helper-mutation-sequence.json', records)

    def test_source_lexer_ignores_mentions_without_hiding_real_edges(self):
        from verify_integration import source_code
        source = '''String url = "https://example.invalid/"; HostAfterUrl value;
          /* outer /* nested */ still comment */ RealAfterComment ref;
          String raw = """\nRebuildController\n""";
          char c = '/'; // CaptionOverlay
          RebuildController actual;
        '''
        code = source_code(source)
        self.assertIn('HostAfterUrl value', code)
        self.assertIn('RealAfterComment ref', code)
        self.assertEqual(1, code.count('RebuildController'))
        self.assertNotIn('CaptionOverlay', code)
        self.assertEqual('CaptionOverlay', source_code(r'\u0043aptionOverlay'))

    def test_credential_scanner_cannot_skip_long_path_file(self):
        import scan_delivery_credentials
        path = self.root / ('nested-' + 'x' * 150) / ('nested-' + 'y' * 100) / 'scan.txt'
        current.long_path(path.parent).mkdir(parents=True)
        marker = 'fixture_credential_for_long_path_check_9917'
        current.long_path(path).write_text(marker, encoding='utf8')
        with patch.object(scan_delivery_credentials.os, 'environ', {'M7A_FIXTURE_SECRET': marker}):
            report = scan_delivery_credentials.scan([self.root])
        self.assertEqual([str(path)], report['matches'])

    def test_missing_module_report_rejected(self):
        receipt = self.receipt()
        Path(receipt['tasks'][current.TEST_TASKS[1]]['xml'], 'TEST-example.xml').unlink()
        with self.assertRaisesRegex(ValueError, 'missing required JUnit'):
            current.collect_tests(receipt, self.root / 'archive')

    def test_zero_module_rejected_even_if_other_module_has_tests(self):
        receipt = self.receipt()
        Path(receipt['tasks'][current.TEST_TASKS[1]]['xml'], 'TEST-example.xml').write_text('<testsuite tests="0" failures="0" errors="0" skipped="0"/>')
        with self.assertRaisesRegex(ValueError, 'no effective tests'):
            current.collect_tests(receipt, self.root / 'archive')

    def test_reports_without_current_task_receipt_rejected(self):
        receipt = self.receipt()
        del receipt['tasks'][current.TEST_TASKS[0]]
        with self.assertRaisesRegex(ValueError, 'this Gradle invocation'):
            current.collect_tests(receipt, self.root / 'archive')

    def test_no_source_is_not_test_success(self):
        receipt = self.receipt()
        receipt['tasks'][current.TEST_TASKS[0]].update(skipped=True, skip_message='NO-SOURCE')
        with self.assertRaisesRegex(ValueError, 'skipped without valid reuse'):
            current.collect_tests(receipt, self.root / 'archive')

    def test_gradle_confirmed_reuse_allowed(self):
        receipt = self.receipt()
        receipt['tasks'][current.TEST_TASKS[0]].update(skipped=True, skip_message='UP-TO-DATE')
        result = current.collect_tests(receipt, self.root / 'archive')
        self.assertEqual('gradle-confirmed reuse', result['translation-core']['execution'])

    def test_failed_or_skipped_xml_rejected_even_with_success_receipt(self):
        receipt = self.receipt()
        for failures, skipped in ((1, 0), (0, 1)):
            with self.subTest(failures=failures, skipped=skipped):
                Path(receipt['tasks'][current.TEST_TASKS[0]]['xml'], 'TEST-example.xml').write_text(
                    f'<testsuite tests="2" failures="{failures}" errors="0" skipped="{skipped}"/>')
                with self.assertRaisesRegex(ValueError, 'has failures|skipped'):
                    current.collect_tests(receipt, self.root / 'archive')

    def test_long_html_report_paths_are_archived(self):
        receipt = self.receipt()
        html = self.root / 'html'
        deep = html / ('x' * 100) / ('y' * 100 + '.html')
        current.long_path(deep.parent).mkdir(parents=True)
        current.long_path(deep).write_text('long report', encoding='utf-8')
        receipt['tasks'][current.TEST_TASKS[0]]['html'] = str(html)
        current.collect_tests(receipt, self.root / 'archive')
        copied = self.root / 'archive/translation-core-html' / ('x' * 100) / ('y' * 100 + '.html')
        self.assertEqual('long report', current.long_path(copied).read_text(encoding='utf-8'))

    def fail_subcommand(self, label, exit_code):
        original = current.Steps.run
        seen = []
        def run_step(step, name, argv):
            seen.append(name)
            if name == 'gradle':
                return original(step, name, [sys.executable, '-c', f'print({label!r}); raise SystemExit({exit_code})'])
            step.summary['commands'].append(dict(name=name, command=['fixture'], exit_code=0))
        run_id = self.root.name + '-' + label
        evidence = self.root / label
        with patch.object(current.Steps, 'run', run_step):
            code = current.main(['--run-id', run_id, '--evidence-dir', str(evidence)])
        self.addCleanup(shutil_cleanup, current.ROOT / 'build/verification' / run_id)
        summary = json.loads((evidence / 'summary.json').read_text())
        self.assertEqual(1, code)
        self.assertEqual('failed', summary['status'])
        self.assertEqual(exit_code, summary['commands'][-1]['exit_code'])
        self.assertNotIn('bundle', seen)

    def test_unit_subcommand_failure_stops_pipeline(self):
        self.fail_subcommand('unit-failed', 7)

    def test_build_subcommand_failure_stops_pipeline(self):
        self.fail_subcommand('build-failed', 13)

    def test_explicit_candidate_selected_with_other_old_bundles_present(self):
        old = self.root / 'old.mpp'
        fixture_bundle(old, ['local-1.5.8-n74'])
        selected = self.root / 'selected.mpp'
        mpe = self.root / 'selected.mpe'
        mpe.write_bytes(fixture_bundle(selected, ['local-1.5.8-n75']))
        result = bundle.inspect_bundle(selected, '1.5.8', 'local-1.5.8-n75', 'candidate', mpe)
        self.assertEqual(str(selected.resolve()), result['path'])
        self.assertEqual(hashlib.sha256(selected.read_bytes()).hexdigest(), result['sha256'])
        with self.assertRaisesRegex(AssertionError, 'expected build ID missing'):
            bundle.inspect_bundle(old, '1.5.8', 'local-1.5.8-n75', 'candidate', mpe)

    def test_identity_mismatch_and_build_id_prefix_rejected(self):
        path = self.root / 'candidate.mpp'
        fixture_bundle(path, ['local-1.5.8-n750'])
        for version, build_id in [('1.5.9', 'local-1.5.8-n750'), ('1.5.8', 'local-1.5.8-n75')]:
            with self.assertRaises(AssertionError):
                bundle.inspect_bundle(path, version, build_id, 'candidate')

    def test_local_passes_candidate_and_is_rejected_as_release(self):
        path = self.root / 'candidate.mpp'
        fixture_bundle(path, ['local-1.5.8-n75'])
        bundle.inspect_bundle(path, '1.5.8', 'local-1.5.8-n75', 'candidate')
        with self.assertRaises(AssertionError):
            bundle.inspect_bundle(path, '1.5.8', 'release-1.5.8', 'release')

    def test_release_passes_but_local_marker_still_rejected(self):
        path = self.root / 'release.mpp'
        fixture_bundle(path, ['release-1.5.8'])
        bundle.inspect_bundle(path, '1.5.8', 'release-1.5.8', 'release')
        fixture_bundle(path, ['release-1.5.8', 'local-1.5.8-n75'])
        with self.assertRaisesRegex(AssertionError, 'local build id'):
            bundle.inspect_bundle(path, '1.5.8', 'release-1.5.8', 'release')

    def test_wrong_standalone_mpe_rejected(self):
        path = self.root / 'candidate.mpp'
        fixture_bundle(path, ['local-1.5.8-n75'])
        mpe = self.root / 'wrong.mpe'
        mpe.write_bytes(b'not this build')
        with self.assertRaisesRegex(AssertionError, 'specified standalone MPE'):
            bundle.inspect_bundle(path, '1.5.8', 'local-1.5.8-n75', 'candidate', mpe)

    def test_ci_and_prepare_use_current_entry(self):
        config = json.loads((current.ROOT / '.releaserc').read_text())
        prepare = next(p[1]['prepareCmd'] for p in config['plugins'] if isinstance(p, list) and p[0] == '@semantic-release/exec')
        self.assertIn('tools/verify_current.py --mode release', prepare)
        workflow = (current.ROOT / '.github/workflows/validate.yml').read_text()
        self.assertIn('tools/verify_current.py', workflow)
        self.assertIn("'codex/**'", workflow)
        self.assertIn('validation/runs/', workflow)
        self.assertIn('build/verification/', workflow)
        release = (current.ROOT / '.github/workflows/release.yml').read_text()
        after = release.split('- name: Validate Morphe metadata after release decision')[1].split('- name:')[0]
        self.assertIn("new_release_published }}' = 'true'", after)
        self.assertIn('--mode published', after)


def cleanup_fixture(path):
    if not path.resolve().is_relative_to(current.ROOT / 'validation/runs') or not path.name.startswith('verification-fixture-'):
        raise ValueError('refusing to remove a non-fixture directory')
    shutil.rmtree(current.long_path(path))


def shutil_cleanup(path):
    import shutil
    # Path is a fixture-owned directory under the verification build root.
    if path.is_relative_to(current.ROOT / 'build/verification'):
        shutil.rmtree(path)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    if args.output:
        EVIDENCE = args.output.parent / 'negative-fixtures'
        EVIDENCE.mkdir(parents=True, exist_ok=True)
    statuses = []
    class Result(unittest.TextTestResult):
        def addSuccess(self, test):
            statuses.append(dict(test=test.id(), status='passed'))
            super().addSuccess(test)
        def addFailure(self, test, err):
            statuses.append(dict(test=test.id(), status='failed'))
            super().addFailure(test, err)
        def addError(self, test, err):
            statuses.append(dict(test=test.id(), status='error'))
            super().addError(test, err)
    result = unittest.TextTestRunner(verbosity=2, resultclass=Result).run(unittest.defaultTestLoader.loadTestsFromTestCase(VerificationContract))
    if args.output:
        current.write_json(args.output, dict(tests=result.testsRun, failures=len(result.failures), errors=len(result.errors), cases=statuses))
    raise SystemExit(0 if result.wasSuccessful() else 1)
