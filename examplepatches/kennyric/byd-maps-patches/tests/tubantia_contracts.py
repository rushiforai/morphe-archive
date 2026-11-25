"""Sanitized Tubantia 9.23.2 publisher contracts; contains no article text or credentials."""
MODEL = 'com/kubus/module/network/model/'
OWNER = MODEL + 'SectionResponse'
TYPE = 'L' + OWNER + ';'
NAMES = {'Hide ads', 'Disable tracking', 'Skip consent screens', 'Hide Premium banner', 'Read full articles'}
FULL = ('ht0', 'a(Ljava/lang/String;ZZLss3;)Ljava/lang/Object;')
MARKETING = ('ima', 'a(Ljava/lang/String;Lnet/persgroep/marketingtemplatessdk/core/types/Appearance;Ljava/util/List;Lcma;Lss3;)Ljava/lang/Object;')
PAYWALL = ('p1f', 't0(Lcom/persgroep/temptationsdk/data/model/ResolveResponse;)Ljava/util/ArrayList;')
CONSENT = ('be/dpgmedia/privacy/privacygatesdk/ConsentService', 'collectConsent(Landroid/app/Activity;Ljava/lang/String;Lbe/dpgmedia/privacy/privacygatesdk/OpenModalOptions;Ljava/lang/String;Lqs3;)Ljava/lang/Object;')
PREMIUM = [('rki','i(Lkv0;ZLfg3;I)V'),('x9l','l(Ljab;FLfg3;II)V'),('t8l','k(Ljab;Ljava/lang/String;Lxb2;Lfg3;II)V')]
TRACK_VOID = [('com/kubusapp/analytics/ComscoreEventTransmitter','execute(Ljava/util/Map;)V'),('p63','a(Ljava/lang/String;)V'),('f1i','b(Lbe/persgroep/tracking/base/model/TrackingEvent;)V'),('d4i','c(Lezh;Lpo0;)V'),('d4i','d(Lrmc;Lpo0;)V'),('shh','b(Lp5b;Ljava/lang/String;Ljava/lang/String;)V'),('zhf','run()V'),('q64','a()V'),('im0','e(Ljava/lang/String;Ljava/lang/Double;Landroid/os/Bundle;ZLjava/util/UUID;Lh6c;)V'),('m9','c(Landroid/app/Application;Ljava/lang/String;)V'),('com/kubusapp/webview/TrackingEventJsListener','trackEvent(Ljava/lang/String;)V'),('x49','sendAnalytics(Ljava/lang/String;)V'),('sii','c(Ljava/lang/String;)V'),('sii','d(Ljava/util/Map;)V')]
TRACK_FALSE = [('d94','o()Z'),('be/persgroep/tracking/config/FeatureFlags','getSnowplowEnabled()Z')]
TRACK_TRUE = [('u4k','H3()Z')]
TRACK_UNIT = [('o64','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')]
VIDEO = 'nl/dpgmedia/publishingservices/videosdk/internal/player/data/model/VideoProduction'

TRACK_VOID += [('ol0','c(Lgp6;)V'),('ol0','d(Lgp6;)V'),('be/dpgmedia/privacy/privacygatesdk/client/metrics/MetricsClient','sendErrorMetric$privacygatesdk_release(Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorMessage;Lbe/dpgmedia/privacy/privacygatesdk/client/metrics/ErrorType;Ljava/lang/String;)V'),('be/persgroep/advertising/userprofile/IdManager','setExternalUserIds(Ljava/util/Map;)V')]
TRACK_UNIT += [('e3d','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'),('be/persgroep/advertising/userprofile/IdManager$1','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;'),('be/persgroep/advertising/userprofile/IdManager$fetchUserIds$1','invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;')]

TRACK_VOID += [('sgj','y(Landroid/content/Intent;)V'),('sgj','z(Ljava/lang/String;Landroid/os/Bundle;)V')]
TRACK_FALSE += [('sgj','H(Landroid/content/Intent;)Z'),('sgj','r()Z')]
