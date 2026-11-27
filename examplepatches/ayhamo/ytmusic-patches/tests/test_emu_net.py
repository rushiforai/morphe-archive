"""Tests for scripts/emu_net.py: adb is never run, subprocess.run is a fake emulator."""
import importlib.util
import io
import subprocess
import sys
import tempfile
import unittest
from contextlib import redirect_stdout
from pathlib import Path
from unittest import mock

ROOT = Path(__file__).resolve().parent.parent
_spec = importlib.util.spec_from_file_location("emu_net", ROOT / "scripts" / "emu_net.py")
e = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(e)


class Clock:
    """time.time and time.sleep: sleeping moves the clock, nothing waits."""

    def __init__(self):
        self.now = 1000.0

    def time(self):
        return self.now

    def sleep(self, s):
        self.now += s


class Emulator:
    """A fake adb: answers the script's shell commands; while the network is off, every shell call
    times out (as on LDPlayer) and costs its timeout on the clock."""

    def __init__(self, clock, offline_for=0, script_finishes=True, watchdog_starts=True):
        self.clock = clock
        self.offline_until = None
        self.offline_for = offline_for
        self.script_finishes = script_finishes
        self.watchdog_starts = watchdog_starts
        self.wd = False
        self.log = []

    def __call__(self, cmd, capture_output=True, text=True, timeout=None):
        assert cmd[0] == e.ADB
        if cmd[1:] == ["devices"]:
            return subprocess.CompletedProcess(cmd, 0, f"List of devices attached\n{e.SERIAL}\tdevice\n", "")
        assert cmd[1:3] == ["-s", e.SERIAL], cmd
        args = cmd[3:]
        if args[0] != "shell":
            self.log.append(args[0])
            return subprocess.CompletedProcess(cmd, 0, "", "")
        sh = args[1]
        if self.offline_until is not None and self.clock.now < self.offline_until:
            self.clock.now += timeout
            raise subprocess.TimeoutExpired(cmd, timeout)
        out = ""
        if sh.startswith("cmd connectivity airplane-mode;"):
            out = "disabled\n" + ("wd" if self.wd else "nowd")
        elif "pgrep -P" in sh:
            self.log.append("stop watchdog")
            self.wd = False
        elif sh.startswith(f"nohup sh {e.WD_SCRIPT}"):
            self.log.append("start watchdog")
            self.wd = self.watchdog_starts
        elif sh.startswith("nohup sh /data/local/tmp/ayham_offtest.sh"):
            self.log.append("start test")
            if self.offline_for:
                self.offline_until = self.clock.now + 5 + self.offline_for
        elif sh.startswith(f"[ -f {e.OUT}/finished ]"):
            out = "finished" if self.script_finishes else ""
        elif sh.startswith("for p in $(ps"):
            self.log.append("kill test")
        elif sh == "cmd connectivity airplane-mode disable":
            self.log.append("network on")
        elif sh == "cmd connectivity airplane-mode enable":
            self.log.append("network off")
        return subprocess.CompletedProcess(cmd, 0, out + "\n", "")


class Base(unittest.TestCase):
    def setUp(self):
        self.clock = Clock()
        for p in (mock.patch.object(e.time, "time", self.clock.time), mock.patch.object(e.time, "sleep", self.clock.sleep)):
            p.start()
            self.addCleanup(p.stop)

    def emulator(self, **kw):
        emu = Emulator(self.clock, **kw)
        p = mock.patch.object(e.subprocess, "run", emu)
        p.start()
        self.addCleanup(p.stop)
        return emu

    def answer(self, stdout=None, timeout=False):
        def run(cmd, **kw):
            if timeout:
                raise subprocess.TimeoutExpired(cmd, kw.get("timeout"))
            return subprocess.CompletedProcess(cmd, 0, stdout, "")

        return mock.patch.object(e.subprocess, "run", run)


class StatusTest(Base):
    def test_parsed(self):
        with self.answer("enabled\nwd\n"):
            self.assertEqual(e.status(), ("enabled", True))
        with self.answer("disabled\nnowd"):
            self.assertEqual(e.status(), ("disabled", False))

    def test_cmd_error_leaves_only_the_watchdog_line(self):
        with self.answer("wd\n"):
            self.assertEqual(e.status(), ("?", True))
        with self.answer(""):
            self.assertEqual(e.status(), ("?", False))

    def test_dead_shell(self):
        with self.answer(timeout=True):
            self.assertIsNone(e.status())


class WaitBackTest(Base):
    def test_answers_at_once(self):
        with self.answer("disabled\nnowd"):
            self.assertEqual(e.wait_back(60), (0, ("disabled", False)))

    def test_comes_back(self):
        emu = self.emulator()
        emu.offline_until = self.clock.now + 45
        with redirect_stdout(io.StringIO()):
            waited, s = e.wait_back(300)
        # each try costs the 10 s shell timeout plus 10 s of sleep
        self.assertEqual(waited, 60)
        self.assertEqual(s, ("disabled", False))

    def test_gives_up(self):
        emu = self.emulator()
        emu.offline_until = self.clock.now + 10_000
        with redirect_stdout(io.StringIO()):
            self.assertIsNone(e.wait_back(100))
        self.assertLess(self.clock.now - 1000, 100 + 20)


class WatchdogTest(Base):
    def test_start_checks_it_is_armed(self):
        emu = self.emulator()
        self.assertTrue(e.start_watchdog(60))
        self.assertEqual(emu.log, ["stop watchdog", "push", "start watchdog"])

    def test_start_reports_failure(self):
        self.emulator(watchdog_starts=False)
        self.assertFalse(e.start_watchdog(60))

    def test_stop_kills_the_watchdog_before_its_sleep(self):
        cmds = []
        with mock.patch.object(e, "shell", lambda c, timeout=10: cmds.append(c)):
            e.stop_watchdog()
        sh = cmds[0]
        self.assertLess(sh.index("k=$(pgrep -P $w)"), sh.index("kill $w"))
        self.assertLess(sh.index("kill $w"), sh.index("kill $k"))
        self.assertTrue(sh.endswith(f"rm -f {e.WD_PID}"))

    def test_watchdog_script(self):
        self.assertIn(f"echo $$ > {e.WD_PID}", e.WATCHDOG)
        self.assertIn("sleep $1", e.WATCHDOG)
        self.assertLess(e.WATCHDOG.index("airplane-mode disable"), e.WATCHDOG.index(f"rm -f {e.WD_PID}"))


class MainTest(Base):
    def main(self, *argv):
        out = io.StringIO()
        code = 0
        with mock.patch.object(sys, "argv", ["emu_net.py", *argv]), redirect_stdout(out):
            try:
                e.main()
            except SystemExit as x:
                code = x.code
        return code, out.getvalue()

    def test_off_needs_the_watchdog(self):
        emu = self.emulator(watchdog_starts=False)
        code, _ = self.main("off")
        self.assertIn("watchdog did not start", code)
        self.assertNotIn("network off", emu.log)

    def test_off(self):
        emu = self.emulator()
        code, out = self.main("off", "--minutes", "0.5")
        self.assertEqual(code, 0)
        self.assertEqual(emu.log[-2:], ["start watchdog", "network off"])
        self.assertIn("in 60 s", out)  # at least a minute

    def test_run(self):
        emu = self.emulator(offline_for=90)
        with tempfile.TemporaryDirectory() as d:
            code, out = self.main("run", "test.sh", "--minutes", "3", "--out", d)
        self.assertEqual(code, 0)
        self.assertIn("script: finished", out)
        log = emu.log
        self.assertLess(log.index("start watchdog"), log.index("start test"))
        # the test is stopped before the watchdog, and the run ends with the network on and the
        # watchdog gone
        self.assertLess(log.index("kill test"), len(log) - 1 - log[::-1].index("stop watchdog"))
        self.assertLess(log.index("kill test"), log.index("network on"))
        self.assertFalse(emu.wd)
        self.assertEqual(log[-1], "pull")

    def test_run_waits_for_the_finished_file(self):
        # adb answers at the first check (the script hasn't turned the network off yet): the run
        # keeps waiting for the finished file instead of stopping the watchdog under it
        emu = self.emulator(script_finishes=False)
        with tempfile.TemporaryDirectory() as d:
            code, out = self.main("run", "test.sh", "--minutes", "1", "--out", d)
        self.assertEqual(code, 0)
        self.assertIn("NOT finished", out)
        self.assertGreaterEqual(self.clock.now - 1000, 60 + 60)

    def test_run_without_watchdog_does_not_start_the_test(self):
        emu = self.emulator(watchdog_starts=False)
        with tempfile.TemporaryDirectory() as d:
            code, _ = self.main("run", "test.sh", "--out", d)
        self.assertIn("test not run", code)
        self.assertNotIn("start test", emu.log)

    def test_not_connected(self):
        with self.answer("List of devices attached\n"):
            code, _ = self.main("status")
        self.assertIn("not connected", code)


if __name__ == "__main__":
    unittest.main()
