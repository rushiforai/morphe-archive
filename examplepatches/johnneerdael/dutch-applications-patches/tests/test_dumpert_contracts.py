"""Verifier failure fixtures; expectations come from DEX contracts, not Kotlin."""
import unittest
import xml.etree.ElementTree as ET

from dex_declarations import ClassDeclaration, DexDeclarations, MethodDeclaration
from verify_dumpert import absolute_registers, audit_call, canonicalize, execute, run_injector, xml_digest


class DumpertContractsTest(unittest.TestCase):
    def declarations(self, flags=0x12, interface=False):
        owner = 'Lsample/Player;'
        signature = 'reportAdError(Ljava/lang/String;)V'
        method = MethodDeclaration(owner, signature, flags, 'direct' if flags & 10 else 'virtual', 1)
        return DexDeclarations({owner: ClassDeclaration(owner, 0x201 if interface else 1,
            'Ljava/lang/Object;', (), {signature: method}, 'classes.dex')}, 'fixture')

    def test_private_callback_requires_direct(self):
        call = '{p0, v0}, Lsample/Player;->reportAdError(Ljava/lang/String;)V'
        audit_call('invoke-direct ' + call, 'Lsample/Player;', self.declarations())
        with self.assertRaisesRegex(AssertionError, 'direct/private'):
            audit_call('invoke-virtual ' + call, 'Lsample/Player;', self.declarations())

    def test_static_and_interface_calls_are_distinct(self):
        call = '{p0, v0}, Lsample/Player;->reportAdError(Ljava/lang/String;)V'
        audit_call('invoke-static ' + call, 'Lsample/Player;', self.declarations(0x9))
        with self.assertRaisesRegex(AssertionError, 'static/instance'):
            audit_call('invoke-virtual ' + call, 'Lsample/Player;', self.declarations(0x9))
        audit_call('invoke-interface ' + call, 'Lsample/Player;', self.declarations(0x401, True))
        with self.assertRaisesRegex(AssertionError, 'class/interface'):
            audit_call('invoke-virtual ' + call, 'Lsample/Player;', self.declarations(0x401, True))

    def test_missing_declared_method_fails(self):
        with self.assertRaisesRegex(AssertionError, 'Missing invoked method'):
            audit_call('invoke-virtual {p0}, Lsample/Player;->missing()V', 'Lsample/Player;', self.declarations())

    def test_register_aliases_and_labels(self):
        self.assertEqual(absolute_registers('return-object p0', 0), 'return-object v0')
        self.assertEqual(absolute_registers('iput-object v0, p0, Lsample/A;->x:Ljava/lang/String;', 24),
                         'iput-object v0, v24, Lsample/A;->x:Ljava/lang/String;')
        self.assertEqual(canonicalize('return-void\n:start\nconst/4 v0, 0x0\ngoto :start', 1),
                         ['const/4 v0, 0x0', 'goto @0'])

    def test_injector_rejects_raw_input_and_unknown_operations(self):
        items = [object() for _ in range(21)]
        with self.assertRaisesRegex(AssertionError, 'mapped slots'):
            run_injector(['return-object p1'], items)
        with self.assertRaisesRegex(AssertionError, 'Unsupported injector'):
            run_injector(['invent-success v0'], items)

    def test_execution_follows_real_zero_branch_and_state_write(self):
        state = {'latched': 1}
        code = ['const/4 v0, 0x0', 'if-nez v0, @4',
                'iput-boolean v0, p0, Lsample/A;->latched:Z', 'return v0', 'return p1']
        result = execute(code, {'p0': state, 'p1': 1}, lambda *_: self.fail('Unexpected call'))
        self.assertEqual((result, state['latched']), (0, 0))
        self.assertEqual(execute(['if-eqz p0, @2', 'return p1', 'return p2'],
                                 {'p0': {'loader': 1}, 'p1': 1, 'p2': 0}, lambda *_: None), 1)
        with self.assertRaisesRegex(AssertionError, 'Unsupported execution'):
            execute(['invent-success v0'], {}, lambda *_: None)

    def test_manifest_digest_ignores_formatting_and_preserves_meaning(self):
        a = ET.fromstring('<activity name="real" exported="false"><child enabled="true"/></activity>')
        b = ET.fromstring('<activity exported="false" name="real">\n <child enabled="true"/>\n</activity>')
        a.tail, b.tail = '\n        ', '\n    '
        self.assertEqual(xml_digest(a), xml_digest(b))
        b.set('exported', 'true')
        self.assertNotEqual(xml_digest(a), xml_digest(b))

    def test_execution_allocates_real_collection_for_callback_mapping(self):
        def call(target, args):
            if '->add(' in target:
                self.assertIsInstance(args[0], list)
                args[0].append(args[1])
                return 1
        code = ['new-instance v0, Ljava/util/ArrayList;', 'const-string v1, "item"',
                'invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z', 'return-object v0']
        self.assertEqual(execute(code, {}, call), ['item'])

    def test_execution_preserves_real_consent_boolean_inversion(self):
        code = ['xor-int/lit8 p1, p1, 0x1', 'return p1']
        for value in (0, 1):
            self.assertEqual(execute(code, {'p1': value}, lambda *_: None), 1 - value)

    def test_execution_handles_native_backend_retry_comparison(self):
        code = ['const/4 v1, 0x1', 'add-int/2addr p0, v1', 'if-ge p0, p1, @4',
                'return p2', 'return p0']
        self.assertEqual(execute(code, {'p0': 1, 'p1': 2, 'p2': 0}, lambda *_: None), 2)


if __name__ == '__main__':
    unittest.main()
