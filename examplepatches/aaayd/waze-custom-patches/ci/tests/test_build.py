"""Builder diagnostics must survive subprocess validation failures."""
import io
import subprocess
import sys
import unittest
from contextlib import redirect_stdout
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build


class CommandDiagnosticsTests(unittest.TestCase):
    def test_captured_success_returns_output(self):
        with redirect_stdout(io.StringIO()):
            output = build.run(sys.executable, "-c", "print('validated')", capture=True)
        self.assertEqual(output.strip(), "validated")

    def test_captured_output_uses_utf8_independent_of_windows_code_page(self):
        # UTF-8 for U+010D includes 0x8d, which is undefined in Windows cp1252.
        with redirect_stdout(io.StringIO()):
            output = build.run(sys.executable, "-c",
                               "import sys; sys.stdout.buffer.write(bytes([0xc4, 0x8d]))",
                               capture=True)
        self.assertEqual(output, "\u010d")

    def test_captured_failure_logs_stdout_and_stderr_and_preserves_exit_code(self):
        log = io.StringIO()
        with redirect_stdout(log), self.assertRaises(subprocess.CalledProcessError) as failure:
            build.run(sys.executable, "-c",
                      "import sys; print('package mismatch'); print('signer rejected', file=sys.stderr); sys.exit(17)",
                      capture=True)
        self.assertEqual(failure.exception.returncode, 17)
        self.assertIn("package mismatch", failure.exception.stdout)
        self.assertIn("signer rejected", failure.exception.stdout)
        # These are output lines, not merely words in the logged command.
        self.assertIn("\npackage mismatch\n", log.getvalue())
        self.assertIn("\nsigner rejected\n", log.getvalue())


if __name__ == "__main__":
    unittest.main()
