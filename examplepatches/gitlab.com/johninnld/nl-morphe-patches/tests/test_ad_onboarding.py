"""APK-free helper semantics and switch parsing; full graph runs on emitted APKs."""
from pathlib import Path
import re
import tempfile
import unittest
from ad_onboarding import EncryptedPreferences, Obj, Q9, ROUTE, VM, parse, verify_seed


class HelperVM(VM):
    def switch_case_map(self):return {}


class HandoffVM(HelperVM):
    def invoke(self,ref,values,kind):
        if ref=='Lq9j;->'+ROUTE:
            self.handoff=(kind,values);return None
        return super().invoke(ref,values,kind)


class OnboardingInstructionTests(unittest.TestCase):
    def helpers(self):
        path=Path(__file__).parents[1]/'patches/src/main/kotlin/patches/ad/OnboardingPatch.kt'
        self.assertTrue(path.is_file(),'Actual generated onboarding helpers must exist')
        text=path.read_text();methods=[]
        for name,params,locals_,body in re.findall(r'addOnboardingHelper\("(morphe\w+)", (emptyList\(\)|listOf\([^\n]+?\)), (\d+), """(.*?)"""\)',text,re.S):
            values=re.findall(r'"([^"]+)"',params)
            body=body.replace("${'$'}",'$')
            methods.append(f'.method public static {name}('+''.join(values)+')V\n.locals '+locals_+'\n'+body+'\n.end method')
        self.assertEqual(len(methods),2)
        temp=tempfile.TemporaryDirectory();self.addCleanup(temp.cleanup)
        root=Path(temp.name);path=root/'smali/q9j.smali';path.parent.mkdir(parents=True)
        path.write_text('.class public Lq9j;\n.super Ljava/lang/Object;\n'+'\n'.join(methods))
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
        root=self.helpers();path=root/'smali/q9j.smali'
        text=path.read_text();self.assertIn('if-nez v2, :done',text)
        path.write_text(text.replace('if-nez v2, :done','nop'))
        with self.assertRaisesRegex(AssertionError,'Keep existing encrypted topic preferences|idempotent'):
            verify_seed(root,HelperVM)

    def test_generated_guest_helper_forwards_real_context_and_push_transition(self):
        root=self.helpers();vm=HandoffVM(root)
        vm.call(Q9,'morpheContinueGuest(Landroid/content/Context;)V',[vm.context])
        kind,args=vm.handoff
        self.assertEqual(kind,'invoke-static');self.assertIs(args[0],vm.context)
        self.assertEqual(args[1].name,'PUSH_NOTIFICATION_SCREEN');self.assertEqual(args[2],0)
        self.assertFalse(vm.events);self.assertFalse(vm.topics.writes)

    def test_packed_switch_rows_preserve_real_case_declaration(self):
        text='''\
.class public Lq9j;
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
            root=Path(temp);(root/'smali').mkdir();(root/'smali/q9j.smali').write_text(text)
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
