"""Unit tests for Ultimea patches and verification."""
import json
from pathlib import Path
import unittest
import zipfile

class UltimeaPatchesTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.root = Path(__file__).resolve().parents[1]
        cls.catalog = json.loads((cls.root / 'patches-list.json').read_text(encoding='utf-8'))
        cls.ultimea_patches = [
            p for p in cls.catalog['patches']
            if any(c['packageName'] == 'com.dynanic.ultimea' for c in p['compatiblePackages'])
        ]

    def test_catalog_contains_exact_two_ultimea_patches(self):
        self.assertEqual(len(self.ultimea_patches), 2)
        names = {p['name'] for p in self.ultimea_patches}
        self.assertEqual(names, {'Ultimea Black Mode', 'Ultimea Hide Explorer Tab'})

    def test_ultimea_black_mode_metadata(self):
        patch = next(p for p in self.ultimea_patches if p['name'] == 'Ultimea Black Mode')
        compat = next(c for c in patch['compatiblePackages'] if c['packageName'] == 'com.dynanic.ultimea')
        self.assertEqual(compat['name'], 'Ultimea')
        self.assertEqual(len(compat['targets']), 1)
        target = compat['targets'][0]
        self.assertEqual(target['version'], '1.4.4')
        self.assertEqual(target['versionCodes'], {'ARM64_V8A': 495})
        self.assertFalse(target['isExperimental'])

    def test_ultimea_hide_explorer_metadata(self):
        patch = next(p for p in self.ultimea_patches if p['name'] == 'Ultimea Hide Explorer Tab')
        compat = next(c for c in patch['compatiblePackages'] if c['packageName'] == 'com.dynanic.ultimea')
        self.assertEqual(compat['name'], 'Ultimea')
        self.assertEqual(len(compat['targets']), 1)
        target = compat['targets'][0]
        self.assertEqual(target['version'], '1.4.4')
        self.assertEqual(target['versionCodes']['ARM64_V8A'], 495)
        self.assertFalse(target['isExperimental'])

    def test_theme_bin_zero_syscall_amoled(self):
        theme_bin = self.root / 'patches/src/main/resources/ultimea/theme.bin'
        self.assertTrue(theme_bin.is_file())
        data = theme_bin.read_bytes()
        self.assertEqual(len(data), 2284)
        # Verify patched instructions at 0x2d4: mov w17, #3; str w17, [x1, x16]; ret
        expected_patch = bytes.fromhex('71008052316820b8c0035fd6')
        self.assertEqual(data[0x2d4:0x2d4 + len(expected_patch)], expected_patch)

    def test_navigation_anchors_unique_in_stock_libraries(self):
        arm64_apk = Path('D:/Learn_Android_Development/analysis/ultimea/device/split_config.arm64_v8a.apk')
        if not arm64_apk.is_file():
            self.skipTest('Stock ARM64 split APK not found')

        with zipfile.ZipFile(arm64_apk, 'r') as z:
            libapp_a64 = z.read('lib/arm64-v8a/libapp.so')

        a64_alloc_old = bytes.fromhex('c20080d252d11294e20300aaa0035df8a2831ff840f000b8a0035cf8403001b8a0835df8407001b8')
        a64_constructor_old = bytes.fromhex('c00080d220b000b825c00f94')
        a64_on_tap_old = bytes.fromhex('a20b40f99f47e597403740f9002457f9')

        self.assertEqual(libapp_a64.count(a64_alloc_old), 1)
        self.assertEqual(libapp_a64.count(a64_constructor_old), 1)
        self.assertEqual(libapp_a64.count(a64_on_tap_old), 1)

        xapk = Path('D:/Learn_Android_Development/ultimia/ULTIMEA_1.4.4_APKPure.xapk')
        if xapk.is_file():
            with zipfile.ZipFile(xapk, 'r') as z:
                with zipfile.ZipFile(z.open('config.armeabi_v7a.apk'), 'r') as v7_apk:
                    libapp_a32 = v7_apk.read('lib/armeabi-v7a/libapp.so')
            a32_alloc_old = bytes.fromhex('0610a0e3328e00eb0010a0e108001be518100be50b0081e510001be50f0081e514001be5130081e5')
            self.assertEqual(libapp_a32.count(a32_alloc_old), 1)

    def test_no_breaking_extras_in_source(self):
        source_dir = self.root / 'patches/src/main/kotlin/app/badfella/patches/ultimea'
        all_text = ''
        for kt in source_dir.glob('*.kt'):
            all_text += kt.read_text(encoding='utf-8')

        breaking_symbols = [
            'FineEqualizer',
            'Xupmix',
            'StopFirmwareReminders',
            'RemovePopups',
            'DisableTracking',
            'PatchesSettingsActivity',
            'FlutterImageDecoder',
            'LoganMethodCall',
        ]
        for symbol in breaking_symbols:
            self.assertNotIn(symbol, all_text)

if __name__ == '__main__':
    unittest.main()
