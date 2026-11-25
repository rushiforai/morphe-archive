"""Sanitized HLN 9.22.0 publisher contracts; contains no article text or credentials."""
MODEL = 'com/kubus/module/network/model/'
OWNER = MODEL + 'SectionResponse'
TYPE = 'L' + OWNER + ';'
NAMES = {'Hide ads', 'Disable tracking', 'Skip consent screens', 'Hide Premium banner', 'Read full articles', 'Hide empty listening carousel'}
FULL = ('ht0', 'a(Ljava/lang/String;ZZLbt3;)Ljava/lang/Object;')
MARKETING = ('mla', 'a(Ljava/lang/String;Lnet/persgroep/marketingtemplatessdk/core/types/Appearance;Ljava/util/List;Lgla;Lbt3;)Ljava/lang/Object;')
PAYWALL = ('nq8', 'k(Lcom/persgroep/temptationsdk/data/model/ResolveResponse;)Ljava/util/ArrayList;')
CONSENT = ('be/dpgmedia/privacy/privacygatesdk/ConsentService', 'collectConsent(Landroid/app/Activity;Ljava/lang/String;Lbe/dpgmedia/privacy/privacygatesdk/OpenModalOptions;Ljava/lang/String;Lzs3;)Ljava/lang/Object;')
PREMIUM = [('sgc','j(Lnv0;ZLtg3;I)V'),('k4c','z(Lk8b;FLtg3;II)V'),('fyb','o(Lk8b;Ljava/lang/String;Lpc2;Lij5;Ltg3;II)V')]
TRACK_VOID = [('com/kubusapp/analytics/ComscoreEventTransmitter','execute(Ljava/util/Map;)V'),('j73','a(Ljava/lang/String;)V'),('zvh','b(Lbe/persgroep/tracking/base/model/TrackingEvent;)V'),('fzh','c(Lhuh;Lfo0;)V'),('fzh','d(Lkkc;Lfo0;)V'),('zbh','b(Lq3b;Ljava/lang/String;Ljava/lang/String;)V'),('fef','run()V'),('y64','a()V'),('hm0','e(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;ZLjava/util/UUID;Lh4c;)V'),('t9','c(Landroid/app/Application;Ljava/lang/String;)V'),('com/kubusapp/webview/TrackingEventJsListener','trackEvent(Ljava/lang/String;)V'),('a59','sendAnalytics(Ljava/lang/String;)V'),('afi','c(Ljava/lang/String;)V'),('afi','d(Ljava/util/Map;)V')]
TRACK_FALSE = [('i94','o()Z'),('be/persgroep/tracking/config/FeatureFlags','getSnowplowEnabled()Z')]
TRACK_TRUE = [('ixj','K2()Z')]
TRACK_UNIT = [('w64','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')]
VIDEO = 'nl/dpgmedia/publishingservices/videosdk/internal/player/data/model/VideoProduction'

TRACK_VOID += [('ml0','c(Lqp6;)V'),('ml0','d(Lqp6;)V'),('be/dpgmedia/privacy/privacygatesdk/client/metrics/MetricsClient','sendErrorMetric$privacygatesdk_release(Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorMessage;Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorType;Ljava/lang/String;)V'),('be/persgroep/advertising/userprofile/IdManager','setExternalUserIds(Ljava/util/Map;)V')]
TRACK_UNIT += [('u0d','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'),('be/persgroep/advertising/userprofile/IdManager$1','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'),('be/persgroep/advertising/userprofile/IdManager$fetchUserIds$1','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')]

TRACK_VOID += [('de4','N(Landroid/content/Intent;)V'),('de4','O(Ljava/lang/String;Landroid/os/Bundle;)V')]
TRACK_FALSE += [('de4','U(Landroid/content/Intent;)Z'),('de4','w()Z')]

TRACK_VOID += [('qx2', 'a()V'), ('com/kubusapp/analytics/cim/CimEventTransmitter', 'execute(Ljava/util/Map;)V')]
AMALIA = ('xz8', 'a(Lst;Lbt3;)Ljava/lang/Object;')
MARKETING_ARGS = '(Ljava/lang/String;Ljava/lang/String;Lcom/persgroep/temptationsdk/data/model/ContentType;Ljava/lang/String;Lcom/persgroep/temptationsdk/data/model/Appearance;Lcom/persgroep/temptationsdk/data/model/PreferredTemplateType;Lbt3;)Ljava/lang/Object;'
MARKETING_LIST = ('nq8', 'c' + MARKETING_ARGS)
MARKETING_FLOW = ('nq8', 'd' + MARKETING_ARGS)
