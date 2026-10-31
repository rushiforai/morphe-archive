"""Prove the emitted-code verifier catches missing policy and unrelated/tail edits."""
import tempfile
import unittest
from pathlib import Path
from verify_kijk import verify


class KijkVerifierTests(unittest.TestCase):
    def test_policy_and_original_tail_are_both_required(self):
        owner = 'Lexample/Player;'
        contract = [{'owner': owner, 'signature': 'ads()Ljava/lang/String;',
                     'prefix': 'const/4 v0, 0x0\nreturn-object v0', 'selection': 'ads'}]
        original = '''.class public Lexample/Player;
.super Ljava/lang/Object;
.method public ads()Ljava/lang/String;
.locals 0
const-string p0, "original-ad-tag"
return-object p0
.end method
.method public content()Z
.locals 1
const/4 v0, 0x1
return v0
.end method
'''
        patched = original.replace('const-string p0', 'const/4 p0, 0x0\nreturn-object p0\nconst-string p0')
        with tempfile.TemporaryDirectory() as scratch:
            before, after = Path(scratch)/'before', Path(scratch)/'after'
            for root, body in [(before, original), (after, patched)]:
                target=root/'smali/example/Player.smali';target.parent.mkdir(parents=True);target.write_text(body)
            verify(before, after, ads=True, contracts=contract)
            target=after/'smali/example/Player.smali'
            for body in [original, patched.replace('original-ad-tag','changed-tag'),
                         patched.replace('const/4 v0, 0x1','const/4 v0, 0x0')]:
                target.write_text(body)
                with self.assertRaises(AssertionError):
                    verify(before, after, ads=True, contracts=contract)
            target.write_text(patched)
            with self.assertRaises(AssertionError):
                verify(before, after, tracking=True, contracts=contract)

    def test_optional_identifier_calls_can_be_removed_without_changing_push(self):
        contract = [{'owner': 'Lexample/Registration;', 'signature': 'register()V',
                     'selection': 'tracking', 'replacements': [{
                         'instruction': 'invoke-static {}, Lexample/Ids;->collect()V',
                         'with': 'nop'}]}]
        original = '.class public Lexample/Registration;\n.super Ljava/lang/Object;\n.method public register()V\n.locals 0\ninvoke-static {}, Lexample/Ids;->collect()V\ninvoke-static {}, Lexample/Push;->register()V\nreturn-void\n.end method\n'
        patched = original.replace('invoke-static {}, Lexample/Ids;->collect()V', 'nop')
        with tempfile.TemporaryDirectory() as scratch:
            before, after = Path(scratch)/'before', Path(scratch)/'after'
            for root, body in [(before, original), (after, patched)]:
                target = root/'smali/example/Registration.smali'
                target.parent.mkdir(parents=True)
                target.write_text(body)
            verify(before, after, tracking=True, contracts=contract)
            target.write_text(patched.replace('invoke-static {}, Lexample/Push;->register()V', 'nop'))
            with self.assertRaises(AssertionError):
                verify(before, after, tracking=True, contracts=contract)


if __name__ == '__main__':
    unittest.main()
