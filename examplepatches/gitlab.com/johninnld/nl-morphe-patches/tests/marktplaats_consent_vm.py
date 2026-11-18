"""Execute the app's real consent display/closure paths with explicit SDK boundaries."""
from marktplaats_push_vm import PushFixture
from rtl_vm import VmThrown

CLIENT='Lcg3;'
CONTROLLER='Ldg3;'
LIB='Lcom/sourcepoint/cmplibrary/SpConsentLib;'
SDK='Lcom/sourcepoint/cmplibrary/SpConsentLibMobileCore;'
REJECT='Lcom/sourcepoint/cmplibrary/SpConsentLibMobileCore$rejectAll$1;'
REJECT_INIT='<init>(Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;'+SDK+'Lkotlin/coroutines/Continuation;)V'
CAMPAIGN='Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;'
READY='onUIReady(Landroid/view/View;)V'
FINISHED='onUIFinished(Landroid/view/View;)V'


class ConsentFixture(PushFixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.native.update((CLIENT,sig) for sig in (READY,FINISHED))
        self.native.update({(SDK,'rejectAll('+CAMPAIGN+')V'),(REJECT,REJECT_INIT)})
        self.statics[CAMPAIGN+'->GDPR:'+CAMPAIGN]=self.new(CAMPAIGN)
        self.consent_calls=[]

    def invoke(self,target,args):
        if target in (LIB+'->showView(Landroid/view/View;)V',LIB+'->removeView(Landroid/view/View;)V'):
            self.consent_calls.append((target.split('->')[1].split('(')[0],args[1]));return None
        if target=='Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V' and args[0].descriptor==REJECT:
            self.defaults(args[0])
            assert args[1]==1;return None
        if target=='Lcom/sourcepoint/cmplibrary/SpConsentLibMobileCoreKt;->launch(Lkotlin/jvm/functions/Function1;)V':
            coroutine=args[0]
            assert coroutine.descriptor==REJECT
            campaign=coroutine.value[REJECT+'->$campaignType:'+CAMPAIGN]
            assert campaign is self.statics[CAMPAIGN+'->GDPR:'+CAMPAIGN]
            assert coroutine.value[REJECT+'->this$0:'+SDK].descriptor==SDK
            assert coroutine.value[REJECT+'->label:I']==0
            self.consent_calls.append(('rejectAll',campaign));return None
        if target=='Lgte;->k(Ljava/lang/Object;)V':
            assert args[1] is self.statics['Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;']
            self.consent_calls.append(('uiClosed',));return None
        if target in ('Landroid/view/View;->setFocusable(Z)V',
                      'Landroid/view/View;->setImportantForAccessibility(I)V',
                      'Landroid/view/View;->requestFocus()Z'):
            self.consent_calls.append((target.split('->')[1].split('(')[0],));return None
        if target=='Lcom/horizon/android/core/tracking/analytics/GoogleAnalyticsEvents;->getValue()Ljava/lang/String;':return 'fixture-banner-loaded'
        if target=='Lqze;->c(ILjava/lang/String;)Ljava/lang/String;':return args[1]+str(args[0])
        if target=='Lcz9;->e(Lcom/horizon/android/core/tracking/analytics/GAEventCategory;Ljava/lang/String;Ljava/lang/String;)V':
            self.consent_calls.append(('bannerMeasurement',));return None
        if target=='Lkotlin/jvm/internal/Intrinsics;->i(Ljava/lang/String;)V':
            raise VmThrown(self.new('Lkotlin/UninitializedPropertyAccessException;'))
        return super().invoke(target,args)

    def client(self,manual=False,missing_sdk=False):
        controller=self.new(CONTROLLER,{CONTROLLER+'->h:'+LIB:0 if missing_sdk else self.new('Lcom/sourcepoint/cmplibrary/SpConsentLibMobileCore;'),
                                       CONTROLLER+'->i:Lgte;':self.new('Lgte;')})
        usecase=self.new('Lcom/horizon/android/feature/consent/usecase/b;',{
            'Lcom/horizon/android/feature/consent/usecase/b;->a:Lkx;':self.new('Lcz9;')})
        controller.value[CONTROLLER+'->d:Lcom/horizon/android/feature/consent/usecase/b;']=usecase
        client=self.new(CLIENT,{CLIENT+'->d:'+CONTROLLER:controller,CLIENT+'->b:Z':int(manual)})
        for owner,field in [('Lcom/horizon/android/core/tracking/analytics/GAEventCategory;','CONSENT_BANNER'),
                            ('Lcom/horizon/android/core/tracking/analytics/GoogleAnalyticsEvents;','CONSENT_BANNER_LOADED')]:
            self.statics[owner+'->'+field+':'+owner]=self.new(owner)
        return client,self.new('Landroid/view/View;')


def verify_consent(f,disabled):
    client,view=f.client();f.consent_calls=[]
    f.run(CLIENT,READY,(client,view))
    names=[e[0] for e in f.consent_calls]
    if disabled:
        assert names==['rejectAll','removeView','uiClosed'], 'Startup consent view was displayed or SDK rejection was not scheduled: '+repr(names)
        assert client.value[CLIENT+'->a:Z']==0
        f.consent_calls=[];f.run(CLIENT,READY,(client,view))
        assert f.consent_calls==[], 'Duplicate startup callback repeated a rejection or closure'
    else:
        assert names==['removeView','showView','setFocusable','setImportantForAccessibility','requestFocus','bannerMeasurement']
    # A user can still open privacy settings deliberately; original UI semantics remain.
    client,view=f.client(manual=True);f.consent_calls=[];f.run(CLIENT,READY,(client,view))
    assert [e[0] for e in f.consent_calls]==['removeView','showView','setFocusable','setImportantForAccessibility','requestFocus','bannerMeasurement']
    assert client.value[CLIENT+'->a:Z']==1
    f.consent_calls=[];f.run(CLIENT,FINISHED,(client,view))
    assert [e[0] for e in f.consent_calls]==['removeView','uiClosed'] and client.value[CLIENT+'->a:Z']==0
    for missing_sdk in (False,True):
        client,view=f.client(missing_sdk=missing_sdk);f.consent_calls=[]
        try:f.run(CLIENT,READY,(client,0 if not missing_sdk else view));raise AssertionError('Original consent input validation skipped')
        except VmThrown as e:assert e.value.descriptor==('Lkotlin/UninitializedPropertyAccessException;' if missing_sdk else 'Ljava/lang/NullPointerException;')
    print('PASS Marktplaats consent startup/manual/duplicate/null/closure paths')
