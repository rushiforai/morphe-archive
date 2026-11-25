"""Scroll the real settings surface until status, end of content or a bounded deadline."""
import ast
from pathlib import Path
from types import SimpleNamespace
import unittest
import xml.etree.ElementTree as ET

SCRIPT = Path(__file__).resolve().parents[1] / 'scripts/navigation-alerts/run_provider_restart_probe.py'


class StatusSearchTest(unittest.TestCase):
    def search(self, pages, seconds=75):
        functions = [node for node in ast.parse(SCRIPT.read_text()).body
                     if isinstance(node, ast.FunctionDef) and node.name == 'find_vela_status_ui']
        self.assertEqual(1, len(functions), 'A bounded content-aware settings search is missing')
        clock = SimpleNamespace(now=0)
        calls = []
        def dump(label):
            index = min(len(calls), len(pages)-1)
            calls.append(label); clock.now += 1
            text = pages[index]
            root = ET.Element('hierarchy')
            ET.SubElement(root, 'node', package='app.vela', text=text, bounds='[0,0][100,100]')
            return ET.ElementTree(root)
        record = {}
        namespace = {'time': SimpleNamespace(monotonic=lambda: clock.now), 'ui_dump': dump,
                     'ui_scroll': lambda tree: None, 'ui_picture': lambda label: None,
                     'output': Path('/fixture'), 'record': record}
        exec(compile(ast.Module(body=functions, type_ignores=[]), str(SCRIPT), 'exec'), namespace)
        return namespace['find_vela_status_ui'], calls, record

    def test_status_below_eighteen_pages_is_found(self):
        search, calls, record = self.search([f'Actual native row {i}' for i in range(21)] + ['Waiting for previous audio to stop'])
        search('Waiting for previous audio to stop')
        self.assertEqual(22, len(calls))
        self.assertEqual('Waiting for previous audio to stop', record['visible_vela_uncertainty_status']['text'])

    def test_unchanged_surface_stops_without_exhausting_timeout(self):
        search, calls, _ = self.search(['End of native settings'])
        with self.assertRaisesRegex(AssertionError, 'unchanged'):
            search('Waiting for previous audio to stop')
        self.assertEqual(3, len(calls))

    def test_deadline_rejects_status_without_faking_success(self):
        search, calls, record = self.search([f'Actual native row {i}' for i in range(40)])
        with self.assertRaisesRegex(AssertionError, 'not visible'):
            search('Waiting for previous audio to stop', max_seconds=4)
        self.assertEqual(4, len(calls))
        self.assertNotIn('visible_vela_uncertainty_status', record)


if __name__ == '__main__': unittest.main()
