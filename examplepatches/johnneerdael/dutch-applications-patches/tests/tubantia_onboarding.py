"""Execute Tubantia 9.23.2 emitted onboarding at Android/storage boundaries.

The shared interpreter consumes the actual emitted instructions. The new app
ABI below is explicit; its automatic-auth router and encrypted storage differ
from AD 9.22.0. Contract fixtures contain hashes, never publisher bodies.
"""
import json
from pathlib import Path
import re
from ad_onboarding import VM, Obj, Enum, EncryptedPreferences, TopicBoundary, method, source, digest

TOPIC='com/kubusapp/onboarding/OnBoardingPushNotificationActivity'
REGION='com/kubusapp/onboarding/regionselection/OnboardingRegionSelectionActivity'
FOLLOW='com/kubusapp/onboarding/followablepush/FollowablePushActivity'
ROUTER='egj'
ROUTE='b(Landroid/content/Context;Lcgj;Lo20;Landroid/content/Intent;)V'
SUSPEND='invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'
STATE='ur6'
CONTRACTS=Path(__file__).with_name('tubantia_onboarding_contracts.json')


class OnboardingVM(VM):
    def switch_case_map(self):
        mapping={};current=None;value=None
        for line in method(self.root,'dgj','<clinit>()V').instructions:
            match=re.search(r'Lcgj;->(\w+):Lcgj;',line)
            if match:current=match[1]
            match=re.match(r'const(?:/4|/16)? v2, (\S+)',line)
            if match:value=int(match[1],0)
            if line.startswith('aput '):mapping[current]=value
        return mapping

    def __init__(self,root,**kwargs):
        super().__init__(root,**kwargs)
        self.analytics=Obj('Lo20;')
        self.static.update({'Legj;->a:Landroid/net/Uri;':self.intent.fields['data'],
                            'Legj;->b:Landroid/os/Bundle;':self.intent.fields['extras'],
                            'Ldgj;->a:[I':self.case_map})
        self.static.update({'Lcgj;->'+name+':Lcgj;':self.enum(name) for name in self.case_map})

    def invoke(self,ref,v,kind):
        typ,target=ref.split('->');cls=typ[1:-1]
        if typ=='Legj;':return self.call(cls,target,v)
        if typ=='Ld33;' and target.startswith('y('):self.events.append('automatic_login');return None
        if typ=='Ll02;' and target=='<init>()V':
            v[0].fields['a']=Obj('Lrqg;',{'value':Obj('Leef;',{'encrypted':self.topics})});return None
        if typ=='Ldl;':
            if target=='<init>(Landroid/content/Context;)V':v[0].fields['c']=Obj('Lrqg;',{'value':self.prefs});return None
            if target=='n(Ljava/lang/String;)V':self.prefs['KEY_ON_BOARDING_PROGRESS']=v[1];return None
        if typ=='Lrqg;' and target=='getValue()Ljava/lang/Object;':return v[0].fields['value']
        if typ=='Leef;':return super().invoke('Ljaf;->'+target,v,kind)
        if typ=='Lxke;' and target=='b(Ljava/lang/String;Ljava/lang/String;)Z':return self.topic_feature
        if typ=='Lo20;':return None  # Measurement boundary; no navigation/persistence result.
        if cls==TOPIC and target=='j()Lh9;':return Obj('Lh9;',{'activity':v[0]})
        if typ=='Lh9;' and target=='c()V':
            activity=v[0].fields['activity'];activity.fields['e']=Obj('Ldl;',{'c':Obj('Lrqg;',{'value':self.prefs})})
            activity.fields['d']=self.analytics;self.events.append('hilt_initialized');return None
        if typ in {'Ly3g;','Lz3g;'}:
            if target.startswith('<init>('):return None
            if target=='g()V':return None
        if typ=='Lur6;' and (target.startswith('<init>(') or target=='a(Lur6;ZZZI)Lur6;'):
            return self.call(cls,target,v)
        if typ=='Lb0e;' and target=='a()Z':return self.os_granted
        if typ=='Li8g;':
            if target=='getValue()Ljava/lang/Object;':return v[0].fields['value']
            if target in {'k(Ljava/lang/Object;Ljava/lang/Object;)Z','m(Ljava/lang/Object;Ljava/lang/Object;)Z'}:
                if target.startswith('k('):assert v[0].fields['value'] is v[1]
                v[0].fields['value']=v[2];return True
        if typ=='Ljie;' and target=='b(Lss3;)Ljava/lang/Object;':return self.selected_region
        if typ=='Lnbi;' and target=='g0(Ljava/lang/Object;)V':assert not isinstance(v[0],Exception);return None
        if typ=='Lcom/kubusapp/feature/auth/model/AuthenticationInfo;' and target=='getEmail()Ljava/lang/String;':return v[0].fields['email']
        if cls==FOLLOW and target=='l()Lyr6;':return v[0].fields['viewmodel']
        if target=='setContentView(I)V':self.events.append('topic_fragment_created');raise TopicBoundary()
        return super().invoke(ref,v,kind)


def verify_seed(root):
    for existing in [None,[],['saved-real-channel','another-saved-channel']]:
        topics=EncryptedPreferences(existing);before=dict(topics.physical)
        vm=OnboardingVM(root,topics=topics)
        vm.call(ROUTER,'morpheSeedTopicChoices()V',[])
        if existing is None:
            assert topics.physical[topics.key]==frozenset() and len(topics.writes)==1
        else:assert topics.physical==before and not topics.writes,'Preserve saved encrypted choices'
        first=dict(topics.physical)
        vm.call(ROUTER,'morpheSeedTopicChoices()V',[])
        assert topics.physical==first and len(topics.writes)==(1 if existing is None else 0)
        assert topics.physical['unrelated-encrypted-key']==before['unrelated-encrypted-key']


def verify_routes(root):
    for state in ['LOGIN_SEDUCTION_SCREEN','LOGIN_SCREEN','PUSH_NOTIFICATION_SCREEN','REGIONAL_FOLLOWABLE_SCREEN']:
        vm=OnboardingVM(root)
        vm.call(ROUTER,ROUTE,[vm.context,vm.enum(state),vm.analytics,None])
        index=0
        while index<len(vm.started):
            target=vm.started[index]['cls'];index+=1
            if target=='L'+TOPIC+';':vm.call(TOPIC,'onCreate(Landroid/os/Bundle;)V',[Obj(target),None])
        expected='Lcom/kubusapp/MainActivity;' if state=='REGIONAL_FOLLOWABLE_SCREEN' else 'L'+REGION+';'
        assert vm.started[-1]['cls']==expected,(state,vm.started)
        assert 'automatic_login' not in vm.events and 'topic_fragment_created' not in vm.events
        if state!='REGIONAL_FOLLOWABLE_SCREEN':
            assert vm.prefs['KEY_ON_BOARDING_PROGRESS']=='REGION_SELECTION_SCREEN'
            assert vm.topics.physical[vm.topics.key]==frozenset()
        else:
            assert vm.prefs['KEY_ON_BOARDING_COMPLETE'] is True
            assert vm.started[-1]['data']==vm.intent.fields['data']
            assert vm.started[-1]['extras'] is vm.intent.fields['extras']
            assert not vm.topics.writes
    vm=OnboardingVM(root)
    vm.call(ROUTER,ROUTE,[vm.context,vm.enum('CONFIG_SCREEN'),vm.analytics,vm.intent])
    assert vm.started[-1]['cls']=='Lcom/kubusapp/onboarding/PrivacyConsentTCF2Activity;'
    assert vm.static['Legj;->a:Landroid/net/Uri;']==vm.intent.fields['data']
    assert vm.static['Legj;->b:Landroid/os/Bundle;'] is vm.intent.fields['extras']


def verify_topic(root):
    for complete in [False,True]:
        for feature in [False,True]:
            vm=OnboardingVM(root,complete=complete,topic_feature=feature)
            vm.call(TOPIC,'onCreate(Landroid/os/Bundle;)V',[Obj('L'+TOPIC+';'),{'saved':'state'}])
            assert vm.events[:2]==['super_onCreate','hilt_initialized']
            assert 'topic_fragment_created' not in vm.events and vm.finished==1
            assert len(vm.started)==1
            assert vm.started[-1]['cls']==('Lcom/kubusapp/MainActivity;' if complete else 'L'+REGION+';')
            if complete:
                assert vm.started[-1]['data']==vm.intent.fields['data']
                assert vm.started[-1]['extras'] is vm.intent.fields['extras'] and not vm.topics.writes


def region_fixture(vm,notifications=False,newsletter=False):
    vm.selected_region=Obj('Lcom/kubusapp/region/Region;',{'id':'fixture-region','name':'Fixture City'})
    vm.static['Llj1;->b:Li8g;']=Obj('Li8g;',{'value':Obj('Lcom/kubusapp/feature/auth/model/AuthenticationInfo;',{'email':'fixture@example.invalid'})})
    state=Obj('Lur6;')
    vm.call(STATE,'<init>(Lcom/kubusapp/region/Region;ZZLjava/lang/String;Z)V',
            [state,vm.selected_region,not vm.os_granted,notifications,'fixture@example.invalid',newsletter])
    holder=Obj('Li8g;',{'value':state})
    model=Obj('Lyr6;',{'b':Obj('Ljie;'),'e':Obj('Lb0e;'),'f':Obj('Lbbk;',{'a':Obj('Lqj1;')}),'h':holder})
    activity=Obj('L'+FOLLOW+';',{'viewmodel':model})
    return model,holder,activity


def verify_region(root):
    for granted in [False,True]:
        vm=OnboardingVM(root,os_granted=granted);model,holder,activity=region_fixture(vm)
        holder.fields['value']=None
        initial=Obj('Lwr6;',{'a':0,'b':False,'c':model})
        result=vm.call('wr6',SUSPEND,[initial,None])
        state=holder.fields['value']
        assert result.type=='Lffi;' and state.type=='Lur6;'
        assert state.fields=={'a':vm.selected_region,'b':not granted,'c':0,'d':'fixture@example.invalid','e':0}
        assert not vm.events and not vm.subscriptions and not vm.flow_events
        for checked in [False,True]:
            for newsletter in [False,True]:
                vm=OnboardingVM(root,os_granted=granted);model,holder,activity=region_fixture(vm,checked,newsletter)
                old=dict(holder.fields['value'].fields)
                vm.call(FOLLOW,'onResume()V',[activity]);new=holder.fields['value'].fields
                assert new['a'] is old['a'] and new['d']==old['d'] and new['b']==(not granted)
                assert new['c']==checked and new['e']==newsletter,'Resume preserves both manual choices'
                assert vm.events==['super_onResume'] and not vm.subscriptions and not vm.flow_events


def verify_helper_invokes(root):
    from ad_sdk import sdk_classes
    sdk,archive=sdk_classes()
    try:
        helper=method(root,ROUTER,'morpheSeedTopicChoices()V')
        assert {'public','static'}<=helper.flags and helper.locals==3
        for line in helper.instructions:
            if not line.startswith('invoke-'):continue
            kind=line.split()[0];owner,sig=line.split('}, ')[1].split('->');platform=sdk(owner)
            if platform is not None:
                interface,_,methods=platform;assert sig in methods
                flags=methods[sig];assert flags&1
            else:
                target=method(root,owner[1:-1],sig);assert 'public' in target.flags
                flags=8 if 'static' in target.flags else 0
                interface=bool(re.search(r'^\.class[^\n]*\binterface\b',source(root,owner[1:-1]),re.M))
            assert bool(flags&8)==(kind=='invoke-static')
            if kind!='invoke-static':assert kind==('invoke-direct' if sig.startswith('<init>') else 'invoke-interface' if interface else 'invoke-virtual')
    finally:archive.close()


def verify_preserved(root,enabled):
    contracts=json.loads(CONTRACTS.read_text())
    for cls,sig,expected in contracts['methods']:
        m=method(root,cls,sig);remove=set();replace={}
        if enabled and (cls,sig)==(ROUTER,ROUTE):
            assert m.instructions[:6]==[
                'sget-object v0, Lcgj;->LOGIN_SEDUCTION_SCREEN:Lcgj;',
                m.instructions[1], 'sget-object p1, Lcgj;->LOGIN_SCREEN:Lcgj;',
                'sget-object v0, Lcgj;->PUSH_NOTIFICATION_SCREEN:Lcgj;',
                m.instructions[4], 'invoke-static {}, Legj;->morpheSeedTopicChoices()V']
            assert m.instructions[1].startswith('if-ne p1, v0, ') and m.labels[m.instructions[1].split(', ')[-1]]==3
            assert m.instructions[4].startswith('if-ne p1, v0, ') and m.labels[m.instructions[4].split(', ')[-1]]==6
            remove.update(range(6))
        elif enabled and (cls,sig)==(TOPIC,'onCreate(Landroid/os/Bundle;)V'):
            slots=[i for i,l in enumerate(m.instructions) if l=='invoke-virtual {p0}, L'+TOPIC+';->k()V']
            assert len(slots)==1 and m.instructions[slots[0]+1]=='return-void'
            replace[slots[0]]='const p1, 0x7f0d00f5';remove.add(slots[0]+1)
            early=[i for i,l in enumerate(m.instructions[:slots[0]]) if l=='nop'];assert len(early)==1
            replace[early[0]]='invoke-virtual {p0}, L'+TOPIC+';->k()V'
        elif enabled and (cls,sig)==('wr6',SUSPEND):
            slots=[i for i,l in enumerate(m.instructions) if l=='invoke-direct/range {v9 .. v14}, Lur6;-><init>(Lcom/kubusapp/region/Region;ZZLjava/lang/String;Z)V']
            assert len(slots)==1;i=slots[0]
            assert m.instructions[i-2:i]==['const/4 v12, 0x0','const/4 v14, 0x0']
            replace[i-2]='invoke-direct/range {v9 .. v14}, Lur6;-><init>(Lcom/kubusapp/region/Region;ZZLjava/lang/String;I)V'
            remove.update([i-1,i])
        elif enabled and (cls,sig)==(FOLLOW,'onResume()V'):
            slots=[i for i,l in enumerate(m.instructions) if l=='const/16 v6, 0x1d'];assert len(slots)==1
            replace[slots[0]]='const/16 v6, 0x19'
        assert digest(m.canonical(remove,replace))==expected,'Tubantia preserve complete original method: '+cls+'->'+sig


def verify_onboarding(root,enabled):
    helpers=re.findall(r'^\.method[^\n]* (morphe(?:SeedTopicChoices|ContinueGuest))\(',source(root,ROUTER),re.M)
    assert helpers==(['morpheSeedTopicChoices'] if enabled else [])
    if enabled:
        verify_seed(root);verify_routes(root);verify_topic(root);verify_region(root);verify_helper_invokes(root)
    verify_preserved(root,enabled)


if __name__=='__main__':
    import argparse
    parser=argparse.ArgumentParser();parser.add_argument('root',type=Path);parser.add_argument('--enabled',action='store_true')
    args=parser.parse_args();verify_onboarding(args.root,args.enabled)
    print('PASS: Tubantia onboarding semantics and original method contracts')
