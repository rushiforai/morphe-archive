"""Retained control-flow across owned indexed edits and inserted policy code."""
import unittest

from brabant_smali import canonical
from brabant_effects import restore_edits
from brabant_effects import restore_alignment


class BrabantEffectsTests(unittest.TestCase):
    def test_terminal_switch_padding_may_change_without_changing_native_routes(self):
        original = canonical('''
            packed-switch p0, :table
            :one
            return-void
            nop
            :table
            .packed-switch 0x0
                :one
            .end packed-switch
        ''')
        selected = canonical('''
            packed-switch p0, :table
            :one
            return-void
            :table
            .packed-switch 0x0
                :one
            .end packed-switch
        ''')
        self.assertEqual(restore_alignment(selected, 3).digest(), original.digest())
        with self.assertRaisesRegex(AssertionError, 'alignment'):
            restore_alignment(selected, 4)

    def test_entry_policy_rebases_original_branch_and_exception_ranges(self):
        original = '''
            :begin
            const-string v0, "literal @4"
            goto :end
            :handler
            move-exception v0
            :end
            return-object v0
            .catch Ljava/lang/Exception; {:begin .. :handler} :handler
        '''
        selected = 'const/4 v0, 0x0\nreturn-object v0\n' + original
        edit = {'index': 0, 'original': [], 'replacement': ['const/4 v0, 0x0', 'return-object v0']}
        self.assertEqual(restore_edits(canonical(selected), [edit], 1).digest(), canonical(original).digest())

    def test_middle_insertion_and_indexed_change_keep_original_targets(self):
        original = 'const/4 v0, 0x0\ngoto :done\nconst/4 v0, 0x1\n:done\nreturn v0'
        selected = 'const/4 v0, 0x0\nconst/4 v1, 0x0\ngoto :done\nnop\n:done\nreturn v0'
        edits = [{'index': 1, 'original': [], 'replacement': ['const/4 v1, 0x0']},
                 {'index': 2, 'original': ['const/4 v0, 0x1'], 'replacement': ['nop']}]
        self.assertEqual(restore_edits(canonical(selected), edits, 2).digest(), canonical(original).digest())
        with self.assertRaisesRegex(AssertionError, 'owned'):
            restore_edits(canonical(original), edits, 2)


if __name__ == '__main__':
    unittest.main()
