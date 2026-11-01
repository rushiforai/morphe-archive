"""No remote consent setup or invented choice; native age checks remain."""
from rtl_vm import Reference,VmThrown
from vi_tracking_vm import CONSENT
from vi_consent_vm import CALLBACK,ConsentWork

REQUEST='requestForConsent(Landroid/app/Activity;)V'
FORCE='forceLoadForm(Landroid/app/Activity;'+CALLBACK+')V'


def verify_consent(f,enabled):
    consent=f.statics[CONSENT+'->INSTANCE:'+CONSENT]
    activity=Reference({},'Landroid/app/Activity;')
    flag=CONSENT+'->showAgeGateDialog:Z'
    loading=CONSENT+'->isLoadingForm:Z'
    obtained=CONSENT+'->_consentObtained:Lkotlinx/coroutines/flow/MutableStateFlow;'
    assert '_consentObtained:Lkotlinx/coroutines/flow/MutableStateFlow;' in f.source.text(CONSENT)
    for prior in (False,True):
        state=Reference({'value':prior},'Lkotlinx/coroutines/flow/MutableStateFlow;');f.statics[obtained]=state
        for first,shown,expired in ((True,False,False),(True,True,True),(False,True,False),(False,True,True)):
            f.statics[flag]=int(first);f.age_shown=shown;f.period_expired=expired;f.events.clear()
            try:f.run(CONSENT,REQUEST,(consent,activity))
            except ConsentWork:assert not enabled, 'VI startup still enters remote consent setup'
            else:
                assert enabled
                assert f.events.count('age-dialog')==int((first and not shown) or (not first and expired))
                assert f.statics[flag]==0
                assert not any(e in {'ump-request','manual-consent'} for e in f.events)
            assert f.statics[obtained] is state and state.value=={'value':prior}, 'VI consent choice was fabricated'
    for busy in (0,1):
        f.statics[loading]=busy;f.events.clear()
        try:f.run(CONSENT,FORCE,(consent,activity,Reference({},CALLBACK)))
        except ConsentWork:assert not enabled and not busy
        else:
            assert f.events==(['consent-dismissed'] if enabled else [])
            assert f.statics[loading]==(0 if enabled else busy)
    if enabled:
        f.dialog_error=Reference({},'Ljava/lang/IllegalStateException;');f.statics[loading]=1
        try:f.run(CONSENT,FORCE,(consent,activity,Reference({},CALLBACK)))
        except VmThrown as thrown:assert thrown.value is f.dialog_error and f.statics[loading]==0
        else:raise AssertionError('VI manual consent swallowed callback error')
        f.dialog_error=None
