package com.google.firebase.crashlytics;

import android.os.Bundle;
import bm.p;
import com.google.firebase.crashlytics.internal.Logger;
import com.google.firebase.crashlytics.internal.analytics.AnalyticsEventLogger;
import com.google.firebase.crashlytics.internal.analytics.BlockingAnalyticsEventLogger;
import com.google.firebase.crashlytics.internal.analytics.BreadcrumbAnalyticsEventReceiver;
import com.google.firebase.crashlytics.internal.analytics.CrashlyticsOriginAnalyticsEventLogger;
import com.google.firebase.crashlytics.internal.analytics.UnavailableAnalyticsEventLogger;
import com.google.firebase.crashlytics.internal.breadcrumbs.BreadcrumbHandler;
import com.google.firebase.crashlytics.internal.breadcrumbs.BreadcrumbSource;
import com.google.firebase.crashlytics.internal.breadcrumbs.DisabledBreadcrumbSource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;
import nm.b;
import nm.c;
import o2.f;
import yl.d;
import yl.e;

/* loaded from: classes.dex */
public class AnalyticsDeferredProxy {
    private final b analyticsConnectorDeferred;
    private volatile AnalyticsEventLogger analyticsEventLogger;
    private final List<BreadcrumbHandler> breadcrumbHandlerList;
    private volatile BreadcrumbSource breadcrumbSource;

    public AnalyticsDeferredProxy(b bVar) {
        this(bVar, new DisabledBreadcrumbSource(), new UnavailableAnalyticsEventLogger());
    }

    private void init() {
        ((p) this.analyticsConnectorDeferred).a(new a(this));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$getAnalyticsEventLogger$1(String str, Bundle bundle) {
        this.analyticsEventLogger.logEvent(str, bundle);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$getDeferredBreadcrumbSource$0(BreadcrumbHandler breadcrumbHandler) {
        synchronized (this) {
            try {
                if (this.breadcrumbSource instanceof DisabledBreadcrumbSource) {
                    this.breadcrumbHandlerList.add(breadcrumbHandler);
                }
                this.breadcrumbSource.registerBreadcrumbHandler(breadcrumbHandler);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public /* synthetic */ void lambda$init$2(c cVar) {
        Logger.getLogger().d("AnalyticsConnector now available.");
        d dVar = (d) cVar.get();
        CrashlyticsOriginAnalyticsEventLogger crashlyticsOriginAnalyticsEventLogger = new CrashlyticsOriginAnalyticsEventLogger(dVar);
        CrashlyticsAnalyticsListener crashlyticsAnalyticsListener = new CrashlyticsAnalyticsListener();
        if (subscribeToAnalyticsEvents(dVar, crashlyticsAnalyticsListener) == null) {
            Logger.getLogger().w("Could not register Firebase Analytics listener; a listener is already registered.");
            return;
        }
        Logger.getLogger().d("Registered Firebase Analytics listener.");
        BreadcrumbAnalyticsEventReceiver breadcrumbAnalyticsEventReceiver = new BreadcrumbAnalyticsEventReceiver();
        BlockingAnalyticsEventLogger blockingAnalyticsEventLogger = new BlockingAnalyticsEventLogger(crashlyticsOriginAnalyticsEventLogger, 500, TimeUnit.MILLISECONDS);
        synchronized (this) {
            try {
                Iterator<BreadcrumbHandler> it = this.breadcrumbHandlerList.iterator();
                while (it.hasNext()) {
                    breadcrumbAnalyticsEventReceiver.registerBreadcrumbHandler(it.next());
                }
                crashlyticsAnalyticsListener.setBreadcrumbEventReceiver(breadcrumbAnalyticsEventReceiver);
                crashlyticsAnalyticsListener.setCrashlyticsOriginEventReceiver(blockingAnalyticsEventLogger);
                this.breadcrumbSource = breadcrumbAnalyticsEventReceiver;
                this.analyticsEventLogger = blockingAnalyticsEventLogger;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private static yl.a subscribeToAnalyticsEvents(d dVar, CrashlyticsAnalyticsListener crashlyticsAnalyticsListener) {
        e eVar = (e) dVar;
        f fVarB = eVar.b("clx", crashlyticsAnalyticsListener);
        if (fVarB != null) {
            return fVarB;
        }
        Logger.getLogger().d("Could not register AnalyticsConnectorListener with Crashlytics origin.");
        f fVarB2 = eVar.b("crash", crashlyticsAnalyticsListener);
        if (fVarB2 != null) {
            Logger.getLogger().w("A new version of the Google Analytics for Firebase SDK is now available. For improved performance and compatibility with Crashlytics, please update to the latest version.");
        }
        return fVarB2;
    }

    public AnalyticsEventLogger getAnalyticsEventLogger() {
        return new a(this);
    }

    public BreadcrumbSource getDeferredBreadcrumbSource() {
        return new a(this);
    }

    public AnalyticsDeferredProxy(b bVar, BreadcrumbSource breadcrumbSource, AnalyticsEventLogger analyticsEventLogger) {
        this.analyticsConnectorDeferred = bVar;
        this.breadcrumbSource = breadcrumbSource;
        this.breadcrumbHandlerList = new ArrayList();
        this.analyticsEventLogger = analyticsEventLogger;
        init();
    }
}
