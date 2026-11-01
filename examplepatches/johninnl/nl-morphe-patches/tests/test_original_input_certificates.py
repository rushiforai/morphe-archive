"""Publisher lineage extraction must not treat source stamps as publishers."""
import importlib.util
from pathlib import Path
import tempfile
import unittest
import zipfile

spec = importlib.util.spec_from_file_location('input_regression', Path(__file__).with_name('verify_original_input.py'))
regression = importlib.util.module_from_spec(spec)
spec.loader.exec_module(regression)

FIRST = '-----BEGIN CERTIFICATE-----\nFIRST\n-----END CERTIFICATE-----'
ROTATED = '-----BEGIN CERTIFICATE-----\nROTATED\n-----END CERTIFICATE-----'
STAMP = '-----BEGIN CERTIFICATE-----\nSTAMP\n-----END CERTIFICATE-----'


class PublisherCertificateTests(unittest.TestCase):
    def parser(self):
        self.assertTrue(hasattr(regression, 'publisher_certificates'), 'Publisher certificate extraction is required')
        return regression.publisher_certificates

    def test_rotated_publishers_exclude_the_source_stamp(self):
        output = (f'Signer (minSdkVersion=33, maxSdkVersion=2147483647) certificate SHA-256 digest: one\n{FIRST}\n'
                  f'Signer (minSdkVersion=24, maxSdkVersion=32) certificate SHA-256 digest: two\n{ROTATED}\n'
                  f'Source Stamp Signer certificate SHA-256 digest: three\n{STAMP}\n')
        self.assertEqual(self.parser()(output), [FIRST, ROTATED])

    def test_legacy_numbered_signer_is_recognized(self):
        output = f'Signer #1 certificate SHA-256 digest: one\n{FIRST}\n'
        self.assertEqual(self.parser()(output), [FIRST])

    def test_unlabelled_and_source_stamp_certificates_are_not_publishers(self):
        output = f'{FIRST}\nSource Stamp Signer certificate SHA-256 digest: three\n{STAMP}\n'
        self.assertEqual(self.parser()(output), [])


class OriginalInputStagingTests(unittest.TestCase):
    def test_phone_archives_and_standalone_nrc_are_staged_without_changing_inputs(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            originals = root / 'phone'
            originals.mkdir()
            archived = ('weerplaza', 'nu.nl', 'volkskrant', 'trouw', 'ftm', 'flitsmeister', 'ad')
            before = {}
            for app in archived:
                path = originals / f'{app}-original.apks'
                with zipfile.ZipFile(path, 'w') as archive:
                    archive.writestr('base.apk', f'{app}-publisher-base'.encode())
                    archive.writestr('split_config.en.apk', b'original-split')
                before[path] = path.read_bytes()
            nrc = originals / 'nrc.apk'
            nrc.write_bytes(b'nrc-publisher-base')
            before[nrc] = nrc.read_bytes()
            destination = root / 'staged'
            regression.stage_originals(originals, destination)
            for app in (*archived, 'nrc'):
                self.assertEqual((destination / app / 'base.apk').read_bytes(),
                                 f'{app}-publisher-base'.encode())
            for path, content in before.items():
                self.assertEqual(path.read_bytes(), content)

    def test_existing_original_directories_are_supported(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            originals = root / 'phone'
            for app in ('weerplaza', 'nu.nl', 'volkskrant', 'trouw', 'ftm', 'flitsmeister', 'ad', 'nrc'):
                directory = originals / app
                directory.mkdir(parents=True)
                (directory / 'base.apk').write_bytes(f'{app}-original'.encode())
            destination = root / 'staged'
            regression.stage_originals(originals, destination)
            self.assertEqual((destination / 'ad/base.apk').read_bytes(), b'ad-original')
            self.assertEqual((destination / 'nrc/base.apk').read_bytes(), b'nrc-original')

    def test_archive_without_base_is_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            with zipfile.ZipFile(root / 'weerplaza-original.apks', 'w') as archive:
                archive.writestr('split_config.en.apk', b'split-only')
            with self.assertRaisesRegex(ValueError, 'base.apk'):
                regression.stage_originals(root, root / 'staged')


if __name__ == '__main__':
    unittest.main()
