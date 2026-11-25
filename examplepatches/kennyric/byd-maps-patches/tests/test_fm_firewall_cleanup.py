import importlib.util
from pathlib import Path
import unittest

SPEC = importlib.util.spec_from_file_location('fm_cleanup', Path(__file__).resolve().parents[1] / 'scripts/navigation-alerts/run_fm_capture_probe.py')
MOD = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MOD)

class FirewallCleanupTest(unittest.TestCase):
    before = '*mangle\n:INPUT ACCEPT [1:10]\n-A routectrl_mangle_INPUT -i wlan0 -j MARK --set-xmark 0x30065/0xffefffff\nCOMMIT\n*filter\n:OUTPUT ACCEPT [1:10]\nCOMMIT\n'
    def test_counters_and_independent_netd_interface_marks_are_not_rolled_back(self):
        after = self.before.replace('[1:10]', '[9:99]').replace('0x30065', '0x30066')
        self.assertEqual(1, len(MOD.firewall_cleanup_changes(self.before, after, 'NWFM_test')))
    def test_remaining_owned_rule_fails(self):
        with self.assertRaisesRegex(RuntimeError, 'remains'):
            MOD.firewall_cleanup_changes(self.before, self.before.replace('COMMIT', '-A OUTPUT -j NWFM_test\nCOMMIT', 1), 'NWFM_test')
    def test_any_changed_filter_rule_fails(self):
        with self.assertRaisesRegex(RuntimeError, 'filter'):
            MOD.firewall_cleanup_changes(self.before, self.before.replace(':OUTPUT ACCEPT', ':OUTPUT DROP'), 'NWFM_test')
    def test_unrelated_mangle_rule_change_fails(self):
        with self.assertRaisesRegex(RuntimeError, 'Unexpected mangle'):
            MOD.firewall_cleanup_changes(self.before, self.before.replace(':INPUT ACCEPT', ':INPUT DROP'), 'NWFM_test')

    def idle_transition(self):
        mangle='-A idletimer_mangle_POSTROUTING -o wlan0 -j IDLETIMER --timeout 15 --label 1 --send_nl_msg\n'
        raw='*raw\n:PREROUTING ACCEPT [0:0]\n-A idletimer_raw_PREROUTING -i wlan0 -j IDLETIMER --timeout 15 --label 1 --send_nl_msg\nCOMMIT\n'
        before=self.before.replace('COMMIT',mangle+'COMMIT',1)+raw
        after=before.replace('wlan0 -j IDLETIMER --timeout 15 --label 1','eth0 -j IDLETIMER --timeout 10 --label 0')
        return before,after

    def test_captured_netd_wifi_to_ethernet_idle_transition_is_preserved(self):
        before,after=self.idle_transition()
        self.assertEqual(2,len(MOD.firewall_cleanup_changes(before,after,'NWFM_test')))

    def test_raw_rule_target_change_is_not_hidden_by_idle_exception(self):
        before,after=self.idle_transition()
        with self.assertRaisesRegex(RuntimeError,'Unexpected raw'):
            MOD.firewall_cleanup_changes(before,after.replace('idletimer_raw_PREROUTING -i eth0 -j IDLETIMER','idletimer_raw_PREROUTING -i eth0 -j DROP'),'NWFM_test')

    def test_unobserved_interface_or_timer_is_rejected(self):
        before,after=self.idle_transition()
        for changed in [after.replace('eth0','eth1'),after.replace('--timeout 10','--timeout 99')]:
            with self.subTest(rules=changed),self.assertRaisesRegex(RuntimeError,'Unexpected'):
                MOD.firewall_cleanup_changes(before,changed,'NWFM_test')

    def test_uid_fence_change_remains_a_failure_during_netd_transition(self):
        before,after=self.idle_transition()
        after=after.replace(':OUTPUT ACCEPT',':OUTPUT DROP')
        with self.assertRaisesRegex(RuntimeError,'filter'):
            MOD.firewall_cleanup_changes(before,after,'NWFM_test')
