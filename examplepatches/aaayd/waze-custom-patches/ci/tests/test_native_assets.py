import hashlib
import io
import json
import sys
import unittest
import zipfile
from pathlib import Path
from unittest.mock import patch

from PIL import Image

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import native_icons


class TemplateCompatibilityTests(unittest.TestCase):
    def setUp(self):
        image = Image.new('RGBA', (32, 32), (10, 20, 30, 255))
        output = io.BytesIO()
        image.save(output, format='PNG')
        self.png = output.getvalue()
        self.expected = dict(size=[32, 32], rgba_sha256=hashlib.sha256(image.tobytes()).hexdigest())
        self.catalog = {'templates': {name: self.expected for name in
                        ['tinypin_hazard.png', 'tinypin_hazard@2x.png', 'smallpin_hazard.png']}}

    def verify(self, files):
        data = io.BytesIO()
        with zipfile.ZipFile(data, 'w') as archive:
            for name, content in files.items():
                archive.writestr('assets/res/skins/default/' + name, content)
        with patch.object(native_icons, 'CATALOG') as catalog:
            catalog.read_text.return_value = json.dumps(self.catalog)
            return native_icons.verify_assets(data.getvalue())

    def test_missing_density_warns_and_keeps_other_templates(self):
        warnings = self.verify({'tinypin_hazard.png': self.png, 'smallpin_hazard.png': self.png})
        self.assertEqual(len(warnings), 1)
        self.assertIn('tinypin_hazard@2x.png', warnings[0])

    def test_changed_pixels_and_canvas_warn(self):
        for size in [(32, 32), (64, 64)]:
            output = io.BytesIO()
            Image.new('RGBA', size).save(output, format='PNG')
            warnings = self.verify({'tinypin_hazard.png': output.getvalue(), 'smallpin_hazard.png': self.png})
            self.assertTrue(any('changed' in warning for warning in warnings))

    def test_unreadable_density_warns(self):
        warnings = self.verify({'tinypin_hazard.png': self.png, 'tinypin_hazard@2x.png': b'bad', 'smallpin_hazard.png': self.png})
        self.assertTrue(any('unreadable' in warning for warning in warnings))

    def test_missing_entire_template_family_fails(self):
        with self.assertRaisesRegex(ValueError, 'family missing or unreadable'):
            self.verify({'tinypin_hazard.png': self.png})


if __name__ == '__main__':
    unittest.main()
