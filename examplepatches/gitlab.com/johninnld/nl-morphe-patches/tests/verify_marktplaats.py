"""Verify Marktplaats original/selected APK graphs and bounded native effects."""
import argparse
import hashlib
from pathlib import Path
import re
import xml.etree.ElementTree as ET
import zipfile
from brabant_smali import canonical
from brabant_effects import restore_edits,restore_alignment
from dex_declarations import DexDeclarations
from verify_dumpert import Smali,xml_digest
from verify_parool import sdk_classes
from marktplaats_contracts import CONTRACTS,BASE_SHA256,MANIFEST_DIGESTS,APPLICATION,AD_PROVIDER,MERGE_PACKAGING,NATIVE_LIBRARIES,TRACKING_PERMISSIONS
from marktplaats_vm import Fixture,RESPONSE,REQUEST,ORDER,LIST
from marktplaats_ads_vm import verify_slots,verify_ad_init
from marktplaats_tracking_vm import verify_measurement,HUB,HUB_NAMES,GAID,CONFIG as TRACK_CONFIG
from marktplaats_marketing_vm import verify_marketing,FACEBOOK_GATES,FACEBOOK_FLUSH,BRAZE,COMPANION,MANAGER,ENABLEMENT,GUARDED
from marktplaats_firebase_vm import verify_firebase,FIREBASE_VOID,CRASH,REMOTE
from marktplaats_persisted_vm import verify_persisted,UPLOADER,UPLOAD,FILTER
from marktplaats_sdk_entries_vm import verify_sdk_entries,SDK_VOID,MANAGER as PAYMENT_ANALYTICS,LEVEL as PAYMENT_LEVEL
from marktplaats_security_vm import SecurityFixture,verify_security,SECURITY,INITIALIZE as SECURITY_INITIALIZE
from marktplaats_ad_requests_vm import AdFixture,verify_ad_consumers,verify_ad_admission,verify_ad_fallbacks,verify_ad_cleanup,HOME,CONTAINER,S2I,ADMISSIONS,REPO,AD_TARGET,LRP_TARGET,SPONSORED,VIP_LOAD,SUSPEND

from marktplaats_consent_vm import ConsentFixture, verify_consent
from marktplaats_auth_vm import AuthFixture, verify_auth, PROVIDER as AUTH_PROVIDER, ACTION as AUTH_ACTION, MICROG
from marktplaats_auth_contracts import AUTH_CONTRACTS
from marktplaats_auth_protocol_vm import ProtocolFixture, verify_protocol
from marktplaats_push_vm import PushFixture,verify_push,PROCESSOR as PUSH_PROCESSOR,MESSAGING as PUSH_MESSAGING,RECEIVER as PUSH_RECEIVER,RECEIVE as PUSH_RECEIVE

EXPERT='Disable ThreatMetrix'
CONSENT='Skip consent screens'
AD_NAMES={'Hide ads','Disable tracking',CONSENT}
AUTH='Google sign-in via microG-Re'
NAMES=AD_NAMES|{EXPERT,AUTH}
CONTRACTS=CONTRACTS+[r for r in AUTH_CONTRACTS if r[:2] not in {v[:2] for v in CONTRACTS}]
A='{http://schemas.android.com/apk/res/android}'
TRACKING_FLAGS={'firebase_analytics_collection_deactivated':'true','firebase_analytics_collection_enabled':'false',
 'google_analytics_adid_collection_enabled':'false','firebase_performance_collection_deactivated':'true',
 'firebase_performance_collection_enabled':'false','firebase_sessions_enabled':'false',
 'delivery_metrics_exported_to_big_query_enabled':'false'}
TRACKING_PROVIDERS={'com.datadog.android.rum.DdRumContentProvider','com.adjust.sdk.SystemLifecycleContentProvider'}
TRACKING_RECEIVERS={'com.adjust.sdk.AdjustReferrerReceiver'}
EDITS=[{'owner':owner,'signature':signature,'index':index,'original':[], 'replacement':replacement}
 for owner,signature,index,replacement in [
 (RESPONSE,'<init>('+LIST+'Lcom/horizon/android/core/datamodel/search/Histograms;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Lcom/horizon/android/feature/search/search/api/RecommendedCategoryDataDto;)V',1,
  ['invoke-static {p1}, '+RESPONSE+'->morpheAdSlots('+LIST+')'+LIST,'move-result-object p1']),
 (REQUEST,'<init>('+LIST+LIST+'Lcom/horizon/android/feature/search/search/api/LrpSearchRequest;)V',0,
  ['invoke-static {p1}, '+REQUEST+'->morpheAdTypes('+LIST+')'+LIST,'move-result-object p1']),
 *[(RESPONSE,sig,1,['invoke-static {p0}, '+RESPONSE+'->morpheAdSlots('+LIST+')'+LIST,'move-result-object p0'])
   for sig in ('getItems()'+LIST,'component1()'+LIST)],
 (RESPONSE,'toAdSearchResult()Lcom/horizon/android/core/datamodel/search/AdSearchResult;',2,
  ['invoke-static {v1}, '+RESPONSE+'->morpheAdSlots('+LIST+')'+LIST,'move-result-object v1']),
 *[(ORDER,'get'+kind+'Sections$vip()'+LIST,1,
  ['invoke-static {p0}, '+ORDER+'->morpheAdSections('+LIST+')'+LIST,'move-result-object p0']) for kind in ('Phone','Tablet')],
 ('Lc37;','c()V',0,['return-void']),('Lc37;','d()V',0,['return-void']),
 ('Lc1c;','a(Landroid/content/Context;)V',0,['return-void'])]]
EDITS += [{'owner':owner,'signature':sig,'index':index,'original':[], 'replacement':replacement}
 for owner,sig,index,replacement in [
 ('Le13;','q(Landroid/content/Context;ILcom/horizon/android/core/datamodel/TargetingConfiguration;Lcom/horizon/android/core/datamodel/search/ItemsVisualisation;)Landroid/view/View;',0,['const/4 v0, 0x0','return-object v0']),
 ('Lecc;','a(Landroid/content/Context;Lrcc;Lwbc;Lnkg;)Lcom/pubmatic/sdk/openwrap/banner/POBBannerView;',0,['const/4 v0, 0x0','return-object v0']),
 ('Ls2i;',S2I,0,['invoke-interface {p8}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;','return-void']),
 (HOME,'c(Ldx6;)V',0,['move-object/from16 v0, p1','instance-of v1, v0, Lww6;','if-nez v1, @10',
  'instance-of v1, v0, Lsw6;','if-nez v1, @10','instance-of v1, v0, Low6;','if-nez v1, @10',
  'instance-of v1, v0, Lyw6;','if-nez v1, @10','goto @11','return-void']),
 (CONTAINER,'onAttachedToWindow()V',1,['return-void'])]]
for owner,prefix,kind in ADMISSIONS:
    signatures=[sig for o,sig,*_ in CONTRACTS if o==owner and sig.startswith(prefix)]
    assert len(signatures)==1,'Ambiguous Marktplaats admission contract'
    replacement={'void':['return-void'],'unit':['sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;','return-object v0'],
                 'null':['const/4 v0, 0x0','return-object v0']}[kind]
    EDITS.append({'owner':owner,'signature':signatures[0],'index':0,'original':[],'replacement':replacement})
for owner,index,completion,result in [(AD_TARGET,18,59,'p1'),(LRP_TARGET,20,67,'v0'),(SPONSORED,20,33,'p1')]:
    EDITS.append({'owner':owner,'signature':SUSPEND,'index':index,'original':[],
                  'replacement':['invoke-static {}, '+REPO+'->morpheNoAd()Lrzc;','move-result-object '+result,'goto/16 @'+str(completion+3)]})
EDITS.append({'owner':VIP_LOAD,'signature':SUSPEND,'index':5,'original':[],
              'replacement':['sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;','return-object v0']})
TRACKING_EDITS=[{'owner':HUB,'signature':sig,'index':0,'original':[],'replacement':['return-void']}
 for owner,sig,*_ in CONTRACTS if owner==HUB and sig.split('(',1)[0] in HUB_NAMES]
TRACKING_EDITS += [{'owner':owner,'signature':sig,'index':index,'original':[],'replacement':replacement}
 for owner,sig,index,replacement in [
 ('Lei;','d(ZZLkm6;)Lwq;',0,['new-instance v0, Luq;','invoke-direct {v0}, Ljava/lang/Object;-><init>()V','return-object v0']),
 (TRACK_CONFIG,'m()Z',0,['const/4 v0, 0x0','return v0']),
 *[(GAID,sig,0,['const/4 v0, 0x0','iput-object v0, p0, '+GAID+'->a:Ljava/lang/String;','return-void']) for sig in ('a('+GAID+')V','b()V')],
 ('Lc8h;','a(Landroidx/fragment/app/w;Ljava/lang/String;)V',0,['return-void']),
 ('Lwg;','onActivityResumed(Landroid/app/Activity;)V',146,['goto/16 @183'])]]
TRACKING_EDITS += [{'owner':owner,'signature':sig,'index':0,'original':[],'replacement':['return-void']}
 for owner,sig in FACEBOOK_GATES+[(BRAZE,GUARDED)]]
TRACKING_EDITS += [{'owner':owner,'signature':sig,'index':0,'original':[],'replacement':replacement}
 for owner,sig,replacement in [
 ('Lxc0;',FACEBOOK_FLUSH,['const/4 v0, 0x0','return-object v0']),
 *[(MANAGER,sig,['iget-object v1, p0, '+MANAGER+'->a:Landroid/app/Application;',
                'sget-object v0, '+BRAZE+'->Companion:'+COMPANION,
                'invoke-virtual {v0, v1}, '+COMPANION+'->disableSdk(Landroid/content/Context;)V','return-void'])
   for sig in ('e('+MANAGER+')V','g()V')],
 (MANAGER,'d('+MANAGER+'Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
  ['sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;','return-object v0']),
 (COMPANION,'enableSdk(Landroid/content/Context;)V',
  ['invoke-virtual {p0, p1}, '+COMPANION+'->disableSdk(Landroid/content/Context;)V','return-void']),
 *[(owner,sig,['const/4 v0, 0x1','return v0']) for owner,sig in ((COMPANION,'isDisabled()Z'),(ENABLEMENT,'a()Z'))],
 (ENABLEMENT,'b(Z)V',['const/4 p1, 0x1']),
 (COMPANION,'setOutboundNetworkRequestsOffline(Z)V',['const/4 p1, 0x1'])]]
TRACKING_EDITS += [{'owner':owner,'signature':sig,'index':0,'original':[],'replacement':['return-void']}
 for owner,sig in FIREBASE_VOID]
TRACKING_EDITS += [{'owner':CRASH,'signature':'<init>()V','index':3,
 'original':['iput-boolean v0, p0, '+CRASH+'->a:Z'],
 'replacement':['const/4 v1, 0x0','iput-boolean v1, p0, '+CRASH+'->a:Z']}]
TRACKING_EDITS += [{'owner':owner,'signature':sig,'index':index,'original':[],'replacement':replacement}
 for owner,sig,index,replacement in [
 ('Lh04;','f()Z',0,['const/4 v0, 0x0','return v0']),
 ('Lpfj;','z0()Z',0,['const/4 v0, 0x1','return v0']),
 *[(owner,sig,0,['sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;','return-object v0'])
   for owner,sig in [('Lfd3;','g()Ljava/lang/Boolean;'),('Lsw8;','a()Ljava/lang/Boolean;')]],
 ('Lad2;','c()Z',0,['const/4 v0, 0x0','return v0']),('Lad2;','h(Z)V',0,['const/4 p0, 0x0']),
 ('Llc3;','call()Ljava/lang/Object;',23,['return-object v4']),
 (REMOTE,'d(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',53,['return-object v11'])]]
TRACKING_EDITS += [{'owner':UPLOADER,'signature':UPLOAD,'index':113,'original':['move-object v8, v9'],
 'replacement':['invoke-static {v0}, '+UPLOADER+'->'+FILTER,'move-result-object v0',
  'invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z','move-result v8','if-eqz v8, @120',
  'const-wide/16 v13, -0x1','goto/32 @42','move-object v8, v9']}]
TRACKING_EDITS += [{'owner':owner,'signature':sig,'index':0,'original':[],'replacement':['return-void']}
 for owner,sig in SDK_VOID]
TRACKING_EDITS += [{'owner':'Lxj5;','signature':'e(Z)V','index':0,'original':[],'replacement':['const/4 p1, 0x0']},
 {'owner':PAYMENT_LEVEL,'signature':'getPriority()I','index':0,'original':[],'replacement':['const/4 p0, 0x1','return p0']},
 {'owner':PAYMENT_ANALYTICS,'signature':'e()V','index':4,
  'original':['iget-object v0, p0, '+PAYMENT_ANALYTICS+'->f:Lxz2;'],
  'replacement':['iput-object v1, p0, '+PAYMENT_ANALYTICS+'->g:Ls8f;','return-void','iget-object v0, p0, '+PAYMENT_ANALYTICS+'->f:Lxz2;']},
 {'owner':PAYMENT_ANALYTICS,'signature':'d(Lkotlin/coroutines/jvm/internal/ContinuationImpl;)Ljava/lang/Object;',
  'index':35,'original':[],'replacement':['return-object v0']}]
TRACKING_EDITS += [
 {'owner':PUSH_PROCESSOR,'signature':'a(Lqtc;)Z','index':0,'original':[],
  'replacement':['sget-object v0, Lcom/braze/push/BrazeFirebaseMessagingService;->Companion:'+PUSH_MESSAGING,
   'invoke-virtual {v0, p1}, '+PUSH_MESSAGING+'->isBrazePushNotification(Lqtc;)Z','move-result v0','return v0']},
 {'owner':PUSH_RECEIVER,'signature':PUSH_RECEIVE,'index':2,'original':[],'replacement':['return-void']}]
SECURITY_EDITS=[{'owner':SECURITY,'signature':sig,'index':0,'original':[],'replacement':replacement}
 for sig,replacement in [(SECURITY_INITIALIZE,['return-void']),('e()Z',['const/4 v0, 0x0','return v0'])]]


CONSENT_EDITS=[{'owner': 'Lcg3;', 'signature': 'onUIReady(Landroid/view/View;)V', 'index': 1, 'original': [], 'replacement': ['iget-boolean v0, p0, Lcg3;->b:Z', 'if-nez v0, @14', 'iget-boolean v0, p0, Lcg3;->morpheRejectedStartupConsent:Z', 'if-nez v0, @13', 'iget-object v1, p0, Lcg3;->d:Ldg3;', 'iget-object v2, v1, Ldg3;->h:Lcom/sourcepoint/cmplibrary/SpConsentLib;', 'if-eqz v2, @14', 'const/4 v0, 0x1', 'iput-boolean v0, p0, Lcg3;->morpheRejectedStartupConsent:Z', 'sget-object v3, Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;->GDPR:Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;', 'invoke-interface {v2, v3}, Lcom/sourcepoint/cmplibrary/SpConsentLib;->rejectAll(Lcom/sourcepoint/cmplibrary/data/network/util/CampaignType;)V', 'invoke-virtual {p0, p1}, Lcg3;->onUIFinished(Landroid/view/View;)V', 'return-void']}]

AUTH_EDITS=[
 {'owner':'Lrt3;','signature':'a(Lrt3;Ljava/lang/Object;)Lit3;','index':0,'original':[],
  'replacement':['invoke-static {p0, p1}, '+AUTH_PROVIDER+'->morpheGoogleProvider(Lrt3;Ljava/lang/Object;)Lit3;',
                 'move-result-object v0','if-eqz v0, @4','return-object v0']},
 {'owner':AUTH_PROVIDER,'signature':'isAvailableOnDevice(I)Z','index':0,'original':[],
  'replacement':['iget-boolean v0, p0, '+AUTH_PROVIDER+'->morpheGoogleMicrog:Z','if-eqz v0, @6',
                 'iget-object v0, p0, '+AUTH_PROVIDER+'->context:Landroid/content/Context;',
                 'invoke-static {v0}, '+AUTH_PROVIDER+'->morpheMicrogAvailable(Landroid/content/Context;)Z',
                 'move-result v0','return v0']},
 {'owner':'Lfdj;','signature':'a(Landroid/content/Context;Lnsk;)Landroid/content/Intent;','index':0,'original':[],
  'replacement':['iget-object v0, p1, Lnsk;->a:Ljava/lang/String;', 'const-string v1, "'+AUTH_ACTION+'"',
                 'invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z','move-result v0','if-eqz v0, @15',
                 'invoke-static {p0}, '+AUTH_PROVIDER+'->morpheMicrogAvailable(Landroid/content/Context;)Z',
                 'move-result v0','if-eqz v0, @15','new-instance v0, Landroid/content/Intent;',
                 'const-string v1, "'+AUTH_ACTION.replace('com.google','app.revanced')+'"',
                 'invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V',
                 'const-string v1, "'+MICROG+'"',
                 'invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;',
                 'move-result-object v0','return-object v0']},
]


AUTH_EDITS.extend([
 {'owner':AUTH_PROVIDER,'signature':'onGetCredential(Landroid/content/Context;Llj6;Landroid/os/CancellationSignal;Ljava/util/concurrent/Executor;Ldt3;)V','index':84,'original':[],
  'replacement':['move-object/from16 v10, p0','invoke-static {v10, v11}, '+AUTH_PROVIDER+'->morpheGoogleOption('+AUTH_PROVIDER+'Lft3;)Lft3;','move-result-object v11']},
 {'owner':'Landroidx/credentials/playservices/controllers/identitycredentials/getcredential/a;','signature':'onReceiveResult(ILandroid/os/Bundle;)V','index':85,'original':[],
  'replacement':['invoke-static {p2}, '+AUTH_PROVIDER+'->morpheGoogleLegacyResult(Landroid/content/Intent;)Z','move-result v4','if-eqz v4, @89','const/16 p1, 0x20']},
])

def verify_manifest(root,hidden,tracking=False,merged=None,auth=False):
    manifest=ET.parse(root/'AndroidManifest.xml').getroot()
    app=manifest.find('application');assert app.get(A+'name')==APPLICATION
    if auth:
        for name,value in {MICROG+'.SPOOFED_PACKAGE_NAME':'nl.marktplaats.android',
                           MICROG+'.SPOOFED_PACKAGE_SIGNATURE':'e650094b1bcb91997173c1261fd0136ab7592984',
                           'app.revanced.MICROG_PACKAGE_NAME':MICROG}.items():
            nodes=[n for n in app if n.tag=='meta-data' and n.get(A+'name')==name]
            assert len(nodes)==1 and nodes[0].attrib=={A+'name':name,A+'value':value}
            app.remove(nodes[0])
        queries=manifest.findall('queries');assert len(queries)==1
        nodes=[n for n in queries[0] if n.tag=='package' and n.get(A+'name')==MICROG]
        assert len(nodes)==1 and nodes[0].attrib=={A+'name':MICROG}
        queries[0].remove(nodes[0])
    provider=[n for n in app if n.tag=='provider' and n.get(A+'name')==AD_PROVIDER[A+'name']]
    assert len(provider)==1
    if hidden:
        assert provider[0].get(A+'enabled')=='false','Marktplaats MobileAds auto-init remains enabled'
        del provider[0].attrib[A+'enabled']
    if merged is None:merged=hidden
    if merged:
        # Desktop's split merger removes these split/Play packaging nodes.
        for key,value in MERGE_PACKAGING['attributes'].items():
            assert key not in manifest.attrib,'Marktplaats merged split requirement changed'
            manifest.set(key,value)
        for index,attrs in MERGE_PACKAGING['metadata']:
            assert not any(n.tag=='meta-data' and n.get(A+'name')==attrs[A+'name'] for n in app)
            app.insert(index,ET.Element('meta-data',attrs))
    assert provider[0].attrib==AD_PROVIDER,'Marktplaats ad provider changed outside policy'
    if tracking:
        for name,wanted in TRACKING_FLAGS.items():
            nodes=[n for n in app if n.tag=='meta-data' and n.get(A+'name')==name]
            assert len(nodes)==1 and nodes[0].attrib=={A+'name':name,A+'value':wanted},'Marktplaats permanent collection flag missing: '+name
            app.remove(nodes[0])
        for name in TRACKING_PROVIDERS:
            nodes=[n for n in app if n.tag=='provider' and n.get(A+'name')==name]
            assert len(nodes)==1 and nodes[0].get(A+'enabled')=='false','Marktplaats automatic tracking provider remains: '+name
            del nodes[0].attrib[A+'enabled']
        for name in TRACKING_RECEIVERS:
            nodes=[n for n in app if n.tag=='receiver' and n.get(A+'name')==name]
            assert len(nodes)==1 and nodes[0].get(A+'enabled')=='false','Marktplaats attribution receiver remains enabled'
            del nodes[0].attrib[A+'enabled']
        assert len(TRACKING_PERMISSIONS)==2
        for index,attrs in TRACKING_PERMISSIONS:
            assert not any(n.tag=='uses-permission' and n.get(A+'name')==attrs[A+'name'] for n in manifest),'Marktplaats advertising permission remains'
            manifest.insert(index,ET.Element('uses-permission',attrs))
    assert xml_digest(manifest) in MANIFEST_DIGESTS,'Marktplaats original manifest changed'


def verify(root,selected,apk,behaviour_only=None):
    # Historical canonical data above remains the independent binding/effects
    # oracle for 16.19, but old APKs are no longer public validation targets.
    metadata=(root/'apktool.yml').read_text()
    assert re.search(r"versionName: ['\"]?16\.19\.0['\"]?",metadata),'Unsupported Marktplaats version'
    from marktplaats_1619 import verify as verify_1619
    return verify_1619(root,selected,apk,behaviour_only)


if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('root',type=Path)
    p.add_argument('--apk',type=Path,required=True);p.add_argument('-e',action='append',choices=sorted(NAMES),default=[])
    p.add_argument('--behaviour-only',choices=('slots','ads','loaders','home','lifetime','admissions','fallbacks','cleanup','tracking','marketing','firebase','resources','persisted','sdk','security','push','consent','auth'));a=p.parse_args()
    verify(a.root,set(a.e),a.apk,a.behaviour_only)
