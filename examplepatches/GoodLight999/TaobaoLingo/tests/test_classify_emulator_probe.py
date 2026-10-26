#!/usr/bin/env python3
"""Behavioral tests for the real-app emulator evidence classifier."""
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "scripts"))
from classify_emulator_probe import classify


LAUNCHER = (
    "<hierarchy><node package='com.google.android.apps.nexuslauncher' "
    "text='Home' /></hierarchy>"
)
TAOBAO = (
    "<hierarchy><node package='com.taobao.taobao' "
    "text='我的淘宝' /></hierarchy>"
)


class ProbeClassificationTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)

    def put(self, name, value):
        (self.root / name).write_text(value, encoding="utf-8")

    def test_install_failed_wrong_abi(self):
        self.put("install.txt", "Failure [INSTALL_FAILED_NO_MATCHING_ABIS]")
        self.assertEqual(classify(self.root)["state"], "INSTALL_FAILED")

    def test_original_launcher_screenshot_is_not_success(self):
        self.put("install.txt", "Success\n")
        self.put("process.txt", "456\n")
        self.put("home_ui.xml", LAUNCHER)
        state = classify(self.root)
        self.assertEqual(state["state"], "TAOBAO_UI_NOT_REACHED")
        self.assertFalse(state["taobao_ui_reached"])

    def test_app_dead_after_install(self):
        self.put("install.txt", "Success\n")
        self.put("process.txt", "\n")
        self.put("home_ui.xml", LAUNCHER)
        self.put("logcat.txt", "F libc : Fatal signal 6 (SIGABRT), code -1\n")
        state = classify(self.root)
        self.assertEqual(state["state"], "APP_NOT_RUNNING")
        self.assertEqual(state["observed_fatal_signals"], ["SIGABRT"])
        self.assertFalse(state["native_bridge_signal_abort"])

    def test_android_native_bridge_abort_is_identified(self):
        self.put("install.txt", "Success\n")
        self.put("logcat.txt", "Abort message: 'Cannot process signal 11'\n"
                 "libndk_translation.so (ndk_translation::HandleHostSignal)")
        state = classify(self.root)
        self.assertEqual(state["state"], "APP_NOT_RUNNING")
        self.assertTrue(state["native_bridge_signal_abort"])

    def test_taobao_ui_visible_but_no_login_or_translation_claim(self):
        self.put("install.txt", "Success\n")
        self.put("process.txt", "789\n")
        self.put("home_ui.xml", TAOBAO)
        state = classify(self.root)
        self.assertEqual(state["state"], "TAOBAO_UI_REACHED")
        self.assertFalse(state["login_verified"])
        self.assertFalse(state["english_translation_verified"])
        self.assertNotIn("我的淘宝", json.dumps(state, ensure_ascii=False))

    def test_stale_taobao_ui_with_dead_process_is_not_success(self):
        self.put("install.txt", "Success\n")
        self.put("process.txt", "")
        self.put("home_ui.xml", TAOBAO)
        self.assertEqual(classify(self.root)["state"], "APP_NOT_RUNNING")

    def test_missing_or_malformed_evidence_fails_closed(self):
        self.assertEqual(classify(self.root)["state"], "INSTALL_FAILED")
        self.put("install.txt", "Success\n")
        self.put("process.txt", "123")
        self.put("home_ui.xml", "not XML")
        self.assertEqual(classify(self.root)["state"], "TAOBAO_UI_NOT_REACHED")


if __name__ == "__main__":
    unittest.main()
