"""VI privacy fixture boundaries; policies execute in original/emitted code."""
import xml.etree.ElementTree as ET
from rtl_vm import Reference, VmThrown
from vi_ads_vm import AdsFixture
from vi_tracking_contracts import TRACKING_CONTRACTS

CRASH='Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;'
FACEBOOK='Lcom/facebook/UserSettingsManager;'
LOCAL='Lcom/google/firebase/sessions/settings/LocalOverrideSettings;'
SESSIONS='Lcom/google/firebase/sessions/settings/SessionsSettings;'
MEASUREMENT='Lcom/google/android/gms/measurement/internal/zzae;'
CONSENT='Lnl/vi/ads/data/google_consent/GoogleConsent;'
DISPLAY_ID='Lnl/vi/core/ads/config/AdsIDFetcher$fetchAdID$1;'
VIDEO_ID=CONSENT[:-1]+'$getIFA_UUID$$inlined$TryCatchCoroutine$2;'
AVAILABLE_ID=CONSENT[:-1]+'$isAdvertisingIDAvailable$$inlined$TryCatchCoroutine$2;'


class IdentifierLookup(Exception):
    """Explicit boundary: the original would query Google Play's identifier API."""


class TrackingFixture(AdsFixture):
    def __init__(self,*args):
        super().__init__(*args)
        self.rows.update({r[:2]:r for r in TRACKING_CONTRACTS})
        self.native |= {(LOCAL,'getSessionEnabled()Ljava/lang/Boolean;'),(SESSIONS,'getSessionsEnabled()Z')}
        self.native |= {(o,s) for o,s in self.rows if (o=='Lnl/vi/core/ads/config/FetchIDResult;' or o==CONSENT[:-1]+'$getIFA_UUID$1$1$1;') and s.startswith(('<init>(', 'invokeSuspend('))}
        ns='{http://schemas.android.com/apk/res/android}'
        app=ET.parse(self.source.root/'AndroidManifest.xml').getroot().find('application')
        self.metadata={e.get(ns+'name'):e.get(ns+'value')=='true' for e in app.findall('meta-data') if e.get(ns+'value') in {'true','false'}}
        self.context=Reference({},'Landroid/content/Context;')
        self.firebase_default=True
        self.facebook_stored=True
        self.crash_sdk=Reference({},'Lcom/google/firebase/crashlytics/FirebaseCrashlytics;')
        self.statics[CONSENT+'->INSTANCE:'+CONSENT]=self.new(CONSENT)
        self.statics['Lnl/vi/core/ads/config/AdsIDFetcher;->INSTANCE:Lnl/vi/core/ads/config/AdsIDFetcher;']=self.new('Lnl/vi/core/ads/config/AdsIDFetcher;')
        self.statics[FACEBOOK+'->INSTANCE:'+FACEBOOK]=self.new(FACEBOOK)
        self.statics[FACEBOOK+'->advertiserIDCollectionEnabled:Lcom/facebook/UserSettingsManager$UserSetting;']=Reference({},'Lcom/facebook/UserSettingsManager$UserSetting;')

    def invoke(self,target,args):
        owner,sig=target.split('->',1)
        if owner=='Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;' and sig.startswith('getAdvertisingIdInfo('):raise IdentifierLookup()
        if owner=='Lkotlin/jvm/functions/Function1;' and sig=='invoke(Ljava/lang/Object;)Ljava/lang/Object;' and args[0].value.get('role') in {'display-id','video-id','available-id'}:
            self.events.append((args[0].value['role'],args[1],'main' if self.dispatcher is self.main else 'current'));return 0
        if target=='Ljava/io/IOException;-><init>(Ljava/lang/String;)V':args[0].value['message']=args[1];return None
        if target=='Ljava/io/IOException;->getMessage()Ljava/lang/String;':return args[0].value['message']
        if target=='Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;':return Reference(bool(args[0]),'Ljava/lang/Boolean;')
        if target=='Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;':return Reference(bool(args[0]),'Ljava/lang/Boolean;')
        if target==CONSENT+'->getAppContext()Landroid/content/Context;':return self.context
        if owner=='Lnl/vi/core/ads/config/AdsIDFetcher;' and sig.startswith('access$log('):self.events.append('local-id-failure-log');return None
        if target=='Ljava/lang/Boolean;->booleanValue()Z':return int(args[0].value)
        if target==CRASH+'->isFirebaseDataCollectionDefaultEnabled()Z':return int(self.firebase_default)
        if target==CRASH+'->logDataCollectionState(Z)V':self.events.append(('collection-state',args[1]));return None
        if target=='Lcom/facebook/internal/instrument/crashshield/CrashShieldHandler;->isObjectCrashing(Ljava/lang/Object;)Z':return 0
        if target==FACEBOOK+'->initializeIfNotInitialized()V':self.events.append('facebook-settings-read');return None
        if target==FACEBOOK+'->checkAutoLogAppEventsEnabled()Z':return int(self.facebook_stored)
        if target=='Lcom/facebook/UserSettingsManager$UserSetting;->getValue()Z':return int(self.facebook_stored)
        if target==MEASUREMENT+'->zzf(Ljava/lang/String;)Ljava/lang/Boolean;':
            value=self.metadata.get(args[1]);return Reference(value,'Ljava/lang/Boolean;') if value is not None else 0
        if target=='Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z':return int(args[1] in args[0].value)
        if target=='Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z':return int(args[0].value.get(args[1],False))
        if target=='Lcom/google/firebase/sessions/settings/SettingsProvider;->getSessionEnabled()Ljava/lang/Boolean;':
            if args[0].descriptor==LOCAL:return self.run(LOCAL,sig,args)[0]
            return Reference(args[0].value['enabled'],'Ljava/lang/Boolean;')
        if target=='Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->getInstance()Lcom/google/firebase/crashlytics/FirebaseCrashlytics;':return self.crash_sdk
        if target=='Lcom/google/firebase/crashlytics/FirebaseCrashlytics;->setCrashlyticsCollectionEnabled(Z)V':self.events.append(('crash-collection',args[1]));return None
        return super().invoke(target,args)
