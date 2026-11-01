"""Execute edition onboarding with independent De Morgen and Humo graph pins."""
import re
from dpg_onboarding import (verify_startup, verify_resumed_startup, verify_notification_defaults,
    verify_manual, digest, method, source, VALIDATE, SUSPEND, MAIN, E)

def verify_onboarding(root, enabled, brand):
    assert brand in {"demorgen", "humo"}
    verify_startup(root, enabled)
    verify_resumed_startup(root, enabled)
    verify_notification_defaults(root)
    verify_manual(root)
    verify_preserved(root, enabled, brand)

def verify_preserved(root,enabled,brand):
    from belgian_edition_originals import ORIGINAL
    original=ORIGINAL[brand]
    for cls,sig,sha in original['retained']:
        assert digest(method(root,cls,sig).canonical())==sha,brand+' preserve manual/account/intent/notification flow: '+cls+'->'+sig
    m=method(root,VALIDATE,SUSPEND);remove=set();replace={}
    sites=[i for i,line in enumerate(m.instructions) if '->onOnboardingComplete()Lkotlinx/coroutines/Job;' in line]
    assert len(sites)==(1 if enabled else 0),brand+' exact owned onboarding completion cardinality'
    if enabled:
        i=sites[0]
        assert m.instructions[i-1:i+2]==[
            'iget-object v4, p0, L'+VALIDATE+';->this$0:L'+MAIN+';',
            'invoke-virtual {v4}, L'+MAIN+';->onOnboardingComplete()Lkotlinx/coroutines/Job;',
            'sget-object v4, L'+E+'ui/main/MainViewState$Home;->INSTANCE:L'+E+'ui/main/MainViewState$Home;']
        # No original edge may bypass completion and enter its call/assignment.
        for line in m.instructions:
            for label in re.findall(r'(?<!\S):\w+',line):
                assert m.labels.get(label) not in {i,i+1},brand+' coroutine edge skips completion receiver'
        remove.update([i,i+1]);replace[i-1]='sget-object v4, L'+E+'ui/main/MainViewState$Onboarding;->INSTANCE:L'+E+'ui/main/MainViewState$Onboarding;'
        native=method(root,MAIN,'onOnboardingComplete()Lkotlinx/coroutines/Job;')
        assert 'public' in native.flags and 'static' not in native.flags,'Existing completion is a public instance method'
        assert re.search(r'^\.class[^\n]*\bpublic\b[^\n]* L'+re.escape(MAIN)+r';$',source(root,MAIN),re.M),'Native completion class is accessible'
        fields=re.findall(r'^\.field ([^\n]*\bthis\$0:L'+re.escape(MAIN)+r';)$',source(root,VALIDATE),re.M)
        assert len(fields)==1 and 'static' not in fields[0].split(),'Capture read uses the original instance field in its own declaring class'
    assert digest(m.canonical(remove,replace))==original['startup'],brand+' complete original coroutine graph outside owned state assignment'
