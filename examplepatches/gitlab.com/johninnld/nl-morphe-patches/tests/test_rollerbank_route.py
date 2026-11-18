"""Run the exact En Route helper source through the emitted-instruction fixture VM."""
from pathlib import Path
import re
import textwrap
import unittest

from rollerbank_route import MARKER, ROUTE, STATIC_KEY, run_initializer, verify_initializer, verify_notification_flow


class RollerbankRouteTest(unittest.TestCase):
    def code(self, name):
        path = Path(__file__).resolve().parents[1] / 'patches/src/main/kotlin/patches/rollerbank/EnRoutePatch.kt'
        self.assertTrue(path.exists(), 'En Route patch source is missing')
        match = re.search(r'private val ' + name + r' = """(.*?)"""', path.read_text(), re.S)
        self.assertIsNotNone(match, 'Missing executable En Route helper source')
        return textwrap.dedent(match[1]).replace("${'$'}", '$').replace('$ROUTE', ROUTE)

    def helper(self):
        return self.code('ROUTE_INITIALIZER_CODE')

    def test_one_time_migration_and_android_permission_matrix(self):
        verify_initializer(self.helper())

    def test_marker_guard_is_behaviorally_required(self):
        body = re.sub(r'if-nez v2, :done', 'nop', self.helper())
        with self.assertRaisesRegex(AssertionError, 'Later user disabling'):
            verify_initializer(body)

    def test_existing_disabled_setting_is_migrated(self):
        prefs = {STATIC_KEY: 0}
        requests, writes = run_initializer(self.helper(), prefs, 32, False)
        self.assertEqual(prefs, {STATIC_KEY: 1, MARKER: 1})
        self.assertFalse(requests)
        self.assertEqual(len(writes), 1)

    def test_notification_prompt_waits_for_location_then_resumes_after_decision(self):
        verify_notification_flow(self.code('ROUTE_NOTIFICATION_GATE_CODE'), self.code('ROUTE_PERMISSION_CALLBACK_CODE'))

    def test_pending_prompt_cannot_be_bypassed_by_native_reentry(self):
        gate = self.code('ROUTE_NOTIFICATION_GATE_CODE').replace('if-nez v0, :not_ready', 'nop', 1)
        with self.assertRaisesRegex(AssertionError, 'outstanding prompt'):
            verify_notification_flow(gate, self.code('ROUTE_PERMISSION_CALLBACK_CODE'))

    def test_native_permission_result_must_reach_inherited_callback(self):
        callback = self.code('ROUTE_PERMISSION_CALLBACK_CODE').replace(
            'invoke-super {p0, p1, p2, p3}, Lyj;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V', 'nop')
        with self.assertRaisesRegex(AssertionError, 'inherited native permission'):
            verify_notification_flow(self.code('ROUTE_NOTIFICATION_GATE_CODE'), callback)


if __name__ == '__main__':
    unittest.main()
