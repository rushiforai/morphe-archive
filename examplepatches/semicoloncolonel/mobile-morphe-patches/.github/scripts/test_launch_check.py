"""Tests for launch_check.py: a framework restart is not blamed on the app.

Run from the repository root: python3 -m unittest discover -s .github/scripts -p 'test_*.py'
"""

import unittest
from unittest import mock

import launch_check

PACKAGE = "com.example.app"
CRASH_LOG = f"""--------- beginning of crash
E AndroidRuntime: FATAL EXCEPTION: main
E AndroidRuntime: Process: {PACKAGE}, PID: 4242
E AndroidRuntime: java.lang.IllegalStateException: boom
"""


class VerdictTest(unittest.TestCase):
    def test_running_app_opened(self):
        self.assertEqual(launch_check.verdict(PACKAGE, 20, "4242", "", False),
                         "opened and was still running after 20 seconds")

    def test_gone_app_closed(self):
        self.assertTrue(launch_check.verdict(PACKAGE, 20, "", "", False).startswith("closed"))

    def test_crash_in_log(self):
        result = launch_check.verdict(PACKAGE, 20, "", CRASH_LOG, False)
        self.assertTrue(result.startswith("crashed on launch"))
        self.assertIn("IllegalStateException", result)

    def test_crash_of_another_app_is_ignored(self):
        log = CRASH_LOG.replace(PACKAGE, "com.android.systemui")
        self.assertEqual(launch_check.verdict(PACKAGE, 20, "4242", log, False),
                         "opened and was still running after 20 seconds")

    def test_restart_wins_over_closed_and_crashed(self):
        self.assertEqual(launch_check.verdict(PACKAGE, 20, "", "", True), launch_check.RESTARTED)
        self.assertEqual(launch_check.verdict(PACKAGE, 20, "", CRASH_LOG, True), launch_check.RESTARTED)

    def test_restart_is_not_a_failure(self):
        # main() treats these prefixes as a failure that needs a manual check.
        self.assertFalse(launch_check.RESTARTED.startswith(("crashed", "closed", "did not install")))


class RestartedSinceTest(unittest.TestCase):
    def check(self, before, now):
        with mock.patch.object(launch_check, "framework", return_value=now):
            return launch_check.restarted_since(before)

    def test_same_framework(self):
        self.assertFalse(self.check(("3", "100"), ("3", "100")))

    def test_new_process(self):
        self.assertTrue(self.check(("3", "100"), ("4", "200")))

    def test_new_start_count_alone(self):
        self.assertTrue(self.check(("3", "100"), ("4", "100")))

    def test_down_before_and_after(self):
        # Run 45493658715: Peacock's install failed while system_server was down,
        # and both reads came back empty.
        self.assertTrue(self.check(("3", ""), ("3", "")))

    def test_down_now(self):
        self.assertTrue(self.check(("3", "100"), ("3", "")))


class StableSystemTest(unittest.TestCase):
    def run_with(self, pids, settle=10, timeout=60):
        clock = [0.0]
        pid_iter = iter(pids)
        last = [pids[0]]

        def pid():
            last[0] = next(pid_iter, last[0])
            return last[0]

        def sleep(seconds):
            clock[0] += seconds

        package_service = mock.Mock(stdout="package:/system/framework/framework-res.apk")
        with mock.patch.object(launch_check, "system_server", pid), \
                mock.patch.object(launch_check, "adb", return_value=package_service), \
                mock.patch.object(launch_check.time, "time", lambda: clock[0]), \
                mock.patch.object(launch_check.time, "sleep", sleep):
            return launch_check.wait_for_stable_system(settle=settle, timeout=timeout)

    def test_steady_pid_is_stable(self):
        self.assertTrue(self.run_with(["100"]))

    def test_restart_loop_never_settles(self):
        # A new system_server every 5 seconds, as on the Android 17 image.
        self.assertFalse(self.run_with([str(n) for n in range(100, 200)]))

    def test_settles_after_restarts_stop(self):
        self.assertTrue(self.run_with(["100", "", "101", "101"]))


if __name__ == "__main__":
    unittest.main()
