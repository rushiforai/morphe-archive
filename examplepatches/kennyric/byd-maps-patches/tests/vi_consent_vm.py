"""Consent UI boundaries; the original local age-gate decision still executes."""
from rtl_vm import Reference,VmThrown
from vi_dispatch_vm import DispatchFixture
from vi_tracking_vm import CONSENT

AGE='Lnl/vi/core/betting/age_gate/AgeGateModule;'
CALLBACK='Lnl/vi/ads/data/google_consent/GoogleConsentFormDialogCallback;'
AGE_SIG='showAgeGateDialogIfNeeded(Landroid/app/Activity;)V'


class ConsentWork(Exception):pass


class ConsentFixture(DispatchFixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.native.add((CONSENT,AGE_SIG))
        self.age_shown=self.period_expired=False
        self.age_module=Reference({},AGE)
        self.dialog_error=None
        self.statics[CONSENT+'->consentInformation:Lcom/google/android/ump/ConsentInformation;']=Reference({},'Lcom/google/android/ump/ConsentInformation;')
        self.statics[CONSENT+'->consentRequestParams:Lcom/google/android/ump/ConsentRequestParameters;']=Reference({},'Lcom/google/android/ump/ConsentRequestParameters;')

    def invoke(self,target,args):
        owner,sig=target.split('->',1)
        if target==CONSENT+'->getAgeGateModule()'+AGE:return self.age_module
        if target==AGE+'->isAgeGateDialogShown()Z':return int(self.age_shown)
        if target==AGE+'->mustShowAgeGateDialogAfterPeriod()Z':return int(self.period_expired)
        if owner==AGE and sig.startswith('showAgeGateDialog$default('):self.events.append('age-dialog');return None
        if target==CONSENT+'->log(Ljava/lang/String;)V':return None
        if owner.startswith(CONSENT[:-1]+'$$ExternalSyntheticLambda') and sig.startswith('<init>('):return None
        if owner=='Lcom/google/android/ump/ConsentInformation;' and sig.startswith('requestConsentInfoUpdate('):self.events.append('ump-request');raise ConsentWork()
        if owner==CONSENT and sig.startswith('isAdvertisingIDAvailable('):self.events.append('manual-consent');raise ConsentWork()
        if target==CALLBACK+'->onDialogDismissed()V':
            self.events.append('consent-dismissed')
            if self.dialog_error:raise VmThrown(self.dialog_error)
            return None
        return super().invoke(target,args)
