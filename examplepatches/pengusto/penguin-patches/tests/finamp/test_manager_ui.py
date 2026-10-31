"""An already enabled installer source must never be toggled off."""
import unittest
import xml.etree.ElementTree as ET
from manager_ui import ensure_install_source


class SourceUi:
    def __init__(self, state, permission='REQUEST_INSTALL_PACKAGES: allow'):
        self.root = ET.fromstring(f'<root><node text="Morphe"/><node checkable="true" checked="{state}"><node text="Allow from this source"/></node></root>')
        self.taps = []
        self.permission = permission

    def dump(self):
        return self.root, ''

    def find(self, root, label, **kwargs):
        return next(n for n in root.iter('node') if n.get('text') == label)

    def tap(self, label, **kwargs):
        self.taps.append(label)

    def adb(self, *args):
        return self.permission


class InstallSourceTests(unittest.TestCase):
    def test_already_enabled_source_is_not_toggled(self):
        ui = SourceUi('true')
        self.assertFalse(ensure_install_source(ui)['toggled'])
        self.assertEqual(ui.taps, [])

    def test_disabled_source_is_enabled_once(self):
        ui = SourceUi('false')
        self.assertTrue(ensure_install_source(ui)['toggled'])
        self.assertEqual(ui.taps, ['Allow from this source'])

    def test_unknown_control_or_denied_permission_fails(self):
        for state, permission in [('unknown', 'REQUEST_INSTALL_PACKAGES: allow'),
                                  ('true', 'REQUEST_INSTALL_PACKAGES: deny')]:
            with self.subTest(state=state), self.assertRaises(RuntimeError):
                ensure_install_source(SourceUi(state, permission))
