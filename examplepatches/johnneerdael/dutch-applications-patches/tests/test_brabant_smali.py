"""Regression coverage for true control-flow and data-payload ownership."""
import unittest

from brabant_smali import canonical


class BrabantSmaliTests(unittest.TestCase):
    def test_switch_payload_entries_do_not_overwrite_executable_branch_labels(self):
        value = canonical('''
            goto :second
            :first
            const/4 v0, 0x1
            return v0
            :second
            const/4 v0, 0x2
            return v0
            packed-switch p0, :table
            return-void
            :table
            .packed-switch 0x0
                :first
                :second
            .end packed-switch
        ''')
        self.assertEqual(value.code[0], 'goto @3')
        self.assertEqual(value.switches, [{0: 1, 1: 3}])
        self.assertEqual(value.code[5], 'packed-switch p0, switch#0')

    def test_array_data_is_pinned_separately_from_executable_instruction_count(self):
        value = canonical('''
            const/4 v0, 0x2
            new-array v1, v0, [I
            fill-array-data v1, :values
            return-object v1
            :values
            .array-data 4
                0x1
                0x2
            .end array-data
        ''')
        self.assertEqual(len(value.code), 4)
        self.assertEqual(value.code[2], 'fill-array-data v1, array#0')
        self.assertEqual(value.arrays, [(4, ['0x1', '0x2'])])
        altered = canonical('''
            const/4 v0, 0x2
            new-array v1, v0, [I
            fill-array-data v1, :values
            return-object v1
            :values
            .array-data 4
                0x1
                0x3
            .end array-data
        ''')
        self.assertNotEqual(value.digest(), altered.digest())

    def test_literal_labels_are_preserved_and_handlers_pin_half_open_ranges(self):
        value = canonical('''
            :start
            const-string v0, ":handler literal"
            :end
            return-object v0
            :handler
            move-exception v0
            return-object v0
            .catch Ljava/lang/Exception; {:start .. :end} :handler
        ''')
        self.assertEqual(value.code[0], 'const-string v0, ":handler literal"')
        self.assertEqual(value.handlers, [(0, 1, 'Ljava/lang/Exception;', 2)])


if __name__ == '__main__':
    unittest.main()
