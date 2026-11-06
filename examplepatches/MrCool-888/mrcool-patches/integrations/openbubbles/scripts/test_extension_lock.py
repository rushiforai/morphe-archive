import pathlib
import shutil
import subprocess
import sys
import tempfile
import unittest


class ExtensionLockTest(unittest.TestCase):
    def test_source_changes_and_binary_changes_fail_closed(self):
        with tempfile.TemporaryDirectory() as directory:
            repo = pathlib.Path(directory)
            integration = repo / 'integrations/openbubbles'
            integration.mkdir(parents=True)
            script = integration / 'verify-extension.py'
            shutil.copyfile(pathlib.Path(__file__).resolve().parents[1] / script.name, script)
            source = integration / 'bridge/src/main/Bridge.java'
            source.parent.mkdir(parents=True)
            source.write_bytes(b'class Bridge {}\r\n')
            generated = integration / 'extension/build/morphe/openbubbles-wear.mpe'
            generated.parent.mkdir(parents=True)
            generated.write_bytes(b'test extension')

            def run(*args):
                return subprocess.run([sys.executable, str(script), *args], capture_output=True)

            self.assertEqual(run('--refresh').returncode, 0)
            source.write_bytes(b'class Bridge {}\n')
            self.assertEqual(run().returncode, 0, 'Line endings must not invalidate the lock')
            source.write_bytes(b'class Changed {}\n')
            self.assertNotEqual(run().returncode, 0, 'Changed source must require a rebuild')
            source.write_bytes(b'class Bridge {}\n')
            artifact = repo / 'patches/src/main/resources/openbubbles-wear.mpe'
            artifact.write_bytes(b'tampered')
            self.assertNotEqual(run().returncode, 0, 'Changed binary must fail verification')


if __name__ == '__main__':
    unittest.main()
