import unittest
from atv_smali import graph
from verify_npo_atv import split_catches


class RuntimeGraphTests(unittest.TestCase):
    def test_catch_directive_placement_keeps_the_same_code_and_handler_range(self):
        code = '''.locals 1
:start
invoke-static {}, Ltest/Work;->run()V
:end
DIRECTIVE
return-void
:handler
move-exception v0
throw v0
TRAILER
'''
        catch = '.catchall {:start .. :end} :handler'
        at_end = graph(code.replace('DIRECTIVE', '').replace('TRAILER', catch))
        at_boundary = graph(code.replace('DIRECTIVE', catch).replace('TRAILER', ''))
        self.assertEqual(split_catches(at_end), split_catches(at_boundary))

    def test_changed_exception_scope_and_handler_remain_visible(self):
        code = '''.locals 1
:start
invoke-static {}, Ltest/Work;->run()V
:end
return-void
:handler
move-exception v0
throw v0
.catchall {:start .. :end} :handler
'''
        expected = split_catches(graph(code))
        self.assertNotEqual(expected, split_catches(graph(code.replace(':start .. :end', ':end .. :handler'))))
        self.assertNotEqual(expected, split_catches(graph(code.replace('} :handler', '} :end'))))

    def test_overlapping_handler_precedence_remains_visible(self):
        code = '''.locals 1
:start
invoke-static {}, Ltest/Work;->run()V
:end
return-void
:general
move-exception v0
throw v0
:specific
move-exception v0
return-void
HANDLERS
'''
        first = '.catch Ljava/lang/Exception; {:start .. :end} :general'
        second = '.catch Ljava/io/IOException; {:start .. :end} :specific'
        self.assertNotEqual(split_catches(graph(code.replace('HANDLERS', first + '\n' + second))),
                            split_catches(graph(code.replace('HANDLERS', second + '\n' + first))))


if __name__ == '__main__':
    unittest.main()
