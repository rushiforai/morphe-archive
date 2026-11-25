"""Sanitized AD 9.22.0 publisher contracts; contains no article text or credentials."""
MODEL = 'com/kubus/module/network/model/'
OWNER = MODEL + 'SectionResponse'
TYPE = 'L' + OWNER + ';'
NAMES = {'Hide ads', 'Disable tracking', 'Skip consent screens', 'Hide Premium banner', 'Read full articles'}
FULL = ('ht0', 'a(Ljava/lang/String;ZZLzs3;)Ljava/lang/Object;')
MARKETING = ('jla', 'a(Ljava/lang/String;Lnet/persgroep/marketingtemplatessdk/core/types/Appearance;Ljava/util/List;Ldla;Lzs3;)Ljava/lang/Object;')
PAYWALL = ('jq8', 'k(Lcom/persgroep/temptationsdk/data/model/ResolveResponse;)Ljava/util/ArrayList;')
CONSENT = ('be/dpgmedia/privacy/privacygatesdk/ConsentService', 'collectConsent(Landroid/app/Activity;Ljava/lang/String;Lbe/dpgmedia/privacy/privacygatesdk/OpenModalOptions;Ljava/lang/String;Lxs3;)Ljava/lang/Object;')
PREMIUM = [('dnc','j(Lnv0;ZLqg3;I)V'),('cgc','z(Lg8b;FLqg3;II)V'),('g4c','l(Lg8b;Ljava/lang/String;Loc2;Lfj5;Lqg3;II)V')]
TRACK_VOID = [('com/kubusapp/analytics/ComscoreEventTransmitter','execute(Ljava/util/Map;)V'),('g73','a(Ljava/lang/String;)V'),('bwh','b(Lbe/persgroep/tracking/base/model/TrackingEvent;)V'),('hzh','c(Ljuh;Lfo0;)V'),('hzh','d(Lgkc;Lfo0;)V'),('bch','b(Lm3b;Ljava/lang/String;Ljava/lang/String;)V'),('eef','run()V'),('w64','a()V'),('hm0','e(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;ZLjava/util/UUID;Ld4c;)V'),('t9','c(Landroid/app/Application;Ljava/lang/String;)V'),('com/kubusapp/webview/TrackingEventJsListener','trackEvent(Ljava/lang/String;)V'),('w49','sendAnalytics(Ljava/lang/String;)V'),('cfi','c(Ljava/lang/String;)V'),('cfi','d(Ljava/util/Map;)V')]
TRACK_FALSE = [('f94','o()Z'),('be/persgroep/tracking/config/FeatureFlags','getSnowplowEnabled()Z')]
TRACK_TRUE = [('ixj','K2()Z')]
TRACK_UNIT = [('u64','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')]
VIDEO = 'nl/dpgmedia/publishingservices/videosdk/internal/player/data/model/VideoProduction'

TRACK_VOID += [('nl0','c(Lnp6;)V'),('nl0','d(Lnp6;)V'),('be/dpgmedia/privacy/privacygatesdk/client/metrics/MetricsClient','sendErrorMetric$privacygatesdk_release(Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorMessage;Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorType;Ljava/lang/String;)V'),('be/persgroep/advertising/userprofile/IdManager','setExternalUserIds(Ljava/util/Map;)V')]
TRACK_UNIT += [('q0d','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'),('be/persgroep/advertising/userprofile/IdManager$1','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'),('be/persgroep/advertising/userprofile/IdManager$fetchUserIds$1','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')]

TRACK_VOID += [('di5','M(Landroid/content/Intent;)V'),('di5','N(Ljava/lang/String;Landroid/os/Bundle;)V')]
TRACK_FALSE += [('di5','W(Landroid/content/Intent;)Z'),('di5','x()Z')]
