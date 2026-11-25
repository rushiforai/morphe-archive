"""APK-free helper semantics and switch parsing; full graph runs on emitted APKs."""
from pathlib import Path
import re
import tempfile
import unittest
from hln_onboarding import EncryptedPreferences, Obj, Q9, ROUTE, VM, parse, verify_seed, verify_guest_replacements


class HelperVM(VM):
    def switch_case_map(self):return {}


class HandoffVM(HelperVM):
    def invoke(self,ref,values,kind):
        if ref=='Ligj;->a(Landroid/content/Context;Ln20;)V':
            self.handoff=(kind,values);return None
        return super().invoke(ref,values,kind)


class HlnOnboardingInstructionTests(unittest.TestCase):
    def test_emitted_router_rejects_remaining_automatic_login(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            path = root / 'smali/r9j.smali'
            path.parent.mkdir()
            guest = 'invoke-static {p0}, Ligj;->morpheContinueGuest(Landroid/content/Context;Ln20;)V'
            login = 'invoke-static {p0, v0, v1, v2}, Lg33;->y(Landroid/content/Context;ZLcom/kubusapp/feature/auth/LoginDrivers;I)V'
            header = '.class public Ligj;\n.super Ljava/lang/Object;\n.method public static ' + ROUTE + '\n.locals 3\n'
            path.write_text(header + guest + '\n' + login + '\nreturn-void\n.end method\n')
            with self.assertRaisesRegex(AssertionError, 'automatic login remains'):
                verify_guest_replacements(root)
            path.write_text(header + guest + '\n' + guest + '\nreturn-void\n.end method\n')
            verify_guest_replacements(root)

    def helpers(self):
        path=Path(__file__).parents[1]/'patches/src/main/kotlin/patches/hln/OnboardingPatch.kt'
        self.assertTrue(path.is_file(),'Actual generated onboarding helpers must exist')
        text=path.read_text();methods=[]
        for name,params,locals_,body in re.findall(r'addOnboardingHelper\("(morphe\w+)", (emptyList\(\)|listOf\([^\n]+?\)), (\d+), """(.*?)"""\)',text,re.S):
            values=re.findall(r'"([^"]+)"',params)
            body=body.replace("${'$'}",'$')
            methods.append(f'.method public static {name}('+''.join(values)+')V\n.locals '+locals_+'\n'+body+'\n.end method')
        self.assertEqual(len(methods),2)
        temp=tempfile.TemporaryDirectory();self.addCleanup(temp.cleanup)
        root=Path(temp.name);path=root/'smali/r9j.smali';path.parent.mkdir(parents=True)
        path.write_text('.class public Ligj;\n.super Ljava/lang/Object;\n'+'\n'.join(methods))
        return root

    def test_generated_seed_establishes_only_missing_topic_default(self):
        root=self.helpers()
        for saved in [None,[],['opaque-prior-choice']]:
            storage=EncryptedPreferences(saved);before=dict(storage.physical)
            vm=HelperVM(root,topics=storage);vm.call(Q9,'morpheSeedTopicChoices()V',[])
            if saved is None:
                self.assertEqual(storage.physical[storage.key],frozenset())
                self.assertEqual(len(storage.writes),1)
            else:
                self.assertEqual(storage.physical,before)
                self.assertFalse(storage.writes)
            first=dict(storage.physical);writes=len(storage.writes)
            vm.call(Q9,'morpheSeedTopicChoices()V',[])
            self.assertEqual(storage.physical,first);self.assertEqual(len(storage.writes),writes)

    def test_seed_guard_regression_cannot_reset_prior_encrypted_choices(self):
        root=self.helpers();path=root/'smali/r9j.smali'
        text=path.read_text();self.assertIn('if-nez v2, :done',text)
        path.write_text(text.replace('if-nez v2, :done','nop'))
        with self.assertRaisesRegex(AssertionError,'Keep existing encrypted topic preferences|idempotent'):
            verify_seed(root,HelperVM)

    def test_generated_guest_helper_completes_onboarding_with_live_tracker(self):
        root=self.helpers();vm=HandoffVM(root)
        tracker=Obj('Ln20;')
        vm.call(Q9,'morpheContinueGuest(Landroid/content/Context;Ln20;)V',[vm.context,tracker])
        kind,args=vm.handoff
        self.assertEqual(kind,'invoke-static')
        self.assertIs(args[0],vm.context,'the real Context must be forwarded')
        self.assertIs(args[1],tracker,'the router supplies its own live tracker, never a fabricated one')
        self.assertFalse(vm.events);self.assertFalse(vm.topics.writes)

    def test_router_redirects_every_step_except_region_selection(self):
        path=Path(__file__).parents[1]/'patches/src/main/kotlin/patches/hln/OnboardingPatch.kt'
        text=path.read_text()
        self.assertIn('Lggj;->REGION_SELECTION_SCREEN:Lggj;',text,
            'The only screen still allowed is the localized news source picker')
        self.assertIn('invoke-static {p0, p2}, Ligj;->morpheContinueGuest(Landroid/content/Context;Ln20;)V',text,
            'Every other onboarding step must continue as a guest')
        self.assertNotIn('Lg33;->y(',text,
            'Automatic login call sites must not be rewritten: n20 is already clobbered there')
        self.assertNotIn('Llbi;',text)

    def test_packed_switch_rows_preserve_real_case_declaration(self):
        text='''\
.class public Ligj;
.super Ljava/lang/Object;
.method public static exercise(I)I
.locals 1
packed-switch p0, :table
const/4 v0, 0x2
return v0
:case
const/4 v0, 0x1
return v0
:table
.packed-switch 0x0
:case
.end packed-switch
.end method
'''
        m=parse(text,'exercise(I)I')
        self.assertEqual(m.labels[':case'],3)
        self.assertEqual(m.payloads[':table'],{0:':case'})
        self.assertEqual(m.canonical()['instructions'][0],'packed-switch p0, {0:@3}')
        redirected=parse(text.replace(':case\n.end packed-switch',':table\n.end packed-switch'),'exercise(I)I')
        self.assertNotEqual(m.canonical(),redirected.canonical(),'Switch destinations contribute to retained graph proof')
        with tempfile.TemporaryDirectory() as temp:
            root=Path(temp);(root/'smali').mkdir();(root/'smali/r9j.smali').write_text(text)
            self.assertEqual(HelperVM(root).call(Q9,'exercise(I)I',[0]),1)
            self.assertEqual(HelperVM(root).call(Q9,'exercise(I)I',[9]),2)

    def test_sparse_switch_rows_are_references_and_digests_retain_destinations(self):
        text='''\
.method public static exercise(I)I
.locals 1
sparse-switch p0, :table
const/4 v0, 0x2
return v0
:case
const/4 v0, 0x1
return v0
:table
.sparse-switch
0x7 -> :case
.end sparse-switch
.end method
'''
        m=parse(text,'exercise(I)I')
        self.assertEqual(m.labels[':case'],3)
        self.assertEqual(m.canonical()['instructions'][0],'sparse-switch p0, {7:@3}')


if __name__=='__main__':unittest.main()
