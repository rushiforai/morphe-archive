"""Reject shared emulators and physical devices before any acceptance mutation."""
import importlib.util
from pathlib import Path
import unittest

SPEC=importlib.util.spec_from_file_location('integrated_vela_profile',Path(__file__).resolve().parents[1]/'scripts/navigation-alerts/run_integrated_vela_probe.py')
MODULE=importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)

class IntegratedVelaProfileTest(unittest.TestCase):
    def test_current_owned_cohort_is_admitted(self):
        self.assertEqual(MODULE.verify_emulator_profile('emulator-5590','1\n','native_warnings_ui_api34\nOK\n','34\n'),'native_warnings_ui_api34')

    def test_shared_devices_and_physical_targets_are_rejected(self):
        for serial in ('emulator-5580','emulator-5582','emulator-5584','usb-phone','192.0.2.4:5555'):
            with self.subTest(serial=serial),self.assertRaises(ValueError):
                MODULE.verify_emulator_profile(serial,'1','native_warnings_ui_api34','34')

    def test_exact_name_api_and_qemu_are_required(self):
        for qemu,name,sdk in [('0','native_warnings_ui_api34','34'),('1','native_warnings_vela_api34','34'),('1','native_warnings_ui_api34-backup','34'),('1','native_warnings_ui_api34','35'),('1','native_warnings_ui_api34\nsecond-avd\nOK','34')]:
            with self.subTest(qemu=qemu,name=name,sdk=sdk),self.assertRaises(ValueError):
                MODULE.verify_emulator_profile('emulator-5590',qemu,name,sdk)

if __name__=='__main__':unittest.main()
