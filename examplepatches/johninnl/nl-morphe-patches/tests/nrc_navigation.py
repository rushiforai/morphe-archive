"""Actual NRC root/menu factories and emitted retirement of newspaper navigation."""
import re
from pathlib import Path
from nrc_onboarding import code, digest, source

ACT='pinch/nrcnext/ui/frontpage/NRCFrontPageActivity'
BAR='pinch/nrcnext/compose/interop/bottomtabbar/BottomTabBarView'
ITEM='pinch/nrcnext/compose/interop/bottomtabbar/BottomMenuItem'
OPTION='Lpinch/nrcnext/ui/frontpage/NRCFrontPageNavigationOption;'
CTRL='Lcom/ncapdevi/fragnav/FragNavController;'
BUNDLE='Landroid/os/Bundle;'
KEY='morphe.nrc.navigation.four-tabs.v1'
ROOTS='P0()Ljava/util/Set;'
MENU='i(L'+BAR+';)Ljava/util/List;'
NAV='navigateToTab('+OPTION+')V'
CREATE='onCreate('+BUNDLE+')V'
SAVE='onSaveInstanceState('+BUNDLE+')V'
RESULT='onActivityResult(IILandroid/content/Intent;)V'
INIT='morpheInitializeNews('+CTRL+'I'+BUNDLE+')V'
MARK='morpheMarkNavigation('+BUNDLE+')V'
DEST='morpheNewsDestination('+OPTION+')'+OPTION
FILTER_ROOTS='morpheNoNewspaperRoots(Ljava/util/Set;)Ljava/util/Set;'
FILTER_MENU='morpheNoNewspaperMenu(Ljava/util/List;)Ljava/util/List;'
ORIGINAL=['NEWS','READER','PODCASTS','PUZZLES','MORE_MENU']
VISIBLE=['NEWS','PODCASTS','PUZZLES','MORE_MENU']
IDS=['menu_news','menu_reader','menu_podcasts','menu_puzzles','menu_more']
# Independently acquired original method digests, filled before production edits.
PINNED=[('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  'Q0(Lpinch/nrcnext/ui/frontpage/NRCFrontPageActivity;)I',
  '9f5c80e0b36bf4b2f474a5cad559a122ee4b9aacb2027c9f071c3eb2a8319e8a'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity', 'R0(II)V', '5fd864123cbe4f6f526fb52f3c04fba1fe0d161ab8703e446ff057803b159713'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity', 'S0(II)Z', '183cd79a5784d18ace15e128b1f1731ed5578991f777c5862a2229336adb8f86'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  'k0(Lpinch/nrcnext/ui/frontpage/NRCFrontPageActivity;)Ljava/util/List;',
  '0df1a2d56b50cd53f1355ce6eac6392f75a9adc8a8d90f73da97ca2ce7ac817e'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  'o0()Ljava/util/List;',
  '0b01188cdb361d67301e9519d5ebaa07d58006e918f90c086fdb6b7f3c4087d6'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  'r0(Landroid/os/Bundle;)Lpinch/nrcnext/ui/frontpage/NRCFrontPageNavigationOption;',
  '8273e956f2aea4c1030521d36c1c5f44d729433a8a8036db879566a153a2c111'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  't0(Lkotlin/jvm/internal/Ref$ObjectRef;Ljava/lang/String;)Lkotlin/Unit;',
  'ea6eb7a5484070489363abacaa60207f64d016201ab546409756de55188b4969'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  'u0(Lkotlin/jvm/internal/Ref$ObjectRef;Lpinch/nrcnext/ui/frontpage/NRCFrontPageActivity;Ljava/lang/String;)Lkotlin/Unit;',
  'aa2ba1d2bfe4dfbc8731ae1d479625facadf51a851d548710aa4c6bb80246215'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  'v0(Lkotlin/jvm/internal/Ref$ObjectRef;Ljava/lang/String;)Lkotlin/Unit;',
  '9dd7e04de6daa0f51ed2e170906ed9bf138d30158d00ec761f57fc4194e59983'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  'w0()Ljava/util/Set;',
  '513fe1787fc4da1ffd8e8579b57df6dfe5ac545dcc2eb360b9940f5ace87a0db'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  'getNumberOfRootFragments()I',
  'dd81b0d7878b26ece5eda77e21882a0fef3280b05604ba36bef91cfb8743934a'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  'getRootFragment(I)Landroidx/fragment/app/Fragment;',
  '4114cd47f20fcdbd6918aac0bb17215b6889f0795ca7751acdf21415b2cb2a73'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity$onCreate$3',
  'onTabTransaction(Landroidx/fragment/app/Fragment;I)V',
  'd1dd9e8e1a0950291f9bd0a83beb675203e245f58aa970ba4ab547919840d0d1'),
 ('com/ncapdevi/fragnav/FragNavController', 'c()V', '97e8d8ef252e27e10f6c8ea703378330134e1e794db4e97daff85cf35212aa2d'),
 ('com/ncapdevi/fragnav/FragNavController',
  'l(Landroidx/fragment/app/FragmentTransaction;Landroidx/fragment/app/Fragment;)V',
  '304d5deaf5579dab9477907b6d2f3fc53dc4e8d0dda17d14bae2da2891b6ea20'),
 ('com/ncapdevi/fragnav/FragNavController', 'm(Landroid/os/Bundle;)Z', 'a7f78199a7cbb621cc5802831d4159ed9164ace89d9709e361a7942a09110ee6'),
 ('com/ncapdevi/fragnav/FragNavController',
  'initialize(ILandroid/os/Bundle;)V',
  'c12b976c29f4281c3406e6fc6131a69d5f70b827213567f121f2480990bacea1')]
CHANGED={('pinch/nrcnext/compose/interop/bottomtabbar/BottomTabBarView', 'i(Lpinch/nrcnext/compose/interop/bottomtabbar/BottomTabBarView;)Ljava/util/List;'): 'c11be1eb70ab57f8b2fbcc5582097a56b7479aadd18be1f28f8a91eedb1c5cba',
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity', 'P0()Ljava/util/Set;'): 'a6b5f80368d0b5ebf00d162ff7bc74e51bdd4e56020c4cd94fb41d90e60b9104',
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity', 'navigateToTab(Lpinch/nrcnext/ui/frontpage/NRCFrontPageNavigationOption;)V'): '8615e9084d2717c5931892599953b9e4a5f20ae2db63045196594ff2c4aa8d98',
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity', 'onCreate(Landroid/os/Bundle;)V'): '29b48957316aee8ce7c684231c00517883e2aef324bbea18818c2f840abdd69c',
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity', 'onSaveInstanceState(Landroid/os/Bundle;)V'): '4868db93c0ac91e33f9f426ba1bf1bc814b3a73cfb2543663e35053e61f9c88a'}

CHANGED[(ACT,RESULT)]='c0c284ae8ed0a309849df50a28d64aa844219f4730344518926628ce2878e9d0'

PINNED.extend([('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  'I0(Lpinch/nrcnext/ui/frontpage/NRCFrontPageActivity;Lnl/pinch/nrc/data/issuestate/NRCIssueState;)Lkotlin/Unit;',
  '0404459e6e78fdca4118208204ae86f03699765a3319159d4c059a328e7654a0'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageActivity',
  'j1(Lnl/pinch/nrc/data/issuestate/NRCIssueState;)V',
  'ea5a8f575f70737b612e55c3b9cc3a78c1e08d345a3a96d30b330816599f782f'),
 ('pinch/nrcnext/ui/frontpage/NRCFrontPageViewModel',
  'getInitialTabIndex$app_productionRelease()Lpinch/nrcnext/ui/frontpage/NRCFrontPageNavigationOption;',
  '02aaa28077ee96d3c30a12e5c3196d1ea7cfa91553d8a3bae75bf2530927406e')])

class Machine:
    """Execute real app DEX; Android/resources/collections are boundary doubles."""
    def __init__(self,root):self.root=root;self.initialized=[];self.switched=[];self.updates=[]
    def run(self,cls,sig,args):
        ins=code(self.root,cls,sig);regs={'p'+str(i):v for i,v in enumerate(args)};pc=0;result=None
        for _ in range(5000):
            line=ins[pc];pc+=1
            if line.startswith(('const/4 ','const/16 ','const ')):
                d,v=line.split(' ',1)[1].split(', ');regs[d]=int(v,16)
            elif line.startswith('const-string '):
                import json
                d,v=line.split(' ',1)[1].split(', ');regs[d]=json.loads(v)
            elif line.startswith(('sget-object ','sget ')):
                d,v=line.split(' ',1)[1].split(', ');regs[d]=v.split('->')[1].split(':')[0]
            elif line.startswith(('iget-object ','iget ')):
                d,o,f=line.split(' ',1)[1].split(', ');regs[d]=regs[o][f.split('->')[1].split(':')[0]]
            elif line.startswith('move-result'):regs[line.split()[1]]=result
            elif line.startswith(('move-object ','move ')):
                d,v=line.split(' ',1)[1].split(', ');regs[d]=regs[v]
            elif line.startswith('check-cast '):pass
            elif line.startswith('new-array '):
                d,n,_=line.split(' ',1)[1].split(', ');regs[d]=[None]*regs[n]
            elif line.startswith('aput-object '):
                v,a,i=line.split(' ',1)[1].split(', ');regs[a][regs[i]]=regs[v]
            elif line.startswith('new-instance '):
                d,t=line.split(' ',1)[1].split(', ');regs[d]={'type':t}
            elif line.startswith('invoke-'):
                names=line.split('{',1)[1].split('}',1)[0];values=[regs[n] for n in names.split(', ')] if names else []
                ref=line.split('}, ',1)[1];owner,target=ref.split('->')
                if target.startswith('morphe') or (owner=='L'+ACT+';' and target.startswith(('w0(','o0('))):result=self.run(owner[1:-1],target,values)
                elif 'Intrinsics;->checkNotNull' in ref:assert values[0] is not None
                elif owner=='L'+ITEM+';' and target.startswith('<init>'):values[0].update(zip(['id','title','icon','label'],values[1:]))
                elif owner=='L'+ITEM+';' and target=='getItemId()I':result=values[0]['id']
                elif 'View;->getResources' in ref:result='resources'
                elif 'Resources;->getString' in ref:result=values[1]
                elif 'CollectionsKt;->listOf(' in ref or 'SetsKt;->setOf(' in ref:result=values[0]
                elif owner in {'Ljava/util/ArrayList;','Ljava/util/LinkedHashSet;'} and target.startswith('<init>'):
                    values[0]['items']=list(values[1]) if len(values)>1 else []
                elif target=='iterator()Ljava/util/Iterator;':result=iter(values[0].get('items',[]) if isinstance(values[0],dict) else values[0])
                elif target=='hasNext()Z':
                    try:result=next(values[0]['iterator']);values[0]['next']=result;result=True
                    except StopIteration:result=False
                elif target=='next()Ljava/lang/Object;':result=values[0]['next']
                elif target=='remove(Ljava/lang/Object;)Z':
                    result=values[1] in values[0]['items']
                    if result:values[0]['items'].remove(values[1])
                elif target=='add(Ljava/lang/Object;)Z':values[0]['items'].append(values[1]);result=True
                elif 'Lazy;->getValue' in ref:result=values[0]['value']
                elif 'CollectionsKt;->indexOf(' in ref:result=values[0].index(values[1]) if values[1] in values[0] else -1
                elif target=='get(I)Ljava/lang/Object;':result=values[0][values[1]]
                elif target=='size()I':result=len(values[0])
                elif 'FragNavController;->switchTab$default' in ref:self.switched.append(values[1])
                elif target=='shouldNavigateToIssue(IILandroid/content/Intent;)Lkotlin/Pair;':result=values[3]['result']
                elif target=='component1()Ljava/lang/Object;':result=values[0]
                elif target=='booleanValue()Z':result=values[0]
                elif line.startswith('invoke-super '):pass
                elif target=='m1(I)V':self.updates.append(values[1])
                elif target=='h0(IZ)V':pass
                elif owner=='L'+BAR+';' and target=='setSelectedItemId(I)V':values[0]['selected']=values[1]
                elif target=='getInt(Ljava/lang/String;)I':result=values[0].get(values[1],0)
                elif target=='putInt(Ljava/lang/String;I)V':values[0][values[1]]=values[2]
                elif 'FragNavController;->initialize(' in ref:self.initialized.append((values[1],None if values[2] is None or isinstance(values[2],int) and values[2]==0 else values[2]))
                else:raise AssertionError('Unsupported navigation operation: '+line)
                if target=='iterator()Ljava/util/Iterator;':result={'iterator':result}
            elif line.startswith(('if-eqz ','if-nez ')):
                op,a,t=line.replace(',','').split()
                is_zero=regs[a] is None or isinstance(regs[a],(int,bool)) and regs[a]==0
                if is_zero==(op=='if-eqz'):pc=int(t[1:])
            elif line.startswith(('if-eq ','if-ne ')):
                op,a,b,t=line.replace(',','').split()
                if (regs[a]==regs[b])==(op=='if-eq'):pc=int(t[1:])
            elif line.startswith('goto'):pc=int(line.split()[1][1:])
            elif line=='return-void':return None
            elif line.startswith(('return-object ','return ')):
                value=regs[line.split()[1]]
                return value['items'] if isinstance(value,dict) and 'items' in value else value
            else:raise AssertionError('Unsupported navigation instruction: '+line)
        raise AssertionError('Navigation must terminate')


def assert_hidden(root):
    actual=Machine(root).run(ACT,ROOTS,[])
    assert actual==VISIBLE,('Krant must be removed from actual root factory',actual)
    menu=Machine(root).run(BAR,MENU,[{}])
    assert [row['id'] for row in menu]==[IDS[i] for i in [0,2,3,4]],'Krant must be removed from actual menu'


def verify(root:Path,enabled:bool):
    for cls,sig,sha in PINNED:assert digest(code(root,cls,sig))==sha,('Preserve original navigation consumer',cls,sig)
    roots=Machine(root).run(ACT,ROOTS,[]);menu=Machine(root).run(BAR,MENU,[{}])
    assert roots==(VISIBLE if enabled else ORIGINAL),('Ordered root model',roots)
    assert [row['id'] for row in menu]==[IDS[ORIGINAL.index(o)] for o in roots],'Menu and root indices must match'
    for cls,sig in [(ACT,ROOTS),(BAR,MENU),(ACT,NAV),(ACT,CREATE),(ACT,SAVE),(ACT,RESULT)]:
        body=code(root,cls,sig)
        if enabled:
            if sig in {ROOTS,MENU}:
                expected='morpheNoNewspaperRoots' if sig==ROOTS else 'morpheNoNewspaperMenu'
                assert expected in body[-3] and body[-2].startswith('move-result-object ')
                body=body[:-3]+body[-1:]
            elif sig==NAV:
                assert body[:2]==['invoke-static {p1}, L'+ACT+';->'+DEST,'move-result-object p1']
                # canonical labels must be re-relative after injected prefix removal
                body=code(root,cls,sig)[2:]
                body=[re.sub(r'@(\d+)',lambda m:'@'+str(int(m[1])-2),line) for line in body]
            elif sig==CREATE:
                assert sum(OPTION+'->NEWS:'+OPTION in l for l in body)==1
                body=[l.replace(OPTION+'->NEWS:'+OPTION,OPTION+'->READER:'+OPTION).replace('invoke-static {v0, v3, p1}, L'+ACT+';->'+INIT,'invoke-virtual {v0, v3, p1}, '+CTRL+'->initialize(I'+BUNDLE+')V') for l in body]
            elif sig==RESULT:
                assert sum(OPTION+'->NEWS:'+OPTION in l for l in body)==1
                body=[l.replace(OPTION+'->NEWS:'+OPTION,OPTION+'->READER:'+OPTION) for l in body]
            elif sig==SAVE:
                assert body[-2]=='invoke-static {p1}, L'+ACT+';->'+MARK
                body=body[:-2]+body[-1:]
        assert digest(body)==CHANGED[(cls,sig)],('Retain exact original navigation body/control flow',cls,sig)
    m=Machine(root);bar={};activity={'v':{'value':roots},'s':{'value':menu},'r':{},'m':{'frontPageBottomNavigation':bar}}
    assert m.run(ACT,'Q0(L'+ACT+';)I',[activity])==len(roots),'Original lazy root count follows four-tab model'
    for option in ORIGINAL:
        m.run(ACT,NAV,[activity,option]);expected='NEWS' if enabled and option=='READER' else option
        assert m.switched[-1]==roots.index(expected) and bar['selected']==IDS[ORIGINAL.index(expected)],('Programmatic/preference/intent destination',option)
    for i,option in enumerate(roots):
        item=IDS[ORIGINAL.index(option)]
        m.run(ACT,'S0(II)Z',[activity,item,i]);assert m.switched[-1]==i and m.updates[-1]==item,'Original click index/chrome contract'
    before=len(m.switched)
    m.run(ACT,RESULT,[activity,7,9,{'result':False}]);assert len(m.switched)==before,'Unrelated Activity results preserved'
    m.run(ACT,RESULT,[activity,7,9,{'result':True}]);assert m.switched[-1]==roots.index('NEWS' if enabled else 'READER'),'Old edition-result navigation cannot select retired -1 tab'
    if not enabled:
        assert ' morpheInitializeNews(' not in source(root,ACT)
        return
    assert_hidden(root)
    rows=[{'id':'menu_news','sentinel':object()}, {'id':'menu_reader'}, {'id':'menu_podcasts','sentinel':object()}, {'id':'unrelated_future_item','sentinel':object()}]
    filtered=m.run(BAR,FILTER_MENU,[rows])
    assert len(rows)==4 and len(filtered)==3 and all(a is b for a,b in zip(filtered,[rows[0],rows[2],rows[3]])),'Filter exact reader ID only; retain item identities and input collection'
    ordered=['PUZZLES','READER','NEWS','MORE_MENU','PODCASTS']
    filtered=m.run(ACT,FILTER_ROOTS,[ordered])
    assert filtered==['PUZZLES','NEWS','MORE_MENU','PODCASTS'] and len(ordered)==5,'Retain root iteration order and original collection'
    # Same helper as the emitted onCreate replacement; legacy activity state stays
    # intact while only FragNav receives a fresh-state signal, avoiding old indices.
    for bundle in [None,{}, {'controllerSelected':1,'oldStacks':[[],['reader'],[],[],[]],'other':'keep'}, {'controllerSelected':2,'oldStacks':[[],[],['podcast'],[],[]],'other':'keep'}]:
        before=None if bundle is None else dict(bundle)
        m.run(ACT,INIT,[{},0,bundle]);assert m.initialized[-1]==(0,None)
        assert bundle==before,'Do not clear or mutate Activity saved state'
    for selected in range(4):
        state={'controllerSelected':selected,'stacks':[['news'],['podcast'],['puzzle'],['more']],'other':'keep'}
        m.run(ACT,MARK,[state]);assert state[KEY]==1
        m.run(ACT,INIT,[{},0,state]);assert m.initialized[-1][1] is state,'Restore new four-tab stacks without copying or clearing'
    # The original controller fresh-state path owns removal of restored old
    # fragments; pin its actual cleanup call and original removal implementation.
    init=code(root,CTRL[1:-1],'initialize(I'+BUNDLE+')V')
    assert any('->m('+BUNDLE+')Z' in l for l in init) and any('->c()V' in l for l in init)
    cleanup=code(root,CTRL[1:-1],'c()V')
    assert any('FragmentManager;->getFragments()' in l for l in cleanup) and any('->l(Landroidx/fragment/app/FragmentTransaction;Landroidx/fragment/app/Fragment;)V' in l for l in cleanup)
    verify_kinds(root)


def verify_kinds(root):
    from verify_trouw import sdk_classes
    sdk,archive=sdk_classes()
    try:
        for cls in [ACT,BAR]:
            for sig,body in re.findall(r'^\.method[^\n]* (\S+)\n(.*?)^\.end method',source(root,cls),re.M|re.S):
                if not sig.startswith(('morpheNoNewspaper','morpheNewsDestination','morpheInitializeNews','morpheMarkNavigation')):continue
                for kind,owner,target in re.findall(r'invoke-(static|virtual|direct|interface)\s+\{[^}]*\},\s+(L[^;]+;)->(\S+)',body):
                    if owner.startswith(('Lpinch/','Lcom/ncapdevi/')):
                        text=source(root,owner[1:-1]);methods=re.findall(r'^\.method ([^\n]*?) '+re.escape(target)+'$',text,re.M)
                        assert len(methods)==1 and (kind=='static')==('static' in methods[0].split()),(owner,target,kind)
                        assert (kind=='interface')==bool(re.search(r'^\.class .*\binterface\b',text,re.M))
                    else:
                        contract=sdk(owner);assert contract,owner
                        assert (kind=='interface')==contract[0],(kind,owner)
                        while target not in contract[2] and contract[1]:contract=sdk(contract[1]);assert contract
                        assert target in contract[2] and (kind=='static')==bool(contract[2][target]&8),(owner,target)
                        assert kind!='direct' or target.startswith('<init>(')
    finally:archive.close()
