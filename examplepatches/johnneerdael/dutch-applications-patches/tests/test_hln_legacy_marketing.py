"""Exercise generated legacy completion instructions; APK verifier pins real helpers."""
from pathlib import Path
import re
import tempfile
import unittest

from hln_legacy_marketing import LegacyMarketingVM, TARGET, verify_completion
from hln_onboarding import Obj


class HlnLegacyMarketingTests(unittest.TestCase):
    def fixture(self):
        path = Path(__file__).parents[1] / 'patches/src/main/kotlin/patches/hln/LegacyMarketingPatch.kt'
        self.assertTrue(path.is_file(), 'Generated legacy section marketing stop must exist')
        source = path.read_text()
        bodies = re.findall(r'change\("Lydh;", "[^"]+", """(.*?)"""\)', source, re.S)
        self.assertEqual(len(bodies), 1, 'One real generated legacy resolver prefix must exist')
        temp = tempfile.TemporaryDirectory()
        self.addCleanup(temp.cleanup)
        root = Path(temp.name)
        smali = root / 'smali'
        smali.mkdir()
        (smali / 'ydh.smali').write_text('.class public Lydh;\n.super Ljava/lang/Object;\n.method public ' + TARGET[1] + '\n.locals 3\n' + bodies[0] + '\n.end method\n')
        # Minimal platform-free data holders. The output verifier executes and
        # independently hashes the complete original publisher constructors.
        for cls, sig, writes in [
            ('gpe', '<init>(Ljava/lang/Throwable;)V', 'iput-object p1, p0, Lgpe;->a:Ljava/lang/Throwable;'),
            ('jpe', '<init>(Ljava/lang/Object;)V', 'iput-object p1, p0, Ljpe;->a:Ljava/lang/Object;'),
            ('rg', '<init>(Ljava/lang/Object;B)V', 'iput-byte p2, p0, Lrg;->a:B\niput-object p1, p0, Lrg;->b:Ljava/lang/Object;'),
        ]:
            text = '.class public L' + cls + ';\n.super Ljava/lang/Object;\n.method public ' + sig + '\n.locals 0\n' + writes + '\nreturn-void\n.end method\n'
            (smali / (cls + '.smali')).write_text(text)
        with (smali / 'rg.smali').open('a') as target:
            target.write('''
.method public collect(Lsk6;Lzs3;)Ljava/lang/Object;
.locals 2
iget-byte v0, p0, Lrg;->a:B
packed-switch v0, :table
invoke-static {}, Ljk1;->unexpectedNetwork()V
return-object p0
:once
iget-object v0, p0, Lrg;->b:Ljava/lang/Object;
invoke-interface {p1, v0, p2}, Lsk6;->emit(Ljava/lang/Object;Lzs3;)Ljava/lang/Object;
move-result-object v0
sget-object v1, Lgw3;->COROUTINE_SUSPENDED:Lgw3;
if-eq v0, v1, :done
sget-object v0, Llbi;->a:Llbi;
:done
return-object v0
:table
.packed-switch 0x8
:once
.end packed-switch
.end method
''')
        return root

    def test_generated_stop_emits_typed_disabled_result_once_and_completes(self):
        verify_completion(self.fixture())

    def test_generated_stop_preserves_suspended_emission(self):
        verify_completion(self.fixture(), suspended=True)

    def test_wrong_flow_selector_is_rejected_before_collection(self):
        root = self.fixture()
        path = root / 'smali/ydh.smali'
        path.write_text(path.read_text().replace('const/16 v2, 0x8', 'const/16 v2, 0x7'))
        with self.assertRaisesRegex(AssertionError, 'finite Flow selector 8'):
            verify_completion(root)

    def test_missing_result_wrapper_is_rejected(self):
        root = self.fixture()
        path = root / 'smali/ydh.smali'
        path.write_text(path.read_text().replace('invoke-direct {v1, v0, v2}, Lrg;-><init>', 'invoke-direct {v1, v1, v2}, Lrg;-><init>'))
        with self.assertRaisesRegex(AssertionError, 'inline Result wrapper'):
            verify_completion(root)

    def test_unexpected_auth_or_network_call_cannot_pass_interpreter(self):
        vm = LegacyMarketingVM(Path('unused'))
        with self.assertRaisesRegex(AssertionError, 'stop before token, feature or network'):
            vm.invoke('Ljk1;->a(Lbt3;)Ljava/lang/Object;', [Obj('Ljk1;'), None], 'invoke-virtual')


if __name__ == '__main__':
    unittest.main()
