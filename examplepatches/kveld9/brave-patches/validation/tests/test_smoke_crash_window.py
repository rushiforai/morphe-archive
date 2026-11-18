"""
Unit Tests for the crash-window bounds used by the physical smoke installer.

Focus: the logcat window is expressed in device time. A host-clock fallback silently
mis-bounds it and turns a real crash into a PASS.
"""

import contextlib
import io
import subprocess
import unittest
from unittest.mock import patch

import validation.smoke_install as smoke


def _completed(stdout: str) -> subprocess.CompletedProcess:
    return subprocess.CompletedProcess(args=[], returncode=0, stdout=stdout, stderr="")


class TestDeviceEpoch(unittest.TestCase):

    def test_numeric_device_clock_is_used_as_is(self):
        with patch.object(smoke, "run_cmd", return_value=_completed("1759276800\n")):
            self.assertEqual(smoke.record_device_epoch("serial"), "1759276800")

    def test_unreadable_clock_aborts_instead_of_substituting_the_host_clock(self):
        with patch.object(smoke, "run_cmd", return_value=_completed("date: illegal option\n")):
            buf = io.StringIO()
            with contextlib.redirect_stderr(buf):
                with self.assertRaises(SystemExit) as ctx:
                    smoke.record_device_epoch("serial")
        self.assertEqual(ctx.exception.code, 2)
        self.assertIn("could not read the device clock", buf.getvalue().lower().replace("could not", "could not"))

    def test_empty_clock_output_aborts(self):
        with patch.object(smoke, "run_cmd", return_value=_completed("")):
            with contextlib.redirect_stderr(io.StringIO()):
                with self.assertRaises(SystemExit) as ctx:
                    smoke.record_device_epoch("serial")
        self.assertEqual(ctx.exception.code, 2)


if __name__ == "__main__":
    unittest.main()