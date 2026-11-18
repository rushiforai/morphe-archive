"""Verify independently decoded Trouw 7.53.1. No flags asserts original behavior."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET
from urllib.parse import urlsplit, unquote
from verify_weerplaza import method as _method, canonical_method as _canonical, resource

def method(*args):return [x.replace('const-string/jumbo ','const-string ') for x in _method(*args)]
def canonical(*args):return [x.replace('const-string/jumbo ','const-string ') for x in _canonical(*args)]
NAMES={'Hide ads','Disable tracking','Hide Premium banner','Skip consent screens','Read full articles'}
A='{http://schemas.android.com/apk/res/android}'
E='nl/persgroep/edition/'
CLIENTS=[E+'component/web/ui/DefaultWebViewClient',E+'embed/webview/ui/EmbedWebViewViewModel$EmbedWebViewClient']
COMSCORE_NATIVE = ['flushOfflineCacheNative()V',
 'notifyDistributedContentViewEventNative(Ljava/lang/String;Ljava/lang/String;)V',
 'notifyEnterForegroundNative()V',
 'notifyExitForegroundNative()V',
 'notifyHiddenEventEventInfoNative(J)V',
 'notifyHiddenEventNative(Ljava/util/Map;)V',
 'notifyUxActiveNative()V',
 'notifyUxInactiveNative()V',
 'notifyViewEventEventInfoNative(J)V',
 'notifyViewEventNative(Ljava/util/Map;)V',
 'startNative()V']
TARGETS = {'AD_NULL': [['nl/persgroep/edition/advertisement/presentation/AdvertisementLoadingHandler',
              'load(Landroid/content/Context;Landroidx/lifecycle/LifecycleOwner;Lnl/persgroep/edition/advertisement/domain/model/Advertisement;Lnl/persgroep/edition/feature/component/tracking/legacy/PageViewType;Lkotlin/jvm/functions/Function1;)Landroid/view/ViewGroup;'],
             ['be/persgroep/advertising/banner/AdvertisingSDK',
              'load(Landroid/content/Context;Landroidx/lifecycle/LifecycleOwner;Lbe/persgroep/advertising/banner/model/AdConfig;Lbe/persgroep/advertising/banner/base/AdResponseListener;Ljava/lang/String;)Landroid/view/ViewGroup;'],
             ['be/persgroep/advertising/banner/AdvertisingSDK',
              'loadAd(Landroid/content/Context;Landroidx/lifecycle/LifecycleOwner;Ljava/lang/String;Lbe/persgroep/advertising/banner/base/AdResponseListener;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)Landroid/view/ViewGroup;']],
 'AD_FALSE': [['be/persgroep/advertising/banner/config/FeatureFlags', 'getDfpEnabled()Z'],
              ['be/persgroep/advertising/banner/config/FeatureFlags', 'getOptOutEnabled()Z'],
              ['be/persgroep/advertising/banner/config/FeatureFlags', 'getPrebidEnabled()Z'],
              ['be/persgroep/advertising/banner/config/FeatureFlags', 'getXandrEnabled()Z'],
              ['nl/dpgmedia/publishingservices/videosdk/internal/player/data/model/VideoProduction',
               'getAdsEnabled()Z']],
 'AD_STOP': [['be/persgroep/advertising/banner/base/performance/PerformanceTracker',
              'initialise(Ljava/lang/Boolean;)V'],
             ['be/persgroep/advertising/banner/base/performance/PerformanceTracker',
              'track(Lbe/persgroep/advertising/banner/base/performance/PerformanceEvent;)V']],
 'AD_UNIT': [['be/persgroep/advertising/banner/AdvertisingSDK$1',
              'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;']],
 'TRACK_STOP': [['nl/persgroep/edition/domain/analytics/events/tracking/AnalyticsDispatcherImpl',
                 'sendPendingEvents()V'],
                ['nl/persgroep/edition/domain/analytics/events/tracking/AnalyticsDispatcherImpl',
                 'sendTrackingEvent(Lnl/persgroep/edition/feature/component/tracking/model/event/TrackingEvent;)V'],
                ['nl/persgroep/edition/domain/analytics/events/tracking/AnalyticsDispatcherImpl',
                 'track(Lnl/persgroep/edition/feature/component/tracking/model/event/TrackingEvent;)V'],
                ['nl/persgroep/edition/domain/analytics/events/tracking/AnalyticsDispatcherImpl',
                 'updateConsent(ZZ)V'],
                ['nl/persgroep/edition/domain/analytics/events/tracking/FirebaseTracker',
                 'trackEvent(Lnl/persgroep/edition/feature/component/tracking/model/event/FirebaseTrackingEvent;)V'],
                ['nl/persgroep/edition/domain/analytics/events/tracking/FirebaseTracker', 'updateConsent(Z)V'],
                ['nl/persgroep/edition/application/startup/task/TrackingStartupTask', 'onStartup()V'],
                ['nl/persgroep/edition/application/startup/task/CrashlyticsStartupTask', 'onStartup()V'],
                ['nl/persgroep/edition/application/startup/task/UsabillaStartupTask', 'onStartup()V'],
                ['be/persgroep/tracking/TrackingSDK',
                 'track(Lbe/persgroep/tracking/base/model/TrackingEvent;)V'],
                ['be/persgroep/tracking/snowplow/SnowplowManager',
                 'track(Lcom/snowplowanalytics/snowplow/event/Event;Lbe/persgroep/tracking/base/model/TrackingResponse;)V'],
                ['be/persgroep/tracking/snowplow/SnowplowManager',
                 'track(Lbe/persgroep/tracking/snowplow/model/SnowplowEvent;)V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker',
                 'addUserId()V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker',
                 'optInAndReapplyEventProperties()V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker',
                 'sendEvent(Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareEvent;)V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker',
                 'sendScreenView(Lnl/persgroep/edition/tracking/contract/models/PageContext;)V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker',
                 'syncPendingTracks()V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker',
                 'updateUserIdentity(Z)V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker',
                 'onMarketingConsentUpdate(Z)V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker',
                 'trackEvent(Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareEvent;)V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareTracker',
                 'trackScreenView(Lnl/persgroep/edition/tracking/contract/models/PageContext;)V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/cim/CimTrackerImpl',
                 'initializeCimSdk()V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/cim/CimTrackerImpl',
                 'track(Ljava/util/Map;)V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/cim/CimTrackerImpl',
                 'trackEvent(Ljava/util/Map;)V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/cim/CimTrackerImpl',
                 'updateConsent(Z)V'],
                ['nl/persgroep/edition/feature/component/tracking/domain/tracker/usabilla/UsabillaTracker',
                 'trackUsabillaEvent(Ljava/lang/String;)V'],
                ['nl/persgroep/edition/domain/analytics/comscore/ComscoreEventTransmitter',
                 'execute(Ljava/util/Map;)V'],
                ['com/comscore/Analytics', 'notifyViewEvent(Ljava/util/LinkedHashMap;)V'],
                ['net/persgroep/marketingtemplatessdk/implementations/piano/CxenseManager',
                 'trackPageView(Ljava/lang/String;)V'],
                ['be/persgroep/advertising/userprofile/config/InitConfigHandler', 'initialize()V'],
                ['be/persgroep/advertising/userprofile/IdManager', 'setExternalUserIds(Ljava/util/Map;)V'],
                ['nl/persgroep/edition/domaindata/userprofile/data/UserProfileRepositoryImpl',
                 'updateUserIds()V'],
                ['nl/dpgmedia/publishingservices/videosdk/internal/player/core/tracking/PlayerAnalyticsReducer',
                 'maybeDispatch(Lnl/dpgmedia/publishingservices/videosdk/core/analytics/VideoSdkAnalyticsDispatcher;Lnl/dpgmedia/publishingservices/videosdk/core/analytics/VideoSdkAnalyticsEvent;)V'],
                ['nl/dpgmedia/publishingservices/videosdk/internal/player/core/tracking/PlayerCimReducer',
                 'maybeDispatch(Lnl/dpgmedia/publishingservices/videosdk/core/cim/VideoSdkCimEvent;)V'],
                ['net/persgroep/pipoidcsdk/client/telemetry/TelemetryClient',
                 'register(Lnet/persgroep/pipoidcsdk/client/telemetry/MetricType;Ljava/lang/String;Ljava/lang/String;)V'],
                ['be/dpgmedia/privacy/privacygatesdk/client/metrics/MetricsClient',
                 'sendErrorMetric$privacygatesdk_release(Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorMessage;Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorType;Ljava/lang/String;)V'],
                ['com/google/firebase/perf/transport/TransportManager',
                 'syncLog(Lcom/google/firebase/perf/v1/PerfMetric$Builder;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V'],
                ['com/facebook/appevents/AppEventsLoggerImpl', 'flush()V'],
                ['com/facebook/appevents/AppEventsLoggerImpl',
                 'logEvent(Ljava/lang/String;DLandroid/os/Bundle;)V'],
                ['com/facebook/appevents/AppEventsLoggerImpl',
                 'logEvent(Ljava/lang/String;Landroid/os/Bundle;)V'],
                ['com/facebook/appevents/AppEventsLoggerImpl',
                 'logEvent(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;ZLjava/util/UUID;Lcom/facebook/appevents/OperationalData;)V'],
                ['io/heap/core/api/HeapApiImpl', 'attemptUploaderStart()V'],
                ['io/heap/core/api/HeapApiImpl', 'addUserProperties(Ljava/util/Map;Ljava/util/Date;)V'],
                ['io/heap/core/api/HeapApiImpl',
                 'eventCommitted(Lcom/contentsquare/proto/unifiedanalytics/ingest/v1/UnifiedAnalyticsEnvelopeProtos$Event;Lcom/contentsquare/proto/unifiedanalytics/ingest/v1/UnifiedAnalyticsEnvelopeProtos$BatchHeader;Lcom/contentsquare/core/statemanager/model/SdkState;)V'],
                ['io/heap/core/api/HeapApiImpl', 'identify(Ljava/lang/String;Ljava/util/Date;)V'],
                ['io/heap/core/api/HeapApiImpl', 'startRecording(Ljava/util/Date;)V'],
                ['io/heap/core/api/HeapApiImpl',
                 'track(Ljava/lang/String;Ljava/util/Map;Ljava/util/Date;Lio/heap/core/api/plugin/model/SourceInfo;Lio/heap/core/api/plugin/model/Pageview;)V'],
                ['io/heap/core/api/HeapApiImpl',
                 'trackComponentTransition(Ljava/util/List;Ljava/util/List;Ljava/util/Date;Lio/heap/core/api/plugin/model/SourceInfo;Lio/heap/core/api/plugin/model/Pageview;Ljava/util/List;)V'],
                ['io/heap/core/api/HeapApiImpl',
                 'trackNotificationInteraction(Lio/heap/core/api/model/NotificationInteractionProperties;Ljava/util/Date;Lio/heap/core/api/plugin/model/SourceInfo;)V'],
                ['io/heap/core/web/v4/HeapJsWebViewIntegration',
                 'register(Landroid/webkit/WebView;Ljava/util/Set;)V']],
 'PIANO_SEND': [['io/piano/android/cxense/SendTask', 'sendConversionEvents$sdk_release(Ljava/util/List;)V'],
                ['io/piano/android/cxense/SendTask', 'sendDmpEventsViaApi$sdk_release(Ljava/util/List;)V'],
                ['io/piano/android/cxense/SendTask',
                 'sendDmpEventsViaPersisted$sdk_release(Ljava/util/List;)V'],
                ['io/piano/android/cxense/SendTask', 'sendPageViewEvents$sdk_release(Ljava/util/List;)V']],
 'TRACK_MAP': [['be/persgroep/advertising/userprofile/IdManager', 'getCachedUserIds()Ljava/util/Map;'],
               ['be/persgroep/advertising/userprofile/IdManager',
                'getUserIdsWithoutPrivacyCheck()Ljava/util/Map;']],
 'TRACK_FALSE': [['com/google/firebase/crashlytics/internal/common/DataCollectionArbiter',
                  'isAutomaticDataCollectionEnabled()Z'],
                 ['nl/dpgmedia/publishingservices/videosdk/core/sdk/VideoSdkConfig', 'getTelemetryEnabled()Z'],
                 ['nl/dpgmedia/publishingservices/videosdk/internal/player/data/model/VideoProduction',
                  'getEnableCimTracking()Z']],
 'TRACK_RESULT': [['nl/dpgmedia/publishingservices/videosdk/internal/player/core/tracking/PlayerTelemetryDispatcher',
                   'dispatch-gIAlu-s(Lnl/dpgmedia/publishingservices/videosdk/core/telemetry/VideoSdkTelemetryEvent;[B)Ljava/lang/Object;'],
                  ['be/persgroep/advertising/userprofile/IdManager',
                   'fetch-IoAF18A(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;']],
 'CSQ_ATTACH': [['com/contentsquare/android/internal/features/webviewbridge/WebViewTrackingManager',
                 'a(Landroid/webkit/WebView;Lcom/contentsquare/android/api/bridge/xpf/XpfWebViewIdProvider;Lcom/contentsquare/android/api/csq/CsqWebViewApi;)V']],
 'ROUTER': [['nl/persgroep/edition/temptation/data/repository/MarketingTemplatesRouter',
             'resolveTemplate(Lnl/persgroep/edition/marketingtemplates/domain/model/MarketingTemplatesConfiguration;Ljava/util/List;Lnl/persgroep/edition/marketingtemplates/domain/model/MarketingTemplateContentMetaData;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;']],
 'LABEL': [['nl/persgroep/edition/ui/components/label/premium/PremiumLabelViewDataMapper',
            'invoke(ZLnl/persgroep/edition/viewdata/ViewDataString;Lnl/persgroep/edition/viewdata/ViewDataColor;)Lnl/persgroep/edition/ui/components/label/premium/PremiumLabelViewData;']],
 'CONSENT': [['nl/persgroep/feature/component/privacy/domain/ConsentManagerImpl',
              'refreshConsent(Landroid/app/Activity;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;']],
 'IMA': [['be/persgroep/advertising/video/ima/ImaManager', 'requestAds()V']]}
RETAINED = [('nl/persgroep/edition/article/data/converters/ArticleDtoMapper',
  'invoke(Lnl/persgroep/edition/article/data/datasource/remote/dto/ArticleDto;)Lnl/persgroep/edition/article/domain/model/Article;',
  'b0f936e36ec8c415312c46eb9b6e55042016d139aaa77089408e32bc80034c93'),
 ('nl/persgroep/edition/embed/webview/utils/EmbedWebViewFullyLoadedJSInterface',
  'notifyHeightUpdated()V',
  '6a9082c88f1902027d6cf19749666c45afacdfa8c2899ba175abb6279a1fb18b'),
 ('nl/persgroep/edition/component/web/ui/DefaultWebViewClient',
  'shouldOverrideUrlLoading(Ljava/lang/String;Z)Z',
  '3207c27dae40f75a3f05a944b70f0bb753467a4d926cad24034fd15d10c5d642'),
 ('nl/persgroep/edition/component/web/ui/DefaultWebViewClient',
  'onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V',
  '89eb84c05b690d4bb0fd3caf527d87a6ac10828cce40518042b59c148fc1bab5'),
 ('nl/persgroep/edition/component/web/ui/DefaultWebViewClient',
  'onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V',
  '228a6aee6090b1067f09f1baf17888a0bea9ab8f35f7399bb527f045975e134f'),
 ('nl/persgroep/edition/component/web/ui/DefaultWebViewClient',
  'onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V',
  '65e4426688959af96dfc470f235f5171a80f2e11b97ddfa622ee18a405b647e7'),
 ('nl/persgroep/edition/component/web/ui/DefaultWebViewClient',
  'onReceivedError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceError;)V',
  'dee4388f4aabadfde78a3c94c46196fdaa7637fd78f2d949b7f0747e2832a583'),
 ('nl/persgroep/edition/component/web/ui/DefaultWebViewClient',
  'onReceivedHttpError(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;Landroid/webkit/WebResourceResponse;)V',
  '60231284aa44af1fd6093b318d3ab6b5cb2bac561bf77b3f16bfa22f198aaae6'),
 ('nl/persgroep/edition/component/web/ui/DefaultWebViewClient',
  'shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z',
  'dc76c9949521473a3b6fea9661ca95be50fa50d46b6a4235383fd3c2d2693bbc'),
 ('nl/persgroep/edition/component/web/ui/DefaultWebViewClient',
  'shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z',
  '46025b095480d69084859e656f9e892bfd64293dbdcdb90c4ba4cb84d2cb5772'),
 ('nl/persgroep/edition/embed/webview/ui/EmbedWebViewViewModel$EmbedWebViewClient',
  'shouldOverrideUrlLoading(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)Z',
  '67bbf84a9ca82e9e880d72b7621b1c531c3434cf6a129bc01071eaa9872570ba'),
 ('nl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareStartupListener',
  'onCSQStartupCompleted()V',
  '2886a5dfbc16f08462bf29f749ace5abb8d66e0bd856f2e974c931c913c26b57'),
 ('nl/persgroep/edition/component/web/ui/MyEnvironmentActionMessageReceiverJSInterface',
  'postMessage(Ljava/lang/String;)V',
  '3ed3ef6121895591ea5aa14c00e753f55bfb75d1c7ab95630c94db98fe700f67'),
 ('nl/persgroep/feature/component/privacy/domain/ConsentManagerImpl',
  'resurfaceConsent(Landroid/app/Activity;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;',
  '8e5cf3d83c9c712eb66ffb77ba29267ca9b66903994d400c0bd0e30e7e9c32d7')]

# Independent Trouw originals retain Piano's EventRecord -> EventStatus callback
# conversion, alongside the 14 shared retained methods above.
RETAINED.append(('io/piano/android/cxense/SendTask',
    'notifyCallback(Ljava/util/List;Ljava/lang/Exception;)Lkotlin/Unit;',
    '279371eb9044595446e61f89d342a3be461b1a48a5ffeb33d648eadcbeb08912'))
# Catsure queue sync and heartbeat send real device/queue/playback state. Their
# server effects are unclassified; retain both boundaries and coroutines always.
RETAINED.extend([
 ('nl/dpgmedia/mcdpg/amalia/player/audio/tracking/catsure/CatsureHeartbeatRepository',
  'sendHeartbeat(Lnl/dpgmedia/mcdpg/amalia/player/audio/statemachine/model/AmaliaAudioPlayerState;Ljava/lang/String;)V',
  '6813b507fb892bedc0fc431d236074b84f2a119708907494c4ce803d0a4a237a'),
 ('nl/dpgmedia/mcdpg/amalia/player/audio/tracking/catsure/CatsureHeartbeatRepository$sendHeartbeat$1',
  'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',
  '0e0d1157f528534d20dec6af6ca970495f690fd187d04858400565d6fb350fe8'),
 ('nl/dpgmedia/mcdpg/amalia/audio/queue/catsure/CatsureQueueSyncRepository',
  'syncQueue(Lnl/dpgmedia/mcdpg/amalia/audio/queue/holder/CurrentQueue;)V',
  'de74fdd3f6d0c6a153d5dcd7947064592725a12c05d3271ee8ef3264129abd7b'),
 ('nl/dpgmedia/mcdpg/amalia/audio/queue/catsure/CatsureQueueSyncRepository$syncQueue$1',
  'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;',
  '847d0cf2d296d99e1c11b4d23c274c6517ad9cce5dd127d521f276815ba6d16c'),
])
OPTIONAL_STARTUP={
 'com.contentsquare.android.internal.features.initialize.CSQInitializer',
 'io.piano.android.cxense.CxSdkInitializer',
 'com.google.firebase.components:com.google.firebase.analytics.connector.internal.AnalyticsConnectorRegistrar',
 'com.google.firebase.components:com.google.firebase.sessions.FirebaseSessionsRegistrar',
 'com.google.firebase.components:com.google.firebase.inappmessaging.display.FirebaseInAppMessagingDisplayKtxRegistrar',
 'com.google.firebase.components:com.google.firebase.inappmessaging.display.FirebaseInAppMessagingDisplayRegistrar',
 'com.google.firebase.components:com.google.firebase.inappmessaging.FirebaseInAppMessagingKtxRegistrar',
 'com.google.firebase.components:com.google.firebase.inappmessaging.FirebaseInAppMessagingRegistrar',
}
AD_PERMISSIONS={
 'com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE',
 'com.google.android.gms.permission.AD_ID','android.permission.ACCESS_ADSERVICES_ATTRIBUTION',
 'android.permission.ACCESS_ADSERVICES_AD_ID','android.permission.AD_SERVICES_CONFIG',
 'android.permission.ACCESS_ADSERVICES_TOPICS','android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE',
}

def emitted(root,cls,signature,args):
    """Execute the emitted pure filters/dispatchers, including resolved branch targets."""
    code=canonical(root,cls,signature);regs={'p'+str(i):x for i,x in enumerate(args)};result=None;pc=0
    for _ in range(20000):
        line=code[pc];pc+=1
        if line.startswith('const-string'):
            dest,value=line.split(' ',1)[1].split(', ',1);regs[dest]=json.loads(value.replace("\\'", "'"))
        elif line.startswith(('const/4 ','const/16 ')):
            dest,value=line.split(' ',1)[1].split(', ',1);regs[dest]=int(value,16)
        elif line.startswith('move-result'):regs[line.split()[1]]=result
        elif line.startswith('move-object '):
            dest,src=line.split(' ',1)[1].split(', ');regs[dest]=regs[src]
        elif line.startswith('sget-object '):
            dest,ref=line.split(' ',1)[1].split(', ',1)
            regs[dest]='Locale.ROOT' if 'Locale;->ROOT' in ref else {'type':ref.split(':')[1]}
        elif line.startswith('instance-of '):
            dest,src,typ=line.split(' ',1)[1].split(', ');regs[dest]=isinstance(regs[src],dict) and regs[src].get('type')==typ
        elif line.startswith('check-cast '):pass
        elif line.startswith('new-instance '):
            dest,typ=line.split(' ',1)[1].split(', ')
            assert typ=='Ljava/util/ArrayList;',line
            regs[dest]=[]
        elif line.startswith('invoke-'):
            argnames=line.split('{',1)[1].split('}',1)[0];v=[regs[x] for x in argnames.split(', ')] if argnames else []
            ref=line.split('}, ',1)[1]
            if '->morphe' in ref:
                c,s=ref.split(';->');result=emitted(root,c[1:],s,v)
            elif 'Uri;->parse' in ref:result=urlsplit(v[0])
            elif 'Uri;->getHost' in ref:result=v[0].hostname
            elif 'String;->toLowerCase' in ref:result=v[0].lower()
            elif 'String;->equals' in ref:result=v[0]==v[1]
            elif 'String;->endsWith' in ref:result=v[0].endswith(v[1])
            elif 'String;->matches' in ref:result=re.fullmatch(v[1],v[0]) is not None
            elif '->iterator()' in ref:result={'values':v[0],'index':0}
            elif '->hasNext()' in ref:result=v[0]['index']<len(v[0]['values'])
            elif '->next()' in ref:
                result=v[0]['values'][v[0]['index']];v[0]['index']+=1
            elif 'List;->add' in ref:v[0].append(v[1]);result=True
            elif 'ArrayList;-><init>' in ref:pass
            elif 'EmbedBlockDto;->getContent' in ref:result=v[0]['content']
            elif 'ResultOf$Success;->getValue' in ref:result=v[0]['value']
            elif 'Article;->getStyle' in ref:result=v[0]['style']
            elif 'Article;->getBody' in ref:result=v[0]['body']
            elif 'ResultOfKt;->error' in ref:result={'type':'Lnl/persgroep/domain/base/ResultOf$Error;','error':v[0]}
            else:raise AssertionError('Unknown emitted operation '+line)
        elif line.startswith(('if-eqz ','if-nez ')):
            op,reg,target=line.replace(',','').split()
            if bool(regs[reg])==(op=='if-nez'):pc=int(target[1:])
        elif line.startswith('goto'):pc=int(line.split('@')[1])
        elif line.startswith('return'):return regs[line.split()[1]]
        else:raise AssertionError('Unknown emitted instruction '+line)
    raise AssertionError('Emitted method did not terminate '+cls+'->'+signature)

def verify_filters(root,ads,tracking):
    if not ads:return
    blocked_ads=['https://advertising-cdn.dpgmedia.cloud/web-advertising/prebid.js','https://adsdk.microsoft.com/ast/ast.js','https://pubads.g.doubleclick.net/gampad/ads','https://ADNXS.COM/x','https://cdn.optoutadvertising.com/script/ootag.v2.min.js']
    blocked_tracking=['https://t.contentsquare.net/uxa/tag.js','https://c.dpgmedia.net/sync','https://www.googletagmanager.com/gtm.js','https://tracker.prd.dpge.be/heartbeat','https://api.cxense.com/x','https://gabe.hit.gemius.pl/x','https://cdn.brandmetrics.com/survey/script/x.js','https://dev.visualwebsiteoptimizer.com/ee.gif']
    allowed=['https://datawrapper.dwcdn.net/abc/1/','https://www.trouw.nl/story/embed','https://mobile2.trouw.nl/article/v1/123','https://www.youtube.com/embed/abc','https://platform.twitter.com/widgets.js','https://account.dpgmedia.nl/login','https://www.trouw.nl/path?next=contentsquare.net','https://notcontentsquare.net/x','https://contentsquare.net.evil.test/x','https://notdoubleclick.net/x','https://doubleclick.net.evil.test/x','https://c2.volkskrant.nl/pixel','https://vx.volkskrant.nl/t','about:blank','data:text/html,hello','not a URI','',None]
    for cls in CLIENTS:
        for url in blocked_ads:assert emitted(root,cls,'morpheWebBlocked(Ljava/lang/String;)Z',[url]),url
        for url in blocked_tracking:assert bool(emitted(root,cls,'morpheWebBlocked(Ljava/lang/String;)Z',[url]))==tracking,url
        for url in allowed:assert not emitted(root,cls,'morpheWebBlocked(Ljava/lang/String;)Z',[url]),url
    cls=E+'article/data/converters/ArticleBodyBlockDtoMapper';dto='L'+E+'article/data/datasource/remote/dto/BlockDto$'
    # Synthetic embeds test preservation; they do not claim discovered endpoints.
    editorial=[{'type':dto+'ParagraphBlockDto;','text':'Final editorial paragraph'}, {'type':dto+'EmbedBlockDto;','content':'<iframe src="https://datawrapper.dwcdn.net/abc/1/"></iframe>'}, {'type':dto+'EmbedBlockDto;','content':'<iframe src="https://www.trouw.nl/story/embed"></iframe>'}, {'type':dto+'PodcastBlockDto;'}, {'type':dto+'EmbedBlockDto;','content':'<iframe src="https://newsletter.example.test/signup" title="Aanmelden voor nieuwsbrief"></iframe>'}]
    blocks=[editorial[0],{'type':dto+'AdvertisementBlockDto;'},*editorial[1:]]
    actual=emitted(root,cls,'morpheArticleBlocks(Ljava/util/List;)Ljava/util/List;',[blocks])
    assert actual==editorial and all(a is b for a,b in zip(actual,editorial)),'Filter only explicit advertising DTOs, preserve complete editorial objects/order'
    over=[{'type':'L'+E+'overview/data/dto/OverviewPageComponentDto$Content;'}, {'type':'L'+E+'overview/data/dto/OverviewPageComponentDto$Advertisement;'}, {'type':'L'+E+'overview/data/dto/OverviewPageComponentDto$Branded;'}]
    assert emitted(root,cls,'morpheOverviewComponents(Ljava/util/List;)Ljava/util/List;',[over])==[over[0],over[2]],'Preserve publisher branding; remove explicit ad slot'

def sdk_classes():
    """Read Android SDK class flags/contracts without loading another JVM."""
    import os
    import struct
    import zipfile
    sdk=Path(os.environ.get('ANDROID_HOME',str(Path.home()/'Library/Android/sdk')))
    jar=sdk/'platforms/android-36/android.jar'
    assert jar.is_file(),'Android SDK36 android.jar required for emitted call audit'
    archive=zipfile.ZipFile(jar)
    available=set(archive.namelist())
    cache={}
    def read(typ):
        if typ in cache:return cache[typ]
        path=typ[1:-1]+'.class'
        if path not in available:
            cache[typ]=None;return None
        data=archive.read(path);pos=8
        def u1():
            nonlocal pos
            v=data[pos];pos+=1;return v
        def u2():
            nonlocal pos
            v=struct.unpack_from('>H',data,pos)[0];pos+=2;return v
        def u4():
            nonlocal pos
            v=struct.unpack_from('>I',data,pos)[0];pos+=4;return v
        pool=[None]*u2();i=1
        while i<len(pool):
            tag=u1()
            if tag==1:
                n=u2();pool[i]=data[pos:pos+n].decode('utf8',errors='replace');pos+=n
            elif tag in {3,4}:pos+=4
            elif tag in {5,6}:pos+=8;i+=1
            elif tag in {7,8,16,19,20}:pool[i]=u2()
            elif tag in {9,10,11,12,17,18}:pos+=4
            elif tag==15:pos+=3
            else:raise AssertionError('Unknown SDK classfile constant '+str(tag))
            i+=1
        access=u2();u2();super_index=u2();supertype='L'+pool[pool[super_index]]+';' if super_index else None
        for _ in range(u2()):u2()
        def members():
            nonlocal pos
            result={}
            for _ in range(u2()):
                flags,name,descriptor=u2(),pool[u2()],pool[u2()]
                result[name+descriptor]=flags
                for _ in range(u2()):
                    u2();size=u4();pos+=size
            return result
        members();methods=members()
        cache[typ]=(bool(access&0x200),supertype,methods)
        return cache[typ]
    return read,archive

def verify_call_kinds(root,ads,tracking):
    """Audit actual emitted calls against decoded DEX class/interface flags."""
    files={}
    sdk_read,sdk_archive=sdk_classes()
    for folder in [root,root/'smali']:
        for base in folder.glob('smali*'):
            if base.is_dir():
                for p in base.rglob('*.smali'):
                    header=p.open().readline().strip()
                    if header.startswith('.class '):files[header.split()[-1]]=('\u0020interface\u0020' in header,p)
    targets={(c,s) for pairs in TARGETS.values() for c,s in pairs}
    targets.add((ONBOARDING_MAPPER,'getLoginBenefits()Ljava/util/List;'))
    for c,s in [('nl/persgroep/edition/application/startup/task/ContentsquareStartupTask','onStartup()V'),('be/persgroep/advertising/userprofile/IdManager','fetchUserIds()Lkotlinx/coroutines/Job;'),(ARTICLE_RESULT_COROUTINE,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'),(ARTICLE_MOMENT_COROUTINE,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')]:targets.add((c,s))
    for typ,(interface,p) in files.items():
        text=p.read_text() if ('nl/persgroep/edition' in typ or 'be/persgroep/' in typ or 'com/comscore/' in typ or typ[1:-1] in {c for c,s in targets}) else ''
        for match in re.finditer(r'^\.method[^\n]* (\S+)\n(.*?)^\.end method',text,re.M|re.S):
            sig,body=match.groups()
            if sig.startswith('morphe') or typ[1:-1] in {ARTICLE_RESULT_COROUTINE,ARTICLE_MOMENT_COROUTINE}:instructions=body
            elif (typ[1:-1],sig) in targets:instructions=body.split('return',1)[0]
            else:continue
            for line in instructions.splitlines():
                m=re.search(r'invoke-(virtual|interface)(?:/range)?\s+\{[^}]*\},\s+(L[^;]+;)->',line)
                sdk_target=sdk_read(m[2]) if m and m[2] not in files else None
                if m and (m[2] in files or sdk_target):
                    is_interface=files[m[2]][0] if m[2] in files else sdk_target[0]
                    expected='interface' if is_interface else 'virtual'
                    assert m[1]==expected,'DEX call kind mismatch: '+typ+'->'+sig+': '+line.strip()
                call=re.search(r'invoke-(static|virtual|interface|direct|super)(?:/range)?\s+\{[^}]*\},\s+(L[^;]+;)->(\S+)',line)
                if call and call[2] in files:
                    target=files[call[2]][1].read_text()
                    declaration=re.search(r'^\.method ([^\n]*) '+re.escape(call[3])+r'$',target,re.M)
                    if declaration:
                        assert (call[1]=='static')==('static' in declaration[1].split()),'DEX static/instance method mismatch: '+line.strip()
                elif call:
                    target_type=call[2]
                    target=sdk_read(target_type)
                    while target and call[3] not in target[2] and target[1]:target=sdk_read(target[1])
                    if target and call[3] in target[2]:
                        assert (call[1]=='static')==bool(target[2][call[3]]&0x8),'SDK static/instance method mismatch: '+line.strip()
            if sig.startswith('morphe'):
                result_type=sig.split(')')[1]
                returns=re.findall(r'^\s*(return(?:-object|-void|-wide)?)\b',body,re.M)
                expected_return='return-void' if result_type=='V' else ('return-object' if result_type.startswith(('L','[')) else 'return')
                assert returns and set(returns)=={expected_return},'Helper return contract '+typ+'->'+sig


ONBOARDING_MAPPER=E+'feature/user/onboarding/login/OnboardingLoginInformationViewDataMapper'
ONBOARDING_BENEFITS_SHA256='47a81e926c24e7b0401cd6a7c1f83ec3160973dd818cdcca011260417b446c55'

def onboarding_benefit_rows(root):
    """Trace the real mapper's resource/constructor arguments and returned list."""
    regs={'p0':object()};result=None
    for line in canonical(root,ONBOARDING_MAPPER,'getLoginBenefits()Ljava/util/List;'):
        if line.startswith('new-instance '):
            dest,typ=line.split(' ',1)[1].split(', ');regs[dest]={'type':typ}
        elif line.startswith('sget '):
            dest,ref=line.split(' ',1)[1].split(', ');regs[dest]=ref.split('->')[1].split(':')[0]
        elif line.startswith(('const/4 ','const/16 ')):
            dest,value=line.split(' ',1)[1].split(', ');regs[dest]=int(value,16)
        elif line.startswith('move-result'):regs[line.split()[1]]=result
        elif line.startswith(('invoke-','filled-new-array ')):
            names=line.split('{',1)[1].split('}',1)[0]
            if ' .. ' in names:
                first,last=names.split(' .. ');names=', '.join('v'+str(i) for i in range(int(first[1:]),int(last[1:])+1))
            args=[regs[name] for name in names.split(', ')]
            if line.startswith('filled-new-array '):result=args
            elif 'ResourceString;-><init>' in line:args[0]['resource']=args[1]
            elif 'StyleableViewDataString;-><init>' in line:args[0]['text']=args[1]
            elif 'BenefitViewData;-><init>' in line:args[0]['text'],args[0]['icon']=args[1:]
            elif '->getBenefitTextStyle()' in line:result=object()
            elif 'CollectionsKt;->listOf(' in line:result=args[0]
            else:raise AssertionError('Unreviewed onboarding operation '+line)
        elif line.startswith('return-object '):
            return [(row['text']['text']['resource'],row['icon']) for row in regs[line.split()[1]]]
        else:raise AssertionError('Unreviewed onboarding instruction '+line)
    raise AssertionError('Onboarding mapper did not return')

def verify_onboarding_benefits(root,premium):
    expected=[('Onboarding_loginintro_features','ic_benefits_features'),('Onboarding_loginintro_oneaccount','ic_benefits_all_brands'),('Onboarding_loginintro_manageyourdata','ic_benefits_my_account')]
    if not premium:expected.append(('Onboarding_loginintro_unlimitedarticles','ic_benefits_unlimited_articles'))
    assert onboarding_benefit_rows(root)==expected,'Remove only subscriber promotion; preserve functional login benefit rows'
    code=canonical(root,ONBOARDING_MAPPER,'getLoginBenefits()Ljava/util/List;')
    array='filled-new-array {v0, v1, v2, v3}, [L'+E+'feature/user/onboarding/login/BenefitViewData;'
    if premium:
        patched='filled-new-array {v0, v1, v2}, [L'+E+'feature/user/onboarding/login/BenefitViewData;'
        assert code.count(patched)==1,'Exact onboarding list boundary'
        code=[array if line==patched else line for line in code]
    assert hashlib.sha256('\n'.join(code).encode()).hexdigest()==ONBOARDING_BENEFITS_SHA256,'Preserve onboarding mapper apart from subscriber list entry'
    for signature,digest in [('invoke(Z)L'+E+'feature/user/onboarding/login/OnboardingLoginInformationViewData;','a92643d221f7a36b2401aa9b87262e2b21296701964dd7a9735ea1fcd2a535e5'),('getSkipButtonState(Z)L'+E+'feature/user/onboarding/login/SkipButtonViewState;','7c4dca6d348dfbb91e4c387496f502784e7f11b0deff36a3c0fcb879983fa92d')]:
        assert hashlib.sha256('\n'.join(canonical(root,ONBOARDING_MAPPER,signature)).encode()).hexdigest()==digest,'Preserve login/onboarding controls '+signature

def verify_no_unobserved_web_policy(root):
    """No publisher DOM or newsletter rule has independent Trouw evidence yet."""
    for cls in [*CLIENTS,E+'article/data/converters/ArticleBodyBlockDtoMapper']:
        paths=list(root.glob('smali*/'+cls+'.smali'))+list(root.glob('smali/smali*/'+cls+'.smali'))
        text=paths[0].read_text()
        assert ' morpheCleanPremium(' not in text,'Unobserved publisher DOM mutation'
        assert ' morpheNewsletter(' not in text,'Unobserved newsletter mutation'

ARTICLE_RESULT_ORIGINAL_SHA256='16f5c05d2fd60b08bead0dc9c9bcc1e40714880662126ac3167a748261e95288'

ARTICLE_RESULT_COROUTINE=E+'article/data/repository/ArticleRepositoryImpl$getArticle$2'
ARTICLE_MOMENT_COROUTINE=E+'article/data/repository/ArticleRepositoryImpl$getArticleMoment$2'
ARTICLE_MOMENT_ORIGINAL_SHA256='8f42897b3b9ec372c87df36c749ec9f920b8ad772300d20f369ae2b8765710c5'

def without_advertorial_calls(code):
    removed=set()
    for i,line in enumerate(code):
        if '->morpheFilterAdvertorialResult(' in line:
            assert code[i+1].startswith('move-result-object ')
            removed.update([i,i+1])
    def target(index):return sum(i not in removed for i in range(index))
    return [re.sub(r'@(\d+)',lambda m:'@'+str(target(int(m[1]))),line) for i,line in enumerate(code) if i not in removed]

def verify_advertorial_guard(root,ads):
    cls=E+'article/data/converters/ArticleBodyBlockDtoMapper'
    paths=list(root.glob('smali*/'+cls+'.smali'))+list(root.glob('smali/smali*/'+cls+'.smali'))
    assert (' morpheFilterAdvertorialResult(' in paths[0].read_text())==ads,'Guard complete sponsored-story result before UI rendering'
    coroutine=canonical(root,ARTICLE_RESULT_COROUTINE,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')
    calls=[i for i,line in enumerate(coroutine) if '->morpheFilterAdvertorialResult(' in line]
    assert len(calls)==(2 if ads else 0),'Guard both ordinary and classic/fallback completed coroutine results'
    for i in calls:
        assert coroutine[i-1].startswith('check-cast ') and coroutine[i-1].endswith('Lnl/persgroep/domain/base/ResultOf;')
        assert coroutine[i+1].startswith('move-result-object ') and coroutine[i+2].startswith('return-object ')
    assert hashlib.sha256('\n'.join(without_advertorial_calls(coroutine)).encode()).hexdigest()==ARTICLE_RESULT_ORIGINAL_SHA256,'Preserve suspend sentinel, resumed states, fallbacks and existing errors'
    moment=canonical(root,ARTICLE_MOMENT_COROUTINE,'invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')
    moment_calls=[i for i,line in enumerate(moment) if '->morpheFilterAdvertorialResult(' in line]
    assert len(moment_calls)==(1 if ads else 0),'Guard completed moment/deep-link result after suspended/resumed merge'
    for i in moment_calls:
        assert 'ResultOfKt;->map(' in moment[i-2] and moment[i-1].startswith('move-result-object ')
        assert moment[i+1].startswith('move-result-object ') and moment[i+2].startswith('return-object ')
    assert hashlib.sha256('\n'.join(without_advertorial_calls(moment)).encode()).hexdigest()==ARTICLE_MOMENT_ORIGINAL_SHA256,'Preserve moment coroutine and mapping'
    if not ads:return
    art='L'+E+'article/domain/model/'
    def article(style='Basic',body=None):return {'type':art+'Article;','style':{'type':art+'ArticleStyle$'+style+';'},'body':body or [{'type':art+'Block$Paragraph;','text':'Final editorial paragraph'}]}
    def success(a):return {'type':'Lnl/persgroep/domain/base/ResultOf$Success;','value':a}
    def run(a):return emitted(root,cls,'morpheFilterAdvertorialResult(Lnl/persgroep/domain/base/ResultOf;)Lnl/persgroep/domain/base/ResultOf;',[a])
    for a in [success(article('Advertorial')),success(article(body=[{'type':art+'AdvertorialHeader;'}, {'type':art+'Block$Paragraph;','text':'Sponsored content'}]))]:
        result=run(a)
        assert result['type']=='Lnl/persgroep/domain/base/ResultOf$Error;' and result['error']['type']=='Lnl/persgroep/domain/base/GeneralDomainError$Other;','Complete with existing whole-result error; never strip disclosure while keeping ad'
    editorial=success(article());uam=success(article('Uam'));branded=success(article(body=[{'type':art+'BrandedHeader;'}]));error={'type':'Lnl/persgroep/domain/base/ResultOf$Error;','error':'existing'}
    for a in [editorial,uam,branded,error,{'type':'Lkotlin/coroutines/intrinsics/CoroutineSingletons;'},success({'type':'Ljava/lang/String;','text':'Unexpected successful type'})]:
        assert run(a) is a,'Preserve editorial/syndicated/branding/existing-error/suspended objects by identity'

FIAM_ADAPTER=E+'domain/messaging/SuppressFirebaseInAppMessagingUseCase'

def run_fiam_adapter(root,popup_suppressed,suppress,component):
    """Execute the real emitted optional-component consumer with missing/real SDK."""
    code=canonical(root,FIAM_ADAPTER,'invoke(Z)V')
    regs={'p0':{'popupSuppression':{'suppressed':popup_suppressed}},'p1':suppress};result=None;pc=0;lookups=0
    for _ in range(200):
        line=code[pc];pc+=1
        if line=='return-void':return lookups
        if line.startswith('iget-object '):
            dest,src,field=line.split(' ',1)[1].split(', ');regs[dest]=regs[src]['popupSuppression']
        elif line.startswith('move-result'):regs[line.split()[1]]=result
        elif line.startswith('const/4 '):
            dest,value=line.split(' ',1)[1].split(', ');regs[dest]=int(value,16)
        elif line.startswith('const-class '):regs[line.split()[1].rstrip(',')]='FIAM.class'
        elif line.startswith('check-cast '):pass
        elif line.startswith('invoke-'):
            names=line.split('{',1)[1].split('}',1)[0];v=[regs[x] for x in names.split(', ')] if names else []
            if 'PopupSuppression;->isSuppressed' in line:result=v[0]['suppressed']
            elif 'FirebaseApp;->getInstance' in line:result={'component':component}
            elif 'FirebaseApp;->get(' in line:lookups+=1;result=v[0]['component']
            elif 'Object;->getClass' in line:
                assert v[0] is not None,'Removed FIAM registrar -> null SDK component -> startup consumer dereferences null'
                result='FIAM.class'
            else:raise AssertionError('Unexpected optional-component consumer '+line)
        elif line.startswith('iput-boolean '):
            src,dest,field=line.split(' ',1)[1].split(', ')
            assert regs[dest] is not None,'Null FIAM field receiver'
            regs[dest]['areMessagesSuppressed']=bool(regs[src])
        elif line.startswith(('if-eqz ','if-nez ')):
            op,reg,target=line.replace(',','').split()
            if bool(regs[reg])==(op=='if-nez'):pc=int(target[1:])
        elif line.startswith('goto'):pc=int(line.split('@')[1])
        else:raise AssertionError('Unexpected optional-component instruction '+line)
    raise AssertionError('Optional-component adapter did not complete')

def verify_optional_firebase_consumers(root,tracking):
    code=method(root,FIAM_ADAPTER,'invoke(Z)V')
    assert (code[:1]==['return-void'])==tracking,'Disable callback-free FIAM suppression adapter whenever its registrars are removed'
    md=[e.get(A+'name','') for e in ET.parse(resource(root,'AndroidManifest.xml')).iter('meta-data')]
    fiam=[n for n in md if n.startswith('com.google.firebase.components:com.google.firebase.inappmessaging.')]
    assert len(fiam)==(0 if tracking else 4),'FIAM component availability matches app adapter policy'
    for popup in [False,True]:
        for suppress in [False,True]:
            if tracking:
                assert run_fiam_adapter(root,popup,suppress,None)==0,'Complete startup without querying an unavailable optional SDK'
            else:
                component={};assert run_fiam_adapter(root,popup,suppress,component)==1
                assert component=={'areMessagesSuppressed':popup or suppress},'Preserve ordinary suppression behavior when SDK exists'
    app_refs=[]
    for folder in [root,root/'smali']:
        for base in folder.glob('smali*'):
            if base.is_dir():
                for p in base.glob('nl/persgroep/**/*.smali'):
                    if 'Lcom/google/firebase/inappmessaging/' in p.read_text():app_refs.append(str(p.relative_to(base))[:-6])
    assert app_refs==[FIAM_ADAPTER],'Reaudit added app consumers before removing FIAM registrars: '+repr(app_refs)

def verify(root: Path, selected: set[str]) -> None:
    tracking=bool(selected & {'Disable tracking','Skip consent screens'})
    ads=tracking or 'Hide ads' in selected
    premium='Hide Premium banner' in selected
    full='Read full articles' in selected
    consent='Skip consent screens' in selected
    def prefix(c,s,code,enabled):
        paths=list(root.glob('smali*/'+c+'.smali'))+list(root.glob('smali/smali*/'+c+'.smali'))
        body=re.search(r'^\.method[^\n]* '+re.escape(s)+r'\n(.*?)^\.end method',paths[0].read_text(),re.M|re.S)[1]
        locals_match=re.search(r'\.locals (\d+)',body);locals_=int(locals_match[1]) if locals_match else 0
        def absolute(line):return re.sub(r'\bp(\d+)\b',lambda m:'v'+str(locals_+int(m[1])),line)
        assert ([absolute(x) for x in method(root,c,s)[:len(code)]]==[absolute(x) for x in code])==enabled, f'Expected patched={enabled}: {c}->{s}'
    for group,enabled in [('AD_STOP',ads),('TRACK_STOP',tracking),('CSQ_ATTACH',tracking)]:
        for c,s in TARGETS[group]:prefix(c,s,['return-void'],enabled)
    for group,enabled in [('AD_FALSE',ads),('TRACK_FALSE',tracking)]:
        for c,s in TARGETS[group]:prefix(c,s,['const/4 v0, 0x0','return v0'],enabled)
    for c,s in TARGETS['AD_NULL']:
        code=['const/4 v0, 0x0','return-object v0']
        if 'AdvertisingSDK' in c:
            code=['sget-object v0, Lbe/persgroep/advertising/banner/base/AdResponse$Failure$Disabled;->INSTANCE:Lbe/persgroep/advertising/banner/base/AdResponse$Failure$Disabled;','invoke-interface {p4, v0}, Lbe/persgroep/advertising/banner/base/AdResponseListener;->onAdResponse(Lbe/persgroep/advertising/banner/base/AdResponse;)V']+code
        prefix(c,s,code,ads)
    for c,s in TARGETS['AD_UNIT']+TARGETS['CONSENT']:
        prefix(c,s,['sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;','return-object v0'],ads if (c,s) in [tuple(x) for x in TARGETS['AD_UNIT']] else consent)
    for c,s in TARGETS['TRACK_MAP']:prefix(c,s,['invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;','move-result-object v0','return-object v0'],tracking)
    for c,s in TARGETS['TRACK_RESULT']:prefix(c,s,(['const-string v0, \"\"'] if 'IdManager' in c else ['sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;'])+['invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;','move-result-object v0','return-object v0'],tracking)
    for c,s in TARGETS['PIANO_SEND']:
        prefix(c,s,['const/4 v0, 0x0','invoke-direct {p0, p1, v0}, Lio/piano/android/cxense/SendTask;->notifyCallback(Ljava/util/List;Ljava/lang/Exception;)Lkotlin/Unit;','return-void'],tracking)
    prefix('be/persgroep/advertising/userprofile/IdManager','fetchUserIds()Lkotlinx/coroutines/Job;',['const/4 v0, 0x0','invoke-static {v0}, Lkotlinx/coroutines/JobKt;->Job(Lkotlinx/coroutines/Job;)Lkotlinx/coroutines/CompletableJob;','move-result-object v0','invoke-interface {v0}, Lkotlinx/coroutines/CompletableJob;->complete()Z','return-object v0'],tracking)
    for sig in ['logToScion(Landroid/os/Bundle;Ljava/lang/String;)V','logNotificationReceived(Landroid/content/Intent;)V']:
        prefix('com/google/firebase/messaging/ByteStreams',sig,['return-void'],tracking)
    prefix('com/google/firebase/messaging/ByteStreams','shouldUploadScionMetrics(Landroid/content/Intent;)Z',['const/4 v0, 0x0','return v0'],tracking)
    for sig in COMSCORE_NATIVE:
        prefix('com/comscore/Analytics',sig,['return-void'],tracking)
        paths=list(root.glob('smali*/com/comscore/Analytics.smali'))+list(root.glob('smali/smali*/com/comscore/Analytics.smali'))
        flags=re.search(r'^\.method ([^\n]*) '+re.escape(sig)+r'$',paths[0].read_text(),re.M)[1].split()
        assert ('native' not in flags)==tracking,'Replace native Comscore method implementation and native flag together'
    prefix('com/comscore/util/setup/Setup','setUp()V',['return-void'],tracking)
    prefix('com/google/firebase/crashlytics/FirebaseCrashlytics','recordException(Ljava/lang/Throwable;)V',['return-void'],tracking)
    prefix('com/google/firebase/messaging/ByteStreams','deliveryMetricsExportToBigQueryEnabled()Z',['const/4 v0, 0x0','return v0'],tracking)
    adid=method(root,'com/google/android/gms/ads/identifier/AdvertisingIdClient','getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;')
    assert any('00000000-0000-0000-0000-000000000000' in x for x in adid)==tracking,'Opt-out advertising ID'
    c,s=TARGETS['IMA'][0]
    prefix(c,s,['invoke-direct {p0}, Lbe/persgroep/advertising/video/ima/ImaManager;->onContentResumeRequested()V','return-void'],ads)
    c,s=TARGETS['LABEL'][0]
    prefix(c,s,['sget-object v0, Lnl/persgroep/edition/ui/components/label/premium/PremiumLabelViewData$None;->INSTANCE:Lnl/persgroep/edition/ui/components/label/premium/PremiumLabelViewData$None;','return-object v0'],premium)
    c,s=TARGETS['ROUTER'][0]
    prefix(c,s,['invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;','move-result-object v0','new-instance v1, Lnl/persgroep/edition/marketingtemplates/domain/model/MarketingTemplateResolveResult;','const/4 v2, 0x0','invoke-direct {v1, v2, v0}, Lnl/persgroep/edition/marketingtemplates/domain/model/MarketingTemplateResolveResult;-><init>(ZLjava/util/List;)V','new-instance v0, Lnl/persgroep/domain/base/ResultOf$Success;','invoke-direct {v0, v1}, Lnl/persgroep/domain/base/ResultOf$Success;-><init>(Ljava/lang/Object;)V','return-object v0'],premium or full)
    c=E+'application/startup/task/ContentsquareStartupTask'
    prefix(c,'onStartup()V',['iget-object v0, p0, L'+c+';->contentsquareStartupListener:Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareStartupListener;','invoke-virtual {v0}, Lnl/persgroep/edition/feature/component/tracking/domain/tracker/contentsquare/ContentsquareStartupListener;->onCSQStartupCompleted()V','return-void'],tracking)
    mapper=E+'article/data/converters/ArticleBodyBlockDtoMapper'
    prefix(mapper,'invoke(Ljava/util/List;)Ljava/util/List;',['invoke-static {p1}, L'+mapper+';->morpheArticleBlocks(Ljava/util/List;)Ljava/util/List;','move-result-object p1'],ads)
    prefix(E+'overview/data/dto/OverviewPageDto','getPageComponents()Ljava/util/List;',['iget-object v0, p0, L'+E+'overview/data/dto/OverviewPageDto;->pageComponents:Ljava/util/List;','invoke-static {v0}, L'+mapper+';->morpheOverviewComponents(Ljava/util/List;)Ljava/util/List;','move-result-object v0','return-object v0'],ads)
    for c,s,digest in RETAINED:
        assert hashlib.sha256('\n'.join(canonical(root,c,s)).encode()).hexdigest()==digest,'Preserve '+c+'->'+s
    manifest=ET.parse(resource(root,'AndroidManifest.xml'))
    startup=[e.get(A+'name') for e in manifest.iter('meta-data') if e.get(A+'name') in OPTIONAL_STARTUP]
    assert len(startup)==(0 if tracking else 8),'Exact optional startup inventory'
    permissions=[e.get(A+'name') for e in manifest.iter('uses-permission') if e.get(A+'name') in AD_PERMISSIONS]
    assert len(permissions)==(0 if tracking else 7),'Exact ad/referrer/AdServices permission inventory'
    md={e.get(A+'name'):e.get(A+'value') for e in manifest.iter('meta-data')}
    for n,v in [('firebase_analytics_collection_deactivated','true'),('firebase_performance_collection_deactivated','true'),('firebase_sessions_enabled','false'),('firebase_inappmessaging_auto_data_collection_enabled','false')]:
        assert (md.get(n)==v)==tracking,'Hard collector flag '+n
    for n in ['com.google.firebase.installations.FirebaseInstallationsRegistrar','com.google.firebase.messaging.FirebaseMessagingRegistrar','com.google.firebase.remoteconfig.RemoteConfigRegistrar']:
        assert 'com.google.firebase.components:'+n in md,'Preserve '+n
    for n,en in [('com.google.android.gms.ads.MobileAdsInitProvider',ads),('com.google.android.gms.ads.AdService',ads),('io.heap.autocapture.HeapViewAutocaptureContentProvider',tracking),('io.heap.core.HeapContentProvider',tracking),('com.facebook.internal.FacebookInitProvider',tracking),('org.acra.sender.LegacySenderService',tracking),('org.acra.sender.JobSenderService',tracking),('org.acra.attachment.AcraContentProvider',tracking),('com.google.android.gms.tagmanager.TagManagerService',tracking),('com.google.android.gms.tagmanager.TagManagerPreviewActivity',tracking)]:
        e,=[e for e in manifest.iter() if e.get(A+'name')==n]
        assert (e.get(A+'enabled')=='false')==en,'Disable startup component '+n
    for asset in ['ad.html','apn_omsdk.js','apn_renderNativeAssets.html','mraid.js','omsdk-v1.js']:
        assert resource(root,'assets/'+asset).exists()!=ads,'Remove ad executable '+asset
    assert resource(root,'assets/containers/GTM-KQGZHLB.json').exists()!=tracking,'Remove collector container'
    for c in CLIENTS:
        paths=list(root.glob('smali*/'+c+'.smali'))+list(root.glob('smali/smali*/'+c+'.smali'))
        text=paths[0].read_text()
        assert (' morpheWebBlockedAds(' in text)==ads,'Scoped Ads policy '+c
        assert (' morpheWebBlockedTracking(' in text)==tracking,'Scoped Tracking policy '+c
        if ads:
            for t in ['Ljava/lang/String;','Landroid/webkit/WebResourceRequest;']:
                code=method(root,c,'shouldInterceptRequest(Landroid/webkit/WebView;'+t+')Landroid/webkit/WebResourceResponse;')
                assert any('->morpheWebResponse(' in x for x in code),'Request policy installed'
                parent='Landroid/webkit/WebViewClient;' if c==CLIENTS[0] else 'Landroidx/webkit/WebViewClientCompat;'
                assert code[-3:]==['invoke-super {p0, p1, p2}, '+parent+'->shouldInterceptRequest(Landroid/webkit/WebView;'+t+')Landroid/webkit/WebResourceResponse;','move-result-object v0','return-object v0'],'Delegate every allowed request to its original superclass'
            assert any('WebResourceResponse;-><init>' in x for x in method(root,c,'morpheWebResponse(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;'))
    verify_optional_firebase_consumers(root,tracking)
    from dpg_onboarding import verify_onboarding
    verify_onboarding(root,consent,'trouw')
    verify_advertorial_guard(root,ads)
    verify_no_unobserved_web_policy(root)
    verify_onboarding_benefits(root,premium)
    verify_filters(root,ads,tracking)
    if ads or tracking or premium or full:verify_call_kinds(root,ads,tracking)
    print('PASS Trouw: '+(', '.join(sorted(selected)) or 'original'))

def probe_public(root):
    """Anonymous fallback supplied by the shipped app; never print or persist its auth."""
    import base64
    import html
    import urllib.request
    values={e.get('name'):e.text or '' for e in ET.parse(resource(root,'res/values/strings.xml')).iter('string')}
    authorization='Basic '+base64.b64encode((values['live_feed_basic_auth_username']+':'+values['live_feed_basic_auth_password']).encode()).decode()
    expected={'5f40769':(12,54,'f39434a2b140163d8ba292bec2f8ee980803417e50e04c628be708e80d86a7e6'),'16dbb92':(22,57,'08505c94a8d5126e2b9950eec02bed3d22dc9e602facd7a6257fc4c227df915c')}
    results=[]
    for short_id,(count,words,digest) in expected.items():
        request=urllib.request.Request('https://mobile2.trouw.nl/article/v1/'+short_id+'?format=HTML&source=DEFAULT',headers={'Authorization':authorization,'x-app-version':'android-7.53.1','x-app-type':'android-go','x-brand':'tr','User-Agent':'okhttp/4.12.0'})
        with urllib.request.urlopen(request,timeout=40) as response:
            assert response.status==200
            raw=response.read();data=json.loads(raw)
        paragraphs=[html.unescape(re.sub(r'<[^>]+>',' ',b['content'])).strip() for b in data['body'] if b['blockType']=='PARAGRAPH']
        hashes=[hashlib.sha256(text.encode()).hexdigest() for text in paragraphs]
        assert len(paragraphs)==count and hashes[-1]==digest,'Substantive premium-body evidence changed: '+short_id
        assert len(paragraphs[hashes.index(digest)].split())==words
        assert data['publication']['isPremium'] is True,'Sample must still be premium: '+short_id
        results.append({'shortId':short_id,'isPremium':data['publication']['isPremium'],'historicalIsPremium':True,'editorialParagraphCount':len(paragraphs),'lastSubstantiveParagraphWords':words,'lastSubstantiveParagraphSha256':digest,'responseSha256':hashlib.sha256(raw).hexdigest()})
    print(json.dumps(results,indent=2))

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('decoded',type=Path)
    p.add_argument('-e',dest='selected',action='append',default=[],choices=sorted(NAMES))
    p.add_argument('--probe-public',action='store_true',help='Reproduce premium-body evidence using shipped anonymous fallback; prints hashes/counts only')
    a=p.parse_args()
    if a.probe_public:probe_public(a.decoded)
    else:verify(a.decoded,set(a.selected))
