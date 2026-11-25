"""Execute emitted AD onboarding control flow at Android/platform boundaries.

The parser treats packed/sparse switch rows as references, never declarations.
No publisher source, article data or account credentials are bundled here.
"""
import ast
from dataclasses import dataclass, field
import hashlib
import json
from pathlib import Path
import re

TOPIC='com/kubusapp/onboarding/OnBoardingPushNotificationActivity'
REGION='com/kubusapp/onboarding/regionselection/OnboardingRegionSelectionActivity'
FOLLOW='com/kubusapp/onboarding/followablepush/FollowablePushActivity'
Q9='q9j'
ROUTE='b(Landroid/content/Context;Lo9j;Landroid/content/Intent;)V'
A='Landroid/content/'


def source(root, cls):
    paths=list(root.glob(f'smali*/{cls}.smali'))+list(root.glob(f'smali/smali*/{cls}.smali'))
    assert len(paths)==1,f'AD onboarding expected one {cls}, got {len(paths)}'
    return paths[0].read_text()


@dataclass
class Method:
    signature: str
    flags: set[str]
    locals: int
    instructions: list[str]
    labels: dict[str,int]
    payloads: dict[str,dict[int,str]]
    catches: list[str]

    def canonical(self, remove=(), replacements=None):
        remove=set(remove);replacements=replacements or {}
        def target(label):return '@'+str(sum(i not in remove for i in range(self.labels[label])))
        result=[]
        for i,line in enumerate(self.instructions):
            if i in remove:continue
            line=replacements.get(i,line)
            if line.startswith(('packed-switch ','sparse-switch ')):
                before,label=line.rsplit(', ',1)
                table=self.payloads[label]
                line=before+', {'+','.join(str(k)+':'+target(v) for k,v in sorted(table.items()))+'}'
            else:line=re.sub(r'(?<!\S):[A-Za-z0-9_]+',lambda m:target(m[0]),line)
            line=line.replace('const-string/jumbo ','const-string ')
            line=re.sub(r'^goto(?:/16|/32)? ','goto ',line)
            result.append(line)
        catches=[re.sub(r':[A-Za-z0-9_]+',lambda m:target(m[0]),line) for line in self.catches]
        return {'instructions':result,'catches':catches,'flags':sorted(self.flags),'locals':self.locals}


def parse(text, signature):
    match=re.search(r'^\.method ([^\n]*?) '+re.escape(signature)+r'\n(.*?)^\.end method',text,re.M|re.S)
    assert match,f'Missing AD onboarding method {signature}'
    body=match[2];local=re.search(r'^\s*\.locals (\d+)',body,re.M)
    instructions=[];labels={};payloads={};catches=[];annotation=0;mode=None;payload=None;key=0;last_label=None
    for raw in body.splitlines():
        line=raw.strip()
        if not line or line.startswith('#'):continue
        if line.startswith('.annotation'):annotation+=1
        if line.startswith('.end annotation'):annotation-=1;continue
        if annotation:continue
        if mode:
            if line.startswith('.end '):mode=None;continue
            if mode=='packed':payloads[payload][key]=line;key+=1
            elif mode=='sparse':
                number,label=line.split(' -> ');payloads[payload][int(number,0)]=label
            continue
        if line.startswith(('.packed-switch ','.array-data ')) or line=='.sparse-switch':
            assert last_label,'Payload needs a declaration label'
            payload=last_label;payloads[payload]={}
            mode='packed' if line.startswith('.packed-switch') else ('sparse' if line.startswith('.sparse-switch') else 'array')
            if mode=='packed':key=int(line.split()[1],0)
            continue
        if line.startswith('.catch'):catches.append(line);continue
        if line.startswith('.'):continue
        if line.startswith(':'):labels[line]=len(instructions);last_label=line;continue
        instructions.append(line.split('    #')[0])
    # Payload alignment nops are unreachable padding after a return/throw.
    if instructions and instructions[-1]=='nop' and any(labels.get(label)==len(instructions) for label in payloads):
        pad=len(instructions)-1
        if not any(re.search(r'(?<!\S)'+re.escape(label)+r'$',line) for label,pc in labels.items() if pc==pad for line in instructions if not line.startswith(('packed-switch','sparse-switch'))):
            instructions.pop()
            labels={label:min(pc,len(instructions)) for label,pc in labels.items()}
    return Method(signature,set(match[1].split()),int(local[1]) if local else 0,instructions,labels,payloads,catches)


def method(root,cls,sig):return parse(source(root,cls),sig)
def digest(value):return hashlib.sha256(json.dumps(value,sort_keys=True,separators=(',',':')).encode()).hexdigest()


@dataclass(eq=False)
class Obj:
    type: str
    fields: dict=field(default_factory=dict)


@dataclass(eq=False)
class Enum:
    name: str


class TopicBoundary(Exception):
    pass


class EncryptedPreferences:
    """Opaque Android/crypto boundary; policy remains in emitted helper code."""
    def __init__(self, existing=None):
        self.key=hashlib.sha256(b'opaque-key:USER_CHANNELS').hexdigest()
        self.physical={'unrelated-encrypted-key':frozenset({'opaque-unrelated-value'})}
        if existing is not None:self.physical[self.key]=frozenset(existing)
        self.writes=[]


class VM:
    def __init__(self,root,authenticated=False,seduction=False,progress=None,complete=False,os_granted=False,prefs=None,topics=None,topic_feature=True):
        self.root=Path(root);self.authenticated=authenticated;self.seduction=seduction;self.os_granted=os_granted
        self.prefs={} if prefs is None else prefs
        if progress is not None:self.prefs['KEY_ON_BOARDING_PROGRESS']=progress
        if complete:self.prefs['KEY_ON_BOARDING_COMPLETE']=True
        self.topics=EncryptedPreferences() if topics is None else topics;self.topic_feature=topic_feature
        self.events=[];self.started=[];self.finished=0;self.steps=0;self.stack=[];self.flow_events=[];self.subscriptions=[]
        self.context=Obj('Landroid/content/Context;')
        self.intent=Obj('Landroid/content/Intent;',{'extras':{'deep_link':'preserve','number':7},'data':'ad://article/preserve','flags':0})
        self.static={'Lq9j;->a:Landroid/net/Uri;':self.intent.fields['data'],'Lq9j;->b:Landroid/os/Bundle;':self.intent.fields['extras']}
        self.enums={}
        self.case_map=self.switch_case_map()

    def enum(self,name):
        if name not in self.enums:self.enums[name]=Enum(name)
        return self.enums[name]

    def switch_case_map(self):
        # Read the app's actual compiler-generated enum switch mapping.
        text=source(self.root,'p9j');mapping={};current=None;value=None
        for line in method(self.root,'p9j','<clinit>()V').instructions:
            m=re.search(r'Lo9j;->(\w+):Lo9j;',line)
            if m:current=m[1]
            m=re.match(r'const(?:/4|/16)? v2, (\S+)',line)
            if m:value=int(m[1],0)
            if line.startswith('aput '):mapping[current]=value
        return mapping

    def nonzero(self,value):return value is not None and (not isinstance(value,(bool,int)) or value!=0)

    def call(self,cls,sig,args):
        m=method(self.root,cls,sig);r={'p'+str(i):v for i,v in enumerate(args)};pc=0;result=None
        self.stack.append((cls,sig))
        try:
            while pc<len(m.instructions):
                self.steps+=1;assert self.steps<50000,'AD onboarding execution did not terminate'
                line=m.instructions[pc];pc+=1
                if line=='nop':continue
                if line.startswith(('const-string ','const-string/jumbo ')):
                    dest,value=line.split(' ',1)[1].split(', ',1);r[dest]=ast.literal_eval(value)
                elif line.startswith(('const/4 ','const/16 ','const ','const/high16 ','const-wide/16 ')):
                    dest,value=line.split(' ',1)[1].split(', ');r[dest]=int(value.split()[0],0)
                elif line.startswith('const-class '):
                    dest,value=line.split(' ',1)[1].split(', ');r[dest]=value
                elif line.startswith(('move-result-object ','move-result ')):r[line.split()[1]]=result
                elif line.startswith(('move-object ','move-object/from16 ','move-object/16 ','move ','move/from16 ','move/16 ')):
                    dest,src=line.split(' ',1)[1].split(', ');r[dest]=r[src]
                elif line.startswith('check-cast '):pass
                elif line.startswith('new-instance '):
                    dest,typ=line.split(' ',1)[1].split(', ');r[dest]=Obj(typ)
                elif line.startswith(('sget-object ','sget ')):
                    dest,ref=line.split(' ',1)[1].split(', ')
                    if ref.startswith('Lo9j;->'):result=self.enum(ref.split('->')[1].split(':')[0])
                    elif ref=='Lp9j;->a:[I':result=self.case_map
                    elif ref=='Landroid/os/Build$VERSION;->SDK_INT:I':result=35
                    elif ref=='Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;':result={}
                    else:result=self.static.setdefault(ref,Obj(ref.split(':')[-1]))
                    r[dest]=result
                elif line.startswith('sput-object '):
                    reg,ref=line.split(' ',1)[1].split(', ');self.static[ref]=r[reg]
                elif line.startswith(('iget-object ','iget-boolean ','iget-byte ','iget ')):
                    dest,reg,ref=line.split(' ',1)[1].split(', ');r[dest]=r[reg].fields.get(ref.split('->')[1].split(':')[0],None if line.startswith('iget-object ') else 0)
                elif line.startswith(('iput-object ','iput-boolean ','iput-byte ','iput ')):
                    value,reg,ref=line.split(' ',1)[1].split(', ');r[reg].fields[ref.split('->')[1].split(':')[0]]=r[value]
                elif line.startswith('instance-of '):
                    dest,reg,typ=line.split(' ',1)[1].split(', ');r[dest]=isinstance(r[reg],Obj) and r[reg].type==typ
                elif line.startswith('xor-int/lit8 '):
                    dest,reg,value=line.split(' ',1)[1].split(', ');r[dest]=int(r[reg])^int(value,0)
                elif line.startswith('and-int/lit8 '):
                    dest,reg,value=line.split(' ',1)[1].split(', ');r[dest]=int(r[reg])&int(value,0)
                elif line.startswith('aget '):
                    dest,arr,index=line.split(' ',1)[1].split(', ');r[dest]=r[arr][r[index]]
                elif line.startswith(('if-eqz ','if-nez ')):
                    op,reg,label=line.replace(',','').split()
                    if self.nonzero(r[reg])==(op=='if-nez'):pc=m.labels[label]
                elif line.startswith(('if-eq ','if-ne ','if-lt ','if-ge ')):
                    op,left,right,label=line.replace(',','').split();a,b=r[left],r[right]
                    equal=(a is b) if isinstance(a,(Obj,Enum)) or isinstance(b,(Obj,Enum)) else a==b
                    take={'if-eq':equal,'if-ne':not equal,'if-lt':False,'if-ge':False}[op]
                    if op=='if-lt':take=a<b
                    if op=='if-ge':take=a>=b
                    if take:pc=m.labels[label]
                elif line.startswith('goto'):pc=m.labels[line.split()[1]]
                elif line.startswith(('packed-switch ','sparse-switch ')):
                    reg,label=line.split(' ',1)[1].split(', ');target=m.payloads[label].get(r[reg])
                    if target is not None:pc=m.labels[target]
                elif line.startswith('invoke-'):
                    registers=line.split('{',1)[1].split('}',1)[0]
                    if ' .. ' in registers:
                        a,b=registers.split(' .. ');names=[a[0]+str(i) for i in range(int(a[1:]),int(b[1:])+1)]
                    else:names=registers.split(', ') if registers else []
                    target=line.split('}, ',1)[1];values=[r[n] for n in names]
                    result=self.invoke(target,values,line.split()[0])
                elif line=='return-void':return None
                elif line.startswith(('return-object ','return ')):return r[line.split()[1]]
                elif line.startswith('throw '):raise AssertionError('AD onboarding threw '+str(r[line.split()[1]]))
                else:raise AssertionError('Unsupported emitted onboarding instruction: '+line)
        finally:self.stack.pop()

    def invoke(self,ref,v,kind):
        typ,target=ref.split('->');cls=typ[1:-1]
        if cls==Q9:return self.call(cls,target,v)
        if typ in {'Las6;','Lbs6;','Llr6;'} and target.startswith('<init>('):return self.call(cls,target,v)
        if typ=='Lcs6;' and target=='x(Lzs3;)Ljava/lang/Object;':return self.call(cls,target,v)
        if typ=='Lmr6;' and target in {'b()V','c(Z)V','e(Z)V'}:return self.call(cls,target,v)
        if typ=='Lit2;' and target=='L(Ljava/lang/Object;)V':
            assert not isinstance(v[0],Exception),'Coroutine failure';return None
        if typ=='Lfee;' and target=='b(Lzs3;)Ljava/lang/Object;':return self.selected_region
        if typ=='Lcom/dpg/auth/authentication/model/AuthenticationInfo;' and target=='getEmail()Ljava/lang/String;':return v[0].fields['email']
        if typ=='Lhu8;' and target=='O(Lzs3;)Ljava/lang/Object;':return self.selected_region.fields['id']
        if typ=='Lqpf;' and target=='n(Ly7h;Ljava/lang/String;Lzs3;)Ljava/lang/Object;':
            assert kind=='invoke-virtual';self.subscriptions.append((v[1].type,v[2]));return True
        if typ=='Lllf;' and target=='a(Ljava/lang/Object;)Z':self.flow_events.append(v[1]);return True
        if typ=='Luzi;' and target=='a(Lrzi;)Lj23;':return Obj('Lj23;')
        if typ=='Ln09;' and target=='I(Ldw3;Lqv3;Lhw3;Le17;I)Le2g;':
            assert isinstance(v[3],Obj) and v[3].type=='Las6;','Execute actual regional coroutine'
            self.call('as6','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',[v[3],None]);return Obj('Le2g;')
        if typ=='Ljava/lang/Boolean;' and target=='booleanValue()Z':return bool(v[0])
        if typ=='Lga;' and target=='a(Ljava/lang/Object;Li8n;)V':self.events.append(('permission_request',v[1]));return None
        if typ=='Lyr6;':
            if target in {'a(Lyr6;ZZZI)Lyr6;','<init>(Lcom/kubusapp/region/Region;ZZLjava/lang/String;Z)V','<init>(Lcom/kubusapp/region/Region;ZZLjava/lang/String;I)V'}:
                return self.call('yr6',target,v)
        if typ=='Lmwd;' and target=='a()Z':return self.os_granted
        if typ=='Lr3g;':
            if target=='getValue()Ljava/lang/Object;':return v[0].fields['value']
            if target=='k(Ljava/lang/Object;Ljava/lang/Object;)Z':assert v[0].fields['value'] is v[1];v[0].fields['value']=v[2];return True
            if target=='m(Ljava/lang/Object;Ljava/lang/Object;)Z':v[0].fields['value']=v[2];return True
        if typ=='Lo9j;':
            if target=='getEntries()Low5;':return [self.enum(name) for name in self.case_map]
            if target=='name()Ljava/lang/String;':return v[0].name
        if target=='ordinal()I' and isinstance(v[0],Enum):return v[0].name
        if typ=='Ljava/lang/Enum;' and target=='name()Ljava/lang/String;':return v[0].name
        if target=='getClass()Ljava/lang/Class;':assert self.nonzero(v[0]);return v[0].type if isinstance(v[0],Obj) else type(v[0])
        if typ=='Lyr6;' and target.startswith('<init>('):return self.call('yr6',target,v)
        if target.startswith('<init>('):
            if typ=='Lx35;':
                assert target=='<init>(B)V' and v[1]==29,'Use actual topic preferences provider'
                v[0].fields['b']=Obj('Lxlg;',{'value':Obj('Ljaf;',{'encrypted':self.topics})})
            elif typ=='Ljava/lang/Object;':return None
            elif typ=='Ljava/util/HashSet;':v[0].fields['set']=set()
            elif typ=='Lhu8;':v[0].fields['c']=Obj('Lxlg;',{'value':self.prefs})
            elif typ=='Landroid/content/Intent;':v[0].fields.update(context=v[1],cls=v[2],extras={},data=None,flags=0)
            elif typ=='Lb27;':v[0].fields['receiver']=v[2]
            elif typ not in {'Lizf;','Lqpf;','Lckg;','Lzs3;'}:
                raise AssertionError('Unsupported emitted onboarding constructor: '+ref)
            return None
        if typ=='Lhu8;' and target=='S(Ljava/lang/String;)V':self.prefs['KEY_ON_BOARDING_PROGRESS']=v[1];return None
        if typ=='Lxlg;' and target=='getValue()Ljava/lang/Object;':return v[0].fields['value']
        if typ=='Ljaf;':
            storage=v[0].fields['encrypted'];assert v[1:]==['USER_CHANNELS'] or target=='edit()Landroid/content/SharedPreferences$Editor;'
            if target=='contains(Ljava/lang/String;)Z':return storage.key in storage.physical
            if target=='edit()Landroid/content/SharedPreferences$Editor;':return Obj('Liaf;',{'target':storage,'pending':{}})
        if typ=='Ljava/util/Collections;' and target=='emptySet()Ljava/util/Set;':return frozenset()
        if typ=='Landroid/content/SharedPreferences;':
            if target.startswith('getBoolean('):return self.prefs.get(v[1],bool(v[2]))
            if target.startswith('getString('):return self.prefs.get(v[1],None if v[2]==0 else v[2])
            if target=='edit()Landroid/content/SharedPreferences$Editor;':return self.prefs
        if typ=='Landroid/content/SharedPreferences$Editor;':
            if isinstance(v[0],Obj) and v[0].type=='Liaf;':
                storage=v[0].fields['target']
                if target=='putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;':
                    assert v[1]=='USER_CHANNELS','Do not overwrite unrelated preferences'
                    value=v[2].fields['set'] if isinstance(v[2],Obj) else v[2]
                    v[0].fields['pending'][storage.key]=frozenset(value);return v[0]
                if target=='apply()V':
                    storage.physical.update(v[0].fields['pending']);storage.writes.append(dict(v[0].fields['pending']));return None
                raise AssertionError('Unexpected encrypted preference operation '+target)
            if target.startswith('putBoolean('):self.prefs[v[1]]=bool(v[2]);return v[0]
            if target=='apply()V':return None
        if typ=='Ljava/lang/String;':
            if target=='equals(Ljava/lang/Object;)Z':return v[0]==v[1]
        if typ=='Lo09;' and target.startswith('l('):return v[0]==v[1]
        if typ=='Lmfg;' and target.startswith('Q0('):return not str(v[0]).strip()
        if typ=='Lmge;' and target.startswith('c('):return self.topic_feature if v[1]=='FEATURE_DISPLAY_PUSH_NOTIFICATIONS_IN_ONBOARDING' else self.seduction
        if typ=='Ltv8;' and target.startswith('f('):return Obj('Ljk1;',{'b':Obj('Lek1;')})
        if typ=='Lek1;' and target=='b()Z':return self.authenticated
        if typ=='Lkx8;' and target.startswith('w('):self.events.append('automatic_login');return None
        if typ=='Lgaj;' and target.startswith('U('):self.started.append({'cls':'Lcom/kubusapp/MainActivity;','data':v[1],'extras':v[2]});return None
        if cls==FOLLOW and target=='k()Lcs6;':return v[0].fields['viewmodel']
        if typ=='Landroidx/fragment/app/f;' and target=='onResume()V':self.events.append('super_onResume');return None
        if cls==TOPIC:
            if target in {'onCreate(Landroid/os/Bundle;)V','l(Landroid/os/Bundle;)V','k()V'}:return self.call(cls,target,v)
            if target=='j()Lo9;':return Obj('Lo9;',{'activity':v[0]})
            if target=='setContentView(I)V':self.events.append('topic_fragment_created');raise TopicBoundary()
        if typ=='Lo9;' and target=='c()V':
            activity=v[0].fields['activity'];activity.fields['d']=Obj('Lhu8;',{'c':Obj('Lxlg;',{'value':self.prefs})});self.events.append('hilt_initialized');return None
        if typ=='Landroidx/fragment/app/f;' and target=='onCreate(Landroid/os/Bundle;)V':self.events.append('super_onCreate');return None
        if typ in {'Lqpf;','Lizf;'} and target=='k()V':return None  # Android theme/window boundary, no subscription/permission result.
        if typ.startswith('Landroid/'):

            if target=='getApplicationContext()Landroid/content/Context;':return self.context
            if target=='getIntent()Landroid/content/Intent;':return self.intent
            if target.startswith('startActivity('):self.started.append(dict(v[1].fields));return None
            if target=='finish()V':self.finished+=1;return None
            if target=='setContentView(I)V':self.events.append('topic_fragment_created');raise TopicBoundary()
            if typ=='Landroid/content/Intent;':
                if target.startswith('addFlags('):v[0].fields['flags']|=v[1];return v[0]
                if target.startswith('getData('):return v[0].fields.get('data')
                if target.startswith('getExtras('):return v[0].fields.get('extras')
                if target.startswith('setData('):v[0].fields['data']=v[1];return v[0]
                if target.startswith('putExtras('):v[0].fields['extras']=v[1];return v[0]
                if target.startswith('putExtra('):v[0].fields['extras'][v[1]]=v[2];return v[0]
        if typ=='Ljava/lang/Iterable;' and target=='iterator()Ljava/util/Iterator;':return {'values':list(v[0]),'index':0}
        if typ=='Ljava/util/Iterator;':
            if target=='hasNext()Z':return v[0]['index']<len(v[0]['values'])
            if target=='next()Ljava/lang/Object;':a=v[0]['values'][v[0]['index']];v[0]['index']+=1;return a
        if typ=='Lv20;':return None  # Telemetry-only platform boundary; no routing/persistence result.
        raise AssertionError('Unsupported emitted onboarding call: '+ref)


def run_route(vm,state='PRIVACY_SCREEN',intent=None):
    vm.call(Q9,ROUTE,[vm.context,vm.enum(state),intent])
    index=0
    while index<len(vm.started):
        target=vm.started[index]['cls'];index+=1
        if target=='L'+TOPIC+';':
            try:vm.call(TOPIC,'onCreate(Landroid/os/Bundle;)V',[Obj('L'+TOPIC+';'),None])
            except TopicBoundary:pass
        elif target=='Lcom/kubusapp/onboarding/LoginSeductionActivity;':vm.events.append('automatic_login_seduction')
    return vm


def verify_routing(root):
    for auth in [False,True]:
        for sed in [False,True]:
            for progress in [None,'LOGIN_SCREEN','LOGIN_SEDUCTION_SCREEN','PUSH_NOTIFICATION_SCREEN','REGION_SELECTION_SCREEN','REGIONAL_FOLLOWABLE_SCREEN']:
                vm=VM(root,authenticated=auth,seduction=sed,progress=progress)
                run_route(vm)
                assert not any(x in vm.events for x in ['automatic_login','automatic_login_seduction','topic_fragment_created']), (auth,sed,progress,vm.events)
                expected=FOLLOW if progress=='REGIONAL_FOLLOWABLE_SCREEN' else REGION
                assert vm.started and vm.started[-1]['cls']=='L'+expected+';',('AD guest/resume progression',auth,sed,progress,vm.started)
                assert vm.prefs.get('KEY_ON_BOARDING_PROGRESS')==('REGIONAL_FOLLOWABLE_SCREEN' if expected==FOLLOW else 'REGION_SELECTION_SCREEN')
                assert not vm.subscriptions and not any(isinstance(e,tuple) and e[0]=='permission_request' for e in vm.events)
                if progress in ['REGION_SELECTION_SCREEN','REGIONAL_FOLLOWABLE_SCREEN']:
                    assert vm.topics.key not in vm.topics.physical and not vm.topics.writes,'Resumed city/follow flow does not seed or subscribe absent topic choices'
    # Complete cold starts must retain their original Main/deep-link route and
    # never seed or reset earlier real preferences.
    for auth in [False,True]:
        vm=VM(root,authenticated=auth,complete=True)
        before=dict(vm.topics.physical);run_route(vm)
        assert len(vm.started)==1 and vm.started[0]['cls']=='Lcom/kubusapp/MainActivity;'
        assert vm.started[0]['data']==vm.intent.fields['data'] and vm.started[0]['extras'] is vm.intent.fields['extras']
        assert vm.topics.physical==before and not vm.topics.writes
    # CONFIG captures the actual Intent; normal privacy completion routes onward.
    vm=VM(root);vm.call(Q9,ROUTE,[vm.context,vm.enum('CONFIG_SCREEN'),vm.intent])
    assert vm.started[-1]['cls']=='Lcom/kubusapp/onboarding/PrivacyConsentTCF2Activity;'
    run_route(vm);vm.call(Q9,ROUTE,[vm.context,vm.enum('REGIONAL_FOLLOWABLE_SCREEN'),None])
    assert vm.prefs['KEY_ON_BOARDING_COMPLETE'] is True and vm.started[-1]['cls']=='Lcom/kubusapp/MainActivity;'
    assert vm.started[-1]['data']==vm.intent.fields['data'] and vm.started[-1]['extras'] is vm.intent.fields['extras']


def verify_seed(root,vm_type=VM):
    for existing in [None,[],['encrypted-old-selection','encrypted-other-choice']]:
        topics=EncryptedPreferences(existing);before=dict(topics.physical);vm=vm_type(root,topics=topics)
        vm.call(Q9,'morpheSeedTopicChoices()V',[])
        if existing is None:
            assert topics.physical[topics.key]==frozenset() and len(topics.writes)==1
        else:assert topics.physical==before and not topics.writes,'Keep existing encrypted topic preferences'
        snapshot=dict(topics.physical);vm.call(Q9,'morpheSeedTopicChoices()V',[])
        assert topics.physical==snapshot and len(topics.writes)==(1 if existing is None else 0),'Topic default seeding must be idempotent'
        assert topics.physical['unrelated-encrypted-key']==before['unrelated-encrypted-key']


def verify_topic_lifecycle(root):
    for complete in [False,True]:
        for feature in [False,True]:
            vm=VM(root,complete=complete,topic_feature=feature)
            activity=Obj('L'+TOPIC+';')
            try:vm.call(TOPIC,'onCreate(Landroid/os/Bundle;)V',[activity,{'saved':'state'}])
            except TopicBoundary:pass
            assert vm.events[:2]==['super_onCreate','hilt_initialized']
            assert 'topic_fragment_created' not in vm.events,'Skip before topic fragment/default category loading'
            assert vm.finished==1
            expected='Lcom/kubusapp/MainActivity;' if complete else 'L'+REGION+';'
            assert len(vm.started)==1 and vm.started[-1]['cls']==expected
            if complete:
                assert vm.started[-1]['extras'] is vm.intent.fields['extras'] and vm.started[-1]['data']==vm.intent.fields['data']
                assert not vm.topics.writes


def region_fixture(vm,notifications=False,newsletter=False,email='fixture@example.invalid'):
    """Supply storage/Android values; execute the app's state and callbacks."""
    vm.selected_region=Obj('Lcom/kubusapp/region/Region;',{'id':'fixture-region','name':'Fixture City'})
    vm.static['Lek1;->b:Lr3g;']=Obj('Lr3g;',{'value':Obj('Lcom/dpg/auth/authentication/model/AuthenticationInfo;',{'email':email})})
    state=Obj('Lyr6;')
    vm.call('yr6','<init>(Lcom/kubusapp/region/Region;ZZLjava/lang/String;Z)V',
            [state,vm.selected_region,not vm.os_granted,notifications,email,newsletter])
    holder=Obj('Lr3g;',{'value':state})
    model=Obj('Lcs6;',{'b':Obj('Lfee;'),'c':Obj('Lqpf;'),'d':Obj('Lhu8;'),
        'e':Obj('Lmwd;'),'f':Obj('Losl;',{'a':Obj('Ljk1;')}),'h':holder,'i':Obj('Lllf;')})
    origin=vm.static.setdefault('Lx1c;->ONBOARDING:Lx1c;',Obj('Lx1c;'))
    activity=Obj('L'+FOLLOW+';',{'viewmodel':model,'d':Obj('Lga;'),'f':Obj('Lxlg;',{'value':origin})})
    callback=Obj('Lmr6;');vm.call('mr6','<init>(L'+FOLLOW+';)V',[callback,activity])
    return model,holder,activity,callback


def region_continue(vm,callback):
    vm.call('mr6','b()V',[callback])
    assert len(vm.flow_events)==1,'Regional Continue emits exactly one existing completion/permission event'
    return vm.flow_events.pop()


def deliver_region_event(vm,activity,event):
    collector=Obj('Ltp5;',{'a':4,'b':activity})
    result=vm.call('tp5','emit(Ljava/lang/Object;Lxs3;)Ljava/lang/Object;',[collector,event,None])
    assert isinstance(result,Obj) and result.type=='Lnbi;','Preserve coroutine Unit completion'


def verify_region(root):
    for granted in [False,True]:
        # Execute the real initial state coroutine with a selected city and an
        # existing account email: neither permission nor email implies opt-in.
        vm=VM(root,os_granted=granted);model,holder,activity,callback=region_fixture(vm)
        holder.fields['value']=None
        initial=Obj('Las6;');vm.call('as6','<init>(Lcs6;Lxs3;B)V',[initial,model,None,0])
        result=vm.call('as6','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',[initial,None])
        state=holder.fields['value']
        assert result.type=='Lnbi;' and state.type=='Lyr6;'
        assert state.fields=={'a':vm.selected_region,'b':not granted,'c':0,'d':'fixture@example.invalid','e':0},'City notification and newsletter defaults must both be off'
        assert not vm.events and not vm.flow_events and not vm.subscriptions
        # Continue without selecting anything completes the real onboarding
        # route, never permission or newsletter/subscription work.
        event=region_continue(vm,callback);assert event.type=='Lqr6;'
        deliver_region_event(vm,activity,event)
        assert not vm.subscriptions and not any(isinstance(e,tuple) and e[0]=='permission_request' for e in vm.events)
        assert vm.finished==1 and vm.prefs['KEY_ON_BOARDING_COMPLETE'] is True
        assert vm.started[-1]['cls']=='Lcom/kubusapp/MainActivity;'
        # Both independently chosen values survive onResume, including when
        # Android permission changes after visiting Settings.
        for checked in [False,True]:
            for newsletter in [False,True]:
                vm=VM(root,os_granted=granted);model,holder,activity,callback=region_fixture(vm)
                vm.call('mr6','c(Z)V',[callback,checked]);vm.call('mr6','e(Z)V',[callback,newsletter])
                before=dict(holder.fields['value'].fields)
                vm.call(FOLLOW,'onResume()V',[activity]);after=holder.fields['value'].fields
                assert after['c']==checked and after['e']==newsletter,'Resume must preserve actual manual choices'
                assert after['a'] is before['a'] and after['d']==before['d'] and after['b']==(not granted)
                assert not vm.flow_events and not vm.subscriptions and vm.events==['super_onResume']
        # Notification opt-in uses the unchanged callback and Continue path.
        vm=VM(root,os_granted=granted);model,holder,activity,callback=region_fixture(vm)
        vm.call('mr6','c(Z)V',[callback,True]);assert holder.fields['value'].fields['c'] is True
        assert not vm.events and not vm.flow_events and not vm.subscriptions,'A toggle alone must not ask or subscribe'
        event=region_continue(vm,callback)
        if granted:
            assert event.type=='Lqr6;' and vm.subscriptions==[('Ly7h;','fixture-region')]
            deliver_region_event(vm,activity,event)
            assert not any(isinstance(e,tuple) and e[0]=='permission_request' for e in vm.events)
        else:
            assert event.type=='Lpr6;' and not vm.subscriptions
            deliver_region_event(vm,activity,event)
            assert vm.events==[('permission_request','android.permission.POST_NOTIFICATIONS')]
            assert vm.finished==0 and not vm.started
            # Invoke both actual Android callback results. Denial completes
            # without subscribing; grant retains the selected city's request.
            for answer in [False,True]:
                vm=VM(root,os_granted=answer);model,holder,activity,callback=region_fixture(vm,notifications=True)
                permission_callback=Obj('Llr6;',{'a':0,'receiver':activity})
                result=vm.call('lr6','invoke(Ljava/lang/Object;)Ljava/lang/Object;',[permission_callback,answer])
                assert result.type=='Lnbi;'
                assert vm.subscriptions==([('Ly7h;','fixture-region')] if answer else [])
                assert len(vm.flow_events)==1 and vm.flow_events[0].type=='Lqr6;'
                deliver_region_event(vm,activity,vm.flow_events.pop())
                assert vm.finished==1 and vm.prefs['KEY_ON_BOARDING_COMPLETE'] is True
                assert not any(isinstance(e,tuple) and e[0]=='permission_request' for e in vm.events)


def verify_helper_invokes(root):
    """Resolve new calls against emitted app flags or the actual API31 jar."""
    from ad_sdk import sdk_classes
    sdk,archive=sdk_classes()
    try:
        for signature in ['morpheSeedTopicChoices()V','morpheContinueGuest(Landroid/content/Context;)V']:
            helper=method(root,Q9,signature)
            assert {'public','static'}<=helper.flags and helper.locals==(3 if 'Seed' in signature else 2)
            for line in helper.instructions:
                if not line.startswith('invoke-'):continue
                kind=line.split()[0].removesuffix('/range');owner,sig=line.split('}, ')[1].split('->')
                platform=sdk(owner)
                if platform is not None:
                    interface,super_,methods=platform
                    assert sig in methods,'New AD onboarding API is available at minSDK32: '+owner+'->'+sig
                    flags=methods[sig];assert flags&1,'New Android/Java call must be public'
                else:
                    target=method(root,owner[1:-1],sig);flags=(8 if 'static' in target.flags else 0)
                    assert 'public' in target.flags,'New AD helper calls accessible app methods'
                    interface=bool(re.search(r'^\.class[^\n]*\binterface\b',source(root,owner[1:-1]),re.M))
                assert bool(flags&8)==(kind=='invoke-static'),'New AD helper static invoke kind: '+line
                if kind!='invoke-static':
                    expected='invoke-direct' if sig.startswith('<init>') else ('invoke-interface' if interface else 'invoke-virtual')
                    assert kind==expected,'New AD helper receiver invoke kind: '+line
    finally:archive.close()


def verify_onboarding(root: Path, enabled: bool) -> None:
    helpers=re.findall(r'^\.method[^\n]* (morphe(?:SeedTopicChoices|ContinueGuest))\(',source(root,Q9),re.M)
    assert sorted(helpers)==(['morpheContinueGuest','morpheSeedTopicChoices'] if enabled else []),'AD onboarding effects follow selected patch only'
    if enabled:
        verify_seed(root);verify_routing(root);verify_topic_lifecycle(root);verify_region(root);verify_helper_invokes(root)
    verify_preserved(root,enabled)


def verify_preserved(root,enabled):
    from ad_onboarding_contracts import RETAINED,MODIFIED
    for cls,sig,expected in RETAINED:
        assert digest(method(root,cls,sig).canonical())==expected,'AD preserve manual/account/region/permission behavior: '+cls+'->'+sig
    for cls,sig,expected in MODIFIED:
        m=method(root,cls,sig);remove=set();replace={}
        if enabled and cls==Q9:
            assert m.instructions[0]=='sget-object v0, Lo9j;->PUSH_NOTIFICATION_SCREEN:Lo9j;'
            assert m.instructions[1].startswith('if-ne p1, v0, ')
            original=m.instructions[1].split(', ')[-1];assert m.labels[original]==3
            assert m.instructions[2]=='invoke-static {}, Lq9j;->morpheSeedTopicChoices()V'
            remove.update([0,1,2]);calls=[];classes=[]
            for i,line in enumerate(m.instructions):
                if '->morpheContinueGuest(' in line:calls.append(i)
                if line=='const-class p2, L'+TOPIC+';':classes.append(i)
            assert len(calls)==2 and len(classes)==1,'AD exact onboarding-only gateway replacements'
            for i in calls:replace[i]='invoke-static {p0, v7, v2, v1}, Lkx8;->w(Landroid/content/Context;ZLcom/dpg/auth/authentication/LoginDrivers;I)V'
            replace[classes[0]]='const-class p2, Lcom/kubusapp/onboarding/LoginSeductionActivity;'
        elif enabled and cls==TOPIC:
            slots=[i for i,line in enumerate(m.instructions) if line=='invoke-virtual {p0}, L'+TOPIC+';->k()V']
            assert len(slots)==1 and m.instructions[slots[0]+1]=='return-void','AD skip layout boundary once'
            replace[slots[0]]='const p1, 0x7f0d00f7';remove.add(slots[0]+1)
            early=[i for i,line in enumerate(m.instructions[:slots[0]]) if line=='nop'];assert len(early)==1
            replace[early[0]]='invoke-virtual {p0}, L'+TOPIC+';->k()V'
        elif enabled and cls=='as6':
            calls=[i for i,line in enumerate(m.instructions) if 'Lyr6;-><init>(Lcom/kubusapp/region/Region;ZZLjava/lang/String;Z)V' in line]
            assert len(calls)==1;i=calls[0]
            assert m.instructions[i-2:i]==['const/4 v11, 0x0','const/4 v13, 0x0']
            replace[i-2]='invoke-direct/range {v8 .. v13}, Lyr6;-><init>(Lcom/kubusapp/region/Region;ZZLjava/lang/String;I)V'
            remove.update([i-1,i])
        elif enabled and cls==FOLLOW:
            slots=[i for i,line in enumerate(m.instructions) if line=='const/16 v6, 0x1d'];assert len(slots)==1
            replace[slots[0]]='const/16 v6, 0x19'
        assert digest(m.canonical(remove,replace))==expected,'AD preserve complete original onboarding control flow outside owned edits: '+cls+'->'+sig
