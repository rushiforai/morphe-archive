"""A force-stop barrier must observe process exit, including a delayed kernel exit."""
import ast
from pathlib import Path
from types import SimpleNamespace
import unittest


SCRIPT = Path(__file__).resolve().parents[1] / 'scripts/navigation-alerts/run_integrated_ownership_probe.py'
PACKAGE = 'org.ungoogled.android.apps.maps'


class ProcessStopTest(unittest.TestCase):
    script = SCRIPT
    def test_failed_stop_still_cleans_other_app_preferences(self):
        tree = ast.parse(self.script.read_text())
        main = next(node for node in tree.body if isinstance(node, ast.Try) and node.finalbody)
        loop = next(node for statement in main.finalbody for node in ast.walk(statement)
                    if isinstance(node, ast.For) and isinstance(node.iter, ast.Name) and node.iter.id == 'inputs')
        cleaned = []
        def device(*args):
            if args[-1] == PACKAGE:
                raise RuntimeError('fixture process could not stop')
        def restore(package):
            cleaned.append(package)
            return {'restored_exactly': True}
        namespace = {'inputs': ['nl.flitsmeister', PACKAGE, 'app.vela'], 'processes': {},
                     'device': device, 'assert_stopped': lambda *args, **kwargs: None,
                     'restore_preferences': restore, 'record': {}, 'failure': None}
        try:
            exec(compile(ast.Module(body=[loop], type_ignores=[]), str(self.script), 'exec'), namespace)
        except RuntimeError as error:
            self.fail(f'One failed app stop skipped remaining cleanup: {error}')
        self.assertEqual(['nl.flitsmeister', 'app.vela'], cleaned)
        self.assertIn('fixture process could not stop', namespace['failure'])

    def barrier(self, snapshots):
        function = next(node for node in ast.parse(self.script.read_text()).body
                        if isinstance(node, ast.FunctionDef) and node.name == 'assert_stopped')
        clock = SimpleNamespace(now=0.0)
        calls = []
        record = {}

        def sleep(seconds):
            clock.now += seconds

        def device(*args):
            calls.append(args)
            value = snapshots.pop(0) if len(snapshots) > 1 else snapshots[0]
            return SimpleNamespace(stdout=value)

        namespace = {'device': device, 'record': record,
                     'time': SimpleNamespace(monotonic=lambda: clock.now, sleep=sleep)}
        exec(compile(ast.Module(body=[function], type_ignores=[]), str(self.script), 'exec'), namespace)
        return namespace['assert_stopped'], clock, calls, record

    def test_delayed_exit_after_force_stop_is_observed_before_success(self):
        stop, clock, calls, record = self.barrier([
            f'UID PID STAT NAME\n10194 13647 R {PACKAGE}\n',
            f'UID PID STAT NAME\n10194 13647 Z {PACKAGE}\n',
            'UID PID STAT NAME\n10195 200 S unrelated.package\n'])
        try:
            stop(PACKAGE, wait_seconds=0.5)
        except Exception as error:
            self.fail(f'Delayed process exit was not observed: {error!r}')
        self.assertEqual(3, len(calls))
        self.assertGreater(clock.now, 0)
        observations = record['process_stop_observations'][-1]
        self.assertEqual(PACKAGE, observations['package'])
        self.assertTrue(observations['stopped'])
        self.assertTrue(observations['samples'][0]['processes'])
        self.assertEqual([], observations['samples'][-1]['processes'])

    def test_live_child_process_times_out_without_more_kill_commands(self):
        stop, clock, calls, record = self.barrier([
            f'UID PID STAT NAME\n10194 13647 S {PACKAGE}:worker\n'])
        with self.assertRaisesRegex(AssertionError, 'process is still alive'):
            stop(PACKAGE, wait_seconds=0.2)
        self.assertAlmostEqual(0.2, clock.now)
        self.assertFalse(record['process_stop_observations'][-1]['stopped'])
        self.assertTrue(all(call[:2] == ('shell', 'ps') for call in calls))

    def test_baseline_admission_remains_immediate(self):
        stop, clock, calls, _ = self.barrier([
            f'UID PID STAT NAME\n10194 13647 S {PACKAGE}\n'])
        with self.assertRaisesRegex(AssertionError, 'process is still alive'):
            stop(PACKAGE)
        self.assertEqual(0, clock.now)
        self.assertEqual(1, len(calls))

    def test_similar_package_name_is_not_the_target(self):
        stop, _, _, _ = self.barrier([
            f'UID PID STAT NAME\n10194 13647 S {PACKAGE}.other\n'])
        stop(PACKAGE)


class ProviderProcessStopTest(ProcessStopTest):
    script = SCRIPT.with_name('run_provider_restart_probe.py')


if __name__ == '__main__':
    unittest.main()
