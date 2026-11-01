"""Independently verify NU.nl 26.9.0 decoded patch effects. No flags checks original."""
import argparse
import base64
import hashlib
import json
import os
import struct
from functools import lru_cache
from zipfile import ZipFile
from pathlib import Path
import re
import subprocess
import xml.etree.ElementTree as ET
from urllib.parse import urlsplit, unquote
from verify_weerplaza import method as _method, canonical_method as _canonical_method, resource

def method(*args):return [line.replace("const-string/jumbo ","const-string ") for line in _method(*args)]
def canonical_method(*args):return [line.replace("const-string/jumbo ","const-string ") for line in _canonical_method(*args)]

NAMES = {'Hide ads','Disable tracking','Hide Premium banner','Skip consent screens'}
A = '{http://schemas.android.com/apk/res/android}'
APP = 'nl/nu/android/'
OBJ = 'nl/nu/performance/api/client/objects/'
TRANSFORMER = APP+'bff/domain/data_integrity/ScreenTransformerImpl'
INLINE = APP+'bff/presentation/views/webview/InlineWebView$InlineWebViewClient'
CLIENTS = [INLINE, APP+'ui/view/webview/WebViewComponentKt$WebView$1$1$1$1$1$1',
           'net/persgroep/pipoidcsdk/service/OidcWebViewBuilder$initLoginWebViewClient$1',
           'com/mondriaan/dpns/client/android/DPNSInboxWebView$1', 'com/longtailvideo/jwplayer/h/d/c']
# Exact independent input signatures; adding a return elsewhere cannot satisfy these checks.
AD_NULL = [
(APP+'bff/presentation/views/blocks/viewholders/composables/dpg_banner_block/DpgBannerBlockViewHolder','getAdvertisementToDisplay()Landroid/view/ViewGroup;'),
(APP+'banners/MobileAdvertisingManager','loadAd(Landroid/content/Context;Landroidx/lifecycle/LifecycleOwner;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)Landroid/view/ViewGroup;'),
(APP+'tracking/vacs/VacsVideoEventTracker','requestVacsUrl(Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;'),
(APP+'bff/data/video/ImaAdvertisingFactory','createVmapImaAdvertisingConfig(Ljava/lang/String;)Lcom/jwplayer/pub/api/configuration/ads/ima/ImaVmapAdvertisingConfig;')]
AD_STOP = [(APP+'banners/initializer/AdvertisementInitializer','onApplicationCreate()V')]
TRACK_STOP = [
(APP+'tracking/engine/sdks/firebase/FirebaseTracker','trackEvent(Ljava/lang/String;Landroid/os/Bundle;)V'),
(APP+'tracking/engine/sdks/sac/SacSnowplowTracker','send(Lnl/sanomamedia/android/nu/analytics/skit/events/Event;Ljava/lang/String;)V'),
(APP+'tracking/trackingsdk/TrackingSDKInitializer','onApplicationCreate()V'),
(APP+'tracking/trackingsdk/TrackingSDKInitializer','configureSDK()V'),
('be/persgroep/tracking/TrackingSDK','track(Lbe/persgroep/tracking/base/model/TrackingEvent;)V'),
('be/persgroep/advertising/userprofile/config/InitConfigHandler','initialize()V'),
(APP+'tracking/engine/sdks/nobo/NoboSdkInitializer','initNoboSDK()V'),
(APP+'tracking/engine/sdks/nobo/NoboTracker','track(Lnl/nu/performance/api/client/objects/NoboEvent;)V'),
('nl/sanomamedia/android/nu/analytics/log/NoboLogger','send(Lnl/sanomamedia/android/nu/analytics/skit/events/Event;)V'),
(APP+'tracking/engine/sdks/usabilla/UsabillaTracker','init()V'),
(APP+'tracking/engine/sdks/usabilla/UsabillaTracker','performSendEvent$tracking(Ljava/lang/String;)V'),
(APP+'tracking/engine/sdks/usabilla/QueuedEventSender','sendEvent(Ljava/lang/Object;)V'),
(APP+'tracking/engine/sdks/HttpTracker','track(Lnl/nu/performance/api/client/objects/HttpEvent;)V'),
(APP+'push/tracking/TrackingEventBroadcastReceiver','trackEvents(Landroid/content/Intent;)V'),
('net/persgroep/pipoidcsdk/client/telemetry/TelemetryClient','register(Lnet/persgroep/pipoidcsdk/client/telemetry/MetricType;Ljava/lang/String;Ljava/lang/String;)V'),
('be/dpgmedia/privacy/privacygatesdk/client/metrics/MetricsClient','sendErrorMetric$privacygatesdk_release(Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorMessage;Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorType;Ljava/lang/String;)V'),
('nl/sanomamedia/android/nu/timber/CrashReportingTree','log(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V'),
('com/google/firebase/perf/transport/TransportManager','dispatchLog(Lcom/google/firebase/perf/v1/PerfMetric;)V'),
('com/google/firebase/messaging/MessagingAnalytics','logToScion(Ljava/lang/String;Landroid/os/Bundle;)V'),
('com/google/firebase/messaging/MessagingAnalytics','logToFirelog(Lcom/google/firebase/messaging/reporting/MessagingClientEvent$Event;Landroid/content/Intent;Lcom/google/android/datatransport/TransportFactory;)V'),
('com/google/firebase/messaging/MessagingAnalytics','setUserPropertyIfRequired(Landroid/os/Bundle;)V'),
('nl/sanomamedia/android/nu/analytics/skit/Engine','dispatch()V'),
('nl/sanomamedia/android/nu/analytics/skit/Engine','send(Lnl/sanomamedia/android/nu/analytics/skit/events/Event;)V'),
('nl/sanomamedia/android/nu/analytics/skit/Engine','send(Lnl/sanomamedia/android/nu/analytics/skit/events/Event;Z)V'),
('nl/sanomamedia/android/nu/analytics/skit/Engine','sendEventToBackend(Lnl/sanomamedia/android/nu/analytics/skit/events/Event;Lnl/sanomamedia/android/nu/analytics/skit/BackendBase;)V'),
('nl/sanomamedia/android/nu/analytics/skit/Engine','sendEventToBackend(Lnl/sanomamedia/android/nu/analytics/skit/events/Event;Lnl/sanomamedia/android/nu/analytics/skit/BackendBase;Z)V'),
]
DPNS='com/mondriaan/dpns/client/android/'
TRACK_STOP += [(DPNS+'DPNSDeliveryStatisticsManager', sig) for sig in [
'sendDeliveryStatistics(Landroid/content/Context;Lcom/mondriaan/dpns/client/android/DPNSGlobalPreferences;Ljava/lang/Long;Lcom/mondriaan/dpns/client/android/DPNSDeliveryStatisticsEvent;)V',
'scheduleDelivery(Landroid/content/Context;Lcom/mondriaan/dpns/client/android/DPNSGlobalPreferences;Z)V',
'sendPendingDeliveryStatistics(Landroid/content/Context;Lcom/mondriaan/dpns/client/android/DPNSGlobalPreferences;)V']]
CRASH='com/google/firebase/crashlytics/FirebaseCrashlytics'
TRACK_STOP += [(CRASH,sig) for sig in ['log(Ljava/lang/String;)V','recordException(Ljava/lang/Throwable;)V','recordException(Ljava/lang/Throwable;Lcom/google/firebase/crashlytics/CustomKeysAndValues;)V','sendUnsentReports()V','setUserId(Ljava/lang/String;)V','setCustomKeys(Lcom/google/firebase/crashlytics/CustomKeysAndValues;)V']]
TRACK_STOP += [(CRASH,'setCustomKey(Ljava/lang/String;'+typ+')V') for typ in ['D','F','I','J','Ljava/lang/String;','Z']]
TRACK_STOP += [('com/google/firebase/analytics/FirebaseAnalytics',sig) for sig in ['logEvent(Ljava/lang/String;Landroid/os/Bundle;)V','setCurrentScreen(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V','setUserId(Ljava/lang/String;)V','setUserProperty(Ljava/lang/String;Ljava/lang/String;)V','setDefaultEventParameters(Landroid/os/Bundle;)V']]
TRACK_FALSE = [('com/google/firebase/crashlytics/internal/common/DataCollectionArbiter','isAutomaticDataCollectionEnabled()Z'),('com/google/firebase/perf/config/ConfigResolver','isPerformanceMonitoringEnabled()Z'),('com/google/firebase/sessions/settings/SessionsSettings','getSessionsEnabled()Z'),('com/google/firebase/messaging/MessagingAnalytics','deliveryMetricsExportToBigQueryEnabled()Z')]
TRACK_UNIT = [(APP+'tracking/userprofilesdk/UserProfileRepositoryInitializer','onActivityCreateParallel(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;'),('net/persgroep/pipoidcsdk/client/telemetry/TelemetryClient','init(Lnet/persgroep/pipoidcsdk/client/telemetry/Meta;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;'),('com/google/firebase/sessions/settings/RemoteSettings','updateSettings(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;')]
CONSENT_UNIT = [(APP+'consent/privacygate/PrivacyGateService',name+'(Landroid/app/Activity;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;') for name in ['refreshConsent']]
TRACK_EMPTY = [(APP+'network/modifiers/UDSTokenHeaderModifier','getValue()Ljava/lang/String;'),(APP+'configurations/UserDataStoreTokenProvider','getUdsToken(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;')]
FLAGS_TRUE=['firebase_analytics_collection_deactivated','firebase_performance_collection_deactivated']
FLAGS_FALSE=['firebase_analytics_collection_enabled','google_analytics_automatic_screen_reporting_enabled','google_analytics_adid_collection_enabled','google_analytics_sgtm_upload_enabled','google_analytics_default_allow_analytics_storage','google_analytics_default_allow_ad_storage','google_analytics_default_allow_ad_user_data','google_analytics_default_allow_ad_personalization_signals','firebase_crashlytics_collection_enabled','firebase_sessions_enabled','firebase_performance_collection_enabled','firebase_performance_logcat_enabled','delivery_metrics_exported_to_big_query_enabled']
# Digests populated from original independently decoded APK before production edits.
RETAINED = {'be/dpgmedia/privacy/privacygatesdk/ui/WebViewFactory$initChromeWebViewClient$1->onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z': '31f4bb7ecda3b2f5073ff73e18a1e03e7080a828704968380039294f785dbc96',
 'com/mondriaan/dpns/client/android/DPNSDeliveryStatisticsIntentService->onHandleIntent(Landroid/content/Intent;)V': '027e0d228fe54f52f6a449ce2a6343306732b46b6b46ff4a9e3e1209a7960887',
 'nl/nu/android/bff/data/mappers/BlockMapper->createCarouselLinkBlock(Lnl/nu/performance/api/client/objects/CarouselLinkBlock;)Lnl/nu/android/bff/domain/models/BlockData$Container$LinkContainer;': '28cf56d9e3e99e87d538370081988f2f4e6ace435bfd170db2ec2e16638cda36',
 'nl/nu/android/bff/data/mappers/BlockMapper->createPairedLinkBlock(Lnl/nu/performance/api/client/objects/PairedLinkBlock;)Lnl/nu/android/bff/domain/models/BlockData$Container$LinkContainer;': '8d7d5dc280549c09060c28a80bb9fd574965ed6aff0b88f27479a7e22e5b98a1',
 'nl/nu/android/bff/data/mappers/BlockMapper->map(Lnl/nu/performance/api/client/interfaces/Block;Ljava/lang/String;)Lnl/nu/android/bff/domain/models/BlockData;': '1cb9a4bd96ecebbc97d0fd189b9ae72029fbb94f64169429d08cf51a783364a1',
 'nl/nu/android/bff/data/mappers/TargetMapper->mapConsentTarget(Lnl/nu/performance/api/client/objects/ConsentTarget;Lnl/nu/android/bff/domain/models/actions/Action;Lnl/nu/android/bff/domain/models/actions/Action;)Lnl/nu/android/bff/domain/models/actions/NavigationAction$BFFNavigationAction$OpenConsent;': 'c2a920019e9463016276dea51018ad018a076afb39f979df254b47a6c948628a',
 'nl/nu/android/bff/data/video/PlayerConfigFactoryImpl->createDefaultHorizontalBuilder(Ljava/lang/String;Ljava/lang/String;)Lcom/jwplayer/pub/api/configuration/PlayerConfig$Builder;': '3a2adb5ebb744f1597648b731e60e1336f576d383f328ea0dfffd6a11f6eb2e9',
 'nl/nu/android/bff/data/video/PlayerConfigFactoryImpl->createDefaultVerticalBuilder(Ljava/lang/String;Ljava/lang/String;Z)Lcom/jwplayer/pub/api/configuration/PlayerConfig$Builder;': 'd91870c1588b193940208ccacb60928435bb77058757aacbf44c839b4e853e0e',
 'nl/nu/android/bff/domain/use_cases/consent/ResurfaceConsentUseCase->invoke(Landroid/app/Activity;)V': 'fa64854ead9d8503ebfeb28ddd1f03b330d402e7d4163b10575b25c7232c6d5e',
 'nl/nu/android/bff/domain/use_cases/remote/ProcessWebViewEventUseCase->invoke(Lnl/nu/android/bff/domain/models/ScreenEvent$BlockEvent$OnWebViewEvent;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;': 'd9dbdaeb53a572c58c8f1d3796842d001969d99fc045d4440d167e0f77833d2f',
 'nl/nu/android/bff/presentation/content/ContentFragment->resurfaceContent()V': 'c99774aec08349f0160cf0eda352c10a7e13999b5d26d65fa1fef8e7ce4938ba',
 'nl/nu/android/bff/presentation/content/EventProcessor->processCompletableEvent(Lnl/nu/android/bff/presentation/models/UIEvent$Completable;)V': '3bae77781731590d7696fcb9a2a202f424f7a41af25432a2f051a30cd76c8780',
 'nl/nu/android/bff/presentation/views/webview/F1WebBlockResponseHandler->handleMessage(Ljava/lang/String;Landroid/webkit/WebView;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V': 'f7d7bd14ef0d198e10b94e48ee8f439f3f629ba9eee592d3e315d10fafb9c3d5',
 'nl/nu/android/bff/presentation/views/webview/F1WebBlockResponseHandler->handleReady(Lnl/nu/android/bff/presentation/views/webview/F1WebBlockMessage;Landroid/webkit/WebView;)V': 'f86495b7af9624073ed91054cc72fbe537b80406de8ddb5d3f555da42ee74664',
 'nl/nu/android/bff/presentation/views/webview/InlineWebView-><init>(Landroid/content/Context;)V': 'd59f025fd09e51495eae767b256b4529d0aef9dc8ad1bd32fef54aabe15663a1',
 'nl/nu/android/bff/presentation/views/webview/InlineWebView-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V': '913e84e2d401a9a7b4c632fdf8b6e7b58157ec4636e0f0b9b72eb4d55cb3eba1',
 'nl/nu/android/bff/presentation/views/webview/InlineWebView-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V': '8d5eb670279d71cf1664a0f3cdd9fc88beae9d7be8db3bfe6fc86532f58bec05',
 'nl/nu/android/bff/presentation/views/webview/InlineWebView-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V': '2b36099be831d4c2bcda17d1ec88fcde9ee1333b1c7629da4751d99311bf1b45',
 'nl/nu/android/bff/presentation/views/webview/InlineWebView->bind(Lnl/nu/performance/api/client/objects/WebAppBlock;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V': '6a802db29e79209d6bf5a09cc297b1ae8bdf1a6f3171e9551871110c822fce6f',
 'nl/nu/android/consent/privacygate/PrivacyGateService->resurfacePrivacyGate(Landroid/app/Activity;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;': '3f9a48e0b3e3c0ac76f16263e2482f257001ab1803d8aadffbda9c0d1699206f',
 'nl/nu/android/network/modifiers/HeaderModifierInterceptor->intercept(Lokhttp3/Interceptor$Chain;)Lokhttp3/Response;': '0c31993a71963739dec6c73b7ff620c419331c0d06d9f98b8ebe9703605fead5',
 'nl/nu/android/push/tracking/TrackingEventBroadcastReceiver->onReceive(Landroid/content/Context;Landroid/content/Intent;)V': '32b45303083c3c63f7b9492d93a31dc90f03a0d214b8580b55a20593eeb916dc',
 'nl/nu/android/tracking/engine/TrackingEngineImpl->track(Lnl/nu/performance/api/client/interfaces/TrackingEvent;)V': '84f7d9873f722c2dc56a09af3b3cd7bfc38d291232b1399d3b97f9e20968fe11'}

def has(root, cls, signature):
    paths=list(root.glob('smali*/'+cls+'.smali'))+list(root.glob('smali/smali*/'+cls+'.smali'))
    assert len(paths)==1, cls
    return bool(re.search(r'^\.method[^\n]* '+re.escape(signature)+r'\n',paths[0].read_text(),re.M))

@lru_cache(maxsize=1)
def platform_classes():
    """Use actual Android SDK ClassFile access flags for non-APK reference owners."""
    explicit=os.environ.get('ANDROID_JAR')
    if explicit:return ZipFile(explicit)
    roots=[Path(os.environ[n]) for n in ['ANDROID_HOME','ANDROID_SDK_ROOT'] if os.environ.get(n)]
    roots += [Path.home()/'Library/Android/sdk',Path.home()/'Android/Sdk']
    jars=[p for r in roots for p in (r/'platforms').glob('android-*/android.jar')]
    assert jars, 'Dispatch verification requires Android SDK platform android.jar; set ANDROID_HOME or ANDROID_JAR'
    return ZipFile(max(jars,key=lambda p:int(p.parent.name.split('-')[1]) if p.parent.name.split('-')[1].isdigit() else -1))


def classfile_flags(data):
    """Read the class access_flags after the JVM constant pool, without a JVM."""
    assert data[:4]==b'\xca\xfe\xba\xbe'
    count=struct.unpack_from('>H',data,8)[0];offset=10;i=1
    sizes={3:4,4:4,5:8,6:8,7:2,8:2,9:4,10:4,11:4,12:4,15:3,16:2,17:4,18:4,19:2,20:2}
    while i<count:
        tag=data[offset];offset+=1
        if tag==1:
            length=struct.unpack_from('>H',data,offset)[0];offset+=2+length
        else:
            assert tag in sizes, 'Unsupported ClassFile constant-pool tag '+str(tag)
            offset+=sizes[tag]
            if tag in {5,6}:i+=1
        i+=1
    return struct.unpack_from('>H',data,offset)[0]


@lru_cache(maxsize=512)
def target_is_interface(root, owner):
    paths=list(root.glob('smali*/'+owner+'.smali'))+list(root.glob('smali/smali*/'+owner+'.smali'))
    assert len(paths)<=1, 'Ambiguous reference owner '+owner
    if paths:
        with paths[0].open() as source:header=source.readline().strip()
        assert header.startswith('.class '), owner
        return 'interface' in header.split()
    archive=platform_classes();entry=owner+'.class'
    assert entry in archive.namelist(), 'Unresolved injected method reference owner '+owner
    return bool(classfile_flags(archive.read(entry)) & 0x200) # ACC_INTERFACE


def invocation_error(root, opcode, reference):
    owner=reference.split(';->',1)[0].removeprefix('L')
    interface=target_is_interface(root,owner)
    kind=opcode.removesuffix('/range')
    if kind=='invoke-virtual' and interface:return 'invoke-virtual expects class, found interface '+owner
    if kind=='invoke-interface' and not interface:return 'invoke-interface expects interface, found class '+owner
    if kind=='invoke-direct' and '-><init>(' in reference and interface:return 'Constructor owner is interface '+owner
    # Static interface methods and invoke-super default-interface methods are legal;
    # their owner is still independently resolved, never inferred from package names.
    return None


def verify_dispatch(root, check):
    """Audit all generated helpers plus every original method receiving an invoke.

    Concrete Block/Target/Link types really are classes despite their namespace;
    BlockData is an interface. Keep that distinction explicit, including /range.
    """
    model_kinds={APP+'bff/domain/models/BlockData':(True,'getBlock()Lnl/nu/performance/api/client/interfaces/Block;'),
                 'nl/nu/performance/api/client/interfaces/Block':(False,'getId()Ljava/lang/String;'),
                 'nl/nu/performance/api/client/interfaces/Target':(False,'getTrackers()Lnl/nu/performance/api/client/objects/TargetTrackers;'),
                 OBJ+'Link':(False,'getTarget()Lnl/nu/performance/api/client/interfaces/Target;')}
    for owner,(interface,signature) in model_kinds.items():
        check(target_is_interface(root,owner)==interface,'Actual model ClassDef contract '+owner)
        for suffix in ['', '/range']:
            good='invoke-interface' if interface else 'invoke-virtual'
            bad='invoke-virtual' if interface else 'invoke-interface'
            ref='L'+owner+';->'+signature
            check(invocation_error(root,good+suffix,ref) is None,'Accept correct dispatch '+good+suffix+' '+owner)
            check(invocation_error(root,bad+suffix,ref) is not None,'Reject wrong dispatch '+bad+suffix+' '+owner)
    classes=set(CLIENTS+[TRANSFORMER,PRIVACY_CLIENT,PRIVACY_FACTORY,APP+'bff/data/mappers/BlockMapper',APP+'tracking/userprofilesdk/UserProfileIdProvider',APP+'tracking/engine/TrackingEngineImpl'])
    classes.update({APP+'bff/domain/use_cases/screen_visibility/ShowScreenUseCase$invoke$2', APP+'bff/presentation/content/ScreenPresenterImpl', APP+'bff/presentation/modal_sheet/ModalSheetViewModel', APP+'bff/presentation/modal_sheet/ModalSheetNavigator'})
    failures=[];references=0;helpers=0
    for cls in classes:
        paths=list(root.glob('smali*/'+cls+'.smali'))+list(root.glob('smali/smali*/'+cls+'.smali'))
        if not paths:continue # Original APK has no generated privacy client.
        assert len(paths)==1,cls
        for match in re.finditer(r'^\.method[^\n]* ([^\s]+)\n(.*?)^\.end method',paths[0].read_text(),re.M|re.S):
            sig,body=match.groups();name=sig.split('(')[0]
            generated=name.startswith('morphe') or cls==PRIVACY_CLIENT
            whole=generated or (cls in CLIENTS and name=='shouldInterceptRequest') or (cls.endswith('/BlockMapper') and name=='adaptToLinkDataOrNull') or (cls.endswith('/UserProfileIdProvider') and name=='getAllIds')
            if generated:helpers+=1
            for line in body.splitlines():
                call=re.match(r'\s*(invoke-[a-z]+(?:/range)?) \{[^}]*\}, (L[^;]+;->\S+)',line)
                if not call:continue
                opcode,reference=call.groups()
                if not whole and '->morphe' not in reference and PRIVACY_CLIENT not in reference:continue
                references+=1;error=invocation_error(root,opcode,reference)
                if error:failures.append(cls+'->'+sig+': '+error)
    for error in failures:check(False,'Injected dispatch: '+error)
    if helpers:print(f'Dispatch audit: {helpers} generated methods, {references} references, {len(failures)} invalid')
    return not failures


def execute(root, cls, sig, args, runtime=None):
    """Small fail-closed interpreter of emitted policy/filter code, using synthetic models.

    The APK instructions choose the result; the test never reimplements the predicates.
    Android framework URL/Base64/JSON and model getters have literal Python equivalents.
    """
    paths=list(root.glob('smali*/'+cls+'.smali'))+list(root.glob('smali/smali*/'+cls+'.smali'))
    raw=re.search(r'^\.method[^\n]* '+re.escape(sig)+r'\n(.*?)^\.end method',paths[0].read_text(),re.M|re.S)[1]
    lines=canonical_method(root,cls,sig)
    runtime = {} if runtime is None else runtime
    r={'p'+str(i):x for i,x in enumerate(args)};result=None;pc=0
    def value(x):return x['value'] if isinstance(x,dict) and x.get('__type')=='java/lang/String' and 'value' in x else x
    def call(ref, vals):
        owner,tail=ref.split(';->');owner=owner[1:];name=tail.split('(')[0]
        vals=[value(x) for x in vals]
        if name.startswith('morphe'):return execute(root,owner,tail,vals,runtime)
        if name=='<init>':
            obj=vals[0]
            if owner=='java/lang/String':obj['value']=vals[1].decode('utf-8')
            elif owner=='org/json/JSONObject':obj['data']=json.loads(vals[1])
            return None
        if owner=='android/webkit/WebResourceRequest':
            if name=='getUrl':return urlsplit(vals[0]['url'])
            return vals[0][{'isForMainFrame':'main','hasGesture':'gesture','isRedirect':'redirect'}[name]]
        if owner=='android/content/Intent':
            if name=='parseUri':
                assert vals[1]==1, 'Use Android URI_INTENT_SCHEME'
                if runtime.get('malformed_uri'):raise ValueError('java.net.URISyntaxException')
                return {'uri':vals[0], 'flags':runtime.get('intent_flags',0),
                        'component':runtime.get('intent_component'), 'selector':runtime.get('intent_selector'),
                        'categories':set(), 'extras':{}}
            intent=vals[0]
            if name=='getFlags':return intent['flags']
            if name=='setFlags':intent['flags']=vals[1];return intent
            if name=='addCategory':intent['categories'].add(vals[1]);return intent
            if name=='setComponent':intent['component']=vals[1] or None;return intent
            if name=='setSelector':intent['selector']=vals[1] or None;return None
            if name=='putExtra':intent['extras'][vals[1]]=vals[2];return intent
        if owner=='android/content/Context' and name=='startActivity':
            runtime.setdefault('attempts',[]).append(vals[1])
            if runtime.get('missing_handler'):raise ValueError('android.content.ActivityNotFoundException')
            if runtime.get('security_denied'):raise ValueError('java.lang.SecurityException')
            runtime.setdefault('launched',[]).append(vals[1]);return None
        if owner=='android/net/Uri':
            if name=='parse':return urlsplit(vals[0])
            if name=='getHost':return vals[0].hostname
            if name=='getPath':return unquote(vals[0].path)
            if name=='toString':return vals[0].geturl()
        if owner=='android/util/Base64':return base64.b64decode(vals[0],validate=False)
        if owner=='org/json/JSONObject' and name=='optString':return vals[0]['data'].get(vals[1],vals[2] if len(vals)>2 else '')
        if owner=='java/lang/String':
            a=vals[0]
            return {'equals':lambda:a==vals[1],'startsWith':lambda:a.startswith(vals[1]),'endsWith':lambda:a.endswith(vals[1]),'toLowerCase':lambda:a.lower(),'matches':lambda:bool(re.fullmatch(vals[1],a)),'lastIndexOf':lambda:a.rfind(chr(vals[1]) if isinstance(vals[1],int) else vals[1]),'substring':lambda:a[vals[1]:vals[2]] if len(vals)>2 else a[vals[1]:],'concat':lambda:a+vals[1],'length':lambda:len(a),'toString':lambda:a}[name]()
        if owner=='java/lang/Boolean' and name=='booleanValue':return vals[0]
        if name=='iterator':return {'iterator':iter(vals[0]),'next':None,'ready':False}
        if name=='hasNext':
            it=vals[0]
            if it['ready']:return True
            try:it['next']=next(it['iterator']);it['ready']=True;return True
            except StopIteration:return False
        if name=='next':it=vals[0];it['ready']=False;return it['next']
        if name=='add':
            if isinstance(vals[0],set):vals[0].add(vals[1])
            else:vals[0].append(vals[1])
            return True
        if name=='contains':return vals[1] in vals[0]
        if name.startswith('get') or name=='isPartner':
            key=name[3:4].lower()+name[4:] if name.startswith('get') else 'isPartner'
            return vals[0].get(key)
        raise AssertionError('Unimplemented invocation '+ref)
    for _ in range(20000):
        line=lines[pc];pc+=1
        try:
            op=line.split(' ',1)[0]
            if op.startswith('const-string'):
                dest,literal=line.split(' ',1)[1].split(', ',1);r[dest]=json.loads(literal)
            elif op.startswith('const'):
                dest,n=line.split(' ',1)[1].split(', ',1);r[dest]=int(n,16)
            elif op=='sget-object':r[line.split()[1].rstrip(',')]='Locale.ROOT'
            elif op.startswith('move-result'):r[line.split()[1]]=result
            elif op.startswith('move-object') or op=='move':
                a,b=line.split(' ',1)[1].split(', ');r[a]=r[b]
            elif op=='check-cast':pass
            elif op=='and-int':
                dest,a,b=line.split(' ',1)[1].split(', ');r[dest]=r[a]&r[b]
            elif op=='instance-of':
                dest,a,typ=line.split(' ',1)[1].split(', ');r[dest]=isinstance(r[a],dict) and typ.strip('L;') in [r[a].get('__type'),*r[a].get('__isa',[])]
            elif op=='new-instance':
                dest,typ=line.split(' ',1)[1].split(', ');typ=typ.strip('L;');r[dest]=[] if typ=='java/util/ArrayList' else set() if typ=='java/util/HashSet' else {'__type':typ}
            elif op.startswith('invoke-'):
                ref=line.split('}, ',1)[1]
                error=invocation_error(root,op,ref)
                assert error is None, error # Synthetic objects cannot hide a DEX invoke-kind error.
                names=line.split('{',1)[1].split('}',1)[0]
                if ' .. ' in names:
                    first,last=names.split(' .. ');reg=[first[0]+str(i) for i in range(int(first[1:]),int(last[1:])+1)]
                else:reg=names.split(', ') if names else []
                result=call(ref,[r[a] for a in reg])
            elif op.startswith('if-'):
                args_=line.split(' ',1)[1].split(', ');target=int(args_[-1][1:]);vals=[value(r[a]) for a in args_[:-1]]
                truth=(vals[0] is not None and vals[0]!=0) # empty Java collections/strings are nonnull!
                take={'if-eqz':lambda:not truth,'if-nez':lambda:truth,'if-eq':lambda:vals[0]==vals[1],'if-ne':lambda:vals[0]!=vals[1],'if-ltz':lambda:vals[0]<0}[op]()
                if take:pc=target
            elif op.startswith('goto'):pc=int(line.split('@')[1])
            elif op=='move-exception':r[line.split()[1]]=None
            elif op.startswith('return'):return value(r[line.split()[1]])
            else:raise AssertionError('Unsupported helper opcode '+line)
        except (ValueError,UnicodeError,json.JSONDecodeError) as err:
            # All helpers with parser catches use a single fail-open return label.
            assert '.catch Ljava/lang/Exception;' in raw, str(err)
            if sig.startswith('morpheSection'):return None
            return False
    raise AssertionError('Helper loop did not terminate '+sig)


def verify_models(root, ads, premium, tracking, check):
    def obj(typ,**kw):return {'__type':OBJ+typ,**kw}
    def link(kind='article',url='https://www.nu.nl/algemeen/story',partner=None):
        fields=[obj('FirebaseTrackingKeyValue',key='teaser_type',value=kind)]
        event=obj('FirebaseTrackingEvent',eventName='teaser_click',fields=fields)
        target=obj('UrlTarget',url=url,trackers=obj('TargetTrackers',activate=[event]))
        flavor={'__type':'nl/nu/performance/api/client/unions/SmallArticleLinkFlavor','isPartner':partner}
        return obj('Link',target=target,linkFlavor=flavor)
    def block(typ,section,ordinal,**kw):
        id_=base64.b64encode(json.dumps({'id':f'undefined-section-{section}-1234-{ordinal}','containerId':'synthetic-screen'}).encode()).decode()
        return {'__type':APP+'bff/domain/models/BlockData$Default','block':obj(typ,id=id_,**kw)}
    if ads:
        sig='morpheCommercialLink(Lnl/nu/performance/api/client/objects/Link;)Z'
        if not has(root,TRANSFORMER,sig):check(False,'Commercial child predicate executable');return
        cases=[(link('advertorial'),True),(link(partner=True),True),(link(url='https://shop.nu.nl/product'),True),(link(url='https://www.nu.nl/nushop/offer'),True),(link(url='https://nu.nl/nushop'),True),(link(url='https://tweakers.net/editorial'),False),(link('player'),False),(link(url='https://notshop.nu.nl/a'),False),(link(url='https://nu.nl.evil.test/nushop/a'),False),(link(url='https://www.nu.nl/nushop-extra/a'),False)]
        for value,expected in cases:check(bool(execute(root,TRANSFORMER,sig,[value]))==expected,'Commercial predicate '+repr(value))
        commercial=block('LinkBlock',32,4,link=link('advertorial'))
        normal=block('LinkBlock',33,2,link=link('article'))
        fixture=[block('DividerBlock',32,1),block('HeaderBlock',32,2),block('TextBlock',32,3),commercial,block('DividerBlock',33,1),normal,block('LinkBlock',34,1,link=link(url='https://shop.nu.nl/x')),block('LinkBlock',35,1,link=link('article'))]
        result=execute(root,TRANSFORMER,'morpheFilterAds(Ljava/util/List;)Ljava/util/List;',[fixture])
        check(result==[fixture[4],normal,fixture[7]],'Remove commercial sections/chrome; retain adjacent article and games')
        check(all(x is not None for x in result),'Never inject null BlockData')
        # A native banner must not classify its surrounding editorial CMS section.
        banner=block('DpgBannerBlock',33,3)
        check(execute(root,TRANSFORMER,'morpheFilterAds(Ljava/util/List;)Ljava/util/List;',[[banner,normal]])==[normal],'Banner removal preserves its editorial section')
        screen=link(url='https://www.nu.nl/nushop/archive');screen['target']['__type']=OBJ+'ScreenTarget'
        check(execute(root,TRANSFORMER,sig,[screen]),'Commercial internal ScreenTarget path')
        empty=link();empty['target']=None
        check(not execute(root,TRANSFORMER,sig,[empty]),'Nullable target remains editorial')

        for plain in ['normal-plaintext-id','invalid base64 !']:
            b={'__type':APP+'bff/domain/models/BlockData$Default','block':obj('WebAppBlock',id=plain)}
            check(execute(root,TRANSFORMER,'morpheFilterAds(Ljava/util/List;)Ljava/util/List;',[[b]])==[b],'Fail-open malformed/plain IDs')
    if premium:
        sig='morpheFilterPremium(Ljava/util/List;)Ljava/util/List;'
        if not has(root,TRANSFORMER,sig):check(False,'Premium notice filter executable');return
        def web(id_):return {'__type':APP+'bff/domain/models/BlockData$Default','block':obj('WebAppBlock',id=id_)}
        ordinary=web('embedded-chart');notice=web('contentBlocker-12345')
        title={'__type':APP+'bff/domain/models/BlockData$Default','block':obj('HeaderBlock',id='contentBlocker-editorial-title')}
        check(execute(root,TRANSFORMER,sig,[[ordinary,notice,title]])==[ordinary,title],'Remove only WebAppBlock contentBlocker notice')
    if ads:
        sig='morpheWebBlocked(Ljava/lang/String;)Z'
        if not has(root,INLINE,sig):check(False,'Executable scoped WebView policy');return
        blocked=['https://applets.ebxcdn.com/ebx.js','https://APPLETS.EBXCDN.COM/x','https://o123.ingest.sentry.io/api/1/envelope','https://www.googletagmanager.com/gtm.js','https://dev.visualwebsiteoptimizer.com/j.php','https://advertising-module.api.dpgmedia.cloud/web/nunl','https://pg.dpgmedia.net/api/metrics','https://prd.jwpltx.com/v1','https://phx.bmtrcs.com/x']
        allowed=['https://www.nu.nl/blocks','https://graph.nu.nl/graphql','https://content.jwplatform.com/playlists/x','https://login.dpgmedia.nl/authorize','https://pg.dpgmedia.net/api/consent','https://pg.dpgmedia.net/api/metrics-extra','https://example.com/path/applets.ebxcdn.com','https://notapplets.ebxcdn.com/x','https://sentry.io.evil.test/x','https://nu.nl/nushop','https://comments.firebaseio.com/comments/1','https://www.nu.nl/assets/index.js']
        ad_urls=['https://advertising-module.api.dpgmedia.cloud/web/nunl','https://advertising-cdn.dpgmedia.cloud/script.js','https://pubads.g.doubleclick.net/gampad/ads']
        if not tracking:allowed += [u for u in blocked if u not in ad_urls];blocked=[]
        blocked += ad_urls
        for url in blocked+allowed:check(bool(execute(root,INLINE,sig,[url]))==(url in blocked),'Scoped WebView URL '+url)


PRIVACY_CLIENT = APP+'morphe/PrivacyWebViewClient'
PRIVACY_FACTORY = 'be/dpgmedia/privacy/privacygatesdk/ui/WebViewFactory'
PRIVACY_FACTORY_SIG = 'createWebView(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;)Landroid/webkit/WebView;'
PRIVACY_FACTORY_HASH = '1754902f300564707c1715456aa316401fc952164950a83a1e7b3806a3cb9d0e'

def verify_privacy_navigation(root, check):
    modern='shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z'
    legacy='shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z'
    check(has(root,PRIVACY_CLIENT,modern),'Clientless main-frame navigation policy installed')
    check(has(root,PRIVACY_CLIENT,legacy),'Clientless legacy navigation policy installed')
    if not has(root,PRIVACY_CLIENT,modern) or not has(root,PRIVACY_CLIENT,legacy):return
    activity={'__type':'android/app/Activity','packageName':'nl.sanomamedia.android.nu'}
    wrapper={'__type':'android/view/ContextThemeWrapper','__isa':['android/content/ContextWrapper'],
             'baseContext':activity,'packageName':activity['packageName']}
    def navigate(url, main=True, gesture=True, redirect=False, context=wrapper, **options):
        runtime=dict(options)
        request={'url':url,'main':main,'gesture':gesture,'redirect':redirect}
        result=execute(root,PRIVACY_CLIENT,modern,[{}, {'context':context},request],runtime)
        return bool(result),runtime
    for url in ['https://www.dpgmediaprivacy.nl/privacy','tel:+31123456789']:
        result,events=navigate(url)
        check(result and len(events.get('launched',[]))==1,'External main-frame navigation '+url)
        intent=events['launched'][0]
        check(intent['uri']==url and intent['categories']=={'android.intent.category.BROWSABLE'} and
              intent['component'] is None and intent['selector'] is None and
              intent['extras'].get('com.android.browser.application_id')==activity['packageName'],
              'Framework-equivalent sanitized browsing intent '+url)
    result,events=navigate('intent://sample#Intent;scheme=sample;end',intent_flags=0xffffffff,
                           intent_component='untrusted/component',intent_selector={'untrusted':True})
    check(result and events['launched'][0]['flags']==0x3c083810 and events['launched'][0]['selector'] is None
          and events['launched'][0]['component'] is None,'Sanitize parsed intent flags/component/selector')
    legacy_events={}
    check(execute(root,PRIVACY_CLIENT,legacy,[{}, {'context':wrapper},'tel:+31123456789'],legacy_events) and bool(legacy_events.get('launched')),'Legacy callback keeps external-scheme handling')
    result,events=navigate('https://login.dpgmedia.nl/redirect',gesture=False,redirect=True)
    check(result and bool(events.get('launched')),'Preserve clientless external redirects')
    result,events=navigate('https://www.nu.nl/script-navigation',gesture=False)
    check(result and not events.get('attempts'),'Deny gesture-less non-redirect intent, as clientless WebView does')
    for url in ['about:blank','chrome://version','file:///android_asset/privacy.html','file:///android_res/raw/privacy.html']:
        result,events=navigate(url)
        check(not result and not events.get('attempts'),'Keep framework internal URL '+url)
    for options in [{'missing_handler':True},{'security_denied':True},{'malformed_uri':True}]:
        result,events=navigate('unknownscheme://example',**options)
        check(not result and not events.get('launched'),'Gracefully decline unavailable/malformed external intent '+str(options))
    result,events=navigate('https://example.com',context={'__type':'android/app/Application','packageName':activity['packageName']})
    check(not result and not events.get('attempts'),'Non-Activity fallback never starts an external activity')
    result,events=navigate('https://www.nu.nl/subframe',main=False)
    check(not result and not events.get('attempts'),'Subframe navigation stays in WebView')
    # Android does not call shouldOverrideUrlLoading for app-initiated loadUrl.
    # The original factory loadUrl is digest-preserved and no lifecycle/resource
    # callback may introduce external dispatch for that initial load.
    for name,sig in [('onPageStarted','(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V'),
                     ('onLoadResource','(Landroid/webkit/WebView;Ljava/lang/String;)V')]:
        check(not has(root,PRIVACY_CLIENT,name+sig),'Initial load/resource callback never opens an activity '+name)
    check(any('WebView;->loadUrl(' in x for x in method(root,PRIVACY_FACTORY,PRIVACY_FACTORY_SIG)),
          'Preserve app-initiated initial loadUrl')
    for arg in ['Ljava/lang/String;','Landroid/webkit/WebResourceRequest;']:
        code=method(root,PRIVACY_CLIENT,'shouldInterceptRequest(Landroid/webkit/WebView;'+arg+')Landroid/webkit/WebResourceResponse;')
        check(not any('startActivity' in x or 'morpheOpenExternal' in x for x in code),
              'Resource interception never opens external activities '+arg)


def verify_privacy_web(root, ads, check):
    files=list(root.glob('smali*/'+PRIVACY_CLIENT+'.smali'))+list(root.glob('smali/smali*/'+PRIVACY_CLIENT+'.smali'))
    check(bool(files)==ads,'Manual privacy WebView request client installed')
    original=canonical_method(root,PRIVACY_FACTORY,PRIVACY_FACTORY_SIG)
    removed=[i for i,x in enumerate(original) if PRIVACY_CLIENT in x or 'WebView;->setWebViewClient(' in x]
    check((len(removed)==3)==ads,'Manual privacy factory attaches scoped request client')
    kept=[re.sub(r'@(\d+)',lambda m:'@'+str(int(m[1])-sum(i<int(m[1]) for i in removed)),x) for i,x in enumerate(original) if i not in removed]
    check(hashlib.sha256('\n'.join(kept).encode()).hexdigest()==PRIVACY_FACTORY_HASH,'Preserve manual privacy factory bridges/settings/cookies and branches')
    if ads and files:
        check(method(root,PRIVACY_CLIENT,'<init>()V')==['invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V','return-void'],'Plain privacy client constructor')
        for arg in ['Ljava/lang/String;','Landroid/webkit/WebResourceRequest;']:
            code=method(root,PRIVACY_CLIENT,'shouldInterceptRequest(Landroid/webkit/WebView;'+arg+')Landroid/webkit/WebResourceResponse;')
            check(any('->morpheWebResponse(' in x for x in code),'Manual privacy request delegation '+arg)
        verify_privacy_navigation(root,check)


BFF_ENGINE = APP+'tracking/engine/TrackingEngineImpl'
BFF_EVENT_SIG = 'trackBFFEvent(Lnl/nu/performance/api/client/objects/BFFEvent;)V'
BFF_EVENT_BODY_HASH = '3cfcd947e461dfb1521852074ca8df440a016f08b189f673e0f7155e0eb95568'
BFF_EVENT_COROUTINE_HASH = '841cc4ab1211cd2bb00cfb73befe4427bb2444df6a98c87ced1934cb2822173e'

def verify_functional_onboarding(root, tracking, check):
    helper='morpheFunctionalOnboardingEvent(Lnl/nu/performance/api/client/objects/BFFEvent;)Z'
    code=canonical_method(root,BFF_ENGINE,BFF_EVENT_SIG)
    prefix=['invoke-static {p1}, L'+BFF_ENGINE+';->'+helper,'move-result v0','if-nez v0, @4','return-void']
    check((code[:4]==prefix)==tracking,'Keep exact functional onboarding acknowledgements in BFF dispatcher')
    skip=4 if tracking else 0
    body=canonical_method(root,BFF_ENGINE,BFF_EVENT_SIG,skip)
    check(hashlib.sha256('\n'.join(body).encode()).hexdigest()==BFF_EVENT_BODY_HASH,'Preserve original BFF acknowledgement coroutine launch/body')
    coroutine=canonical_method(root,BFF_ENGINE+'$trackBFFEvent$1','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')
    check(hashlib.sha256('\n'.join(coroutine).encode()).hexdigest()==BFF_EVENT_COROUTINE_HASH,'Preserve original HandleEvent mutation, completion and response/cookie path')
    check(has(root,BFF_ENGINE,helper)==tracking,'Install narrow functional-event predicate')
    if not tracking or not has(root,BFF_ENGINE,helper):return
    def event(type_,data):return {'__type':OBJ+'BFFEvent','eventType':type_,'data':data}
    def encode(value):return base64.b64encode(json.dumps(value,separators=(',',':')).encode()).decode()
    allowed=[event('wncCardShownEvent',encode(card)) for card in ['breakingNews','promoteLogin','followTopics']]
    denied=[None,event(None,encode('breakingNews')),event('profileEventOccurredEvent',encode('breakingNews')),
            event('analyticsEvent',encode('promoteLogin')),event('wncCardShownEvent ',encode('followTopics')),
            event('wncCardShownEvent',encode('unknownCard')),event('wncCardShownEvent','not-base64!'),
            event('wncCardShownEvent',None),event('wncCardShownEvent',''),
            event('wncCardShownEvent',encode({'card':'breakingNews'})),
            event('wncCardShownEvent',base64.b64encode(b' "breakingNews" ').decode()),
            event('wncCardShownEvent',encode('breakingNews').rstrip('='))]
    for value in allowed:check(bool(execute(root,BFF_ENGINE,helper,[value])),'Admit evidenced onboarding acknowledgement '+value['data'])
    for value in denied:check(not execute(root,BFF_ENGINE,helper,[value]),'Deny analytics/unknown/malformed/noncanonical event '+repr(value))


def verify(root, selected):
    ads=bool(selected & {'Hide ads','Disable tracking','Skip consent screens'})
    tracking=bool(selected & {'Disable tracking','Skip consent screens'})
    premium='Hide Premium banner' in selected
    consent='Skip consent screens' in selected
    errors=[]
    def check(ok,label):
        if not ok: errors.append(label)
    def prefix(cls,sig,code,enabled):
        actual=method(root,cls,sig)
        matches=actual[:len(code)]==code or actual[:len(code)]==[re.sub(r'\bv0\b','p0',line) for line in code]
        check(matches==enabled, f'{cls}->{sig} expected patched={enabled}')
    for cls,sig in AD_STOP:prefix(cls,sig,['return-void'],ads)
    for cls,sig in AD_NULL:prefix(cls,sig,['const/4 v0, 0x0','return-object v0'],ads)
    for cls,sig in TRACK_STOP:prefix(cls,sig,['return-void'],tracking)
    for cls,sig in TRACK_FALSE:prefix(cls,sig,['const/4 v0, 0x0','return v0'],tracking)
    for cls,sig in TRACK_UNIT+CONSENT_UNIT:prefix(cls,sig,['sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;','return-object v0'],consent if (cls,sig) in CONSENT_UNIT else tracking)
    for cls,sig in TRACK_EMPTY:prefix(cls,sig,['const-string v0, ""','return-object v0'],tracking)
    prefix(APP+'tracking/userprofilesdk/UserProfileIdProvider','getAllIds()Ljava/util/Map;', ['invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;','move-result-object v0','return-object v0'],tracking)
    prefix('be/persgroep/advertising/banner/xandr/service/BrandMetricsService','call(Ljava/lang/String;Ljava/lang/Integer;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;', ['const/4 v0, 0x0','return-object v0'],tracking)
    transform=method(root,TRANSFORMER,'transformBlockData(Ljava/util/List;)Ljava/util/List;')
    for control,enabled in [('Ads',ads),('Premium',premium)]:
        check(any('->morpheFilter'+control+'(' in l for l in transform)==enabled,'Transform safe nonnull list '+control)
    nested=method(root,APP+'bff/data/mappers/BlockMapper','adaptToLinkDataOrNull(Lnl/nu/performance/api/client/objects/Link;Ljava/lang/String;)Lnl/nu/android/bff/domain/models/LinkData;')
    check(any('->morpheCommercialLink(' in l for l in nested)==ads,'Nullable carousel/paired child commercial filter')
    for cls in CLIENTS:
        check(has(root,cls,'shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;')==ads,'Web client legacy policy '+cls)
        if ads:
            for arg in ['Ljava/lang/String;','Landroid/webkit/WebResourceRequest;']:
                sig='shouldInterceptRequest(Landroid/webkit/WebView;'+arg+')Landroid/webkit/WebResourceResponse;'
                if not has(root,cls,sig):continue
                code=method(root,cls,sig)
                check(any('->morpheWebResponse(' in l for l in code),'Web client request sink '+cls+' '+arg)
    js=resource(root,'assets/jwplayer/jwpsrv.js').read_text()
    check(('function Oe(e,a){return;' in js)==tracking,'JW pixel dispatch stopped')
    check('registerPlugin' in js and 'getTrackingPixelURLs' in js,'JW API retained')
    check(resource(root,'assets/containers/GTM-WHQHCXT.json').exists()!=tracking,'GTM container removed')
    manifest=ET.parse(resource(root,'AndroidManifest.xml'))
    md={e.get(A+'name'):e.get(A+'value') for e in manifest.iter('meta-data')}
    for name in FLAGS_TRUE: check((md.get(name)=='true')==tracking,'Hard flag '+name)
    for name in FLAGS_FALSE:check((md.get(name)=='false')==tracking,'Hard flag '+name)
    for e in manifest.iter():
        name=e.get(A+'name','')
        if name=='com.google.android.gms.ads.MobileAdsInitProvider':check((e.get(A+'enabled')=='false')==ads,'Disable ads provider')
        if name in ['com.google.android.gms.ads.AdService','com.google.android.gms.measurement.AppMeasurementReceiver','com.google.android.gms.measurement.AppMeasurementService','com.google.android.gms.measurement.AppMeasurementJobService','com.google.android.gms.tagmanager.TagManagerService','com.google.android.gms.tagmanager.TagManagerPreviewActivity']:
            check((e.get(A+'enabled')=='false')==tracking,'Disable component '+name)
    check(('com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar' not in md)==tracking,'Remove Analytics registrar')
    for registrar in ['com.google.firebase.messaging.FirebaseMessagingRegistrar','com.google.firebase.installations.FirebaseInstallationsRegistrar','com.google.firebase.remoteconfig.RemoteConfigRegistrar','com.google.firebase.database.DatabaseRegistrar','com.google.firebase.crashlytics.CrashlyticsRegistrar','com.google.firebase.perf.FirebasePerfRegistrar']:
        check('com.google.firebase.components:'+registrar in md,'Preserve functional registrar '+registrar)
    perms={e.get(A+'name') for e in manifest.iter('uses-permission')}
    check(('com.google.android.gms.permission.AD_ID' not in perms)==tracking,'Remove AD_ID')
    check({'android.permission.INTERNET','android.permission.POST_NOTIFICATIONS'}<=perms,'Retain content and push permissions')
    for cls,sig,label,skip in [('nl/nu/android/bff/domain/data_integrity/ScreenTransformerImpl', 'transformBlockData(Ljava/util/List;)Ljava/util/List;', 'transform', None), ('nl/nu/android/bff/data/mappers/BlockMapper', 'adaptToLinkDataOrNull(Lnl/nu/performance/api/client/objects/Link;Ljava/lang/String;)Lnl/nu/android/bff/domain/models/LinkData;', 'child', None), ('com/longtailvideo/jwplayer/h/d/c', 'shouldInterceptRequest(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Landroid/webkit/WebResourceResponse;', 'jw', None)]:
        skip = (2*int(ads)+2*int(premium)) if label=="transform" else 5*int(ads) if label=="child" else 8*int(ads)
        check(hashlib.sha256("\n".join(canonical_method(root,cls,sig,skip)).encode()).hexdigest()=={'transform': 'f4f2a987a7f153b0176788351babf711a6eeb6ebbd013a9ff05db0120eae7491', 'child': '8152171324a00035cb836ca4ef1248da6bc8bb8a6fcdd0ee9143ed8b505f7c8d', 'jw': 'c4f133a9b23f78d24f417f5e8ea618c48972d1b5f2b6a062fc1344af0e501099'}[label],"Preserve original "+label+" body")
    for key,digest in RETAINED.items():
        cls,sig=key.split('->');actual=hashlib.sha256('\n'.join(canonical_method(root,cls,sig)).encode()).hexdigest()
        check(actual==digest,'Preserve '+key)
    if tracking:
        # Syntax and real JS pixel execution, preserving the plugin's remaining script.
        result=subprocess.run(['node','--check'],input=js,text=True,capture_output=True)
        check(result.returncode==0,'JW JS syntax')
        pixel=js[js.index('function Oe(e,a)'):js.index('var Le=',js.index('function Oe(e,a)'))]
        result=subprocess.run(['node','-e',pixel+';global.Image=function(){throw Error("tracking image created")};Oe({},"https://prd.jwpltx.com/v1");'],text=True,capture_output=True)
        check(result.returncode==0,'JW pixel function emits no image')
    verify_functional_onboarding(root,tracking,check)
    from nunl_onboarding import verify as verify_optional_onboarding
    verify_optional_onboarding(root,consent)
    valid_dispatch=verify_dispatch(root,check)
    if valid_dispatch:
        verify_models(root,ads,premium,tracking,check)
        verify_privacy_web(root,ads,check)
    if errors:raise AssertionError('\n'.join(errors))
    print('PASS NU.nl: '+(', '.join(sorted(selected)) or 'original'))

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('decoded',type=Path);p.add_argument('-e',dest='selected',action='append',default=[],choices=sorted(NAMES));a=p.parse_args();verify(a.decoded,set(a.selected))
