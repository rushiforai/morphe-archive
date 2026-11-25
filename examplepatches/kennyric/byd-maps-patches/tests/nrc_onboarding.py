"""Execute NRC's emitted welcome policy and original Skip persistence/navigation."""
import hashlib
import re
from pathlib import Path
from verify_weerplaza import canonical_method, smali_string

ACT='pinch/nrcnext/ui/onboarding/OnboardingActivity'
MODEL='pinch/nrcnext/ui/welcome/OnboardingViewModel'
REPO='nl/pinch/nrc/data/repositories/welcome/WelcomeRepositoryImpl'
INTERFACE='nl/pinch/nrc/data/repositories/welcome/WelcomeRepository'
PAGE='Lnl/pinch/nrc/data/model/onboarding/OnboardingPage;'
CREATE='onCreate(Landroid/os/Bundle;)V'
SKIP='morpheSkipWelcome(L'+ACT+';)Z'
POLICY='morpheShouldSkipWelcome(L'+MODEL+';)Z'
KEY='WelcomeRepository.welcomedata.pageshown.key'
PINNED=[('pinch/nrcnext/ui/onboarding/OnboardingActivity',
  'N()Landroid/net/Uri;',
  '3e2b360b24cc5c42685da268b6fcc87eafa96e4383ce1a27032082a6688167d1'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity', 'P()Z', '5597b131bfc994a555707ef86f27a6ba7d95d0c09c3110f991dfc6d5f3d6bf8b'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity',
  'Q()Lnl/pinch/nrc/data/model/onboarding/OnboardingPage;',
  '62181732360062e9746240c270158ccdc89ca0d21b12c0850cacb776504f155e'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity',
  'R()Lpinch/nrcnext/ui/welcome/OnboardingViewModel;',
  '04013a27ed1fadd16bc44621558786eafc42c2034165e1c911a9dc5cb9f4865b'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity',
  'S(Lpinch/nrcnext/ui/onboarding/OnboardingActivity;Landroidx/activity/result/ActivityResult;)V',
  '5e7663be7e3c603bd0ac47c54f3aa01232925dd2cf844e94ab4b04f9476c5f26'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity', 'T()V', 'ec0616e804ae9beeb1c7133ac76e411ec5843ff9b0c807ee19230fe4b3401ae6'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity', 'U()V', 'cab9083e4ed6358e6a3861db01c9b877d1a27d1d3932046ea1d9bf90dd1826f9'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity', 'V(Z)V', 'f609d70933a90beac7e01f59904cf6f82bf5df0d49fed027f408131d379c9bf5'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity',
  'a0(Lpinch/nrcnext/ui/onboarding/OnboardingActivity;ZLnl/pinch/nrc/data/model/onboarding/OnboardingPage;)Lkotlin/Unit;',
  '308fb7e9ed46ee5f54082345402126f2155db75946f90697c767957b9e655830'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity',
  'e0(Lpinch/nrcnext/ui/onboarding/OnboardingActivity;Z)Lkotlin/Unit;',
  '70b4841eda56894faec7f403c1958cb4cb7ab0144796639d405fa3f71cee5f09'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity',
  'h0(Lpinch/nrcnext/ui/onboarding/OnboardingActivity;Z)V',
  'a09dcc605e1e85f4cce4a1c4d10974c6fb85a9d15cf62722ae1efb2377a8d8e1'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity',
  'i0(Lpinch/nrcnext/ui/onboarding/OnboardingActivity;)Z',
  '280e320c2ee58ffd680e17158a59c51e6c725079c301ffbec5c1200862a8af49'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity',
  'j0(Lpinch/nrcnext/ui/onboarding/OnboardingActivity;)Lnl/pinch/nrc/data/model/onboarding/OnboardingPage;',
  'e11905cdb1557f8c6faec72f313c53c92d9b550eeb754813ab2a18874cd83c29'),
 ('pinch/nrcnext/ui/welcome/OnboardingViewModel',
  '<init>(Lnl/pinch/nrc/data/repositories/welcome/WelcomeRepository;Lnl/pinch/nrc/data/repositories/session/UserRepository;Lnl/pinch/nrc/analytics/AnalyticsTracker;)V',
  '20cecea7af7e61649184fe5938ee1caaa83f5c4b4222d1009f4d3bf0c3d83f12'),
 ('pinch/nrcnext/ui/welcome/OnboardingViewModel', 'h2()Z', '742ab6b04b7c21384e2f6612a058c4b47f7a9109a624421bf4807d53268fb4c4'),
 ('pinch/nrcnext/ui/welcome/OnboardingViewModel',
  'getStartingPage()Lnl/pinch/nrc/data/model/onboarding/OnboardingPage;',
  '84ef72f20d3d62d76d6086079297027f5f56db015419af203828dc5e82b5b4f9'),
 ('pinch/nrcnext/ui/welcome/OnboardingViewModel',
  'setWelcomePageShown()V',
  '23c38e06bf28859db519c48fe1194dd5afa77aa1d1372038b5d99fa3521618c1'),
 ('nl/pinch/nrc/data/repositories/welcome/WelcomeRepositoryImpl',
  '<init>(Landroid/content/Context;)V',
  'c325c94f3e38d620490b80d898d8b8e46054640edb885a743089ab7eeffa733a'),
 ('nl/pinch/nrc/data/repositories/welcome/WelcomeRepositoryImpl',
  'b()Landroid/content/SharedPreferences;',
  '2fc00caa78d21a703d1aebed19f7cd7372b12351541fc0dea0c830b7801e15a8'),
 ('nl/pinch/nrc/data/repositories/welcome/WelcomeRepositoryImpl',
  'c(Lnl/pinch/nrc/data/repositories/welcome/WelcomeRepositoryImpl;)Landroid/content/SharedPreferences;',
  '425930e68983012b20e7f4e705347658c4983aa1fa9f7b365c7588ea8ddcb635'),
 ('nl/pinch/nrc/data/repositories/welcome/WelcomeRepositoryImpl',
  'didShowWelcomePage()Z',
  'a9c6170b30444e14160746359305deda8d6777102373044a023c143768db1a01'),
 ('nl/pinch/nrc/data/repositories/welcome/WelcomeRepositoryImpl',
  'setWelcomePageShown()V',
  '5f5d67f8b98e606dd4bff8655f9a295616de2c2fb186a7f54da83cef786bee51'),
 ('pinch/nrcnext/ui/splash/NRCSplashViewModel',
  'D(Lpinch/nrcnext/ui/splash/NRCSplashViewModel;)Ljava/lang/Boolean;',
  'c2b985b6202877b3e8cda317133188d46a073bcd2264cf6d7c4b69166cd3db10'),
 ('pinch/nrcnext/ui/splash/NRCSplashViewModel',
  'E(ZZ)Ljava/lang/Boolean;',
  '14ee11c6972adc6a4aac25e89ea47d525f51ab53ee7219b183ba6c2b4ff16bba'),
 ('pinch/nrcnext/ui/splash/NRCSplashViewModel',
  'M(Lpinch/nrcnext/ui/splash/NRCSplashViewModel;Ljava/lang/Boolean;)Lkotlin/Unit;',
  'a2e3f2d3b4becda48dc9974337a5799c0608ae2165c54df5cdb10a5550fd4bf3'),
 ('pinch/nrcnext/ui/splash/NRCSplashViewModel',
  'refreshData()V',
  '65c263ba37e9aa8bc241fd5b2746858237c346dd441b93576d6d07c176efcffc'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity$Companion',
  'startActivity$default(Lpinch/nrcnext/ui/onboarding/OnboardingActivity$Companion;Landroid/content/Context;Lnl/pinch/nrc/data/model/onboarding/OnboardingPage;Landroid/net/Uri;ZILjava/lang/Object;)V',
  'ee9ec2d60205cc84d423b974791ddc7f6e7d5cff4c228f67035fc8a1c3560099'),
 ('pinch/nrcnext/ui/onboarding/OnboardingActivity$Companion',
  'startActivity(Landroid/content/Context;Lnl/pinch/nrc/data/model/onboarding/OnboardingPage;Landroid/net/Uri;Z)V',
  'ebe55375cd440433ce038fc5a0fa3288a230ef5ff22402ade30b03d20ce841dc'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity$Companion',
  'a(Landroid/content/Context;Z)Landroid/content/Intent;',
  'f3f5891627db3e5bd8997e744e7e7c32f769077b4882037341afc7f64db479fb'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity$Companion',
  'startActivity(Landroid/content/Context;Lpinch/nrcnext/ui/frontpage/NRCFrontPageOpenFeatureOptions;)V',
  'd94cff626266b3ebfa1fcce4525004c9a1507ef2d7af67d02077c4c799d10ca6'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity$Companion',
  'startActivity(Landroid/content/Context;Z)V',
  '9a21ed8c7a28025eb087952422d02214d23a9b543fccb8c8fc374f1ec5ec1ddf')]
CREATE_SHA='f213a170a1873a6b7701a1e9633b223e110c6d3980e801ef1f77638236d4f8a8'

PINNED.extend([('pinch/nrcnext/ui/deeplink/DeepLinkActivity', 'E()V', '5c5e1873449676982f820620f91fd32e497f147d3ca63e98a7f10c02852ed2eb'),
 ('pinch/nrcnext/ui/deeplink/DeepLinkActivity',
  'F(Landroid/content/Intent;)V',
  'b0f0ab4e5d4f5e941afe8fc499ff06123f872d8f65ea4daba4b10d96dda51d9c'),
 ('pinch/nrcnext/ui/deeplink/DeepLinkActivity', 'H()V', 'ba873621df80850d9fe18b7b97c1488e3bc4891832ff0c9827b6e17b3e5b9c5b')])

def code(root,cls,sig):return [l.replace('const-string/jumbo ','const-string ') for l in canonical_method(root,cls,sig)]


def source(root,cls):
    paths=list(root.glob('smali*/'+cls+'.smali'))+list(root.glob('smali/smali*/'+cls+'.smali'))
    assert len(paths)==1,cls
    return paths[0].read_text()


def digest(lines):return hashlib.sha256('\n'.join(lines).encode()).hexdigest()


class Machine:
    """Android boundary doubles retain real decoded app/repository method bodies."""
    def __init__(self,root):self.root=root;self.navigation=[];self.finished=0;self.writes=[];self.stack=[];self.started=[]
    def run(self,cls,sig,args):
        if cls==ACT and not self.stack and args and isinstance(args[0],dict):self.stack=[args[0]]
        instructions=code(self.root,cls,sig);regs={'p'+str(i):v for i,v in enumerate(args)};pc=0;result=None
        for _ in range(1500):
            line=instructions[pc];pc+=1
            if line.startswith('const-string '):
                dst,literal=line.split(' ',1)[1].split(', ',1);regs[dst]=smali_string(literal)
            elif line.startswith(('const/4 ','const/16 ','const ')):
                dst,v=line.split(' ',1)[1].split(', ');regs[dst]=int(v,16)
            elif line.startswith('const-class '):
                dst,typ=line.split(' ',1)[1].split(', ');regs[dst]=typ
            elif line.startswith('sget '):
                dst,field=line.split(' ',1)[1].split(', ');regs[dst]=field
            elif line.startswith('sget-object '):
                dst,field=line.split(' ',1)[1].split(', ');regs[dst]=field.split('->')[1].split(':')[0]
            elif line.startswith('iget-object '):
                dst,obj,field=line.split(' ',1)[1].split(', ');regs[dst]=regs[obj][field.split('->')[1].split(':')[0]]
            elif line.startswith('move-result'):regs[line.split()[1]]=result
            elif line.startswith('check-cast '):pass
            elif line.startswith('new-instance '):
                dst,typ=line.split(' ',1)[1].split(', ');regs[dst]={'type':typ}
            elif line.startswith('invoke-'):
                names=line.split('{',1)[1].split('}',1)[0];values=[regs[n] for n in names.split(', ')] if names else []
                ref=line.split('}, ',1)[1];owner,target=ref.split('->')
                if owner in {'L'+ACT+';','L'+MODEL+';','L'+REPO+';','Lpinch/nrcnext/ui/deeplink/DeepLinkActivity;'}:result=self.run(owner[1:-1],target,values)
                elif owner=='L'+INTERFACE+';':result=self.run(REPO,target,values)
                elif 'Lazy;->getValue' in ref:result=values[0]['value']
                elif 'StateFlow;->getValue' in ref:result=values[0]['value']
                elif 'Boolean;->booleanValue' in ref:result=bool(values[0])
                elif 'Intrinsics;->checkNotNull' in ref:assert values[0] is not None
                elif 'SharedPreferences;->getBoolean' in ref:result=values[0]['values'].get(values[1],values[2])
                elif 'SharedPreferences;->edit' in ref:result={'preferences':values[0],'pending':{}}
                elif 'SharedPreferences$Editor;->putBoolean' in ref:values[0]['pending'][values[1]]=bool(values[2]);result=values[0]
                elif 'SharedPreferences$Editor;->apply' in ref:
                    values[0]['preferences']['values'].update(values[0]['pending']);self.writes.append(dict(values[0]['pending']))
                elif 'Intent;-><init>' in ref:values[0]['target']=values[2]
                elif 'Intent;->setData' in ref:values[0]['data']=values[1];result=values[0]
                elif 'Intent;->setFlags' in ref:values[0]['flags']=values[1];result=values[0]
                elif 'Context;->startActivity' in ref:
                    self.navigation.append(values[1]);activity={'type':values[1]['target']};self.started.append(activity);self.stack.append(activity)
                elif 'NRCFrontPageActivity$Companion;->startActivity' in ref:
                    self.navigation.append({'frontpage':True,'clear_task':values[2]})
                    if values[2]:self.stack=[]
                    activity={'type':'Lpinch/nrcnext/ui/frontpage/NRCFrontPageActivity;'};self.started.append(activity);self.stack.append(activity)
                elif 'Activity;->finish' in ref:
                    self.finished+=1;values[0]['was_task_root']=bool(self.stack and self.stack[0] is values[0]);self.stack=[node for node in self.stack if node is not values[0]]
                elif 'Activity;->isTaskRoot' in ref:result=values[0].get('was_task_root',bool(self.stack and self.stack[0] is values[0]))
                elif 'Context;->getString' in ref:result='synthetic error'
                elif 'Toast;->makeText' in ref:result={'type':'Landroid/widget/Toast;'}
                elif 'Toast;->show' in ref:pass
                else:raise AssertionError('Unsupported onboarding operation: '+line)
            elif line.startswith(('if-eqz ','if-nez ')):
                op,reg,target=line.replace(',','').split()
                if bool(regs[reg])==(op=='if-nez'):pc=int(target[1:])
            elif line.startswith(('if-eq ','if-ne ')):
                op,a,b,target=line.replace(',','').split()
                if (regs[a]==regs[b])==(op=='if-eq'):pc=int(target[1:])
            elif line.startswith('goto'):pc=int(line.split()[1][1:])
            elif line=='return-void':return None
            elif line.startswith(('return-object ','return ')):return regs[line.split()[1]]
            else:raise AssertionError('Unsupported onboarding instruction: '+line)
        raise AssertionError('Onboarding did not complete')


def fixture(shown=False,logged=False,page=None,link=None):
    preferences={'values':{KEY:shown}}
    repo={'b':{'value':preferences}}
    model={'Z':repo,'b0':{'value':logged}}
    activity={'m':{'value':model},'s':{'value':page},'t':{'value':link},'genuine_account':{'unchanged':logged}}
    return activity,preferences


def live_before_write(lines):
    """Conservative original register liveness before the first defining write.

    Branches can only increase this set; all original branch bodies are scanned.
    A scratch value must be overwritten before any possible original read.
    """
    written=set();live=set()
    for line in lines:
        registers=re.findall(r'(?<![A-Za-z0-9_])(?:v|p)\d+(?![A-Za-z0-9_])',line.split('}, ',1)[0])
        if not registers:continue
        writes=line.startswith(('const','sget','iget','move-result','new-instance','aget'))
        if line.startswith('move ') or line.startswith('move-object '):writes=True
        reads=registers[1:] if writes else registers
        live.update(reg for reg in reads if reg not in written)
        if writes:written.add(registers[0])
    return live


def verify(root:Path,enabled:bool):
    for cls,sig,sha in PINNED:assert digest(code(root,cls,sig))==sha,'Original NRC welcome/account contract '+cls+'->'+sig
    original=code(root,ACT,CREATE)
    calls=[i for i,line in enumerate(original) if '->morpheSkipWelcome(' in line]
    assert len(calls)==int(enabled),'NRC automatic welcome policy installed with consent control only'
    if enabled:
        index=calls[0]
        scratch=original[index+1].split()[1]
        assert scratch not in live_before_write(original[index+4:]),'Injected welcome result clobbers an original live Activity/Compose argument: '+scratch
        assert original[index:index+4]==['invoke-static {p0}, L'+ACT+';->'+SKIP,'move-result v2','if-eqz v2, @'+str(index+4),'return-void'],'Resume exact original onCreate path'
        assert 'const/4 v0, 0x0' in original[:index] and any('setContent$default' in line and '{p0, v0,' in line for line in original[index+4:]),'Preserve typed null CompositionContext and default-marker arguments'

        consent=[i for i,line in enumerate(original) if 'ConsentManager;->showWhenNeeded('in line]
        assert len(consent)==1 and index==consent[0]+1,'Retain super/DI/consent readiness before guest completion'
        original=original[:index]+original[index+4:]
        original=[re.sub(r'@(\d+)',lambda m:'@'+str(int(m[1])-4 if int(m[1])>=index+4 else int(m[1])),line) for line in original]
        for shown,logged,page,link,want in [
            (False,False,None,None,True),(False,False,None,'nrc://article/example',True),
            (True,False,None,None,False),(True,True,None,None,False),(False,True,None,None,False),
            (False,False,'Login',None,False),(False,False,'PushOptions',None,False),(False,False,'PushPermissionDenied',None,False),
        ]:
            state,prefs=fixture(shown,logged,page,link);account=state['genuine_account'];machine=Machine(root)
            assert bool(machine.run(ACT,SKIP,[state]))==want,(shown,logged,page,link)
            assert state['genuine_account'] is account and account=={'unchanged':logged},'Never replace/logout/authenticate the account'
            if want:
                assert prefs['values'][KEY] and machine.writes==[{KEY:True}],'Original asynchronous SharedPreferences completion is persisted'
                assert machine.finished==1 and all(node is not state for node in machine.stack),'Automatic completion leaves no contentless onboarding Activity beneath a deep link'
                expected={'target':'Lpinch/nrcnext/ui/deeplink/DeepLinkActivity;','data':link,'type':'Landroid/content/Intent;'} if link else {'frontpage':True,'clear_task':1}
                assert machine.navigation==[expected],'Original Skip deep-link/frontpage branch'
                assert machine.run(ACT,SKIP,[state])==0 and len(machine.navigation)==1 and len(machine.writes)==1,'Persisted completion prevents repeated automatic navigation'
            else:assert not machine.writes and not machine.navigation and machine.finished==0,'Keep explicit/manual/account onboarding behavior'
        # Original invalid/error deep-link completion must have no blank
        # onboarding Activity underneath; it can become root and open fallback.
        state,prefs=fixture(link='nrc://invalid/example');machine=Machine(root);assert machine.run(ACT,SKIP,[state])==1
        link_activity=machine.started[-1];machine.run('pinch/nrcnext/ui/deeplink/DeepLinkActivity','E()V',[link_activity])
        assert len(machine.stack)==1 and machine.stack[0]['type']=='Lpinch/nrcnext/ui/frontpage/NRCFrontPageActivity;','Invalid deep link resolves to original frontpage fallback'
        verify_calls(root)
    assert digest(original)==CREATE_SHA,'Retain complete original Activity creation body/control flow'
    # Independently execute the unmodified original UI Skip binding, so the
    # persistence/navigation expectation is established by the real app body.
    state,prefs=fixture();machine=Machine(root);machine.run(ACT,'e0(L'+ACT+';Z)Lkotlin/Unit;',[state,False])
    assert prefs['values'][KEY] and machine.navigation==[{'frontpage':True,'clear_task':1}],'Actual original Overslaan completion'


def verify_calls(root):
    for cls,sig in [(ACT,SKIP),(MODEL,POLICY)]:
        for kind,owner,target in re.findall(r'invoke-(static|virtual|direct|interface)\s+\{[^}]*\},\s+(L[^;]+;)->(\S+)', '\n'.join(code(root,cls,sig))):
            if owner=='Landroid/app/Activity;' and target=='finish()V':
                assert kind=='virtual';continue
            text=source(root,owner[1:-1]);matches=re.findall(r'^\.method ([^\n]*?) '+re.escape(target)+r'$',text,re.M)
            assert len(matches)==1,(owner,target)
            assert (kind=='interface')==bool(re.search(r'^\.class .*\binterface\b',text,re.M)),(kind,owner,target)
            assert (kind=='static')==('static' in matches[0].split()),(kind,owner,target)
            if kind=='direct':assert 'private' in matches[0].split(),(owner,target)


if __name__=='__main__':
    import argparse
    parser=argparse.ArgumentParser();parser.add_argument('root',type=Path);parser.add_argument('--enabled',action='store_true');args=parser.parse_args()
    verify(args.root,args.enabled);print('PASS NRC welcome '+('enabled' if args.enabled else 'original'))
