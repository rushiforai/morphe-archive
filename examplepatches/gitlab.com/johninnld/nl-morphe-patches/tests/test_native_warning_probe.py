"""Native spikes must bind original bytes and the explicitly owned emulator."""
import importlib.util
import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import unittest
import zipfile

SCRIPT = Path(__file__).resolve().parents[1] / 'scripts/navigation-alerts/run_native_probe.py'


class NativeWarningProbeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.api = None
        if SCRIPT.exists():
            spec = importlib.util.spec_from_file_location('native_warning_probe', SCRIPT)
            cls.api = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(cls.api)

    def require_api(self):
        self.assertIsNotNone(self.api, 'Native runtime probe runner is not implemented')
        return self.api

    def test_device_checks_reject_physical_or_another_tasks_emulator(self):
        api = self.require_api()
        with self.assertRaises(ValueError):
            api.verify_emulator('physical-device', '1', 'native_warnings_api34\nOK')
        with self.assertRaises(ValueError):
            api.verify_emulator('emulator-5580', '0', 'native_warnings_api34\nOK')
        with self.assertRaises(ValueError):
            api.verify_emulator('emulator-5570', '1', 'flitsmeister15_api34\nOK')
        with self.assertRaises(ValueError):
            api.verify_emulator('emulator-5570', '1', 'native_warnings_api34\nOK')
        api.verify_emulator('emulator-5580', '1', 'native_warnings_api34\nOK\n')

    def test_failed_rerun_cannot_leave_a_current_success_report(self):
        api = self.require_api()
        self.assertTrue(hasattr(api, 'prepare_output'), 'Stale native evidence is not archived')
        with tempfile.TemporaryDirectory() as tmp:
            output = Path(tmp)
            (output / 'result.json').write_text('{"probe_completed":true,"old":true}')
            (output / 'instrumentation.txt').write_text('previous successful instrumentation')
            run_id = api.prepare_output(output)
            self.assertTrue(run_id)
            self.assertFalse((output / 'result.json').exists())
            self.assertFalse((output / 'instrumentation.txt').exists())
            archives = list((output / 'previous-runs').iterdir())
            self.assertEqual(len(archives), 1)
            self.assertTrue(json.loads((archives[0] / 'result.json').read_text())['old'])
            self.assertIn('previous successful', (archives[0] / 'instrumentation.txt').read_text())

    def test_resigning_may_change_signature_entries_but_never_target_code(self):
        api = self.require_api()
        with tempfile.TemporaryDirectory() as tmp:
            original, signed = Path(tmp) / 'original.apk', Path(tmp) / 'signed.apk'
            def write(path, code, manifest=b'original-manifest'):
                with zipfile.ZipFile(path, 'w') as z:
                    z.writestr('classes.dex', code)
                    z.writestr('AndroidManifest.xml', manifest)
                    z.writestr('resources.arsc', b'original-resources')
                    z.writestr('META-INF/CERT.RSA', path.name)
                    if path == original:
                        z.writestr('stamp-cert-sha256', b'original-source-stamp')
            write(original, b'original-dex')
            write(signed, b'original-dex')
            api.verify_resigned(original, signed)
            write(signed, b'modified-dex')
            with self.assertRaisesRegex(ValueError, 'classes.dex'):
                api.verify_resigned(original, signed)
            write(signed, b'original-dex', b'modified-manifest')
            with self.assertRaisesRegex(ValueError, 'AndroidManifest.xml'):
                api.verify_resigned(original, signed)

    def test_resigning_may_omit_only_empty_directory_records(self):
        api = self.require_api()
        payloads = {'classes.dex': b'original-dex', 'resources.arsc': b'resources',
                    'lib/arm64-v8a/libmaplibre.so': b'original-native-library'}
        with tempfile.TemporaryDirectory() as tmp:
            original, signed = Path(tmp) / 'original.apk', Path(tmp) / 'signed.apk'

            def write(path, files, directories=()):
                with zipfile.ZipFile(path, 'w') as archive:
                    for name, data in [*directories, *files.items()]:
                        archive.writestr(name, data)

            write(original, payloads, [('lib/', b''), ('lib/arm64-v8a/', b'')])
            write(signed, payloads)
            api.verify_resigned(original, signed)
            for name in payloads:
                with self.subTest(missing=name):
                    write(signed, {key: value for key, value in payloads.items() if key != name})
                    with self.assertRaisesRegex(ValueError, re.escape(name)):
                        api.verify_resigned(original, signed)
                with self.subTest(changed=name):
                    write(signed, {**payloads, name: b'changed-payload'})
                    with self.assertRaisesRegex(ValueError, re.escape(name)):
                        api.verify_resigned(original, signed)
            for destination in [original, signed]:
                with self.subTest(nonempty_directory=destination.name):
                    write(original, payloads)
                    write(signed, payloads)
                    write(destination, payloads, [('lib/', b'nonempty-directory-data')])
                    with self.assertRaisesRegex(ValueError, 'directory'):
                        api.verify_resigned(original, signed)

    def test_missing_or_incomplete_instrumentation_is_never_accepted(self):
        api = self.require_api()
        for text in ['', 'INSTRUMENTATION_CODE: -1',
                     'INSTRUMENTATION_RESULT: native_warning_result={"probe_completed":false}',
                     'INSTRUMENTATION_RESULT: native_warning_result={"probe_completed":true,"probe_status":"failed","process_uid":10123,"target_uid":10123}',
                     'INSTRUMENTATION_RESULT: native_warning_result={"probe_completed":true,"status":"blocked","process_uid":10123,"target_uid":10123}',
                     'INSTRUMENTATION_RESULT: native_warning_result={"probe_completed":true,"process_uid":2000,"target_uid":10123}']:
            with self.subTest(text=text), self.assertRaises(ValueError):
                api.parse_result(text)
        value = {'probe_completed': True, 'process_uid': 10123, 'target_uid': 10123}
        text = 'INSTRUMENTATION_RESULT: native_warning_result=' + json.dumps(value)
        self.assertEqual(api.parse_result(text), value)
        for case in [{'observation_timed_out': True}, {'native_callback_forward_failures': 1},
                     {'terminal_callback': 'onError'}]:
            broken = dict(value, cases=[case])
            with self.subTest(case=case), self.assertRaises(ValueError):
                api.parse_result('INSTRUMENTATION_RESULT: native_warning_result=' + json.dumps(broken))

    @unittest.skipUnless(shutil.which('javac') and shutil.which('java'), 'JDK needed for private closure-fence host checks')
    def test_private_closure_fence_lifecycle_and_identity(self):
        root = SCRIPT.parents[2]
        with tempfile.TemporaryDirectory() as tmp:
            subprocess.run(['javac', '--release', '8', '-Xlint:-options', '-d', tmp,
                            str(root / 'scripts/navigation-alerts/probe/TaggedSpeechFence.java'),
                            str(root / 'tests/host-navigation/TaggedSpeechFenceTest.java')],
                           check=True, capture_output=True, text=True)
            result = subprocess.run(['java', '-cp', tmp, 'TaggedSpeechFenceTest'],
                                    check=True, capture_output=True, text=True)
            self.assertIn('PASS TaggedSpeechFenceTest', result.stdout)


if __name__ == '__main__':
    unittest.main()
