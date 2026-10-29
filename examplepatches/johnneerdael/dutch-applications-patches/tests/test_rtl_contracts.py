"""Independent RTL owned-edit normalization and guard failure fixtures."""
import unittest
from pathlib import Path
import os
import struct
import tempfile
from unittest.mock import patch
import zipfile

from verify_rtl import restore_owned_edits
from verify_parool import sdk_classes
from verify_dumpert import absolute_registers


class RtlContractTests(unittest.TestCase):
    def test_parameter_aliases_do_not_rename_fields_methods_or_labels(self):
        self.assertEqual(absolute_registers('iget-object p0, p1, Lfixture;->p0:Ljava/lang/Object;', 3),
                         'iget-object v3, v4, Lfixture;->p0:Ljava/lang/Object;')
        self.assertEqual(absolute_registers('invoke-static/range {p0 .. p1}, Lfixture;->p2(Ljava/lang/Object;)V', 3),
                         'invoke-static/range {v3 .. v4}, Lfixture;->p2(Ljava/lang/Object;)V')
        self.assertEqual(absolute_registers('goto :p0', 3), 'goto :p0')

    def test_same_length_owned_edit_restores_original_branch(self):
        edit = {'index': 1, 'remove_count': 1, 'replacement': ['nop'], 'original': ['if-eqz v0, @3']}
        code = ['const/4 v0, 0x0', 'nop', 'return-void', 'return-void']
        self.assertEqual(restore_owned_edits(code, [edit], 1, True)[1], 'if-eqz v0, @3')
        with self.assertRaisesRegex(AssertionError, 'owned RTL edit'):
            restore_owned_edits(['const/4 v0, 0x0', 'return-void'], [edit], 1, True)

    def test_prefix_targets_rebase_to_original_positions(self):
        edit = {'index': 0, 'remove_count': 0, 'replacement': ['return-void'], 'original': []}
        self.assertEqual(restore_owned_edits(['return-void', 'goto @2', 'return-void'], [edit], 1, True),
                         ['goto @1', 'return-void'])

    def test_register_aliases_compare_actual_parameter_slots(self):
        edit = {'index': 0, 'remove_count': 1, 'replacement': ['const/4 p0, 0x0'], 'original': ['return p0']}
        self.assertEqual(restore_owned_edits(['const/4 v0, 0x0'], [edit], 0, True), ['return p0'])

    def test_sdk_hierarchy_retains_declared_interfaces_without_changing_call_contract(self):
        # Minimal independent JVM classfile: Child extends Parent implements Interface.
        pool = bytearray()
        for index, text in enumerate(('fixture/Parent', 'fixture/Child', 'fixture/Interface')):
            data = text.encode()
            pool += b'\x01' + struct.pack('>H', len(data)) + data
            pool += b'\x07' + struct.pack('>H', 2 * index + 1)
        binary = (struct.pack('>IHHH', 0xcafebabe, 0, 61, 7) + pool +
                  struct.pack('>HHHHHHHH', 0x21, 4, 2, 1, 6, 0, 0, 0))
        with tempfile.TemporaryDirectory() as directory:
            jar = Path(directory) / 'platforms/android-36/android.jar'
            jar.parent.mkdir(parents=True)
            with zipfile.ZipFile(jar, 'w') as archive:
                archive.writestr('fixture/Child.class', binary)
            with patch.dict(os.environ, {'ANDROID_HOME': directory}):
                read, archive = sdk_classes()
                try:
                    self.assertEqual(read('Lfixture/Child;'), (False, 'Lfixture/Parent;', {}))
                    self.assertEqual(read.interfaces('Lfixture/Child;'), ('Lfixture/Interface;',))
                finally:
                    archive.close()


if __name__ == '__main__':
    unittest.main()
