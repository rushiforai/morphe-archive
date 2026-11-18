"""Verify exact9292 original/selected graphs and native behaviour, bound to an APK."""
import argparse
from copy import deepcopy
from pathlib import Path
import re
import xml.etree.ElementTree as ET
from brabant_smali import canonical
from brabant_effects import restore_edits,restore_alignment
from dex_declarations import DexDeclarations
from verify_dumpert import Smali,xml_digest
from verify_parool import sdk_classes
from n9292_contracts import CONTRACTS,ORIGINAL_VARIANTS,MERGE_PACKAGING,TRACKING_PERMISSIONS
from n9292_vm import Fixture,CONFIG,DELEGATE,BOOL,GET,LOCATION,LOCATE,CONT
from n9292_tracking_vm import TrackingFixture,verify_app_measurement,verify_measurement_metadata,verify_crash_collection,verify_crash_settings,verify_optional_services,verify_persisted_measurement,ARBITER,SPI,SETTINGS,UPLOADER,UPLOAD
from rtl_vm import Reference,VmThrown
from n9292_startup_consent import StartupConsentFixture,verify_startup_consent,verify_commit_routing,CLIENT,CHECK,OBSERVER,OBSERVE,READY,MERGE,LOCAL,COMMIT,MATCH
from n9292_saved_consent import SavedConsentFixture,verify_saved_consent,STORE,INIT

NAMES={'Hide ads','Disable tracking','Fix PairIP startup','Skip consent screens'}
A='{http://schemas.android.com/apk/res/android}'
POLICY={'disable_ads_android':True,'disable_station_ads':True,'sovendus_android':False}
POLICY_EDIT={'owner':CONFIG,'signature':BOOL,'index':0,'original':[],
 'replacement':['const-string v0, "disable_ads_android"',
    'invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z','move-result v0','if-nez v0, @14',
    'const-string v0, "disable_station_ads"','invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z',
    'move-result v0','if-nez v0, @14','const-string v0, "sovendus_android"',
    'invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z','move-result v0',
    'if-eqz v0, @16','const/4 v0, 0x0','return v0','const/4 v0, 0x1','return v0']}
LOCATION_EDIT={'owner':LOCATION,'signature':LOCATE,'index':79,
 'original':['invoke-static {v4}, Lcom/pubmatic/sdk/common/OpenWrapSDK;->setLocation(Lcom/pubmatic/sdk/common/models/POBLocation;)V'],'replacement':[]}
STARTUP_EDIT={'owner':CLIENT,'signature':CHECK,'index':0,'original':[],'replacement':['return-void']}
CONSENT_EDITS=[
 {'owner':OBSERVER,'signature':OBSERVE,'index':38,
  'original':['iget-boolean v3, v1, '+READY+'->a:Z'],'replacement':['const/4 v3, 0x0']},
 {'owner':OBSERVER,'signature':OBSERVE,'index':45,
  'original':['iget-object v1, v1, '+READY+'->b:Ljava/util/List;'],
  'replacement':['invoke-static {}, Lvdg;->s()Lydd;','move-result-object v1',
   'sget-object v3, Lvcd;->EXPLICIT:Lvcd;',
   'iget-object v4, v0, Lnl/negentwee/ui/features/MainViewModel;->a:Luu2;',
   'iget-object v4, v4, Luu2;->i:Lzyb;',
   'invoke-virtual {v4}, Lzyb;->getValue()Ljava/lang/Object;','move-result-object v4',
   'check-cast v4, Ljava/lang/String;','new-instance v5, Ljava/util/ArrayList;',
   'invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V',
   'invoke-virtual {v1}, Lydd;->c()Ljava/util/ArrayList;','move-result-object v6',
   'invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;','move-result-object v6',
   'invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z','move-result v7','if-eqz v7, @72',
   'invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;','move-result-object v7',
   'check-cast v7, Lcom/usercentrics/sdk/UsercentricsServiceConsent;',
   'iget-object v7, v7, Lcom/usercentrics/sdk/UsercentricsServiceConsent;->a:Ljava/lang/String;',
   'invoke-static {v7, v4}, Lc56;->c(Ljava/lang/Object;Ljava/lang/Object;)Z','move-result v8',
   'new-instance v9, Lcom/usercentrics/sdk/UserDecision;',
   'invoke-direct {v9, v7, v8}, Lcom/usercentrics/sdk/UserDecision;-><init>(Ljava/lang/String;Z)V',
   'invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z','goto @59',
   'invoke-virtual {v1, v5, v3}, Lydd;->f(Ljava/util/List;Lvcd;)Ljava/util/ArrayList;','move-result-object v1',
   'invoke-static {v1, v4}, Lhb3;->'+MATCH,'move-result v3','if-nez v3, @83',
   'new-instance v3, Ljava/lang/IllegalStateException;',
   'const-string v5, "Privacy settings could not be saved. Please try again."',
   'invoke-direct {v3, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V',
   'new-instance v1, Lnl/negentwee/domain/Result$Error;',
   'invoke-direct {v1, v3}, Lnl/negentwee/domain/Result$Error;-><init>(Ljava/lang/Throwable;)V','goto/32 @89']}]
CONSENT_EDITS += [
 {'owner':'Lo83;','signature':COMMIT,'index':23,
  'original':['invoke-virtual {p0, p1, v5, p2}, Lo83;->'+MERGE],
  'replacement':['sget-object v6, Ltcd;->UPDATE_SERVICES:Ltcd;','if-ne p3, v6, @30',
   'sget-object v6, Lvcd;->EXPLICIT:Lvcd;','if-ne p4, v6, @30',
   'invoke-virtual {p0, p1, v5, p2}, Lo83;->'+LOCAL,'move-result-object p1','goto/32 @32',
   'invoke-virtual {p0, p1, v5, p2}, Lo83;->'+MERGE]},
 {'owner':'Lo83;','signature':COMMIT,'index':25,
  'original':['iget-object p2, v0, La6b;->b:Ll37;'],
  'replacement':['move-object v6, p3','iget-object p2, v0, La6b;->b:Ll37;']},
 {'owner':'Lnl/negentwee/ui/features/home/HomeViewModel;','signature':'v()V','index':6,'original':[],
  'replacement':['iget-object v5, p0, Lnl/negentwee/ui/features/home/HomeViewModel;->q:Lru2;',
   'iget-object v6, v5, Lru2;->k:Le6;','sget-object v2, Lru2;->m:[Ljl6;','const/4 v1, 0x1',
   'aget-object v2, v2, v1','invoke-virtual {v6, v5, v2}, Lb6;->o(Lav5;Ljl6;)Ljava/lang/Object;',
   'move-result-object v2','check-cast v2, Ljava/lang/Boolean;',
   'invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z','move-result v1','if-eqz v1, @18',
   'const/4 v0, 0x0','const/4 v1, 0x0']}]
CONSENT_EDITS.append({'owner':STORE,'signature':INIT,'index':22,'original':[],
 'replacement':['iget-object v0, p0, Lru2;->g:Landroid/content/SharedPreferences;',
 'invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;',
 'move-result-object v0','const-string p1, "shouldShowDeleteUserDataConfirmationPopup"',
 'invoke-interface {v0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;',
 'const-string p1, "isFunctionalConsentGiven"','const/4 p2, 0x1',
 'invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;',
 'invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V']})
TRACKING_FLAGS={'firebase_analytics_collection_deactivated':True,
 'firebase_analytics_collection_enabled':False,'google_analytics_adid_collection_enabled':False,
 'google_analytics_automatic_screen_reporting_enabled':False,'firebase_crashlytics_collection_enabled':False,
 'firebase_sessions_enabled':False,'delivery_metrics_exported_to_big_query_enabled':False}
TRACKING_EDITS=[{'owner':owner,'signature':signature,'index':index,'original':[], 'replacement':replacement}
 for owner,signature,index,replacement in [
 ('Llq;','f(Ljava/lang/String;Landroid/os/Bundle;)V',0,['return-void']),
 ('Llq;','j(Llq;Ljava/lang/String;Ljava/io/Serializable;I)V',0,['return-void']),
 ('Lyz;','<init>(Lqg9;Lru2;Llq;)V',8,['return-void']),
 (ARBITER,'isAutomaticDataCollectionEnabled()Z',0,['const/4 v0, 0x0','return v0']),
 (ARBITER,'setCrashlyticsDataCollectionEnabled(Ljava/lang/Boolean;)V',0,['sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;']),
 (SPI,SETTINGS,5,['return-object v2']),('Lbd1;','a(JLjava/lang/String;)V',0,['return-void']),
 ('Lcg;','s(Ljava/lang/String;Lez2;)Ljava/lang/Object;',0,['sget-object v0, Lc9d;->a:Lc9d;','return-object v0'])]]
TRACKING_EDITS.append({'owner':UPLOADER,'signature':UPLOAD,'index':114,
 'original':['move-object v8, v2'],'replacement':[
 'invoke-static {v14}, Lyx0;->morpheMeasurementBatch(Ljava/util/ArrayList;)Ljava/util/ArrayList;',
 'move-result-object v14','invoke-virtual {v14}, Ljava/util/ArrayList;->isEmpty()Z','move-result v8',
 'if-eqz v8, @121','const-wide/16 v12, -0x1','goto/32 @41','move-object v8, v2']})


def verify_configuration(f,hidden):
    # Independent expected Firebase boolean values exercise the actual native
    # source patterns, fetched/default fallthrough and property delegate.
    cases=[(None,None,False),({}, {},False),({'KEY':'true'},{'KEY':'false'},True),
           ({'KEY':'false'},{'KEY':'true'},False),({'KEY':'garbage'},{'KEY':'yes'},True),
           ({'KEY':'1'},{},True),({'KEY':'TRUE'},{},True),({'KEY':'off'},{'KEY':'on'},False),
           ({},{'KEY':'y'},True),({'KEY':'???'},{'KEY':'???'},False)]
    for key in [*POLICY,'android_min_supported_sdk','rental_enabled','ticket_shop_enabled','DISABLE_ADS_ANDROID','disable_ads_android ',None]:
        for fetched,defaults,expected in cases:
            def expand(values):return None if values is None else {key if key is not None else 'other':v for k,v in values.items()}
            config=f.configuration(expand(fetched),expand(defaults));f.events.clear()
            result=f.run(CONFIG,BOOL,(config,key))[0]
            wanted=POLICY[key] if hidden and key in POLICY else (False if key is None else expected)
            assert result==int(wanted),'9292 ad config policy still follows remote value: '+str(key)
            metadata=f.new('Ljl6;')
            delegate=f.new(DELEGATE,{DELEGATE+'->b:Ljava/lang/Object;':config,DELEGATE+'->c:Ljava/lang/Object;':key})
            actual=f.run(DELEGATE,GET,(delegate,metadata,config))[0]
            assert actual.value==wanted,'9292 native config delegate bypassed policy'
    # Mutate the same SDK cache as a later config activation would. The real
    # getter and delegate must observe ordinary keys while protected keys stay fixed.
    for key in [*POLICY,'rental_enabled']:
        config=f.configuration({key:'false'},{key:'yes'})
        remote=config.value[CONFIG+'->a:Lls4;'].value['Lls4;->h:Lxr2;']
        data=remote.value['Lxr2;->c:Lpr2;'].value['fixture'].value['Lrr2;->b:Lorg/json/JSONObject;'].value
        for value,expected in [('false',False),('true',True),('invalid',True)]:
            data[key]=value
            wanted=POLICY[key] if hidden and key in POLICY else expected
            assert f.run(CONFIG,BOOL,(config,key))[0]==int(wanted),'9292 config refresh bypassed policy'


def verify_location(f,hidden):
    original=Reference({'latitude':52.1234567,'longitude':4.9876543},'Landroid/location/Location;')
    service=f.location_service()
    for ordinal in (0,1):
        mode=f.new('Lq43;',{'fixture-ordinal':ordinal})
        for suspend in (False,True):
            f.location_reply=original;f.location_wait=suspend;f.events.clear()
            actual=f.run(LOCATION,LOCATE,(service,mode,f.new('Lez2;')))[0]
            if suspend:
                assert actual is f.suspended
                actual=f.run(CONT,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',(f.saved_location,original))[0]
            assert actual.descriptor=='Lt43;' and actual.value['Lt43;->a:Landroid/location/Location;'] is original,'9292 changed precise functional location'
            assert len([e for e in f.events if e[0]=='location-request'])==1,'9292 location requested twice on resume'
            ads=[e for e in f.events if e[0]=='ad-location']
            assert len(ads)==int(not hidden),'9292 still publishes location to advertising SDK'
            if ads:assert ads[0][1]==(52.12,4.99)
        f.location_wait=False;f.location_reply=0;f.events.clear()
        actual=f.run(LOCATION,LOCATE,(service,mode,f.new('Lez2;')))[0]
        assert actual.descriptor=='Lr43;' and actual.value['Lr43;->a:Ljava/lang/Throwable;'].descriptor.endswith('/CurrentLocationException;')
        failure=Reference({},'Ljava/lang/SecurityException;');f.location_reply=VmThrown(failure)
        actual=f.run(LOCATION,LOCATE,(service,mode,f.new('Lez2;')))[0]
        assert actual.descriptor=='Lr43;' and actual.value['Lr43;->a:Ljava/lang/Throwable;'] is failure,'9292 lost native location failure'
    f.location_wait=False
    broken=f.new(CONT,{CONT+'->b:'+LOCATION:service,CONT+'->c:I':99})
    try:f.run(CONT,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',(broken,original))
    except VmThrown as e:assert e.value.descriptor=='Ljava/lang/IllegalStateException;'
    else:raise AssertionError('9292 lost invalid location continuation error')


def verify_startup(f):
    owner='Lcom/pairip/application/Application;';app=f.new(owner);context=Reference({},'Landroid/content/Context;')
    f.events.clear();f.run(owner,'attachBaseContext(Landroid/content/Context;)V',(app,context))
    assert f.events==[('play-license-entry',context),('native-super-attach',app,context)],'9292 startup/license invocation changed'


def verify_native_ad_gates(f,hidden):
    # Execute the actual property read and branch at each retained consumer.
    # Composer/platform initialization and the remainder of these unchanged
    # methods are covered by whole graphs rather than simulated UI behavior.
    count=0
    for owner,sig in f.rows:
        if owner not in {'Lep0;','Lmh;','Lnl/negentwee/ui/features/journey/detail/JourneyDetailViewModel;'}:continue
        code=canonical(f.source.body(owner,sig)).code
        for start,line in enumerate(code):
            match=re.fullmatch(r'iget-object (\w+), (\w+), Lj0a;->([ef]):Lmq;',line)
            if not match:continue
            field=match[3];key='disable_ads_android' if field=='e' else 'disable_station_ads'
            call=next(i for i in range(start+1,min(start+14,len(code))) if 'Ljava/lang/Boolean;->booleanValue()Z' in code[i])
            branch=call+2;condition=re.fullmatch(r'(if-nez|if-eqz) (\w+), @(\d+)',code[branch]);assert condition,'9292 native no-ad gate changed'
            jump=int(condition[3]);assert jump>branch+1
            local=f.rows[owner,sig][3]
            absolute=lambda reg: 'v'+str(local+int(reg[1:])) if reg.startswith('p') else reg
            for remote in (False,True):
                config=f.configuration({key:'true' if remote else 'false'},{});registers={absolute(match[2]):config}
                for instruction in code[start:call]:
                    index=re.fullmatch(r'aget-object \w+, \w+, (\w+)',instruction)
                    if index:registers[absolute(index[1])]=2 if field=='e' else 3
                actual=f.run(owner,sig,start=start,stop_at=(branch+1,jump),registers=registers)[0]
                disabled=hidden or remote
                wanted=jump if disabled==(condition[1]=='if-nez') else branch+1
                assert actual==wanted,'9292 native ad consumer bypassed config policy'
            count+=1
    assert count==4,'9292 init/render/station gate inventory changed'


def verify_voucher_state(f,hidden):
    # The two real paid-result mappers construct the same native state, whose
    # promotion bit is consumed by ProgressView. Keep status/details identities.
    for owner,receiver,output,status,details,index in [
        ('Lvhc;','p0','p1','v0','v1',None),('Lyqa;','v1','v3','v0','v6','v9')]:
        sig='invoke(Ljava/lang/Object;)Ljava/lang/Object;';code=canonical(f.source.body(owner,sig)).code
        start=next(i for i,line in enumerate(code) if re.fullmatch(r'iget-object \w+, '+receiver+r', Lj0a;->g:Lmq;',line))
        end=next(i for i in range(start,len(code)) if 'Lbl9;-><init>(Lzk9;Lal9;Z)V' in code[i])+1
        local=f.rows[owner,sig][3];absolute=lambda reg: 'v'+str(local+int(reg[1:])) if reg.startswith('p') else reg
        for remote in (False,True):
            config=f.configuration({'sovendus_android':'true' if remote else 'false'},{});model=f.new('Lbl9;')
            paid=f.new('Lzk9;');detail=f.new('Lal9;')
            registers={absolute(receiver):config,absolute(output):model,absolute(status):paid,absolute(details):detail}
            if index:registers[absolute(index)]=4
            f.run(owner,sig,start=start,stop_at=(end,),registers=registers)
            assert model.value['Lbl9;->a:Lzk9;'] is paid and model.value['Lbl9;->b:Lal9;'] is detail,'9292 changed native payment state'
            enabled=remote and not hidden
            assert model.value['Lbl9;->c:Z']==int(enabled),'9292 voucher promotion survived config override'
            ui='Lgk9;';view=next(s for o,s in f.rows if o==ui and s.startswith('ProgressView('))
            ui_code=canonical(f.source.body(ui,view)).code
            read=next(i for i,line in enumerate(ui_code) if 'Lbl9;->c:Z' in line)
            branch=re.fullmatch(r'if-eqz \w+, @(\d+)',ui_code[read+1]);assert branch
            skipped=int(branch[1]);actual=f.run(ui,view,start=read,stop_at=(read+2,skipped),registers={'v1':model})[0]
            assert actual==(read+2 if enabled else skipped),'9292 voucher UI gate changed'


def original_variant(root):
    # Apktool moves uses-sdk/version metadata into apktool.yml. Require it so
    # merged outputs are checked against their own exact publisher variant.
    metadata=(root/'apktool.yml').read_text()
    def field(name):
        values=re.findall(r'^  '+name+r": ['\"]?([^'\"\s]+)['\"]?\s*$",metadata,re.M)
        assert len(values)==1,'9292 missing/ambiguous '+name
        return values[0]
    assert field('versionName')=='2.48.1' and field('versionCode')=='32189','9292 version changed'
    assert field('targetSdkVersion')=='36','9292 target SDK changed'
    minimum=int(field('minSdkVersion'))
    assert minimum in ORIGINAL_VARIANTS,'9292 unsupported minimum SDK'
    return ORIGINAL_VARIANTS[minimum]


def verify(root,selected,apk):
    assert selected<=NAMES
    source=Smali(root);decl=DexDeclarations.from_apk(apk);variant=original_variant(root)
    if not selected:assert decl.source_sha256==variant['base_sha256'],'9292 original APK digest changed'
    consent='Skip consent screens' in selected
    tracking='Disable tracking' in selected or consent
    hidden='Hide ads' in selected or tracking
    fixed='Fix PairIP startup' in selected or hidden
    assert (LOCAL in decl.classes['Lo83;'].methods)==consent
    assert (MATCH in decl.classes[OBSERVER].methods)==consent
    if consent:
        local=decl.classes['Lo83;'].methods[LOCAL]
        assert local.access_flags==17 and '.locals 40' in source.body('Lo83;',LOCAL)
        original=canonical(source.body('Lo83;',MERGE));cloned=canonical(source.body('Lo83;',LOCAL))
        assert cloned.code[124]=='goto/32 @195'
        assert cloned.code[:124]==original.code[:124] and cloned.code[125:]==original.code[125:]
        assert cloned.handlers==original.handlers and cloned.switches==original.switches
        assert decl.classes[OBSERVER].methods[MATCH].access_flags==9 and '.locals 4' in source.body(OBSERVER,MATCH)
    edits=([POLICY_EDIT,LOCATION_EDIT] if hidden else [])+(TRACKING_EDITS if tracking else [])
    edits+=([STARTUP_EDIT] if fixed else [])+(CONSENT_EDITS if consent else [])
    for owner,sig,flags,local,count,digest in CONTRACTS:
        actual=decl.classes[owner].methods[sig];body=source.body(owner,sig);value=canonical(body)
        assert actual.access_flags==flags and int(re.search(r'\.locals (\d+)',body)[1])==local,'9292 ABI changed'
        owned=[e for e in edits if (e['owner'],e['signature'])==(owner,sig)]
        if owned:value=restore_alignment(restore_edits(value,owned,local),count)
        assert len(value.code)==count and value.digest()==digest,'9292 original graph changed: '+owner+'->'+sig
    manifest=ET.parse(root/'AndroidManifest.xml').getroot()
    actual_manifest=deepcopy(manifest)
    assert manifest.get('package')=='nl.negentwee'
    provider=[n for n in manifest.iter('provider') if n.get(A+'name')=='com.google.android.gms.ads.MobileAdsInitProvider']
    assert len(provider)==1
    if tracking:
        app=manifest.find('application')
        for name,value in TRACKING_FLAGS.items():
            nodes=[n for n in app if n.tag=='meta-data' and n.get(A+'name')==name]
            assert len(nodes)==1 and nodes[0].get(A+'value')==str(value).lower(),'9292 product measurement flag changed: '+name
            if name!='google_analytics_automatic_screen_reporting_enabled':app.remove(nodes[0])
        for index,attributes in TRACKING_PERMISSIONS:
            assert not any(n.tag=='uses-permission' and n.get(A+'name')==attributes[A+'name'] for n in manifest),'9292 advertising permission remains enabled'
            manifest.insert(index,ET.Element('uses-permission',attributes))
    if hidden:
        assert provider[0].get(A+'enabled')=='false','9292 MobileAds auto-init remains enabled'
        del provider[0].attrib[A+'enabled']
    if selected:
        # The pinned Desktop merger removes split-only requirements and old Play
        # stamp metadata when producing one re-signed APK. Restore exactly those
        # observed packaging records before comparing all manifest semantics.
        for key,value in MERGE_PACKAGING['attributes'].items():
            assert key not in manifest.attrib,'9292 merged APK retained split requirements'
            manifest.set(key,value)
        app=manifest.find('application')
        for index,attributes in MERGE_PACKAGING['metadata']:
            assert not any(n.tag=='meta-data' and n.get(A+'name')==attributes[A+'name'] for n in app),'9292 merged APK retained original Play/split metadata'
            attributes=dict(attributes)
            if attributes[A+'name']=='com.android.vending.derived.apk.id':
                attributes[A+'value']=variant['derived_apk_id']
            app.insert(index,ET.Element('meta-data',attributes))
    assert xml_digest(manifest) in variant['manifest_digests'],'9292 original manifest changed'
    sdk,archive=sdk_classes()
    try:
        f=Fixture(source,decl,sdk)
        verify_configuration(f,hidden);verify_location(f,hidden);verify_startup(f);verify_native_ad_gates(f,hidden);verify_voucher_state(f,hidden)
        t=TrackingFixture(source,decl,sdk,actual_manifest)
        for verify_tracking in (verify_app_measurement,verify_measurement_metadata,verify_crash_collection,verify_crash_settings,verify_optional_services,verify_persisted_measurement):
            verify_tracking(t,tracking)
        startup=StartupConsentFixture(source,decl,sdk,actual_manifest)
        verify_commit_routing(startup,consent)
        for timestamp in [None, startup.clock_ms//1000*1000, startup.clock_ms//1000*1000+5000]:
            startup.history_override=timestamp
            verify_startup_consent(startup,fixed,consent)
        saved=SavedConsentFixture(source,decl,sdk)
        verify_saved_consent(saved,consent)
    finally:archive.close()
    print('PASS9292: '+(', '.join(sorted(selected)) or 'original')+f' ({len(CONTRACTS)} method contracts)')


if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('root',type=Path);p.add_argument('--apk',type=Path,required=True);p.add_argument('-e',action='append',choices=sorted(NAMES),default=[]);a=p.parse_args();verify(a.root,set(a.e),a.apk)
