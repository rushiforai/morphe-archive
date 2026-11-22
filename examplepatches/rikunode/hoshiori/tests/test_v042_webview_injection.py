"""Regression guard for the v0.4.1 article WebView register-type crash."""
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]


class WebViewInjectionTests(unittest.TestCase):
    def test_injects_before_webview_parameter_is_overwritten(self):
        source = (ROOT / "patches/src/main/kotlin/dev/rikunode/hatenabookmark/"
                  "BlockAdsInAppBrowserPatch.kt").read_text(encoding="utf-8")
        self.assertIn("instructions.getOrNull(4)", source)
        self.assertIn("Opcode.INVOKE_SUPER", source)
        self.assertIn(
            "Landroid/webkit/WebViewClient;->onPageFinished"
            "(Landroid/webkit/WebView;Ljava/lang/String;)V", source)
        self.assertRegex(source, r"existing\.addInstructions\(\s*5,")
        self.assertNotIn("existing.implementation!!.instructions.size - 1", source)
        self.assertIn("invoke-static { p1, v0 }", source)


if __name__ == "__main__":
    unittest.main()
