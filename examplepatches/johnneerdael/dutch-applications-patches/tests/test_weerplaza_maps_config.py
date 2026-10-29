"""Check Maps verification uses explicit configuration, never generated output."""
import importlib.util
import os
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch


class MapsConfigurationTests(unittest.TestCase):
    def setUp(self):
        directory = tempfile.TemporaryDirectory()
        self.addCleanup(directory.cleanup)
        self.root = Path(directory.name)
        source = self.root / 'tests/verify_weerplaza_maps.py'
        source.parent.mkdir()
        shutil.copyfile(Path(__file__).with_name('verify_weerplaza_maps.py'), source)
        spec = importlib.util.spec_from_file_location('maps_config_fixture', source)
        self.verifier = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(self.verifier)
        generated = self.root / 'patches/build/generated/maps-key/kotlin/patches/buienalarm/CommunityMapsKey.kt'
        generated.parent.mkdir(parents=True)
        generated.write_text('internal object CommunityMapsKey { const val value = "' + 'AIza' + 'g' * 35 + '" }')

    def test_explicit_file_overrides_stale_generated_key(self):
        expected = 'AIza' + 'f' * 35
        (self.root / '.community-maps-api-key').write_text(expected + '\n')
        with patch.dict(os.environ, {'SHARED_MAPS_API_KEY': ''}):
            self.assertEqual(self.verifier.expected_community_key(), expected)

    def test_generated_output_cannot_supply_missing_configuration(self):
        with patch.dict(os.environ, {'SHARED_MAPS_API_KEY': ''}):
            with self.assertRaisesRegex(AssertionError, 'community Maps configuration'):
                self.verifier.expected_community_key()

    def test_environment_overrides_local_file(self):
        (self.root / '.community-maps-api-key').write_text('AIza' + 'f' * 35)
        expected = 'AIza' + 'e' * 35
        with patch.dict(os.environ, {'SHARED_MAPS_API_KEY': expected}):
            self.assertEqual(self.verifier.expected_community_key(), expected)


if __name__ == '__main__':
    unittest.main()
