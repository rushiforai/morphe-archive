"""Keep setup clicks confined to the reviewed emulator surface and failure dialog."""
import ast
from pathlib import Path
import re
import unittest
import xml.etree.ElementTree as ET

SCRIPT=Path(__file__).resolve().parents[1]/'scripts/navigation-alerts/run_provider_restart_probe.py'
FUNCTIONS=[node for node in ast.parse(SCRIPT.read_text()).body if isinstance(node,ast.FunctionDef) and node.name=='vela_setup_surface']
NAMESPACE={'re':re}
exec(compile(ast.Module(body=FUNCTIONS,type_ignores=[]),str(SCRIPT),'exec'),NAMESPACE)
classify=NAMESPACE['vela_setup_surface']


def surface(package,*labels):
    root=ET.Element('hierarchy')
    for label in labels:ET.SubElement(root,'node',package=package,text=label,enabled='true',clickable='true',bounds='[70,1174][1010,1300]')
    return ET.ElementTree(root)


class VelaSetupAdmissionTest(unittest.TestCase):
    def test_start_and_existing_map_require_actual_vela_focus(self):
        for label in ['Get started','Settings','Open settings','Use system voice']:
            tree=surface('app.vela',label)
            self.assertEqual(('READY',None),classify(tree,'mCurrentFocus=Window{ u0 app.vela/.MainActivity}'))
            self.assertEqual(('PENDING',None),classify(tree,'mCurrentFocus=Window{ u0 other.app/.MainActivity}'))

    def test_only_exact_wellbeing_dialog_and_focused_package_can_be_closed(self):
        tree=surface('android',"Digital Wellbeing isn't responding",'Close app','Wait')
        focus='mCurrentFocus=Window{ u0 Application Not Responding: com.google.android.apps.wellbeing}'
        self.assertEqual(('WELLBEING_ANR','[70,1174][1010,1300]'),classify(tree,focus))
        for other in ['app.vela','com.google.android.apps.wellbeing.fake','other.app']:
            with self.subTest(package=other),self.assertRaises(RuntimeError):classify(tree,focus.replace('com.google.android.apps.wellbeing',other))

    def test_unrelated_failure_dialog_is_never_dismissed(self):
        for label in ["Vela isn't responding",'Vela keeps stopping']:
            with self.subTest(label=label),self.assertRaises(RuntimeError):classify(surface('android',label,'Close app'),'app.vela/.MainActivity')

    def test_ambiguous_or_disabled_system_button_is_rejected(self):
        focus='Application Not Responding: com.google.android.apps.wellbeing}'
        for change in ['duplicate','disabled','bounds']:
            tree=surface('android',"Digital Wellbeing isn't responding",'Close app')
            button=list(tree.iter('node'))[-1]
            if change=='duplicate':tree.getroot().append(ET.Element('node',button.attrib))
            elif change=='disabled':button.set('enabled','false')
            else:button.set('bounds','[0,0][0,0]')
            with self.subTest(change=change),self.assertRaises(RuntimeError):classify(tree,focus)

    def test_splash_is_pending_without_fabricating_map_readiness(self):
        self.assertEqual(('PENDING',None),classify(surface('app.vela','Loading'),'app.vela/.MainActivity'))


if __name__=='__main__':unittest.main()
