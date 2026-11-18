import io
import tempfile
import unittest
import zipfile
from pathlib import Path
from prepare_coffee_update import prepare


def apk(entries):
    data = io.BytesIO()
    with zipfile.ZipFile(data, 'w', zipfile.ZIP_DEFLATED) as z:
        for name, value in entries.items():
            z.writestr(name, value)
    return data.getvalue()


class PreparationTest(unittest.TestCase):
    def test_cache_detects_changed_extracted_input_and_preserves_source(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            source = root / 'game.apkm'
            with zipfile.ZipFile(source, 'w') as z:
                z.writestr('base.apk', apk({'classes.dex': b'dex', 'assets/a': b'game'}))
                z.writestr('native.apk', apk({'lib/arm64-v8a/libunity.so': b'native'}))
            before = source.read_bytes()
            first = prepare(source, root / 'cache')
            self.assertFalse(first['cache_hit'])
            self.assertTrue(prepare(source, root / 'cache')['cache_hit'])
            cached = root / 'cache' / first['source_sha256'] / 'inputs/libunity.so'
            cached.write_bytes(b'broken')
            self.assertFalse(prepare(source, root / 'cache')['cache_hit'])
            self.assertEqual(cached.read_bytes(), b'native')
            self.assertEqual(source.read_bytes(), before)

    def test_incomplete_bundle_does_not_create_success_marker(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            source = root / 'game.apkm'
            with zipfile.ZipFile(source, 'w') as z:
                z.writestr('base.apk', apk({'classes.dex': b'dex'}))
            with self.assertRaises(ValueError):
                prepare(source, root / 'cache')
            self.assertFalse(list((root / 'cache').rglob('prepared.json')))


if __name__ == '__main__':
    unittest.main()
