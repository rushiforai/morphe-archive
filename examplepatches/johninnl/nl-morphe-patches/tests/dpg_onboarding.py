"""Execute Trouw/Volkskrant's emitted startup and native completion methods.

Android, coroutine scheduling and the preference/Room engines are boundaries;
the startup decision, callback, persistence key and continuation tests are app
instructions. No publisher method bodies or user data are bundled here.
"""
from pathlib import Path
import re
from ad_onboarding import VM, Obj, method, source, digest

E='nl/persgroep/edition/'
MAIN=E+'ui/main/MainViewModel'
VALIDATE=MAIN+'$validateState$1'
COMPLETE=MAIN+'$onOnboardingComplete$1'
RESOLVER=E+'ui/main/LaunchStateResolverImpl'
ONBOARD='nl/edition/persgroep/user/onboarding/'
REPO=ONBOARD+'data/OnboardingRepositoryImpl'
IS_SHOWN=ONBOARD+'domain/IsOnboardingShownUseCase'
SET_SHOWN=ONBOARD+'domain/SetOnboardingShownUseCase'
SUSPEND='invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'
STORAGE='Lnl/persgroep/local/domain/UserPreferencesDataSource;'
PUSH=E+'push/'
EXT=PUSH+'ui/extension/OpenNotificationSettingsExtKt'


class StartupVM(VM):
    def switch_case_map(self):return {}

    def __init__(self,root,shown=None,play_services=0,defer=False,**kwargs):
        super().__init__(root,**kwargs)
        if shown is not None:self.prefs['PREF_ONBOARDING_SHOWN']=shown
        self.play_services=play_services;self.defer=defer;self.jobs=[];self.emitted=[];self.reads=[];self.writes=[];self.suspend_dismiss=False;self.room={}
        self.sentinel=Obj('Lkotlin/coroutines/intrinsics/CoroutineSingletons;')
        self.unit=Obj('Lkotlin/Unit;');self.static['Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;']=self.unit
        self.storage=Obj(STORAGE)
        self.repository=Obj('L'+REPO+';',{'preferencesStorage':self.storage})
        is_shown=Obj('L'+IS_SHOWN+';',{'onboardingRepository':self.repository})
        setter=Obj('L'+SET_SHOWN+';',{'onboardingRepository':self.repository})
        self.main=Obj('L'+MAIN+';',{'stateResolver':Obj('L'+RESOLVER+';',{'isOnboardingShownUseCase':is_shown}),
            '_viewState':Obj('Lkotlinx/coroutines/flow/MutableStateFlow;'),
            'setOnboardingShownUseCase':setter,'testIntentHandler':Obj('L'+E+'ui/main/TestIntentHandler;'),
            'suppressFirebaseInAppMessagingUseCase':Obj('L'+E+'domain/messaging/SuppressFirebaseInAppMessagingUseCase;'),
            'dismissAudioCoachmarkCandidate':Obj('L'+E+'domain/data/onboarding/domain/audio/DismissAudioCoachmarkCandidateUseCase;'),
            'onboardingTrackingDelegate':Obj('L'+E+'feature/user/onboarding/tracking/OnboardingTrackingDelegate;'),
            '_requestPushPermission':Obj('L'+E+'foundation/coroutines/MutableSingleEventFlow;')})
        self.lambda_=Obj('L'+VALIDATE+';',{'this$0':self.main,'$intent':self.intent,'$activity':self.context})

    def run(self):return self.call(VALIDATE,SUSPEND,[self.lambda_,self.unit])

    def drain(self):
        while self.jobs:
            job=self.jobs.pop(0);self.call(job.type[1:-1],SUSPEND,[job,self.unit])

    def invoke(self,ref,v,kind):
        typ,sig=ref.split('->');cls=typ[1:-1]
        if typ=='Ljava/util/ArrayList;':
            if sig.startswith('<init>('):v[0].fields['values']=[];return None
            if sig=='add(Ljava/lang/Object;)Z':v[0].fields['values'].append(v[1]);return True
            if sig=='iterator()Ljava/util/Iterator;':return {'values':v[0].fields['values'],'index':0}
        if typ=='Ljava/lang/Iterable;' and sig=='iterator()Ljava/util/Iterator;':
            return {'values':v[0].fields['values'] if isinstance(v[0],Obj) else v[0],'index':0}
        if typ=='Lkotlin/collections/CollectionsKt;':
            if sig=='emptyList()Ljava/util/List;':return []
            if sig=='collectionSizeOrDefault(Ljava/lang/Iterable;)I':return len(v[0].fields['values'] if isinstance(v[0],Obj) else v[0])
        model_classes={PUSH+'data/PushSectionsDtoMapper',PUSH+'data/PushSectionLocalStorage',PUSH+'data/PushSectionLocalStorage$special$$inlined$listPref$default$1',
            PUSH+'data/model/PushSectionDto',PUSH+'data/model/PushCategoryDto',PUSH+'domain/model/Category',PUSH+'domain/model/Section',PUSH+'domain/model/PushSections'}
        if cls in model_classes:return self.call(cls,sig,v)
        if typ=='Lcom/michaelflisar/materialpreferences/core/SettingsModel;':
            if sig.startswith('<init>('):return None
            if sig.startswith('anyPref('):
                stored=v[0].fields['storage'].fields['settings'];value=stored.get(v[3],v[2])
                return Obj('Lcom/michaelflisar/materialpreferences/core/interfaces/StorageSetting;',{'flow':Obj('Lkotlinx/coroutines/flow/Flow;',{'value':value})})
        if typ=='Lcom/michaelflisar/materialpreferences/core/initialisation/SettingSetup;' and sig=='getENABLE_CACHING()Z':return True
        if typ=='Lkotlinx/serialization/json/JsonKt;' and sig.startswith('Json$default('):return Obj('Lkotlinx/serialization/json/Json;')
        if typ=='Lcom/michaelflisar/materialpreferences/core/interfaces/StorageSetting;' and sig=='getFlow()Lkotlinx/coroutines/flow/Flow;':return v[0].fields['flow']
        if cls==RESOLVER and sig.startswith('getGooglePlayServicesResult('):return self.play_services
        if cls==E+'ui/main/TestIntentHandler' and sig.startswith('invoke('):
            self.events.append(('test_intent',v[1]));return self.unit
        if cls==E+'domain/messaging/SuppressFirebaseInAppMessagingUseCase':self.events.append(('popup_suppression',bool(v[1])));return None
        if cls==E+'domain/data/onboarding/domain/audio/DismissAudioCoachmarkCandidateUseCase':
            self.events.append('dismiss_audio_coachmark')
            return self.sentinel if self.suspend_dismiss else self.unit
        if cls==E+'feature/user/onboarding/tracking/OnboardingTrackingDelegate':self.events.append('native_completion_tracking');return None
        if cls in {MAIN,VALIDATE,COMPLETE,RESOLVER,IS_SHOWN,SET_SHOWN,REPO,REPO+'$isOnboardingShown$2',REPO+'$setIsOnboardingShown$2',RESOLVER+'$resolve$1',E+'ui/main/LaunchState',E+'ui/main/MainViewState',E+'ui/main/LaunchState$GooglePlayServicesError',E+'ui/main/MainViewState$GooglePlayServicesError'}:
            return self.call(cls,sig,v)
        if cls==ONBOARD+'OnboardingRepository':return self.call(REPO,sig,v)
        if typ=='Lnl/persgroep/edition/ui/main/LaunchStateResolver;':return self.call(RESOLVER,sig,v)
        if typ==STORAGE:
            if sig=='getBoolean(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;':
                self.reads.append(v[1]);return Obj('Lkotlinx/coroutines/flow/Flow;',{'value':self.prefs.get(v[1])})
            if sig=='setBoolean(Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;':
                self.prefs[v[1]]=bool(v[2]);self.writes.append((v[1],bool(v[2])));return self.unit
        if typ=='Lkotlin/coroutines/intrinsics/IntrinsicsKt;':return self.sentinel
        if typ=='Lkotlin/ResultKt;' and sig=='throwOnFailure(Ljava/lang/Object;)V':
            assert not isinstance(v[0],Exception);return None
        if typ=='Lkotlin/coroutines/jvm/internal/SpillingKt;':return None
        if typ=='Lkotlin/coroutines/jvm/internal/Boxing;' and sig=='boxBoolean(Z)Ljava/lang/Boolean;':return bool(v[0])
        if typ in {'Lkotlin/coroutines/jvm/internal/ContinuationImpl;','Lkotlin/coroutines/jvm/internal/SuspendLambda;'} and sig.startswith('<init>'):return None
        if typ=='Lkotlinx/coroutines/flow/FlowKt;' and sig.startswith('firstOrNull('):return v[0].fields['value']
        if typ=='Lkotlinx/coroutines/BuildersKt;':
            if sig.startswith('withContext('):return self.call(v[1].type[1:-1],SUSPEND,[v[1],self.unit])
            if sig.startswith('launch$default('):
                if self.defer:self.jobs.append(v[3])
                else:self.call(v[3].type[1:-1],SUSPEND,[v[3],self.unit])
                return Obj('Lkotlinx/coroutines/Job;')
        if typ=='Landroidx/lifecycle/ViewModelKt;':return Obj('Lkotlinx/coroutines/CoroutineScope;')
        if typ=='L'+E+'foundation/coroutines/Coroutines;' and sig=='getIO()Lkotlinx/coroutines/CoroutineDispatcher;':return Obj('Lkotlinx/coroutines/CoroutineDispatcher;')
        if typ=='Landroidx/media3/ui/HtmlUtils;' and sig.startswith('areEqual('):return v[0] is v[1] or v[0]==v[1]
        if typ=='Ljava/lang/Number;' and sig=='intValue()I':return int(v[0])
        if typ=='Lkotlinx/coroutines/flow/MutableSharedFlow;' and sig.startswith('emit('):
            self.emitted.append(v[1]);return self.unit
        if typ=='L'+E+'foundation/coroutines/MutableSingleEventFlow;' and sig.startswith('tryEmit('):
            self.events.append('manual_push_request');return None
        if cls==EXT:
            if sig=='getShouldShowPushPermissionRationale(Landroid/app/Activity;)Z':return False
            if sig=='getPushPermissionNotGranted(Landroid/content/Context;)Z':return not self.os_granted
            if sig.startswith('notifyPushPermissionDialogShown('):self.events.append('permission_dialog_recorded');return None
            if sig.startswith('requestPushPermission('):return self.call(cls,sig,v)
        if typ=='Landroidx/activity/result/ActivityResultLauncher;' and sig=='launch(Ljava/lang/Object;)V':self.events.append(('permission_request',v[1]));return None
        if cls==PUSH+'domain/usecase/UpdatePushCategoryUseCase':return self.call(cls,sig,v)
        if cls==PUSH+'repository/PushRepository' and sig.startswith('updatePushCategory('):
            self.subscriptions.append((v[1],bool(v[2])));self.room[v[1]]=bool(v[2]);return self.unit
        return super().invoke(ref,v,kind)


def verify_startup(root,enabled):
    for shown in [None,False,True]:
        for account in [False,True]:
            for granted in [False,True]:
                for defer in [False,True]:
                    vm=StartupVM(root,shown=shown,authenticated=account,os_granted=granted,defer=defer)
                    # Existing values are independent persistence engines and
                    # must never be reset, even during incomplete onboarding.
                    vm.prefs['real-account-state']='opaque-existing' if account else None
                    vm.room={'explicit-category':True} if account else {}
                    before_room=dict(vm.room);before_topics=dict(vm.topics.physical)
                    result=vm.run();assert result is vm.unit
                    expected='Home' if enabled or shown else 'Onboarding'
                    assert vm.emitted and all(x.type=='L'+E+'ui/main/MainViewState$'+expected+';' for x in vm.emitted),('Automatic onboarding must finish before its graph is created',shown,account,granted,defer,[x.type for x in vm.emitted])
                    vm.drain()
                    assert all(x.type=='L'+E+'ui/main/MainViewState$'+expected+';' for x in vm.emitted)
                    assert vm.prefs.get('PREF_ONBOARDING_SHOWN')==(True if enabled else shown)
                    assert vm.writes==([('PREF_ONBOARDING_SHOWN',True)] if enabled and not shown else [])
                    assert vm.prefs['real-account-state']==('opaque-existing' if account else None)
                    assert vm.room==before_room and vm.topics.physical==before_topics and not vm.subscriptions
                    assert ('test_intent',vm.intent) in vm.events and not any(isinstance(e,tuple) and e[0]=='permission_request' for e in vm.events)
    for error in [1,2,9]:
        vm=StartupVM(root,play_services=error);vm.run()
        assert len(vm.emitted)==1 and vm.emitted[0].type=='L'+E+'ui/main/MainViewState$GooglePlayServicesError;'
        assert not vm.writes and not vm.jobs,'Retain native Google Play error handling'


def verify_manual(root):
    # Existing explicit settings action still emits the request; invoking the
    # retained permission dispatcher then reaches Android only when denied.
    for granted in [False,True]:
        vm=StartupVM(root,shown=True,os_granted=granted)
        vm.call(MAIN,'requestPushPermission()V',[vm.main]);assert vm.events==['manual_push_request']
        vm.call(EXT,'requestPushPermission(Landroid/app/Activity;Landroidx/activity/result/ActivityResultLauncher;Lkotlin/jvm/functions/Function0;)V',
            [vm.context,Obj('Landroidx/activity/result/ActivityResultLauncher;'),Obj('Lkotlin/jvm/functions/Function0;')])
        assert [x for x in vm.events if isinstance(x,tuple)]==([] if granted else [('permission_request','android.permission.POST_NOTIFICATIONS')])
        for choice in [True,False]:
            usecase=Obj('L'+PUSH+'domain/usecase/UpdatePushCategoryUseCase;',{'pushRepository':Obj('L'+PUSH+'repository/PushRepository;')})
            vm.call(PUSH+'domain/usecase/UpdatePushCategoryUseCase','invoke(Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;',[usecase,'fixture-category',choice,None])
        assert vm.subscriptions==[('fixture-category',True),('fixture-category',False)],'Manual on/off subscription contract remains functional'


def verify_resumed_startup(root,enabled):
    for defer in [False,True]:
        vm=StartupVM(root,defer=defer);vm.suspend_dismiss=True
        assert vm.run() is vm.sentinel and not vm.emitted and not vm.writes
        assert vm.lambda_.fields['label']==3,'Resume the real audio-dismiss suspension point'
        result=vm.call(VALIDATE,SUSPEND,[vm.lambda_,vm.unit]);assert result is vm.unit
        vm.drain()
        expected='Home' if enabled else 'Onboarding'
        assert vm.emitted and all(x.type=='L'+E+'ui/main/MainViewState$'+expected+';' for x in vm.emitted)
        assert vm.writes==([('PREF_ONBOARDING_SHOWN',True)] if enabled else []),'Resumed startup must enter native completion, not jump past injected code'


def verify_notification_defaults(root):
    # The original storage wrapper, not a fake USER_CHANNELS key, supplies the
    # legacy missing value. Existing serialized preference values stay intact.
    for existing in [None,[],['opaque-legacy-explicit-choice']]:
        vm=StartupVM(root);saved={} if existing is None else {'pushSections':existing}
        storage=Obj('Lcom/michaelflisar/materialpreferences/core/interfaces/Storage;',{'settings':saved})
        wrapper=Obj('L'+PUSH+'data/PushSectionLocalStorage;')
        vm.call(PUSH+'data/PushSectionLocalStorage','<init>(Lcom/michaelflisar/materialpreferences/core/interfaces/Storage;)V',[wrapper,storage])
        flow=vm.call(PUSH+'data/PushSectionLocalStorage','getPushSectionsFlow$domain_data_push_notifications()Lkotlinx/coroutines/flow/Flow;',[wrapper])
        assert flow.fields['value']==([] if existing is None else existing)
        assert saved==({} if existing is None else {'pushSections':existing}) and not vm.subscriptions
    # Current Room/BFF conversion defaults missing subscription false, even
    # when the category advertises enabledDuringOnboarding. Explicit true and
    # false values are retained. The separate onboarding promotion is skipped.
    vm=StartupVM(root)
    categories=[Obj('L'+PUSH+'data/model/PushCategoryDto;',{'id':'fixture-'+str(i),'title':'Fixture','description':'Fixture description','subscribed':value,'enabledDuringOnboarding':True}) for i,value in enumerate([None,False,True])]
    section=Obj('L'+PUSH+'data/model/PushSectionDto;',{'title':'Fixture section','categories':categories})
    sections=vm.call(PUSH+'data/PushSectionsDtoMapper','invoke(Ljava/util/List;)L'+PUSH+'domain/model/PushSections;',[Obj('L'+PUSH+'data/PushSectionsDtoMapper;'),[section]])
    mapped=sections.fields['sections'].fields['values'][0].fields['categories'].fields['values']
    assert [x.fields['subscribed'] for x in mapped]==[0,False,True]
    assert [x.fields['enabledDuringOnboarding'] for x in mapped]==[True,True,True]
    assert [x.fields['id'] for x in mapped]==['fixture-0','fixture-1','fixture-2'] and not vm.subscriptions


def verify_onboarding(root:Path,enabled:bool,brand:str):
    assert brand in {'trouw','volkskrant','parool'}
    verify_startup(root,enabled);verify_resumed_startup(root,enabled);verify_notification_defaults(root);verify_manual(root)
    verify_preserved(root,enabled,brand)


def verify_preserved(root,enabled,brand):
    from dpg_onboarding_contracts import ORIGINAL
    if brand == 'parool':
        from parool_onboarding_contracts import ORIGINAL as original
    else:
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
