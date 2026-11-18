"""Publisher-APK-free checks execute production-generated injection strings."""
from pathlib import Path
import re
import tempfile
import unittest
from ad_onboarding import Obj,source
from dpg_onboarding import StartupVM,MAIN,VALIDATE,E,SUSPEND


def generated_injection(brand):
    path=Path(__file__).parents[1]/'patches/src/main/kotlin/patches'/brand/'OnboardingPatch.kt'
    code=path.read_text()
    replacement=re.search(r'target.replaceInstruction\(index, "([^"\n]+)"\)',code)[1]
    addition=re.search(r'target.addInstructions\((index(?:\s*\+\s*1)?), """(.*?)"""',code,re.S)
    values={'main':'L'+MAIN+';','coroutine':'L'+VALIDATE+';','home':'L'+E+'ui/main/MainViewState$Home;','destination':'4'}
    def render(text):
        text=text.replace("${'$'}",'@DOLLAR@').replace('\\$','@DOLLAR@')
        for key,value in values.items():text=text.replace('$'+key,value)
        return text.replace('@DOLLAR@','$').strip()
    return render(replacement),render(addition[2]),'+' in addition[1]


class CompletionBoundaryVM(StartupVM):
    def invoke(self,ref,values,kind):
        if ref=='L'+MAIN+';->onOnboardingComplete()Lkotlinx/coroutines/Job;':
            assert kind=='invoke-virtual' and values==[self.main]
            self.events.append('native_completion');return Obj('Lkotlinx/coroutines/Job;')
        return super().invoke(ref,values,kind)


class DpgOnboardingInjectionTests(unittest.TestCase):
    def test_existing_resume_branch_enters_generated_completion_for_each_brand(self):
        for brand in ['trouw','volkskrant']:
            replacement,addition,after=generated_injection(brand)
            # Model DEX's real label identity: inserting before an existing
            # instruction leaves branches bound to that original instruction.
            block=(':resume\n'+replacement+'\n'+addition if after else addition+'\n:resume\n'+replacement)
            text='.class public L'+VALIDATE+';\n.super Ljava/lang/Object;\n.method public final '+SUSPEND+'\n.locals 9\ngoto :resume\n'+block+'\nreturn-object v4\n.end method\n'
            with tempfile.TemporaryDirectory() as temporary:
                root=Path(temporary);p=root/'smali'/(VALIDATE+'.smali');p.parent.mkdir(parents=True);p.write_text(text)
                vm=CompletionBoundaryVM(root);result=vm.run()
                self.assertEqual(result.type,'L'+E+'ui/main/MainViewState$Home;')
                self.assertEqual(vm.events,['native_completion'],'Existing branch must enter completion before Home')

    def test_generated_injection_uses_only_original_killed_destination(self):
        for brand in ['trouw','volkskrant']:
            replacement,addition,after=generated_injection(brand)
            self.assertEqual(set(re.findall(r'\bv\d+\b',replacement+'\n'+addition)),{'v4'})
            self.assertIn('p0',replacement+'\n'+addition)


if __name__=='__main__':unittest.main()
