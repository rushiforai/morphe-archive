"""Unit tests for Ultimea patches and verification."""
import json
import re
from pathlib import Path
import unittest
import zipfile

class UltimeaPatchesTests(unittest.TestCase):
    def test_menu_branding_matches_native_label_and_page_title(self):
        root = Path(__file__).resolve().parents[1]
        menu = (root / 'extensions/extension/src/main/java/app/hxreborn/extension/ultimea/PatchesMenu.java').read_text()
        title = re.search(r'SETTINGS_ROW_TITLE = "([^"]+)"', menu).group(1)
        self.assertEqual(title, 'BadFella Patches')
        native = (root / 'patches/src/main/kotlin/app/badfella/patches/ultimea/upstream/settings/NativeCode.kt').read_text()
        allocation = native.split('private val TITLE_ALLOCATION =', 1)[1].split('.hexToByteArray()', 1)[0]
        payload = bytes.fromhex(''.join(re.findall(r'"([0-9a-f]+)"', allocation)))
        self.assertEqual(payload[-16:], title.encode())
        self.assertNotIn(b'hxreborn patches', payload)

    @classmethod
    def setUpClass(cls):
        cls.root = Path(__file__).resolve().parents[1]
        cls.catalog = json.loads((cls.root / 'patches-list.json').read_text(encoding='utf-8'))
        cls.ultimea_patches = [
            p for p in cls.catalog['patches']
            if any(c['packageName'] == 'com.dynanic.ultimea' for c in p['compatiblePackages'])
        ]

    def test_catalog_contains_exact_six_ultimea_patches(self):
        self.assertEqual(len(self.ultimea_patches), 6)
        names = {p['name'] for p in self.ultimea_patches}
        self.assertEqual(names, {'Ultimea Black Mode', 'Ultimea Hide Explorer Tab', 'Accent color', 'Disable tracking', 'Remove distractions', 'Remove popups'})

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
        self.assertEqual(target['versionCodes'], {'ARM64_V8A': 495})
        self.assertFalse(target['isExperimental'])

    def test_no_engine_or_connection_hooks(self):
        source = self.root / 'patches/src/main/kotlin/app/badfella/patches/ultimea'
        text = '\n'.join(p.read_text(encoding='utf-8') for p in source.rglob('*.kt'))
        for symbol in ('libflutter.so', 'FlutterImageDecoder', 'FineEqualizer', 'Xupmix',
                       'spoofSignaturePatch', 'EqualizerConnection', 'NativeSettings',
                       'EqualizerConnectionPatch', '--aot-shared-library-name='):
            self.assertNotIn(symbol, text)

    def test_no_automatic_main_activity_recreation(self):
        source = self.root / 'extensions/extension/src/main/java/app/hxreborn/extension/ultimea'
        self.assertFalse((source / 'AccentObserver.java').exists())
        self.assertFalse((source / 'NativeSettings.java').exists())
        self.assertNotIn('observer', (source / 'AccentColor.java').read_text())

    def test_android_bundle(self):
        version = next(line.split('=', 1)[1].strip() for line in
                       (self.root / 'gradle.properties').read_text().splitlines()
                       if line.startswith('version ='))
        bundle = self.root / f'patches/build/libs/patches-{version}.mpp'
        if not bundle.exists():
            self.skipTest('Build the Android patch bundle first')
        with zipfile.ZipFile(bundle) as archive:
            for name in archive.namelist():
                if name.endswith(('.class', '.dex')):
                    for package in (b'javax/imageio/', b'java/awt/', b'javax/swing/'):
                        self.assertNotIn(package, archive.read(name), name)
            self.assertIn('ultimea/theme.bin', archive.namelist())
            self.assertIn('ultimea/accent.bin', archive.namelist())
            for icon in ('hdmi', 'usb', 'optical', 'aux', 'bluetooth'):
                self.assertIn(f'ultimea/images/device_input_{icon}_n.png', archive.namelist())

if __name__ == '__main__':
    unittest.main()
