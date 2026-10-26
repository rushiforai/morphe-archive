"""Exercise the distributed Windows frontends in fresh processes with controlled children."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch
import verify_current as current

ROOT = Path(__file__).resolve().parents[1]


class ManifestContract(unittest.TestCase):
    def test_nested_entry_is_fingerprinted_and_history_is_not(self):
        with tempfile.TemporaryDirectory(dir=ROOT / 'work/temp') as tmp:
            root = Path(tmp)
            files = ['tools/workspace/dev.ps1', 'tools/n37/old.ps1', '.devenv/private.ps1']
            for name in files:
                p = root / name
                p.parent.mkdir(parents=True, exist_ok=True)
                p.write_text('fixture')
            with patch.object(current, 'ROOT', root), patch.object(current, 'git', return_value='\0'.join(files)):
                before = current.source_manifest()
                self.assertEqual(['tools/workspace/dev.ps1'], [x['path'] for x in before['files']])
                (root / files[0]).write_text('changed')
                self.assertNotEqual(before['sha256'], current.source_manifest()['sha256'])


@unittest.skipUnless(os.name == 'nt', 'Windows frontends require Windows PowerShell 5.1')
class FrontendContract(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        base = ROOT / 'work/temp'
        base.mkdir(parents=True, exist_ok=True)
        cls.root = Path(tempfile.mkdtemp(prefix='workspace-contract-', dir=base))
        shutil.copytree(ROOT / 'tools/workspace', cls.root / 'tools/workspace')
        shutil.copyfile(ROOT / 'tools/Verify.ps1', cls.root / 'tools/Verify.ps1')
        shutil.copyfile(ROOT / 'tools/Enter-Workspace.ps1', cls.root / 'tools/Enter-Workspace.ps1')
        # Only child boundaries are substitutes; actual PS initialization and forwarding run.
        (cls.root / 'tools/check_localization.py').write_text('import os,sys; sys.exit(int(os.getenv("FIXTURE_LOCALIZATION_EXIT","0")))')
        (cls.root / 'tools/verify_current.py').write_text('import os,sys,json,pathlib; pathlib.Path("received.json").write_text(json.dumps(sys.argv[1:])); sys.exit(int(os.getenv("FIXTURE_CHILD_EXIT","0")))')
        (cls.root / 'gradlew.bat').write_text('@echo off\n"%MORPHE_TASK_PYTHON%" tools/verify_current.py %*\nexit /b %ERRORLEVEL%\n')
        cls.env = dict(os.environ)
        cls.env.update(JAVA_HOME=os.environ.get('JAVA_HOME', str(ROOT / 'work/toolchain/jdk-21')),
                       ANDROID_HOME=os.environ.get('ANDROID_HOME', str(ROOT / 'work/toolchain/android-sdk')),
                       MORPHE_TASK_PYTHON=sys.executable,
                       MORPHE_ROBOLECTRIC_DIR=os.environ.get('MORPHE_ROBOLECTRIC_DIR', str(ROOT / 'work/toolchain/robolectric')),
                       GRADLE_USER_HOME=str(cls.root / 'work/gradle-home'))
        cls.env['ANDROID_SDK_ROOT'] = cls.env['ANDROID_HOME']
        # A dummy secret is injected to check that neither logs nor generated files expose it.
        cls.secret = 'm7a_contract_secret_do_not_print_75f820'
        cls.env.update(GITHUB_ACTOR='contract-only', GITHUB_TOKEN=cls.secret, GH_TOKEN=cls.secret, DEEPSEEK_API_KEY=cls.secret)

    def run_entry(self, entry, args=(), overrides=None):
        env = dict(self.env, **(overrides or {}))
        command = 'cmd.exe /d /s /c "' + subprocess.list2cmdline([str(self.root / 'tools/workspace' / entry), *args]) + '"'
        result = subprocess.run(command,
                                cwd=ROOT, env=env, capture_output=True, text=True, errors='replace')
        self.assertNotIn(self.secret, result.stdout + result.stderr)
        return result

    def test_daily_defaults_and_child_exit_propagation(self):
        r = self.run_entry('dev.cmd', overrides={'FIXTURE_CHILD_EXIT': '37'})
        self.assertEqual(37, r.returncode, r.stdout + r.stderr)
        received = json.loads((self.root / 'received.json').read_text())
        self.assertEqual(list(current.TEST_TASKS), received[:2])
        self.assertIn('-Ptranslation.live=false', received)

    def test_daily_forwards_one_spaced_gradle_property(self):
        r = self.run_entry('dev.cmd', [':patches:buildAndroid', '-Pfixture.message=two words', '--offline'])
        self.assertEqual(0, r.returncode, r.stdout + r.stderr)
        received = json.loads((self.root / 'received.json').read_text())
        self.assertEqual([':patches:buildAndroid', '-Pfixture.message=two words', '--offline'], received[:3])

    def test_localization_failure_does_not_run_gradle(self):
        target = self.root / 'received.json'
        target.unlink(missing_ok=True)
        r = self.run_entry('dev.cmd', overrides={'FIXTURE_LOCALIZATION_EXIT': '19'})
        self.assertEqual(19, r.returncode, r.stdout + r.stderr)
        self.assertFalse(target.exists())

    def test_full_forwards_identity_mode_flags_and_exit(self):
        r = self.run_entry('verify-full.cmd', ['-RunId', 'contract-01', '-Mode', 'release', '-ExpectedVersion', '1.5.8',
                          '-ExpectedBuildId', 'release-1.5.8', '-EvidenceDirectory', str(self.root / 'evidence with spaces'),
                          '-Offline', '-RerunTests'], {'FIXTURE_CHILD_EXIT': '23'})
        self.assertEqual(23, r.returncode, r.stdout + r.stderr)
        received = json.loads((self.root / 'received.json').read_text())
        self.assertEqual(['--mode', 'release', '--run-id', 'contract-01', '--evidence-dir', str(self.root / 'evidence with spaces'),
                          '--version', '1.5.8', '--build-id', 'release-1.5.8', '--offline', '--rerun-tests'], received)

    def test_missing_jdk_does_not_fallback(self):
        r = self.run_entry('dev.cmd', overrides={'JAVA_HOME': str(self.root / 'absent-jdk')})
        self.assertNotEqual(0, r.returncode)
        self.assertIn('JDK 21 missing', r.stdout + r.stderr)

    def test_conflicting_sdk_inputs_rejected(self):
        r = self.run_entry('dev.cmd', overrides={'ANDROID_SDK_ROOT': str(self.root / 'other-sdk')})
        self.assertNotEqual(0, r.returncode)
        self.assertIn('ANDROID_HOME and ANDROID_SDK_ROOT disagree', r.stdout + r.stderr)

    def test_missing_sdk_does_not_fallback(self):
        r = self.run_entry('dev.cmd', overrides={'ANDROID_HOME': str(self.root / 'absent-sdk'), 'ANDROID_SDK_ROOT': ''})
        self.assertNotEqual(0, r.returncode)
        self.assertIn('Android SDK input missing', r.stdout + r.stderr)

    def test_missing_python_does_not_search_path(self):
        r = self.run_entry('dev.cmd', overrides={'MORPHE_TASK_PYTHON': str(self.root / 'missing.exe')})
        self.assertNotEqual(0, r.returncode)
        self.assertIn('Python 3.12 missing', r.stdout + r.stderr)

    def test_missing_robolectric_is_explicit(self):
        r = self.run_entry('dev.cmd', overrides={'MORPHE_ROBOLECTRIC_DIR': str(self.root / 'missing-jars')})
        self.assertNotEqual(0, r.returncode)
        self.assertIn('Robolectric SDK jar missing', r.stdout + r.stderr)

    def test_missing_package_settings_have_readable_error(self):
        r = self.run_entry('dev.cmd', overrides={'GITHUB_ACTOR': '', 'GITHUB_TOKEN': ''})
        self.assertNotEqual(0, r.returncode)
        self.assertIn('Morphe package settings missing', r.stdout + r.stderr)

    def test_writable_cache_on_c_refused(self):
        r = self.run_entry('dev.cmd', overrides={'GRADLE_USER_HOME': 'C:/must-not-create-m7a'})
        self.assertNotEqual(0, r.returncode)
        self.assertIn('must be on E:', r.stdout + r.stderr)
        self.assertFalse(Path('C:/must-not-create-m7a').exists())

    def test_proxy_credentials_are_not_echoed(self):
        r = self.run_entry('dev.cmd', overrides={'HTTPS_PROXY': 'http://user:' + self.secret + '@127.0.0.1:8888'})
        self.assertNotEqual(0, r.returncode)
        self.assertIn('without embedded credentials', r.stdout + r.stderr)

    def test_no_credentials_written_and_no_gradle_settings_overwrite(self):
        props = self.root / 'work/gradle-home/gradle.properties'
        props.parent.mkdir(parents=True, exist_ok=True)
        props.write_bytes(b'# sentinel: keep caller settings\n')
        self.assertEqual(0, self.run_entry('verify-full.cmd').returncode)
        self.assertEqual(b'# sentinel: keep caller settings\n', props.read_bytes())
        for path in self.root.rglob('*'):
            if path.is_file():
                self.assertNotIn(self.secret.encode(), path.read_bytes(), str(path))

    def test_source_compatibility_alias_forwards_and_propagates(self):
        r = subprocess.run(['powershell.exe', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File',
                            str(self.root / 'tools/Verify.ps1'), '-RunId', 'alias-01', '-Offline'], cwd=ROOT,
                           env=dict(self.env, FIXTURE_CHILD_EXIT='31'), capture_output=True, text=True)
        self.assertEqual(31, r.returncode, r.stdout + r.stderr)
        self.assertEqual(['--mode', 'candidate', '--run-id', 'alias-01', '--offline'], json.loads((self.root / 'received.json').read_text()))
        r = subprocess.run(['powershell.exe', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File',
                            str(self.root / 'tools/Enter-Workspace.ps1')], cwd=ROOT, env=self.env, capture_output=True, text=True)
        self.assertEqual(0, r.returncode, r.stdout + r.stderr)
        self.assertNotIn(self.secret, r.stdout + r.stderr)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    (ROOT / 'work/temp').mkdir(parents=True, exist_ok=True)
    result = unittest.TextTestRunner(verbosity=2).run(unittest.defaultTestLoader.loadTestsFromModule(sys.modules[__name__]))
    if args.output:
        args.output.write_text(json.dumps(dict(tests=result.testsRun, failures=len(result.failures), errors=len(result.errors),
                                              skipped=len(result.skipped), success=result.wasSuccessful()), indent=2))
    raise SystemExit(0 if result.wasSuccessful() else 1)
