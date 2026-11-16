"""The clone output gate must reject the old package-derived OAuth redirect."""
import unittest
from verify_chatgpt_clone_output import verify_redirect_code, STOCK_REDIRECT

class ChatGptTests(unittest.TestCase):
    def test_request_builder_requires_stock_redirect(self):
        builder = '''
    #0 : (in Lzz7;)
      name : 'invoke'
0010: const-string v4, "://auth.openai.com/android/"
0011: const-string v11, "/callback"
0012: invoke-virtual {v5}, Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;
0013: move-result-object v4
'''
        with self.assertRaisesRegex(AssertionError, 'clone package'):
            verify_redirect_code(builder)
        fixed = builder.replace('move-result-object v4', 'const-string v4, "'+STOCK_REDIRECT+'"')
        verify_redirect_code(fixed)
        with self.assertRaisesRegex(AssertionError, 'clone package'):
            verify_redirect_code(fixed.replace(STOCK_REDIRECT, STOCK_REDIRECT.replace('chatgpt', 'chatgpt.clone')))
        with self.assertRaisesRegex(AssertionError, 'one native'):
            verify_redirect_code(fixed + fixed)
        with self.assertRaisesRegex(AssertionError, 'clone package'):
            verify_redirect_code(builder + '\n    #1 : (in LOther;)\n const-string v0, "'+STOCK_REDIRECT+'"')
