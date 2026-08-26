package morningentree.morphe.patches.all.misc.tracking

/**
 * Built-in blocklist for [blockTrackingHostsPatch]. Parsed by
 * [morningentree.morphe.patches.shared.misc.hosts.HostsBlocker.fromString]:
 * `#` comments and blank lines are ignored, entries are de-duplicated, and — when the patch's
 * "Wildcard blocking" option is on (the default) — an apex entry such as `mixpanel.com` also
 * blocks its subdomains (`api.mixpanel.com`, …).
 *
 * Curation rule: apex domains are used only for vendors that are **purely** tracking/ads. For
 * dual-use services (Facebook, Amazon, TikTok, Yandex, Tencent, …) only the specific
 * telemetry/ad subdomains are listed so legitimate app functionality (login, content, push,
 * deep links) keeps working even with wildcard blocking enabled.
 */
internal const val UNIVERSAL_TRACKING_HOSTS = """
    # --- Firebase / Google analytics & measurement ---
    app-measurement.com
    firebaselogging-pa.googleapis.com
    firebaselogging.googleapis.com
    google-analytics.com
    ssl.google-analytics.com
    www.google-analytics.com
    analytics.google.com
    region1.google-analytics.com
    firebase-settings.crashlytics.com
    crashlyticsreports-pa.googleapis.com
    firebaseremoteconfig.googleapis.com
    firebaseinstallations.googleapis.com
    google-analytics.l.google.com

    # --- Google ads / DoubleClick ---
    googleads.g.doubleclick.net
    googleads4.g.doubleclick.net
    ad.doubleclick.net
    stats.g.doubleclick.net
    ade.googlesyndication.com
    pagead2.googlesyndication.com
    tpc.googlesyndication.com
    pubads.g.doubleclick.net
    securepubads.g.doubleclick.net
    googlesyndication.com
    www.googleadservices.com
    googleadservices.com
    adservice.google.com
    admob.com
    admob-gmats.uc.r.appspot.com
    imasdk.googleapis.com

    # --- Amazon advertising (pure ad domain) ---
    amazon-adsystem.com
    aax.amazon-adsystem.com
    c.amazon-adsystem.com

    # --- Third-party mobile ad networks ---
    applovin.com
    ms.applovin.com
    rt.applovin.com
    d.applovin.com
    a.applovin.com
    unityads.unity3d.com
    config.unityads.unity3d.com
    auction.unityads.unity3d.com
    unity3dusercontent.com
    unityads.unitychina.cn
    vungle.com
    api.vungle.com
    ads.api.vungle.com
    events.vungle.com
    ironsrc.com
    ironsource.mobi
    supersonicads.com
    supersonic.com
    chartboost.com
    live.chartboost.com
    da.chartboost.com
    ads.mopub.com
    mopub.com
    inmobi.com
    i.w.inmobi.com
    sdkm.w.inmobi.com
    inner-active.mobi
    adcolony.com
    ads30.adcolony.com
    wd.adcolony.com
    events3.adcolony.com
    tapjoy.com
    ws.tapjoyads.com
    rpc.tapjoy.com
    smaato.net
    smaato.com
    fyber.com
    startappservice.com
    startappexchange.com
    mintegral.com
    mintegral.net
    rayjump.com
    pangle.io
    isnssdk.com
    byteoversea.com
    criteo.com
    static.criteo.net
    bidder.criteo.com
    pubmatic.com
    ads.pubmatic.com
    hbopenbid.pubmatic.com
    rubiconproject.com
    fastlane.rubiconproject.com
    openx.net
    adnxs.com
    ib.adnxs.com
    taboola.com
    trc.taboola.com
    outbrain.com
    an.yandex.ru

    # --- Attribution / mobile measurement partners ---
    adjust.com
    app.adjust.com
    app.adjust.world
    s2s.adjust.com
    view.adjust.com
    appsflyer.com
    api.appsflyer.com
    t.appsflyer.com
    events.appsflyer.com
    inapps.appsflyer.com
    launches.appsflyer.com
    conversions.appsflyer.com
    branch.io
    api.branch.io
    api2.branch.io
    kochava.com
    control.kochava.com
    singular.net
    sdk-api-v1.singular.net
    tenjin.com
    track.tenjin.com

    # --- Product / behavioral analytics ---
    api.mixpanel.com
    mixpanel.com
    api-js.mixpanel.com
    amplitude.com
    api.amplitude.com
    api2.amplitude.com
    cdn.amplitude.com
    regionconfig.amplitude.com
    segment.io
    api.segment.io
    cdn.segment.com
    segment.com
    heapanalytics.com
    count.ly
    localytics.com
    analytics.localytics.com
    profile.localytics.com
    clevertap.com
    wzrkt.com
    smartlook.com
    fullstory.com
    rs.fullstory.com
    uxcam.com
    ads.flurry.com
    data.flurry.com
    flurry.com

    # --- Crash / performance monitoring ---
    notify.bugsnag.com
    sessions.bugsnag.com
    app.bugsnag.com
    sentry.io
    o1.ingest.sentry.io
    mobile-collector.newrelic.com
    bam.nr-data.net
    bam-cell.nr-data.net
    api.instabug.com
    in.appcenter.ms

    # --- Social pixels / SDK tracking (dual-use: specific subdomains only) ---
    graph.facebook.com
    connect.facebook.net
    an.facebook.com
    tr.snapchat.com
    sc-analytics.appspot.com
    ads-api.pinterest.com
    log.pinterest.com
    analytics.pinterest.com
    px.ads.linkedin.com
    analytics.tiktok.com
    business-api.tiktok.com
    ads-api.twitter.com
    analytics.twitter.com

    # --- Adobe / marketing clouds ---
    omtrdc.net
    demdex.net
    adobedtm.com

    # --- Regional analytics SDKs (dual-use: specific subdomains only) ---
    report.appmetrica.yandex.net
    startup.mobile.yandex.net
    bugly.qq.com
    android.bugly.qq.com
    mta.qq.com
    pingma.qq.com
    ulogs.umeng.com
    umeng.com
    umengcloud.com
    stats.jpush.cn
    gt.igexin.com
"""
