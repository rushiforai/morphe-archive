"""Offline admission checks: never contact a device while testing profiles."""
import importlib.util
from pathlib import Path
import unittest


SCRIPT=Path(__file__).resolve().parents[1]/'scripts/navigation-alerts/run_integrated_maps_probe.py'
SPEC=importlib.util.spec_from_file_location('integrated_maps_profile',SCRIPT)
MODULE=importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


class IntegratedMapsProfileTest(unittest.TestCase):
    def test_only_exact_new_owned_cohort_is_admitted(self):
        self.assertEqual(MODULE.verify_emulator_profile('emulator-5590','1\n','native_warnings_ui_api34\nOK\n','34\n'),'native_warnings_ui_api34')

    def test_other_threads_and_usb_are_rejected_even_if_properties_look_owned(self):
        for serial in ('emulator-5580','emulator-5582','emulator-5584','usb-phone','192.0.2.4:5555'):
            with self.subTest(serial=serial),self.assertRaises(ValueError):
                MODULE.verify_emulator_profile(serial,'1','native_warnings_ui_api34','34')

    def test_exact_name_api_and_qemu_are_all_required(self):
        for qemu,name,sdk in [('0','native_warnings_ui_api34','34'),('1','native_warnings_api34','34'),('1','native_warnings_ui_api34-backup','34'),('1','native_warnings_ui_api34','35'),('1','native_warnings_ui_api34\nsecond-avd\nOK','34')]:
            with self.subTest(qemu=qemu,name=name,sdk=sdk),self.assertRaises(ValueError):
                MODULE.verify_emulator_profile('emulator-5590',qemu,name,sdk)


if __name__=='__main__':
    unittest.main()
