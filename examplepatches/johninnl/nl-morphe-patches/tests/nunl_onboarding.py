"""Run NU's actual show coroutine and modal completion without publisher prose."""
import base64
import hashlib
import re
from pathlib import Path
from verify_weerplaza import canonical_method, smali_string

BASE='nl/nu/android/bff/'
SHOW=BASE+'domain/use_cases/screen_visibility/ShowScreenUseCase'
CORO=SHOW+'$invoke$2'
PRES=BASE+'presentation/content/ScreenPresenterImpl'
VM=BASE+'presentation/modal_sheet/ModalSheetViewModel'
ENTITY=BASE+'domain/models/screen/ScreenEntity'
MODEL=BASE+'presentation/models/ScreenPresentationModel'
DISMISS=BASE+'domain/models/actions/NavigationAction$DismissScreen'
CONT='Lkotlin/coroutines/Continuation;'
UNIT='Unit';SUSP=object()
SID=lambda name:base64.b64encode(('{"type":"OnboardingScreen","id":"'+name+'"}').encode()).decode()
PUSH=SID('breaking-news-modal');LOGIN=SID('promote-login-modal');TOPIC=SID('onboarding-follow-topics')
RUN='invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'
CAPTURE='morpheRememberWelcome(L'+CORO+';L'+ENTITY+';)V'
FINISH='morpheFinishWelcome('+CONT+'Ljava/lang/Object;Ljava/lang/Object;)V'
COUNT='morpheCountAndComplete(L'+SHOW+';'+CONT+')Ljava/lang/Object;'
NAV=BASE+'presentation/modal_sheet/ModalSheetNavigator'
NAV_SIG='navigate(L'+BASE+'domain/models/actions/NavigationAction;L'+BASE+'domain/models/SwipelaneModel;L'+BASE+'domain/models/actions/BffPresentationMode;Lkotlin/jvm/functions/Function1;)V'
BYID=BASE+'domain/models/screen/ScreenLoadingType$ById'
DEFAULT=BASE+'domain/models/BlockData$Default'
NATIVE='morpheDismissWelcomeIfCurrent(L'+VM+';L'+BASE+'domain/models/actions/NavigationAction;)Z'
CLAIM='morpheClaimWelcome(L'+PRES+';Ljava/lang/String;)Z'
PINNED=[('nl/nu/android/bff/presentation/modal_sheet/ModalSheetViewModel',
  '<clinit>()V',
  '98eaf168b896d2470494c3681091c39727606fe484049cbea5238448a1397891'),
 ('nl/nu/android/bff/presentation/modal_sheet/ModalSheetViewModel',
  '<init>(Lnl/nu/android/bff/presentation/content/ScreenPresenterImpl$ScreenPresenterFactory;Lnl/nu/android/bff/domain/ScreenInteractor$ScreenInteractorFactory;Landroidx/lifecycle/SavedStateHandle;)V',
  'cb79ed94429fea35fc3815eb346962b2629f04bf30039c0d97887ffcd794b375'),
 ('nl/nu/android/bff/presentation/modal_sheet/ModalSheetViewModel',
  'getNextActivityIntent()Landroid/content/Intent;',
  'eaa23d56154b2b0044490b7f1213ab555b0bf621fb4b0ae5e86878e704ea7f6c'),
 ('nl/nu/android/bff/presentation/modal_sheet/ModalSheetViewModel',
  'goToNextScreen()V',
  '66c26c0a425cd6eefe3ff33cd2662cb2918d2b04da2da1e23603ae7c2f024c0e'),
 ('nl/nu/android/bff/presentation/modal_sheet/ModalSheetViewModel',
  'hasNextScreen()Z',
  '9c421ce1afd1141faf09ccf11c063c21eba18055747024c972ee7267fb0f6cc6'),
 ('nl/nu/android/bff/presentation/modal_sheet/ModalSheetViewModel',
  'saveStateForProcessDeath()V',
  '984c3b52550d437ffa3001b24d513567efee796ea6eda89936cdfe3840b6a303'),
 ('nl/nu/android/bff/presentation/modal_sheet/ModalSheetViewModel',
  'getCloseModalLiveData()Landroidx/lifecycle/LiveData;',
  '77e5bbf8905dd94f680e45959ff3225c5352e8b6fd6586fd52c6361b2cf232a6'),
 ('nl/nu/android/bff/presentation/modal_sheet/ModalSheetViewModel',
  'getCurrentScreenLoadingType()Lnl/nu/android/bff/domain/models/screen/ScreenLoadingType;',
  '86187ade19f6ecaafbb0dc821cd5bca7766ac1c3eaddb713cdd828a7ef089e43'),
 ('nl/nu/android/bff/presentation/modal_sheet/ModalSheetViewModel',
  'processDismissIntent()Z',
  '74e50430689d8b635d7bf0fdf17a5896bfdc87ffc5598c10ea38a255f655d12f'),
 ('nl/nu/android/bff/domain/use_cases/screen_visibility/ShowScreenUseCase',
  'incrementShownCount(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
  'fbe06158dfeded01dced477441648aac947244d1826cd7827b5b1590f98c293b'),
 ('nl/nu/android/bff/domain/use_cases/screen_visibility/ShowScreenUseCase',
  'incrementShownCount$lambda$0(Lnl/nu/android/bff/domain/models/screen/ScreenEntity;)Lnl/nu/android/bff/domain/models/screen/ScreenEntity;',
  'b645aba0d6a4dd0ac75084034c54ef6c3b349798ecdb244ab5544090f6036bde'),
 ('nl/nu/android/bff/domain/use_cases/screen_visibility/ShowScreenUseCase',
  'processTrackers(Lnl/nu/android/bff/domain/models/screen/ScreenEntity;Lnl/nu/android/bff/domain/ScreenPresenter;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
  'c043f9afa13221da43d4c6fbf48facdb332eff737e22ef47fa18c765517995e2'),
 ('nl/nu/android/bff/presentation/modal_sheet/ModalSheetNavigator',
  'navigate(Lnl/nu/android/bff/domain/models/actions/NavigationAction;Lnl/nu/android/bff/domain/models/SwipelaneModel;Lnl/nu/android/bff/domain/models/actions/BffPresentationMode;Lkotlin/jvm/functions/Function1;)V',
  '5f8d8a9c5b05f6ad88643d16158559613753d97ebdb31c1124d738283aa56c8b'),
 ('nl/nu/android/bff/domain/ScreenInteractor',
  'processAction(Lnl/nu/android/bff/domain/models/actions/Action;)V',
  '964f082ca3964aeb101ab6a1e02f115095db574cc134488f50e212d0e3a1614a'),
 ('nl/nu/android/bff/domain/ScreenInteractor',
  'onNextScreenAvailable(Lnl/nu/android/bff/domain/models/screen/ScreenLoadingType;)V',
  '461c159f62a5e90356de20ce15f56c5a8f4db7992db330584ecfe0308efaf8c8'),
 ('nl/nu/android/bff/domain/use_cases/tracking/ProcessTrackingEventsUseCase',
  'invoke(Ljava/util/List;Lnl/nu/android/bff/domain/ScreenPresenter;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
  'a8be8ec10fb2422bf20524292bd4d4c41d874b2bc8b70f6a0174386b0b541149'),
 ('nl/nu/android/bff/domain/models/actions/NavigationAction$DismissScreen',
  '<init>(Lnl/nu/android/bff/domain/models/actions/Action;Lnl/nu/android/bff/domain/models/actions/Action;Ljava/util/List;)V',
  '58968bc1a27ee20ff98682d2905e29f850151791a3c35213be97e9b4d8f6c5ac')]
PINNED.extend([('nl/nu/android/bff/presentation/content/ScreenPresenterImpl',
  'processUIIntent$lambda$0(Lnl/nu/android/bff/presentation/content/ScreenPresenterImpl;Lnl/nu/android/bff/domain/models/actions/UIAction;Lnl/nu/android/bff/presentation/models/ScreenPresentationModel;)Lnl/nu/android/bff/presentation/models/ScreenPresentationModel;',
  '6406094c4046a5422d77388cf72bd86a10110dc66d1f25354d55b46fa856d20c'),
 ('nl/nu/android/bff/presentation/content/ScreenPresenterImpl',
  'toUIEvent(Lnl/nu/android/bff/domain/models/actions/UIAction;)Lnl/nu/android/bff/presentation/models/UIEvent$Completable;',
  'ac9a43e408f6c36a5ec7d8697138fb5e4cd11241e5a49ebcfe59c3d9b606c6fd'),
 ('nl/nu/android/bff/presentation/content/ScreenPresenterImpl',
  'processUIIntent(Lnl/nu/android/bff/domain/models/actions/UIAction;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
  '5d21ec426774ec40dfbd5ad2cc851541688752d7b974d44ad799a67976369163'),
 ('nl/nu/android/bff/presentation/models/ScreenPresentationModel',
  'withAdditionalEvent(Lnl/nu/android/bff/presentation/models/UIEvent;)Lnl/nu/android/bff/presentation/models/ScreenPresentationModel;',
  'f4021b2500390a26c73fdd8b36a9cb003d654a90854ae3dce27d9fc568f707a6'),
 ('nl/nu/android/bff/presentation/content/ContentViewModel',
  '<init>(Lnl/nu/android/bff/presentation/content/ScreenPresenterImpl$ScreenPresenterFactory;Lnl/nu/android/bff/domain/ScreenInteractor$ScreenInteractorFactory;)V',
  '1a2ccbf85cb6b909cc7df2cb8fadb05c6adb0153f4a19db08548ca1c5b82af1c'),
 ('nl/nu/android/bff/presentation/content/ContentViewModel',
  'removeProcessedEvent$lambda$0(Lnl/nu/android/bff/presentation/models/UIEvent;Lnl/nu/android/bff/presentation/models/ScreenPresentationModel;)Lnl/nu/android/bff/presentation/models/ScreenPresentationModel;',
  '3069d6cad62d249417f831ebe80cc06011cb953ba6e5d90ded9c5469acffda0d'),
 ('nl/nu/android/bff/presentation/content/ContentViewModel',
  'onUIEventProcessed(Lnl/nu/android/bff/presentation/models/UIEventResult;)V',
  '4ccf28b60d79470a5429cebaf8120bca14bdb81a5576a82b15213f09e95922fa'),
 ('nl/nu/android/bff/data/mappers/TargetMapper',
  'mapDismissTarget(Lnl/nu/performance/api/client/objects/DismissTarget;Lnl/nu/android/bff/domain/models/actions/Action;Lnl/nu/android/bff/domain/models/actions/Action;)Lnl/nu/android/bff/domain/models/actions/Action;',
  '6fdecc0fba78622d03542b36f288307c2154e71dd18bc1fee06b2a091b726382'),
 ('nl/nu/android/bff/data/mappers/TargetMapper',
  'mapRemoteTarget(Lnl/nu/performance/api/client/objects/RemoteTarget;Ljava/lang/String;Lnl/nu/android/bff/domain/models/actions/Action;Lnl/nu/android/bff/domain/models/actions/Action;)Lnl/nu/android/bff/domain/models/actions/Action;',
  '5c634e252c48272c1eef969b7abccbba604ea6f7b59469ba8791143308327570'),
 ('nl/nu/android/bff/data/mappers/ScreenMapper',
  'screenIdsToScreenIdentifiers(Ljava/util/List;)Ljava/util/List;',
  '069c7db256ddfe3bbd4047a865c21ae6aa79babe604e608e06f0176a6f5966ce'),
 ('nl/nu/android/bff/data/mappers/ScreenMapper',
  'map(Lnl/nu/performance/api/client/objects/Screen;)Lnl/nu/android/bff/domain/models/screen/ScreenEntity;',
  '20e0b03581c6802a26fe495db29b9b6c00c76c1515614876ab5fa59fcf2b0831'),
 ('nl/nu/android/bff/presentation/runtime_permission/RuntimePermissionProcessor',
  'request(Lnl/nu/android/bff/domain/models/RuntimePermission;Lkotlin/jvm/functions/Function1;)V',
  '0c9be8419d4b34a2275f79176f02be17a064ca526f17713f48d27c6a9da6870b'),
 ('nl/nu/android/bff/presentation/login/LoginHandler',
  'openLogin(Lnl/nu/android/bff/domain/models/actions/NavigationAction$OpenLogin;Lkotlin/jvm/functions/Function1;Lnl/nu/android/utility/navigation/ActivityResultLauncher;)V',
  '8686f2ad131793f2e650ba65fa678b890a2c84302345b275b3712da1311aae12'),
 ('nl/nu/android/bff/domain/use_cases/remote/RemoteIntentUseCase',
  'invoke(Lnl/nu/android/bff/domain/models/actions/RemoteAction;Lnl/nu/android/bff/domain/ScreenPresenter;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
  'd9d95c12582c800680f3b82fc14b49ea1e05cd6c17bbf09fcf8ad3f40c00650d'),
 ('nl/nu/android/bff/domain/use_cases/screen_visibility/ShowScreenUseCase',
  'processLocalActions(Lnl/nu/android/bff/domain/models/screen/ScreenEntity;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
  'd308999f67565c035ccc6d2c6317c878a1fad0566bdeb0b5d70011c9727df740')])
ORIGINAL_SHA='b49bef3f96e38fa61f7dc9c3db39e5c87fe0add9d07decfe738232a1b9e0eca2'


def code(root,cls,sig):return [l.replace('const-string/jumbo ','const-string ') for l in canonical_method(root,cls,sig)]
def digest(lines):return hashlib.sha256('\n'.join(lines).encode()).hexdigest()
def source(root,cls):
    ps=list(root.glob('smali*/'+cls+'.smali'))+list(root.glob('smali/smali*/'+cls+'.smali'));assert len(ps)==1,cls
    return ps[0].read_text()
def zero(v):return v is None or isinstance(v,(int,bool)) and v==0

def switches(root,cls,sig):
    body=re.search(r'^\.method[^\n]* '+re.escape(sig)+r'\n(.*?)^\.end method',source(root,cls),re.M|re.S)[1]
    labels={};pc=0;annotations=0;tables={};payload=None;value=0
    for raw in body.splitlines():
        line=raw.strip()
        if line.startswith('.annotation'):annotations+=1
        if line.startswith('.end annotation'):annotations-=1;continue
        if annotations or not line or line.startswith('#'):continue
        if line.startswith('.packed-switch '):payload=[];value=int(line.split()[1],16);continue
        if line.startswith('.end packed-switch'):
            tables[label]=(value,payload);payload=None;continue
        if payload is not None:payload.append(line);continue
        if line.startswith(':'):labels[line]=pc;label=line
        elif not line.startswith('.'):pc+=1
    return {labels[k]:{v+i:labels[t] for i,t in enumerate(ts)} for k,(v,ts) in tables.items()}


def catches(root,cls,sig):
    body=re.search(r'^\.method[^\n]* '+re.escape(sig)+r'\n(.*?)^\.end method',source(root,cls),re.M|re.S)[1]
    labels={};pc=0;annotations=0
    for raw in body.splitlines():
        line=raw.strip()
        if line.startswith('.annotation'):annotations+=1
        if line.startswith('.end annotation'):annotations-=1;continue
        if annotations or not line or line.startswith('#'):continue
        if line.startswith(':'):labels[line]=pc
        elif not line.startswith('.'):pc+=1
    return [(labels[a],labels[b],labels[c]) for a,b,c in re.findall(r'\.catchall\s+\{(:\w+)\s+\.\.\s+(:\w+)\}\s+(:\w+)',body)]


class Machine:
    """Android/coroutine IO boundaries are doubles; app instructions are real."""
    def __init__(self,root,suspend=()):
        self.root=root;self.suspend=set(suspend);self.pending=None;self.trace=[];self.dismiss=[];self.loaded=[];self.closed=[];self.acks=[];self.monitors=[]
    def operation(self,name,value,continuation,effect=lambda:None):
        if name in self.suspend:
            self.suspend.remove(name);self.pending=(value,name,effect);return SUSP
        effect();self.trace.append(name);return value
    def drive(self,coro):
        result=self.run(CORO,RUN,[coro,UNIT])
        while result is SUSP:
            assert self.pending;value,name,effect=self.pending;self.pending=None;effect();self.trace.append(name)
            result=self.run(CORO,RUN,[coro,value])
        assert result==UNIT
    def run(self,cls,sig,args):
        ins=code(self.root,cls,sig);regs={'p'+str(i):v for i,v in enumerate(args)};pc=0;result=None;table=switches(self.root,cls,sig)
        for _ in range(2500):
            line=ins[pc];pc+=1
            try:
                if line.startswith('const-string '):d,v=line.split(' ',1)[1].split(', ',1);regs[d]=smali_string(v)
                elif line.startswith(('const/4 ','const/16 ','const ')):
                    d,v=line.split(' ',1)[1].split(', ');regs[d]=int(v,16)
                elif line.startswith(('iget-object ','iget ')):
                    d,o,f=line.split(' ',1)[1].split(', ');regs[d]=regs[o].get(f.split('->')[1].split(':')[0])
                elif line.startswith(('iput-object ','iput ')):
                    v,o,f=line.split(' ',1)[1].split(', ');regs[o][f.split('->')[1].split(':')[0]]=regs[v]
                elif line.startswith('monitor-enter '):self.monitors.append(regs[line.split()[1]])
                elif line.startswith('monitor-exit '):assert self.monitors.pop() is regs[line.split()[1]]
                elif line.startswith('move-exception '):regs[line.split()[1]]=caught
                elif line.startswith('sget-object '):d,_=line.split(' ',1)[1].split(', ');regs[d]=UNIT
                elif line.startswith('move-result'):regs[line.split()[1]]=result
                elif line.startswith(('move-object ','move ')):
                    d,v=line.split(' ',1)[1].split(', ');regs[d]=regs[v]
                elif line.startswith('check-cast '):pass
                elif line.startswith('instance-of '):
                    d,v,t=line.split(' ',1)[1].split(', ');regs[d]=isinstance(regs[v],dict) and regs[v].get('__type')==t
                elif line.startswith('new-instance '):
                    d,t=line.split(' ',1)[1].split(', ');regs[d]={'__type':t}
                elif line.startswith('invoke-'):
                    names=line.split('{',1)[1].split('}',1)[0]
                    if ' .. ' in names:
                        a,b=names.split(' .. ');names=', '.join(a[0]+str(i) for i in range(int(a[1:]),int(b[1:])+1))
                    vals=[regs[n] for n in names.split(', ')] if names else []
                    ref=line.split('}, ',1)[1];owner,target=ref.split('->');owner=owner[1:-1]
                    if target.startswith('morphe') or owner in {VM,ENTITY,MODEL,DISMISS,NAV,BYID,DEFAULT,NAV+'$$ExternalSyntheticTypeSwitchClass2'} or owner==SHOW and target.startswith(('access$','processTrackers(','incrementShownCount(')):
                        if owner==VM and target=='getScreenInteractor()L'+BASE+'domain/ScreenInteractor;':owner=BASE+'presentation/content/ContentViewModel'
                        result=self.run(owner,target,vals)
                    elif target=='getCOROUTINE_SUSPENDED()Ljava/lang/Object;':result=SUSP
                    elif 'ResultKt;->throwOnFailure(' in ref:
                        if isinstance(vals[0],Exception):raise vals[0]
                    elif 'SpillingKt;->nullOutSpilledVariable(' in ref:result=None
                    elif 'Intrinsics;->checkNotNull' in ref:assert vals[0] is not None
                    elif 'String;->equals(' in ref:result=vals[0]==vals[1]
                    elif 'Boolean;->valueOf(' in ref:result=bool(vals[0])
                    elif owner.endswith('PipUserRepository$$ExternalSyntheticBackport0') and target=='m(II)I':assert 0<=vals[0]<vals[1]
                    elif owner==BASE+'domain/models/BlockData' and target.startswith('getClickAction('):result=self.run(DEFAULT,target,vals)
                    elif target=='iterator()Ljava/util/Iterator;':result={'iterator':iter(vals[0])}
                    elif target=='hasNext()Z':
                        try:vals[0]['next']=next(vals[0]['iterator']);result=True
                        except StopIteration:result=False
                    elif target=='next()Ljava/lang/Object;':result=vals[0]['next']
                    elif target=='get(I)Ljava/lang/Object;':result=vals[0][vals[1]]
                    elif target=='isEmpty()Z':result=not vals[0]
                    elif 'Collections;->emptyList(' in ref:result=[]
                    elif target=='invoke(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;' and owner.endswith('BannerInvalidationUseCase'):result=self.operation('banner',UNIT,vals[-1])
                    elif target=='getScreen('+CONT+')Ljava/lang/Object;':result=self.operation('screen',vals[0]['screen'],vals[-1])
                    elif target.startswith('presentScreen('):
                        def present(presenter=vals[0],screen=vals[1]):presenter['viewState']={'currentScreenId':screen['id']}
                        result=self.operation('present',UNIT,vals[-1],present)
                    elif owner.endswith('BottomBarUseCase') and target.startswith('invoke('):result=self.operation('bottom',UNIT,vals[-1])
                    elif owner==SHOW and target.startswith('processLocalActions('):result=self.operation('local',UNIT,vals[-1])
                    elif owner.endswith('ScreenTrackers') and target=='getShow()Ljava/util/List;':result=vals[0]['show']
                    elif target=='getTrackers()Lnl/nu/performance/api/client/objects/ScreenTrackers;':result=vals[0]['trackers']
                    elif owner.endswith('ProcessTrackingEventsUseCase') and target.startswith('invoke('):
                        def ack(events=vals[1]):self.acks.extend(events or [])
                        result=self.operation('ack',UNIT,vals[-1],ack)
                    elif target.startswith('modify(Lkotlin/jvm/functions/Function1;'):
                        result=self.operation('shown',UNIT,vals[-1],lambda store=vals[0]:store.__setitem__('shown',store.get('shown',0)+1))
                    elif owner.endswith('ExternalSyntheticLambda0') and target=='<init>()V':pass
                    elif owner=='java/lang/Object' and target=='<init>()V':pass
                    elif owner=='kotlin/jvm/functions/Function1' and target.startswith('invoke('):

                        if 'model' in vals[0]:self.trace.append('dismiss');self.dismiss.append((vals[0]['model'],vals[1]))
                        else:vals[0]['results'].append(vals[1])
                        result=UNIT
                    elif target=='size()I':result=len(vals[0])
                    elif target=='remove(I)Ljava/lang/Object;':result=vals[0].pop(vals[1])
                    elif 'CollectionsKt;->first(' in ref:result=vals[0][0]
                    elif target=='get(Ljava/lang/String;)Ljava/lang/Object;':result=vals[0].get(vals[1])
                    elif target=='set(Ljava/lang/String;Ljava/lang/Object;)V':vals[0][vals[1]]=vals[2]
                    elif target.startswith('onNextScreenAvailable('):self.loaded.append(vals[1])
                    elif owner=='androidx/lifecycle/MutableLiveData' and target=='setValue(Ljava/lang/Object;)V':vals[0]['value']=vals[1];self.closed.append(vals[1])
                    else:raise AssertionError('Unsupported onboarding operation '+line)
                elif line.startswith(('if-eqz ','if-nez ')):
                    op,a,t=line.replace(',','').split()
                    if zero(regs[a])==(op=='if-eqz'):pc=int(t[1:])
                elif line.startswith(('if-eq ','if-ne ','if-le ')):
                    op,a,b,t=line.replace(',','').split();a,b=regs[a],regs[b]
                    equal=(a is b) if isinstance(a,(dict,list)) or isinstance(b,(dict,list)) else (zero(a) and zero(b) or a==b)
                    if (equal if op=='if-eq' else not equal if op=='if-ne' else a<=b):pc=int(t[1:])
                elif line.startswith('packed-switch '):
                    a,t=line.split(' ',1)[1].split(', ');pc=table[int(t[1:])].get(regs[a],pc)
                elif line.startswith('goto'):pc=int(line.split()[1][1:])
                elif line=='nop':pass
                elif line.startswith('throw '):
                    error=regs[line.split()[1]]
                    if isinstance(error,Exception):raise error
                    raise AssertionError('Unexpected original throw '+repr(error))
                elif line=='return-void':return None
                elif line.startswith(('return-object ','return ')):return regs[line.split()[1]]
                else:raise AssertionError('Unsupported onboarding instruction '+line)
            except Exception as error:
                target=next((handler for first,last,handler in catches(self.root,cls,sig) if first<=pc-1<last),None)
                if target is None:raise
                caught=error;pc=target
        raise AssertionError('Onboarding must terminate')
    def flush(self):
        while self.dismiss:
            vm,action=self.dismiss.pop(0)
            assert action.get('__type')=='L'+DISMISS+';' and zero(action.get('successAction')) and zero(action.get('failureAction')) and action.get('trackingEvents')==[]
            self.navigate(vm,action)

    def navigate(self,vm,action):
        callback={'results':[]};self.run(NAV,NAV_SIG,[{'viewModel':vm},action,None,None,callback]);assert callback['results']==[True],'Original native callback completes once'


def ids(vm):return [v['id'] if isinstance(v,dict) else v for v in vm['remainingScreenLoadingTypes']]

def fixture(ids=(PUSH,LOGIN,TOPIC),current=None):
    vm={'remainingScreenLoadingTypes':[{'__type':'L'+BYID+';','id':v} for v in ids],'stateHandle':{'PARAM_RECREATE_INTENT':object()},'_closeModalLiveData':{},'screenInteractor':{}}
    presenter={'__type':'L'+PRES+';','viewState':{'currentScreenId':current or (ids[0] if ids else None)}}
    return vm,presenter

def coroutine(vm,presenter,id_):
    ack={PUSH:'breakingNews',LOGIN:'promoteLogin',TOPIC:'followTopics'}.get(id_)
    action={'__type':'L'+DISMISS+';','successAction':None,'failureAction':None,'trackingEvents':[]}
    data={'screen':{'id':id_,'blocks':[{'__type':'L'+DEFAULT+';','clickAction':action}],'trackers':{'show':[ack] if ack else []}}}
    use={'bannerInvalidationUseCase':{},'dataStore':data,'bottomBarUseCase':{},'processTrackingEventsUseCase':{}}
    return {'__type':'L'+CORO+';','this$0':use,'$presenter':presenter,'$intentProcessor':{'model':vm},'label':0}


def fresh(root):
    m=Machine(root);vm,presenter=fixture()
    for id_ in [PUSH,LOGIN]:m.drive(coroutine(vm,presenter,id_));m.flush()
    return m,vm,presenter

def assert_optional_skipped(root):
    m,vm,_=fresh(root)
    assert ids(vm)==[TOPIC],('Fresh flow must reach interactive topics',vm['remainingScreenLoadingTypes'])
    assert m.acks==['breakingNews','promoteLogin'],'Retain actual acknowledgement processing before dismissal'


def stripped(root):
    ins=code(root,CORO,RUN);keep=[i for i,l in enumerate(ins) if '->morpheRememberWelcome(' not in l and '->morpheFinishWelcome(' not in l]
    mapping={i:sum(k<i for k in keep) for i in range(len(ins)+1)}
    return [re.sub(r'@(\d+)',lambda m:'@'+str(mapping[int(m[1])]),ins[i]).replace('L'+CORO+';->'+COUNT,'L'+SHOW+';->access$incrementShownCount(L'+SHOW+';'+CONT+')Ljava/lang/Object;') for i in keep]


def verify(root:Path,enabled:bool):
    for cls,sig,sha in PINNED:
        body=code(root,cls,sig)
        if enabled and cls==NAV and sig==NAV_SIG:
            expected='invoke-static {p0, p1}, L'+VM+';->'+NATIVE
            assert body.count(expected)==1,'One native optional-source guard, original callback kept'
            body=[l.replace(expected,'invoke-virtual {p0}, L'+VM+';->processDismissIntent()Z') for l in body]
        assert digest(body)==sha,('Retain original NU onboarding contract',cls,sig)
    ins=code(root,CORO,RUN)
    assert (' morpheRememberWelcome(' in source(root,CORO))==enabled
    assert digest(stripped(root) if enabled else ins)==ORIGINAL_SHA,'Every original coroutine instruction/branch target retained'
    if not enabled:
        m,vm,_=fresh(root);assert ids(vm)==[PUSH,LOGIN,TOPIC] and m.acks==['breakingNews','promoteLogin'];return
    assert_optional_skipped(root)
    # Every original await independently suspends; completion policy cannot run
    # until actual processTrackers AND shown-count completion, on both code paths.
    phases=['banner','screen','present','bottom','local','ack','shown']
    for suspended in [[],*[[x] for x in phases],phases]:
        m=Machine(root,suspended);vm,p=fixture();c=coroutine(vm,p,PUSH);m.drive(c)
        assert m.trace==phases+['dismiss'],('Preserve successful await order',suspended,m.trace)
        m.flush();assert ids(vm)==[LOGIN,TOPIC] and vm['stateHandle']['KEY_REMAINING_SCREENS'] is vm['remainingScreenLoadingTypes']
    # Both optional screens may be the last remaining card; original next intent
    # closes normally, with no invented replacement or infinite onboarding loop.
    for sequence in [(LOGIN,TOPIC),(TOPIC,),('unknown',TOPIC),(PUSH,),(LOGIN,)]:
        m=Machine(root);vm,p=fixture(sequence);c=coroutine(vm,p,sequence[0]);m.drive(c);m.flush()
        if sequence[0] in {PUSH,LOGIN}:
            if len(sequence)>1:assert ids(vm)==list(sequence[1:])
            else:assert m.closed==[vm['stateHandle']['PARAM_RECREATE_INTENT']]
        else:assert ids(vm)==list(sequence) and not m.closed and 'dismiss' not in m.trace
    # Duplicate show completions can queue, but actual native consumption claims
    # the current source once and completes every original callback.
    m=Machine(root);vm,p=fixture()
    for _ in range(2):m.drive(coroutine(vm,p,PUSH))
    assert len(m.dismiss)==2;m.flush();assert ids(vm)==[LOGIN,TOPIC] and not m.closed
    # Stale completion captured before suspension cannot dismiss a newer topic.
    m=Machine(root,['shown']);vm,p=fixture();c=coroutine(vm,p,PUSH)
    assert m.run(CORO,RUN,[c,UNIT]) is SUSP and not m.dismiss
    p['viewState']['currentScreenId']=TOPIC
    result,name,effect=m.pending;effect();m.trace.append(name)
    assert m.run(CORO,RUN,[c,result])==UNIT and not m.dismiss
    # Failure resuming the final await propagates before any automatic action.
    m=Machine(root,['shown']);vm,p=fixture();c=coroutine(vm,p,LOGIN)
    assert m.run(CORO,RUN,[c,UNIT]) is SUSP
    try:m.run(CORO,RUN,[c,RuntimeError('synthetic shown failure')])
    except RuntimeError:pass
    else:raise AssertionError('Original failure must propagate')
    assert not m.dismiss
    # Topics remain interactive: only a genuine explicit original dismiss closes.
    m=Machine(root);vm,p=fixture((TOPIC,));c=coroutine(vm,p,TOPIC);m.drive(c);assert not m.closed and not m.dismiss
    manual=c['this$0']['dataStore']['screen']['blocks'][0]['clickAction']
    assert not manual.get('morpheWelcomeSourceId'),'Topic action remains untagged'
    m.navigate(vm,manual);assert len(m.closed)==1 and m.closed[0] is vm['stateHandle']['PARAM_RECREATE_INTENT']
    claim_body=code(root,VM,NATIVE)
    assert claim_body[0]=='monitor-enter p0' and claim_body.count('monitor-exit p0')==2 and '.catchall ' in source(root,VM),'Explicit DEX monitor with release and catchall'
    assert not m.monitors,'Release monitor on every normal claim path'
    # Incoming resume switch must hit the helper, not bypass its policy.
    switch=switches(root,CORO,RUN);resume=next(iter(switch.values()))[7]
    assert '->'+FINISH in ins[resume] and '{p0, p1, v0}' in ins[resume],'Resume target enters completion prelude'
    # The actual optional button action is tagged before presentation, covering
    # BOTH delayed-auto/manual orders; presenter can still show stale LOGIN while
    # the native remaining-list head has already moved to TOPIC.
    for auto_first in [False,True]:
        m=Machine(root);vm,p=fixture((LOGIN,TOPIC));c=coroutine(vm,p,LOGIN);m.drive(c)
        manual=c['this$0']['dataStore']['screen']['blocks'][0]['clickAction']
        assert manual.get('morpheWelcomeSourceId')==LOGIN,'Tag genuine optional button before display'
        if auto_first:m.flush();m.navigate(vm,manual)
        else:m.navigate(vm,manual);m.flush()
        assert ids(vm)==[TOPIC] and not m.closed and not m.monitors,'Pending optional actions cannot dismiss interactive topics'
    # Same duplicate-last case must not launch the original next Activity twice.
    m=Machine(root);vm,p=fixture((LOGIN,));c=coroutine(vm,p,LOGIN);m.drive(c);manual=c['this$0']['dataStore']['screen']['blocks'][0]['clickAction']
    m.navigate(vm,manual);m.flush();assert len(m.closed)==1
    # A tagged stale event remains handled for an empty or unrecognized restored
    # queue; no cast/first() crash and no next-Activity launch.
    for queue in [[],[{'__type':'unknown','id':LOGIN}]]:
        vm,p=fixture();vm['remainingScreenLoadingTypes']=queue;m=Machine(root)
        action={'__type':'L'+DISMISS+';','morpheWelcomeSourceId':LOGIN,'successAction':None,'failureAction':None,'trackingEvents':[]}
        m.navigate(vm,action);assert not m.closed and not m.loaded and not m.monitors
    class BrokenQueue(list):
        def __getitem__(self,index):raise RuntimeError('synthetic queue access failure')
    m=Machine(root);vm,p=fixture();vm['remainingScreenLoadingTypes']=BrokenQueue(vm['remainingScreenLoadingTypes'])
    action={'__type':'L'+DISMISS+';','morpheWelcomeSourceId':PUSH,'successAction':None,'failureAction':None,'trackingEvents':[]}
    try:m.navigate(vm,action)
    except RuntimeError:pass
    else:raise AssertionError('Original queue failure must propagate')
    assert not m.monitors,'Actual emitted catchall releases VM monitor before rethrow'
    verify_kinds(root)
    from nunl_onboarding_source import verify as verify_original_metadata
    verify_original_metadata()


def verify_kinds(root):
    from verify_nunl import invocation_error
    from verify_trouw import sdk_classes
    sdk,archive=sdk_classes()
    try:
        for cls in [CORO,PRES,VM]:
            for sig,body in re.findall(r'^\.method[^\n]* (\S+)\n(.*?)^\.end method',source(root,cls),re.M|re.S):
                if not sig.startswith('morphe'):continue
                for line in body.splitlines():
                    call=re.match(r'\s*(invoke-[a-z]+(?:/range)?) \{[^}]*\}, (L[^;]+;->\S+)',line)
                    if not call:continue
                    opcode,reference=call.groups();assert invocation_error(root,opcode,reference) is None,(cls,sig,line)
                    owner,target=reference.split(';->');owner=owner[1:];kind=opcode.removeprefix('invoke-').removesuffix('/range')
                    paths=list(root.glob('smali*/'+owner+'.smali'))
                    if paths:
                        text=source(root,owner);header=text.splitlines()[0]
                        assert 'public' in header.split() or cls.rsplit('/',1)[0]==owner.rsplit('/',1)[0],('Class visibility',cls,owner)
                        methods=re.findall(r'^\.method ([^\n]*?) '+re.escape(target)+'$',text,re.M)
                        declaring=owner
                        while not methods:
                            parent=re.search(r'^\.super L([^;]+);',text,re.M)
                            assert parent,(owner,target)
                            declaring=parent[1];text=source(root,declaring)
                            methods=re.findall(r'^\.method ([^\n]*?) '+re.escape(target)+'$',text,re.M)
                        assert len(methods)==1,(owner,target)
                        flags=methods[0].split();assert (kind=='static')==('static' in flags),(owner,target,kind)
                        assert 'private' not in flags or declaring==cls,('Private method visibility',cls,owner,target)
                        assert kind!='direct' or target.startswith('<init>(') or 'private' in flags
                    else:
                        contract=sdk('L'+owner+';');assert contract,owner
                        while target not in contract[2] and contract[1]:contract=sdk(contract[1]);assert contract
                        assert target in contract[2] and (kind=='static')==bool(contract[2][target]&8),(owner,target,kind)
                        # New platform calls are the established Java1 collection/
                        # String methods, available before NU's Android32 floor.
                        assert (owner,target) in {('java/lang/String','equals(Ljava/lang/Object;)Z'),('java/util/Collections','emptyList()Ljava/util/List;'),('java/util/List','iterator()Ljava/util/Iterator;'),('java/util/List','isEmpty()Z'),('java/util/List','get(I)Ljava/lang/Object;'),('java/util/Iterator','hasNext()Z'),('java/util/Iterator','next()Ljava/lang/Object;')},('New API needs minimum-SDK audit',owner,target)
                for op,owner,field in re.findall(r'\b(iget-object|iput-object)\s+[^\n]*?, (L[^;]+;)->(\S+)',body):
                    text=source(root,owner[1:-1]);matches=re.findall(r'^\.field ([^\n]*?) '+re.escape(field)+r'(?: = [^\n]*)?$',text,re.M)
                    assert len(matches)==1,(owner,field)
                    assert 'private' not in matches[0].split() or owner=='L'+cls+';',('Private field visibility',cls,owner,field)
    finally:archive.close()
