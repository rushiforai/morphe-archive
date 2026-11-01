"""Exact 16.19 publisher contracts and selected effects, separate from 16.17.

Store declaration/graph hashes only. Evaluate original and restored output graphs
against the genuine originals; do not infer compatibility from version strings.
"""
import hashlib
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET
import zipfile

from brabant_smali import canonical
from brabant_effects import restore_edits, restore_alignment
from dex_declarations import DexDeclarations
from verify_dumpert import Smali, xml_digest, absolute_registers, audit_call
from verify_parool import sdk_classes
from rtl_vm import Memory, Reference, VmThrown, execute, is_zero
from marktplaats_vm import Fixture as ModelFixture

DATA=json.loads(Path(__file__).with_name('marktplaats_1619_contracts.json').read_text())
CONTRACTS=DATA['contracts']
HELPERS={
    'ads': {
        'Lcom/horizon/android/core/advertising/nativead/a;->morpheNoAd()Lrid;',
        'Lcom/horizon/android/feature/search/search/model/FlexibleSearchResponse;->morpheAdSlots(Ljava/util/List;)Ljava/util/List;',
        'Lcom/horizon/android/feature/search/search/api/LrpItemsRequest;->morpheAdTypes(Ljava/util/List;)Ljava/util/List;',
        'Lcom/horizon/android/feature/vip/contentorder/VipContentOrder;->morpheAdSections(Ljava/util/List;)Ljava/util/List;',
    },
    'tracking': {'Lj11;->morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;'},
    'auth': {
        'Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;->'+signature for signature in [
            'morpheGoogleBundle(Landroid/os/Bundle;Z)Landroid/os/Bundle;',
            'morpheGoogleLegacyResult(Landroid/content/Intent;)Z',
            'morpheGoogleOption(Landroidx/credentials/playservices/CredentialProviderPlayServicesImpl;Lwz3;)Lwz3;',
            'morpheGoogleProvider(Li04;Ljava/lang/Object;)Lzz3;',
            'morpheGoogleRequest(Ljava/lang/Object;)Z',
            'morpheMicrogAvailable(Landroid/content/Context;)Z',
        ]
    },
}
METHODS=DATA['methods']
TYPES=DATA['types']
A='{http://schemas.android.com/apk/res/android}'
ROOT='Lcom/horizon/android/'


def translate(text):
    text=re.sub(r'L[^;\s]+;->[^\s,}]+',lambda m:METHODS.get(m[0],m[0]),text)
    return re.sub(r'L[^;\s]+;',lambda m:TYPES.get(m[0],m[0]),text)


def profile(root):
    text=(root/'apktool.yml').read_text()
    def field(name):
        values=re.findall(r'^  '+name+r": ['\"]?([^'\"\s]+)['\"]?\s*$",text,re.M)
        assert len(values)==1,'Marktplaats missing/ambiguous '+name
        return values[0]
    assert field('versionName')=='16.19.0' and field('versionCode')=='633464','Marktplaats build changed'
    assert field('targetSdkVersion')=='37','Marktplaats target SDK changed'
    minimum=field('minSdkVersion')
    assert minimum in DATA['profiles'],'Marktplaats unsupported minimum SDK'
    return DATA['profiles'][minimum]


def selected_edits(selected):
    import verify_marktplaats as legacy
    hidden=bool(selected&legacy.AD_NAMES)
    tracking='Disable tracking' in selected or legacy.CONSENT in selected
    edits=(legacy.EDITS if hidden else [])+(legacy.TRACKING_EDITS if tracking else [])
    edits+=(legacy.SECURITY_EDITS if legacy.EXPERT in selected else [])
    edits+=(legacy.CONSENT_EDITS if legacy.CONSENT in selected else [])
    edits+=(legacy.AUTH_EDITS if legacy.AUTH in selected else [])
    result=[]
    omitted={'Lecc;',ROOT+'feature/vip/feature/advertising/b;',
             ROOT+'feature/vip/feature/advertising/VipComposableBannerViewModel$loadBanner$1;'}
    for original in edits:
        key=original['owner']+'->'+original['signature']
        if original['owner'] in omitted:
            continue
        assert key in METHODS,'Unmapped Marktplaats 16.19 edit: '+key
        owner,signature=METHODS[key].split('->',1)
        edit={**original,'owner':owner,'signature':signature,
              'original':[translate(s) for s in original['original']],
              'replacement':[translate(s) for s in original['replacement']]}
        if original['owner']==ROOT+'core/advertising/targeting/AdTargetingRepository$requestDisplayTargetingForAd$1;':
            edit.update(index=20,replacement=['invoke-static {}, '+ROOT+'core/advertising/nativead/a;->morpheNoAd()Lrid;',
                                             'move-result-object v0','goto/16 @65'])
        elif original['owner']==ROOT+'core/advertising/targeting/AdTargetingRepository$requestDisplayTargetingForListing$2;':
            edit.update(index=20,replacement=['invoke-static {}, '+ROOT+'core/advertising/nativead/a;->morpheNoAd()Lrid;',
                                             'move-result-object v0','goto/16 @71'])
        elif original['owner']=='Lwg;':
            edit.update(index=150,replacement=['goto/16 @187'])
        elif original['owner']=='Llc3;':
            edit['index']=160
        elif original['owner']=='Lnw0;':
            edit['replacement']=[s.replace('const-wide/16 v13,','const-wide/16 v14,') for s in edit['replacement']]
        result.append(edit)
    return result


def verify_manifest(root,selected,variant):
    import verify_marktplaats as legacy
    manifest=ET.parse(root/'AndroidManifest.xml').getroot()
    app=manifest.find('application')
    assert manifest.get('package')=='nl.marktplaats.android' and app.get(A+'name')==legacy.APPLICATION
    if legacy.AUTH in selected:
        for name,value in {legacy.MICROG+'.SPOOFED_PACKAGE_NAME':'nl.marktplaats.android',
                           legacy.MICROG+'.SPOOFED_PACKAGE_SIGNATURE':'e650094b1bcb91997173c1261fd0136ab7592984',
                           'app.revanced.MICROG_PACKAGE_NAME':legacy.MICROG}.items():
            nodes=[n for n in app if n.tag=='meta-data' and n.get(A+'name')==name]
            assert len(nodes)==1 and nodes[0].attrib=={A+'name':name,A+'value':value}
            app.remove(nodes[0])
        queries=manifest.findall('queries');assert len(queries)==1
        nodes=[n for n in queries[0] if n.tag=='package' and n.get(A+'name')==legacy.MICROG]
        assert len(nodes)==1 and nodes[0].attrib=={A+'name':legacy.MICROG}
        queries[0].remove(nodes[0])
    if selected&legacy.AD_NAMES:
        provider=[n for n in app if n.tag=='provider' and n.get(A+'name')==legacy.AD_PROVIDER[A+'name']]
        # The NextGen publisher original has no legacy MobileAds provider.
        assert not provider,'Marktplaats 16.19 unexpected legacy ad initializer'
    if 'Disable tracking' in selected or legacy.CONSENT in selected:
        for name,wanted in legacy.TRACKING_FLAGS.items():
            nodes=[n for n in app if n.tag=='meta-data' and n.get(A+'name')==name]
            assert len(nodes)==1 and nodes[0].attrib=={A+'name':name,A+'value':wanted}
            app.remove(nodes[0])
        for tag,names in [('provider',legacy.TRACKING_PROVIDERS),('receiver',legacy.TRACKING_RECEIVERS)]:
            for name in names:
                nodes=[n for n in app if n.tag==tag and n.get(A+'name')==name]
                assert len(nodes)==1 and nodes[0].get(A+'enabled')=='false'
                del nodes[0].attrib[A+'enabled']
        for index,attrs in variant['tracking_permissions']:
            assert not any(n.tag=='uses-permission' and n.get(A+'name')==attrs[A+'name'] for n in manifest)
            manifest.insert(index,ET.Element('uses-permission',attrs))
    if selected:
        fused=variant.get('fused_modules',[])
        if fused:
            nodes=[n for n in app if n.tag=='meta-data' and n.get(A+'name')=='com.android.dynamic.apk.fused.modules']
            assert len(nodes)==1 and nodes[0].attrib=={A+'name':'com.android.dynamic.apk.fused.modules',A+'value':','.join(fused)},'Marktplaats bundled Notifications registration missing or changed'
            app.remove(nodes[0])
        for key,value in variant['packaging']['attributes'].items():
            assert key not in manifest.attrib
            manifest.set(key,value)
        for index,attrs in variant['packaging']['metadata']:
            assert not any(n.tag=='meta-data' and n.get(A+'name')==attrs[A+'name'] for n in app)
            app.insert(index,ET.Element('meta-data',attrs))
    assert xml_digest(manifest)==variant['manifest_digest'],'Marktplaats 16.19 original manifest changed'


class Fixture:
    """Execute emitted instructions; object/platform services remain explicit boundaries."""
    def __init__(self,source,declarations,sdk):
        self.source,self.declarations,self.sdk=source,declarations,sdk
        self.rows={(r[0],r[1]):r for r in CONTRACTS}
        self.memory=Memory(self.parents);self.events=[]
        self.unit=Reference({},'Lkotlin/Unit;')
        self.memory.statics['Lkotlin/Unit;->a:Lkotlin/Unit;']=self.unit
        for name,value in [('TRUE',True),('FALSE',False)]:
            self.memory.statics['Ljava/lang/Boolean;->'+name+':Ljava/lang/Boolean;']=Reference(value,'Ljava/lang/Boolean;')

    def parents(self,owner):
        if owner in self.declarations.classes:
            cls=self.declarations.classes[owner]
            return tuple(v for v in (cls.superclass,*cls.interfaces) if v)
        cls=self.sdk(owner)
        assert cls,'Missing platform type: '+owner
        return tuple(v for v in (cls[1],*self.sdk.interfaces(owner)) if v)

    def new(self,owner,fields=None):
        value=Reference({},owner)
        current=owner
        while current in self.declarations.classes:
            for line in self.source.text(current).splitlines():
                if not line.startswith('.field ') or 'static' in line.split():continue
                match=re.search(r' ([^ ]+):([^ ]+)(?: |$)',line);assert match
                value.value.setdefault(current+'->'+match[1]+':'+match[2],0)
            current=self.declarations.classes[current].superclass
        value.value.update(fields or {})
        return value

    def invoke(self,target,values):
        if '->morphe' in target:
            own,sig=target.split('->',1)
            return self.run(own,sig,args=values)[0]
        if target=='Ljava/lang/Object;-><init>()V':return None
        if target=='Ljava/lang/Object;->getClass()Ljava/lang/Class;':
            if is_zero(values[0]):raise VmThrown(self.new('Ljava/lang/NullPointerException;'))
            return self.new('Ljava/lang/Class;')
        if target=='Lkotlin/ResultKt;->b(Ljava/lang/Object;)V':
            if isinstance(values[0],VmThrown):raise values[0]
            return None
        if target in {'Lhgh;->d(Ljava/lang/String;)V','Lkotlin/jvm/internal/Intrinsics;->i(Ljava/lang/String;)V'}:
            kind='Ljava/lang/IllegalStateException;' if target.startswith('Lhgh;') else 'Lkotlin/UninitializedPropertyAccessException;'
            raise VmThrown(self.new(kind))
        if target=='Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;':
            self.events.append(('callback',values[0]));return self.unit
        if target=='Landroid/view/View;->onAttachedToWindow()V':
            self.events.append(('super-attach',values[0]));return None
        raise AssertionError('Unexpected effect boundary: '+target)

    def run(self,owner,signature,start=0,stop_at=(),registers=None,args=()):
        method=self.declarations.classes[owner].methods[signature]
        body=self.source.body(owner,signature)
        local=int(re.search(r'\.locals (\d+)',body)[1]);program=canonical(body).program
        program.instructions=[absolute_registers(s,local) for s in program.instructions]
        frame={'v'+str(local+i):v for i,v in enumerate(args)};frame.update(registers or {})
        def trace(line):
            if line.startswith('invoke-'):audit_call(line,owner,self.declarations,self.sdk)
        def invoke(target,values):
            return self.invoke(target,values)
        result=execute(program,frame,invoke,start=start,stop_at=stop_at,memory=self.memory,trace=trace)
        return result,frame


def verify_prefix_effects(f,edits):
    """Prove terminal policies finish before any original SDK/request operation."""
    checked=0
    for edit in edits:
        code=edit['replacement']
        if not code or code[-1] not in ['return-void','return v0','return-object v0','return p0','return-object p0']:
            continue
        # Nontrivial auth/consent decisions and changed state mappers are audited
        # separately; this loop covers unconditional terminal entry policies.
        if any(s.split(' ',1)[0].startswith(('if-','goto')) for s in code):continue
        if any(s.startswith('new-instance') for s in code):continue
        if any(s.startswith('invoke-') and 'Function0;->invoke()' not in s and 'onAttachedToWindow()' not in s
               for s in code):continue
        owner,sig=edit['owner'],edit['signature'];row=f.rows[owner,sig];local=row[3]
        # Frame values are inert identities. Any unintended SDK/platform call is
        # rejected by the explicit boundary above.
        registers={'v'+str(i):f.new('Ljava/lang/Object;') for i in range(local+24)}
        receiver=f.new(owner);registers['v'+str(local)]=receiver
        f.events.clear()
        result,_=f.run(owner,sig,start=edit['index'],registers=registers)
        if code[-1]=='return-void':assert result is None
        elif any('Lkotlin/Unit;->a:' in s for s in code):assert result is f.unit
        elif any(s.startswith('const/4 v0, 0x0') for s in code):assert result==0
        elif any(s.startswith('const/4 v0, 0x1') for s in code):assert result==1
        elif code[-1]=='return p0':assert result==1
        if any('Function0;->invoke()' in s for s in code):assert len(f.events)==1 and f.events[0][0]=='callback'
        else:assert not f.events
        checked+=1
    return checked


class ConsentFixture(Fixture):
    CLIENT='Ltm3;'
    CONTROLLER='Lum3;'
    LIB='Lcom/sourcepoint/cmplibrary/SpConsentLib;'
    CAMPAIGN='Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;'

    def __init__(self,*args):
        super().__init__(*args)
        self.memory.statics[self.CAMPAIGN+'->GDPR:'+self.CAMPAIGN]=self.new(self.CAMPAIGN)
        self.memory.statics['Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;']=Reference(True,'Ljava/lang/Boolean;')

    def invoke(self,target,values):
        if target==self.CLIENT+'->onUIFinished(Landroid/view/View;)V':
            return self.run(self.CLIENT,'onUIFinished(Landroid/view/View;)V',args=values)[0]
        if target in {self.LIB+'->rejectAll('+self.CAMPAIGN+')V',
                      self.LIB+'->removeView(Landroid/view/View;)V'}:
            self.events.append((target.split('->')[1].split('(')[0],values[1]));return None
        if target=='Liff;->k(Ljava/lang/Object;)V':
            assert values[1] is self.memory.statics['Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;']
            self.events.append(('uiClosed',));return None
        return super().invoke(target,values)

    def client(self,manual=False,missing_sdk=False):
        controller=self.new(self.CONTROLLER,{
            self.CONTROLLER+'->h:'+self.LIB:0 if missing_sdk else self.new('Lcom/sourcepoint/cmplibrary/SpConsentLibMobileCore;'),
            self.CONTROLLER+'->i:Liff;':self.new('Liff;')})
        return self.new(self.CLIENT,{self.CLIENT+'->d:'+self.CONTROLLER:controller,
                                     self.CLIENT+'->b:Z':int(manual)}),self.new('Landroid/view/View;')


def verify_consent_effects(f,disabled):
    owner=f.CLIENT;sig='onUIReady(Landroid/view/View;)V'
    added=13 if disabled else 0
    # The retained native arm begins after the injected decision gate. Stop
    # before original display work for manual/missing-SDK positive controls.
    for manual,missing in [(False,False),(True,False),(False,True)]:
        client,view=f.client(manual,missing);f.events.clear()
        marker=1+added
        result,_=f.run(owner,sig,args=(client,view),stop_at=(marker,))
        if disabled and not manual and not missing:
            assert [e[0] for e in f.events]==['rejectAll','removeView','uiClosed']
            assert client.value[owner+'->a:Z']==0
            assert f.events[0][1] is f.memory.statics[f.CAMPAIGN+'->GDPR:'+f.CAMPAIGN]
            f.events.clear();f.run(owner,sig,args=(client,view),stop_at=(marker,))
            assert not f.events,'Marktplaats repeated startup rejection/closure'
        else:assert result==marker and not f.events,'Marktplaats manual/native consent path was intercepted'
        try:f.run(owner,sig,args=(client,0),stop_at=(marker,))
        except VmThrown as error:assert error.value.descriptor=='Ljava/lang/NullPointerException;'
        else:raise AssertionError('Marktplaats consent input validation skipped')


class AdFixture(Fixture):
    TARGET=ROOT+'core/advertising/targeting/a;'
    STATUS=ROOT+'core/datamodel/resource/ResourceStatus;'

    def __init__(self,*args):
        super().__init__(*args)
        self.suspended=self.new('Lkotlin/coroutines/intrinsics/CoroutineSingletons;')
        self.memory.statics['Lkotlin/coroutines/intrinsics/CoroutineSingletons;->COROUTINE_SUSPENDED:Lkotlin/coroutines/intrinsics/CoroutineSingletons;']=self.suspended
        for name in ['ERROR','SUCCESS']:
            self.memory.statics[self.STATUS+'->'+name+':'+self.STATUS]=self.new(self.STATUS)
        self.wait=False

    def invoke(self,target,values):
        owner,sig=target.split('->',1)
        if (owner in {'Lrid;','Lilg;'} and sig.startswith('<init>(')) or owner==self.TARGET:
            assert (owner,sig) in self.rows,'Unpinned Marktplaats ad completion method'
            return self.run(owner,sig,args=values)[0]
        if target=='Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;':
            return values[0].value.pop(values[1],0)
        if target in {'Lkotlinx/coroutines/flow/o0;->emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
                      'Ln86;->emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;'}:
            self.events.append(('emit',values[1]));return self.suspended if self.wait else self.unit
        return super().invoke(target,values)


def verify_ad_effects(f,hidden):
    home=ROOT+'feature/feeds/homepage/ui/e;';sig='c(La87;)V'
    blocked={'Lt77;','Lp77;','Ll77;','Lv77;'}
    # Enumerate genuine current action types, including unchanged functional
    # actions, rather than inventing an assumed class hierarchy.
    actions={name for name,cls in f.declarations.classes.items() if cls.superclass=='La87;' or 'La87;' in cls.interfaces}
    assert blocked<=actions and len(actions)>len(blocked)
    for action in actions:
        marker=11 if hidden else 0
        result,_=f.run(home,sig,args=(f.new(home),f.new(action)),stop_at=(marker,))
        assert result==(None if hidden and action in blocked else marker),'Marktplaats changed functional/ad action routing'
    qqi='Lqqi;';load='a(Landroid/content/Context;Landroid/view/ViewGroup;'+ROOT+'core/datamodel/TargetingConfiguration;[Ld91;Ljava/lang/String;'+('Lkotlin/jvm/functions/Function0;'*3)+')V'
    callbacks=[f.new('Lkotlin/jvm/functions/Function0;') for _ in range(3)]
    f.events.clear()
    args=(f.new(qqi),f.new('Landroid/content/Context;'),f.new('Landroid/view/ViewGroup;'),
          f.new(ROOT+'core/datamodel/TargetingConfiguration;'),Reference([],'[Ld91;'),'fixture-unit',*callbacks)
    result,_=f.run(qqi,load,args=args,stop_at=(2 if hidden else 0,))
    if hidden:assert result is None and f.events==[('callback',callbacks[2])]
    else:assert result==0 and not f.events
    for name,key in [('AdTargetingRepository$requestDisplayTargetingForAd$1;','fixture-urn'),
                     ('AdTargetingRepository$requestDisplayTargetingForListing$2;',0),
                     ('NativeAdRepo$getSponsoredAd$1;',None)]:
        sponsored=name.startswith('NativeAdRepo')
        owner=ROOT+('core/advertising/nativead/' if sponsored else 'core/advertising/targeting/')+name
        for wait in [False,True]:
            jobs=Reference({'fixture-urn':f.new('Ljava/lang/Object;')},'Ljava/util/HashMap;')
            target=f.new(f.TARGET,{f.TARGET+'->f:Ljava/util/HashMap;':jobs,
                                  f.TARGET+'->d:Lkotlinx/coroutines/flow/o0;':f.new('Lkotlinx/coroutines/flow/o0;')})
            fields={owner+'->L$0:Ljava/lang/Object;':f.new('Ln86;')} if sponsored else {
                owner+'->this$0:'+f.TARGET:target,owner+'->$adUrn:Ljava/lang/String;':'fixture-urn'}
            work=f.new(owner,fields);f.events.clear();f.wait=wait
            result,_=f.run(owner,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',args=(work,f.unit),stop_at=() if hidden else (20,))
            if not hidden:assert result==20 and not f.events;continue
            assert result is (f.suspended if wait else f.unit)
            assert len(f.events)==1 and f.events[0][0]=='emit'
            value=f.events[0][1]
            if sponsored:
                assert value.descriptor=='Lrid;' and value.value['Lrid;->a:'+f.STATUS] is f.memory.statics[f.STATUS+'->ERROR:'+f.STATUS]
                assert value.value['Lrid;->b:Ljava/lang/Object;']==0
            else:
                assert value.descriptor=='Lilg;' and value.value['Lilg;->a:Ljava/lang/String;']==key
                if key:assert not jobs.value,'Marktplaats completed request retained its job'
            if wait:
                result,_=f.run(owner,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',args=(work,f.unit))
                assert result is f.unit and len(f.events)==1,'Marktplaats resumed completion emitted twice'
            broken=f.new(owner,{owner+'->label:I':99})
            try:f.run(owner,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',args=(broken,f.unit))
            except VmThrown as error:assert error.value.descriptor=='Ljava/lang/IllegalStateException;'
            else:raise AssertionError('Marktplaats lost invalid continuation failure')



class SlotsFixture(ModelFixture):
    """Execute current model/enum constructors, copy/getters and policy helpers."""
    def invoke(self,target,args):
        if target=='Lw83;->j([Ljava/lang/Object;)Ljava/util/List;':
            return self.run('Lw83;','j([Ljava/lang/Object;)Ljava/util/List;',args)[0]
        return super().invoke(target,args)



def verify_measurement_filter(f,enabled):
    owner='Lj11;';signature='morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;'
    assert (signature in f.declarations.classes[owner].methods)==enabled
    if not enabled:return
    method=f.declarations.classes[owner].methods[signature]
    local=int(re.search(r'\.locals (\d+)',f.source.body(owner,signature))[1])
    assert method.access_flags==9 and local==5
    f.rows[owner,signature]=(owner,signature,9,local,0,'');f.native.add((owner,signature))
    rejected=['FIREBASE_CRASHLYTICS_REPORT','FIREBASE_APPQUALITY_SESSION','FCM_CLIENT_EVENT_LOGGING',
              'GDT_CLIENT_METRICS','FIREPERF','FIREPERF_AUTOPUSH','FIREPERF_INTERNAL_LOW','FIREPERF_INTERNAL_HIGH']
    for names in [[],rejected,['FUNCTIONAL_EVENT'],[None,'OTHER_EVENT','fireperf','FIREPERF '],
                  ['FUNCTIONAL_EVENT',*rejected,'FUNCTIONAL_EVENT']]:
        items=[f.new('Lr01;',{'Lr01;->a:Ljava/lang/String;':name}) for name in names]
        original=Reference(list(items),'Ljava/util/ArrayList;')
        result,_=f.run(owner,signature,(original,))
        expected=[item for item,name in zip(items,names) if name not in rejected]
        assert result is not original and result.value==expected
        assert all(a is b for a,b in zip(result.value,expected)),'Marktplaats measurement filter changed retained event identities'
        assert original.value==items,'Marktplaats filter mutated the persisted source batch'



def audit_fields(source,decl,body):
    """Resolve emitted field name AND descriptor through the actual DEX hierarchy."""
    for instruction in canonical(body).code:
        if not instruction.startswith(('iget','iput','sget','sput')):continue
        match=re.search(r'(L[^;]+;)->([^: ]+):([^ ]+)$',instruction)
        assert match,'Unrecognized helper field operand: '+instruction
        owner,name,descriptor=match.groups();pending=[owner];seen=set();found=False
        while pending:
            current=pending.pop()
            if current in seen:continue
            seen.add(current)
            if current not in decl.classes:
                # Framework fields remain constrained by the exact generated
                # helper policy and existing SDK method ABI checks.
                if current==owner:
                    assert current.startswith(('Landroid/','Ljava/')),'Missing helper field owner: '+current
                    found=True
                break
            text=source.text(current)
            declaration=re.search(r'^\.field ([^\n]* )'+re.escape(name+':'+descriptor)+r'(?: |$)',text,re.M)
            if declaration:
                assert ('static' in declaration[1].split())==instruction.startswith(('sget','sput')),'Helper field static/instance mismatch: '+instruction
                found=True;break
            cls=decl.classes[current]
            pending.extend(v for v in (cls.superclass,*cls.interfaces) if v)
        assert found,'Missing emitted helper field: '+owner+'->'+name+':'+descriptor



def verify(root,selected,apk,behaviour_only=None):
    import verify_marktplaats as legacy
    assert selected<=legacy.NAMES
    variant=profile(root);source=Smali(root);decl=DexDeclarations.from_apk(apk)
    if not selected:assert decl.source_sha256==variant['base_sha256'],'Marktplaats original APK digest changed'
    if selected:
        for feature in variant.get('features',{}).values():
            for expected in feature['classes']:
                assert expected['name'] in decl.classes,'Marktplaats bundled Notifications code missing'
                actual=decl.classes[expected['name']]
                assert actual.access_flags==expected['flags'] and actual.superclass==expected['superclass'] and list(actual.interfaces)==expected['interfaces'],'Marktplaats Notifications class declaration changed'
                assert {sig:m.access_flags for sig,m in actual.methods.items()}==expected['methods'],'Marktplaats Notifications methods missing or changed'
    edits=selected_edits(selected)
    expected_helpers=set()
    if selected&legacy.AD_NAMES:expected_helpers.update(HELPERS['ads'])
    if 'Disable tracking' in selected or legacy.CONSENT in selected:expected_helpers.update(HELPERS['tracking'])
    if legacy.AUTH in selected:expected_helpers.update(HELPERS['auth'])
    actual_helpers={owner+'->'+sig for owner,cls in decl.classes.items() for sig in cls.methods if sig.startswith('morphe')}
    assert actual_helpers==expected_helpers,'Marktplaats generated helper inventory changed'
    # These expected graphs are translated from the retained 16.17 output that
    # passes the complete native behavior suite, then compared instruction by
    # instruction with genuine 16.19 output. This catches valid-but-wrong moved
    # fields as well as missing declarations.
    for owner,sig,flags,local,count,digest in DATA['helpers']:
        if owner+'->'+sig not in expected_helpers:continue
        method=decl.classes[owner].methods[sig];body=source.body(owner,sig);value=canonical(body)
        assert method.access_flags==flags and int(re.search(r'\.locals (\d+)',body)[1])==local
        assert len(value.code)==count and value.digest()==digest,'Marktplaats generated helper graph changed: '+owner+'->'+sig
    for owner,sig,flags,local,count,digest in CONTRACTS:
        actual=decl.classes[owner].methods[sig];body=source.body(owner,sig);value=canonical(body)
        assert actual.access_flags==flags and int(re.search(r'\.locals (\d+)',body)[1])==local,'Marktplaats 16.19 ABI changed: '+owner+'->'+sig
        owned=[e for e in edits if (e['owner'],e['signature'])==(owner,sig)]
        if owned:value=restore_alignment(restore_edits(value,owned,local),count)
        assert len(value.code)==count and value.digest()==digest,'Marktplaats 16.19 original graph changed: '+owner+'->'+sig
    verify_manifest(root,selected,variant)
    if selected:
        with zipfile.ZipFile(apk) as archive:
            libraries={n:hashlib.sha256(archive.read(n)).hexdigest() for n in archive.namelist() if n.startswith('lib/') and n.endswith('.so')}
        assert libraries==variant['libraries'],'Marktplaats 16.19 native libraries changed'
    sdk,archive=sdk_classes()
    try:
        source.contracts=CONTRACTS
        from marktplaats_ads_vm import verify_slots
        model=SlotsFixture(source,decl,sdk)
        verify_slots(model,bool(selected&legacy.AD_NAMES))
        verify_measurement_filter(model,'Disable tracking' in selected or legacy.CONSENT in selected)
        fixture=Fixture(source,decl,sdk)
        effects=verify_prefix_effects(fixture,edits)
        verify_consent_effects(ConsentFixture(source,decl,sdk),legacy.CONSENT in selected)
        verify_ad_effects(AdFixture(source,decl,sdk),bool(selected&legacy.AD_NAMES))
        # Resolve every added helper's emitted invocation against genuine output
        # declarations and the Android SDK, including merged R8 owner changes.
        helper_count=0
        for owner,cls in decl.classes.items():
            for sig in cls.methods:
                if not sig.startswith('morphe'):continue
                helper_count+=1
                assert cls.methods[sig].access_flags==9,'Marktplaats helper access changed'
                audit_fields(source,decl,source.body(owner,sig))
                for instruction in canonical(source.body(owner,sig)).code:
                    if instruction.startswith('invoke-'):audit_call(instruction,owner,decl,sdk)
    finally:archive.close()
    print('PASS Marktplaats 16.19: '+(', '.join(sorted(selected)) or 'original')+
          f' ({len(CONTRACTS)} exact method contracts; {effects} terminal effect probes; {helper_count} helper ABIs)')
