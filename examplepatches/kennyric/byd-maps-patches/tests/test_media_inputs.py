"""Reject incomplete split sets and silent native/resource changes."""
import hashlib
import io
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch
import zipfile

from media_inputs import verify_input, verify_payload


def apk(entries):
    output = io.BytesIO()
    with zipfile.ZipFile(output, 'w') as archive:
        for name, blob in entries.items():
            archive.writestr(name, blob)
    return output.getvalue()


class MediaInputsTests(unittest.TestCase):
    def setUp(self):
        self.scratch = tempfile.TemporaryDirectory()
        self.addCleanup(self.scratch.cleanup)
        self.root = Path(self.scratch.name)
        self.base = apk({'AndroidManifest.xml': b'manifest', 'classes.dex': b'dex',
                         'res/drawable-v24/icon.png': b'icon', 'assets/content': b'content'})
        self.native = apk({'AndroidManifest.xml': b'native manifest',
                           'lib/arm64-v8a/libfunctional.so': b'original native image'})
        self.members = {'publisher.package.apk': self.base, 'config.arm64_v8a.apk': self.native}
        profile = {'filename': 'publisher.xapk', 'base_member': 'publisher.package.apk', 'min_sdk': 24,
                   'members': {n: hashlib.sha256(b).hexdigest() for n, b in self.members.items()},
                   'dex_sha256': {'classes.dex': hashlib.sha256(b'dex').hexdigest()}}
        self.override = patch('media_inputs.PROFILES', [profile])
        self.override.start()
        self.addCleanup(self.override.stop)
        self.original = self.write('original.apks', self.members)
        self.output = {'AndroidManifest.xml': b'patched manifest', 'classes.dex': b'patched dex',
                       'res/drawable/icon.png': b'icon', 'assets/content': b'content',
                       'lib/arm64-v8a/libfunctional.so': b'original native image'}

    def write(self, name, entries):
        path = self.root / name
        path.write_bytes(apk(entries))
        return path

    def test_complete_and_normalized_base_accepted(self):
        verify_input(self.original)
        renamed = {'base.apk': self.base, 'config.arm64_v8a.apk': self.native}
        verify_input(self.write('normalized.apks', renamed))
        self.assertEqual(verify_payload(self.original, self.write('patched.apk', self.output)), 3)

    def test_missing_extra_or_changed_split_rejected(self):
        variants = [dict(list(self.members.items())[:1]),
                    self.members | {'unexpected.apk': self.native},
                    self.members | {'config.arm64_v8a.apk': self.native + b'changed'}]
        for index, members in enumerate(variants):
            with self.subTest(index=index), self.assertRaisesRegex(AssertionError, 'profile'):
                verify_input(self.write(f'bad-{index}.apks', members))

    def test_missing_extra_or_corrupt_native_and_resources_rejected(self):
        for name in ['lib/arm64-v8a/libfunctional.so', 'assets/content', 'res/drawable/icon.png']:
            with self.subTest(name=name):
                changed = self.output | {name: b'changed'}
                with self.assertRaisesRegex(AssertionError, 'payload changed'):
                    verify_payload(self.original, self.write('changed.apk', changed))
                missing = {key: value for key, value in self.output.items() if key != name}
                with self.assertRaisesRegex(AssertionError, 'inventory'):
                    verify_payload(self.original, self.write('missing.apk', missing))
        with self.assertRaisesRegex(AssertionError, 'inventory'):
            verify_payload(self.original, self.write('extra.apk', self.output | {'lib/mips/unexpected.so': b'extra'}))

    def test_owned_resource_edit_is_narrow(self):
        changed = self.output | {'res/drawable/icon.png': b'owned'}
        self.assertEqual(verify_payload(self.original, self.write('owned.apk', changed), ['res/drawable/icon.png']), 3)
        with self.assertRaisesRegex(AssertionError, 'Unknown allowed'):
            verify_payload(self.original, self.write('patched.apk', self.output), ['res/missing'])
        with self.assertRaisesRegex(AssertionError, 'Only owned resource'):
            verify_payload(self.original, self.write('patched.apk', self.output), ['lib/arm64-v8a/libfunctional.so'])

    def test_manifest_sdk_does_not_drop_preserved_newer_resource_configurations(self):
        base = apk({'AndroidManifest.xml': b'manifest', 'classes.dex': b'dex',
                    'res/layout/toolbar.xml': b'base layout',
                    'res/layout-v26/toolbar.xml': b'API26 layout'})
        members = self.members | {'publisher.package.apk': base}
        profile = dict(self.override.new[0], min_sdk=32, resource_api_floor=24,
                       members={n: hashlib.sha256(b).hexdigest() for n, b in members.items()})
        original = self.write('api32.apks', members)
        output = {'AndroidManifest.xml': b'patched manifest', 'classes.dex': b'patched dex',
                  'res/layout/toolbar.xml': b'base layout', 'res/layout-v26/toolbar.xml': b'API26 layout',
                  'lib/arm64-v8a/libfunctional.so': b'original native image'}
        with patch('media_inputs.PROFILES', [profile]):
            self.assertEqual(verify_payload(original, self.write('api32-patched.apk', output)), 3)
            del output['res/layout-v26/toolbar.xml']
            with self.assertRaisesRegex(AssertionError, 'inventory'):
                verify_payload(original, self.write('api32-missing.apk', output))


if __name__ == '__main__':
    unittest.main()
