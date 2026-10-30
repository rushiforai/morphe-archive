import unittest
from atv_smali import graph


class AtvGraphTests(unittest.TestCase):
    def test_switch_alignment_padding_does_not_change_control_flow(self):
        source = '''.locals 1
packed-switch v0, :data
return-void
:case
return-void
PADDING
:data
.packed-switch 0x0
:case
.end packed-switch
'''
        self.assertEqual(graph(source.replace('PADDING', 'nop')), graph(source.replace('PADDING', '')))

    def test_executable_nop_and_switch_destination_changes_remain_visible(self):
        self.assertNotEqual(graph('.locals 1\nconst/4 v0, 0x0\nnop\nreturn-void'),
                            graph('.locals 1\nconst/4 v0, 0x0\nreturn-void'))
        self.assertNotEqual(graph('.locals 1\ngoto :a\n:a\nreturn-void\n:b\nthrow v0'),
                            graph('.locals 1\ngoto :b\n:a\nreturn-void\n:b\nthrow v0'))


if __name__ == '__main__':
    unittest.main()
