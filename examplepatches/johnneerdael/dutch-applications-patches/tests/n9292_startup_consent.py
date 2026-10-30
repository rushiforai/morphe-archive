"""Execute the shipped readiness observer and native deny-all consumer."""
from rtl_vm import Reference, VmThrown
from n9292_tracking_vm import TrackingFixture
from n9292_saved_consent import SavedConsentFixture,STORE,INIT,HOME,FUNCTIONAL,POPUP,DELETE
from brabant_smali import canonical

CLIENT='Lcom/pairip/licensecheck/LicenseClient;'
CHECK='checkLicense(Landroid/content/Context;)V'
OBSERVER='Lhb3;'
OBSERVE='invoke(Ljava/lang/Object;)Ljava/lang/Object;'
READY='Lcom/usercentrics/sdk/UsercentricsReadyStatus;'
MERGE='a(Ljava/lang/String;Ljava/util/List;Lcom/usercentrics/sdk/v2/consent/data/DataTransferObject;)Ljava/util/ArrayList;'
LOCAL=MERGE.replace('a(', 'morpheApplyLocalConsent(',1)
COMMIT='b(Ljava/lang/String;Ljava/util/List;Ltcd;Lvcd;)V'
MATCH='morpheConsentMatches(Ljava/util/List;Ljava/lang/String;)Z'


class StartupConsentFixture(TrackingFixture,SavedConsentFixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.native.add((CLIENT,CHECK))
        self.native.update({('Lded;','b(Lvcd;)Ljava/util/ArrayList;'),('Lded;','f(Ljava/util/List;Lvcd;)Ljava/util/ArrayList;'),('Lded;','c()Ljava/util/ArrayList;'),('Luu2;','a(Ljava/util/List;Li55;)V'),('Luu2;','e()Z'),('Luu2;','g(Li55;)V')})
        self.statics[CLIENT+'->mainThreadRunner:Lcom/pairip/licensecheck/LicenseClient$ImmediateTaskExecutor;']=self.new('Lcom/pairip/licensecheck/LicenseClient$ImmediateTaskExecutor;')
        for owner,name in [('Lvcd;','EXPLICIT'),('Ltcd;','DENY_ALL_SERVICES'),('Ltcd;','UPDATE_SERVICES')]:
            self.statics[owner+'->'+name+':'+owner]=self.new(owner)
        self.denial_error=None
        self.sdk_consent=self.new('Lded;')
        self.clock_ms=1000999
        self.last_timestamp=-1
        self.routing=False;self.settings_available=True;self.history_override=None
        for owner,sig,local in [('Lo83;',LOCAL,40),(OBSERVER,MATCH,4)]:
            if sig in self.declarations.classes[owner].methods:
                self.rows[owner,sig]=(owner,sig,self.declarations.classes[owner].methods[sig].access_flags,local,0,'')
                self.native.add((owner,sig))
        self.statics['Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;']=Reference(True,'Ljava/lang/Boolean;')

    def invoke(self,target,args):
        if target.startswith(('Lb6;->o(', 'Lb6;->z(')) and args[1].descriptor==STORE:
            return SavedConsentFixture.invoke(self,target,args)
        if target.startswith('Lo83;->') and target.split('->',1)[1] in (MERGE,LOCAL) and self.routing:
            self.route=target.split('->',1)[1];return Reference([],'Ljava/util/ArrayList;')
        if target==CLIENT+'->isIsolatedProcess()Z':return 0
        if target.startswith('Lcom/pairip/licensecheck/LicenseClient$$ExternalSyntheticLambda6;-><init>'):
            args[0].value['context']=args[1];return None
        if target.endswith('LicenseClient$ImmediateTaskExecutor;->run(Ljava/lang/Runnable;)V'):
            self.events.append(('license-dispatch',args[1].value['context']));return None
        if target=='Lvdg;->s()Lydd;':return self.sdk_consent
        if target=='Lydd;->b(Lvcd;)Ljava/util/ArrayList;':
            if self.denial_error:raise VmThrown(self.denial_error)
            self.events.append(('deny-all',))
            return self.run('Lded;','b(Lvcd;)Ljava/util/ArrayList;',args)[0]
        if target=='Lydd;->f(Ljava/util/List;Lvcd;)Ljava/util/ArrayList;':
            if self.denial_error:raise VmThrown(self.denial_error)
            self.events.append(('update-services',))
            self.latest_sdk_result=self.run('Lded;','f(Ljava/util/List;Lvcd;)Ljava/util/ArrayList;',args)[0]
            return self.latest_sdk_result
        if target=='Lydd;->c()Ljava/util/ArrayList;':return self.run('Lded;','c()Ljava/util/ArrayList;',args)[0]
        if target=='Lcom/usercentrics/sdk/UsercentricsServiceConsent;-><init>(Ljava/lang/String;ZLjava/util/ArrayList;Lvcd;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V':
            args[0].value.update({'Lcom/usercentrics/sdk/UsercentricsServiceConsent;->a:Ljava/lang/String;':args[1],'Lcom/usercentrics/sdk/UsercentricsServiceConsent;->b:Z':args[2],'Lcom/usercentrics/sdk/UsercentricsServiceConsent;->g:Z':args[7]});return None
        if target=='Lx92;->Y(Ljava/util/List;)Ljava/lang/Object;':return args[0].value[-1] if args[0].value else 0
        if target=='Ljava/util/List;->add(Ljava/lang/Object;)Z':args[0].value.append(args[1]);return 1
        if target=='Lcom/usercentrics/sdk/UserDecision;-><init>(Ljava/lang/String;Z)V':
            args[0].value={'Lcom/usercentrics/sdk/UserDecision;->a:Ljava/lang/String;':args[1], 'Lcom/usercentrics/sdk/UserDecision;->b:Z':args[2]};return None
        if target=='Lo92;->c(Ljava/lang/Object;)Ljava/util/List;':return Reference([args[0]],'Ljava/util/ArrayList;')
        if target=='Lded;->o()Lw0c;':return self.new('Ld0c;')
        if target=='Ld0c;->j()Lcom/usercentrics/sdk/v2/settings/data/TCF2Settings;':return 0
        if target=='Lded;->r()Z':return 1
        if target=='Lkl7;->a(I)I':return args[0]
        if target=='Ljava/util/LinkedHashMap;-><init>(I)V':args[0].value={};return None
        if target=='Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;':args[0].value[args[1]]=args[2];return 0
        if target=='Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z':return int(args[1] in args[0].value)
        if target=='Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;':return args[0].value.get(args[1],0)
        if target in {'Ljava/util/List;->isEmpty()Z','Ljava/util/ArrayList;->isEmpty()Z'}:return int(not args[0].value)
        if target=='Lzyb;->getValue()Ljava/lang/Object;':return args[0].value['fixture-value']
        if target=='Ljava/util/ArrayList;-><init>(I)V':args[0].value=[];return None
        if target=='Lq92;->o(Ljava/lang/Iterable;I)I':return len(args[0].value)
        if target=='Li37;-><init>(Ljava/util/List;Z)V':
            args[0].value={'Li37;->a:Ljava/util/List;':args[1],'Li37;->b:Z':args[2]};return None
        if target=='Lq37;->a(Lq37;Li37;)Lq37;':
            value=dict(args[0].value);value['Lq37;->p:Li37;']=args[1];return self.new('Lq37;',value)
        if target=='Loh7;->a()Lo83;':return self.new('Lo83;')
        if target=='Lo83;->b(Ljava/lang/String;Ljava/util/List;Ltcd;Lvcd;)V':
            assert args[3] in [self.statics['Ltcd;->DENY_ALL_SERVICES:Ltcd;'],self.statics['Ltcd;->UPDATE_SERVICES:Ltcd;']]
            assert args[4] is self.statics['Lvcd;->EXPLICIT:Lvcd;']
            # Execute the retained SDK timestamp arbitration branch. Storage and
            # the wall clock are boundaries; equal-second updates retain old rows.
            if not self.settings_available:return None
            new_timestamp=self.clock_ms//1000*1000
            code=canonical(self.source.body('Lo83;',COMMIT)).code
            stop=next(i for i,line in enumerate(code) if line=='iget-object p2, v0, La6b;->b:Ll37;')
            self.routing=True
            try:
                settings=self.new('La6b;')
                _,frame=self.run('Lo83;',COMMIT,start=23,stop_at=(stop,),registers={'v0':settings,'v5':args[2],
                    'v8':args[0],'v9':args[1],'v10':self.new('Lcom/usercentrics/sdk/v2/consent/data/DataTransferObject;'),
                    'v11':args[3],'v12':args[4]})
                assert frame['v0'] is settings,'9292 changed the settings receiver while routing consent'
                if LOCAL in self.declarations.classes['Lo83;'].methods:
                    assert frame['v6'] is args[3],'9292 changed the action passed to consent persistence'
            finally:self.routing=False
            branch=self.run('Lo83;',self.route,start=123,stop_at=(125,195),registers={'v0':self.last_timestamp,'v8':new_timestamp})[0]
            if branch==195:
                updates={row.value['Lq37;->f:Ljava/lang/String;']:row for row in args[2].value}
                self.settings.value['La6b;->b:Ll37;'].value['Ll37;->b:Ljava/util/List;']=Reference([updates.get(row.value['Lq37;->f:Ljava/lang/String;'],row) for row in self.settings.value['La6b;->b:Ll37;'].value['Ll37;->b:Ljava/util/List;'].value],'Ljava/util/ArrayList;')
                self.last_timestamp=new_timestamp
            self.persisted=self.run('Lded;','c()Ljava/util/ArrayList;',(self.sdk_consent,))[0]
            self.events.append(('consent-persist',));return None
        if target=='Ldya;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V':return None
        if target=='Lded;->l(Ljava/util/ArrayList;Ldya;)V':self.events.append(('consent-notify',));return None
        if target=='Lded;->s()V':self.events.append(('consent-flush',));return None
        if target=='Li13;-><init>(Ljava/lang/Object;I)V':
            assert args[2]==23;args[0].value['target']=args[1];return None
        if target=='Luu2;->a(Ljava/util/List;Li55;)V':
            self.events.append(('apply-consent',args[1],args[2]))
            if self.apply_native:
                assert self.run('Luu2;','e()Z',(args[0],))[0]==1,'9292 functional enable lost to same-second SDK timestamp arbitration'
                return self.run('Luu2;','a(Ljava/util/List;Li55;)V',args)[0]
            return None
        if target=='Li55;->invoke()Ljava/lang/Object;':self.events.append(('completion',));return self.statics['Lc9d;->a:Lc9d;']
        if target=='Lojg;->x(Ljava/lang/String;)V':return None
        if target=='Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V':args[0].value['message']=args[1];return None
        if target in {'Lw8a;-><init>(Ljava/lang/Object;)V','Lnl/negentwee/domain/Result$Error;-><init>(Ljava/lang/Throwable;)V'}:
            args[0].value['value']=args[1]
            if target.startswith('Lnl/negentwee/domain/Result$Error;'):
                args[0].value['Lnl/negentwee/domain/Result$Error;->a:Ljava/lang/Throwable;']=args[1]
            return None
        if target=='Landroidx/lifecycle/l;->j(Ljava/lang/Object;)V':
            self.events.append(('ui-result',args[1]));return None
        return super().invoke(target,args)

    def services(self,required):
        rows=[self.new('Lq37;',{'Lq37;->f:Ljava/lang/String;':'service-'+str(i),'Lq37;->q:Z':int(value),'Lq37;->p:Li37;':
              self.new('Li37;',{'Li37;->b:Z':1,'Li37;->a:Ljava/util/List;':Reference([],'Ljava/util/ArrayList;')})}) for i,value in enumerate(required)]
        rows.append(self.new('Lq37;',{'Lq37;->f:Ljava/lang/String;':'functional','Lq37;->q:Z':0,'Lq37;->p:Li37;':self.new('Li37;',{'Li37;->b:Z':0,'Li37;->a:Ljava/util/List;':Reference([],'Ljava/util/ArrayList;')})}))
        settings=self.new('La6b;',{'La6b;->b:Ll37;':self.new('Ll37;',{'Ll37;->b:Ljava/util/List;':Reference(rows,'Ljava/util/ArrayList;')})})
        self.settings=settings;self.last_timestamp=-1 if self.history_override is None else self.history_override
        self.sdk_consent.value['Lded;->a:Loh7;']=self.new('Loh7;',{'Loh7;->F:Lzyb;':self.new('Lzyb;',{'fixture-value':settings})})
        self.sdk_consent.value['Lded;->c:Ljava/lang/String;']='fixture-controller'


def verify_startup_consent(f,fixed,consent):
    f.apply_native=consent
    context=f.new('Landroid/content/Context;');f.events.clear()
    f.run(CLIENT,CHECK,(context,))
    assert [e[0] for e in f.events]==([] if fixed else ['license-dispatch']), '9292 licensing still dispatches a shutdown-capable check'
    # Use the genuine shared-lambda selector, rather than bypass its switch.
    selector=next(k for k,v in next(iter(f.program(OBSERVER,OBSERVE).switches.values())).items() if v==28)
    values={FUNCTIONAL:True,DELETE:False,'savedTrips':object()}
    store=f.new(STORE);onboarding=f.new('Lqn8;')
    f.run(STORE,INIT,(store,Reference(values,'Landroid/content/SharedPreferences;'),f.new('Lqg9;'),onboarding))
    sink=f.new('La38;');service=f.new('Luu2;',{'Luu2;->i:Lzyb;':f.new('Lzyb;',{'fixture-value':'functional'}),'Luu2;->c:Lru2;':store})
    vm=f.new('Lnl/negentwee/ui/features/MainViewModel;',{'Lnl/negentwee/ui/features/MainViewModel;->a:Luu2;':service})
    receiver=f.new(OBSERVER,{OBSERVER+'->a:I':selector,OBSERVER+'->b:Ljava/lang/Object;':sink,OBSERVER+'->c:Ljava/lang/Object;':vm})
    for fresh in (True,False):
        for required in ([],[True],[False],[True,False,False]):
            f.services(required);f.events.clear()
            stale=Reference(['restored-opt-in'],'Ljava/util/ArrayList;')
            ready=f.new(READY,{READY+'->a:Z':int(fresh),READY+'->b:Ljava/util/List;':stale})
            result=f.new('Lw8a;',{'Lw8a;->a:Ljava/lang/Object;':ready})
            f.run(OBSERVER,OBSERVE,(receiver,result))
            kinds=[e[0] for e in f.events]
            if consent:
                assert [r.value['Lcom/usercentrics/sdk/UsercentricsServiceConsent;->b:Z'] for r in f.persisted.value]==[int(v) for v in required]+[1], '9292 functional enable lost to same-second SDK timestamp arbitration'
                assert kinds.count('consent-persist')==1 and 'deny-all' not in kinds,'9292 issues conflicting consent writes'
                applied=next(e for e in f.events if e[0]=='apply-consent')
                assert applied[1] is f.latest_sdk_result and applied[2].value['target'] is sink
                assert values[FUNCTIONAL] is True and values.get(POPUP) not in (True,'true'),'9292 native consent reconciliation recreates deletion prompt'
                assert kinds.count('completion')==1
            elif fresh:assert kinds==['ui-result']
            else:assert kinds==['apply-consent'] and f.events[0][1] is stale
    failure=f.new('Ljava/lang/IllegalStateException;');f.events.clear()
    result=f.new('Lnl/negentwee/domain/Result$Error;',{'Lnl/negentwee/domain/Result$Error;->a:Ljava/lang/Throwable;':failure})
    f.run(OBSERVER,OBSERVE,(receiver,result))
    assert len(f.events)==1 and f.events[0][0]=='ui-result' and f.events[0][1].value['value'] is failure
    if consent:
        f.denial_error=failure;f.events.clear()
        try:f.run(OBSERVER,OBSERVE,(receiver,f.new('Lw8a;',{'Lw8a;->a:Ljava/lang/Object;':ready})))
        except VmThrown as error:assert error.value is failure
        else:raise AssertionError('9292 fabricated success after native rejection failure')
        assert not f.events
        f.denial_error=None
        # Real ready-success with unavailable native settings must report the
        # existing failure result, never normal completion or a deletion prompt.
        f.services([False]);f.settings_available=False;f.events.clear()
        f.run(OBSERVER,OBSERVE,(receiver,f.new('Lw8a;',{'Lw8a;->a:Ljava/lang/Object;':ready})))
        kinds=[event[0] for event in f.events]
        assert 'ui-result' in kinds and 'apply-consent' not in kinds and 'completion' not in kinds
        forwarded=f.events[-1][1].value['Lnl/negentwee/domain/Result$Error;->a:Ljava/lang/Throwable;']
        assert forwarded.descriptor=='Ljava/lang/IllegalStateException;' and forwarded.value['message']=='Privacy settings could not be saved. Please try again.'
        assert values.get(POPUP) not in (True,'true') and values[FUNCTIONAL] is True
        f.settings_available=True


def verify_commit_routing(f,selected):
    if selected:
        def row(identifier,allowed,required=False):return f.new('Lcom/usercentrics/sdk/UsercentricsServiceConsent;',{
            'Lcom/usercentrics/sdk/UsercentricsServiceConsent;->a:Ljava/lang/String;':identifier,
            'Lcom/usercentrics/sdk/UsercentricsServiceConsent;->b:Z':int(allowed),
            'Lcom/usercentrics/sdk/UsercentricsServiceConsent;->g:Z':int(required)})
        for rows,expected in [([],0),([row('optional',False)],0),([row('functional',False)],0),
                              ([row('functional',True),row('optional',True)],0),
                              ([row('functional',True),row('required',False,True)],0),
                              ([row('functional',True),row('optional',False),row('required',True,True)],1)]:
            assert f.run(OBSERVER,MATCH,(Reference(rows,'Ljava/util/ArrayList;'),'functional'))[0]==expected,'9292 accepts incomplete or opted-in consent state'
    for action in ['UPDATE_SERVICES','INITIAL_PAGE_LOAD','NON_EU_REGION']:
        for source in ['EXPLICIT','IMPLICIT']:
            a=f.statics.setdefault('Ltcd;->'+action+':Ltcd;',f.new('Ltcd;'))
            s=f.statics.setdefault('Lvcd;->'+source+':Lvcd;',f.new('Lvcd;'))
            code=canonical(f.source.body('Lo83;',COMMIT)).code
            stop=next(i for i,line in enumerate(code) if line=='iget-object p2, v0, La6b;->b:Ll37;')
            f.routing=True
            try:
                settings=f.new('La6b;')
                _,frame=f.run('Lo83;',COMMIT,start=23,stop_at=(stop,),registers={'v0':settings,
                    'v5':Reference([],'Ljava/util/ArrayList;'),'v8':f.new('Lo83;'),'v9':'controller',
                    'v10':f.new('Lcom/usercentrics/sdk/v2/consent/data/DataTransferObject;'),'v11':a,'v12':s})
                assert f.route==(LOCAL if selected and action=='UPDATE_SERVICES' and source=='EXPLICIT' else MERGE),'9292 overrides implicit or imported SDK history'
                if selected:assert frame['v6'] is a,'9292 changed the action passed to consent persistence'
            finally:f.routing=False
