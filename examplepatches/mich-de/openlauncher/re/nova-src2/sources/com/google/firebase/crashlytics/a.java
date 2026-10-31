package com.google.firebase.crashlytics;

import android.os.Bundle;
import com.google.firebase.crashlytics.internal.analytics.AnalyticsEventLogger;
import com.google.firebase.crashlytics.internal.breadcrumbs.BreadcrumbHandler;
import com.google.firebase.crashlytics.internal.breadcrumbs.BreadcrumbSource;
import nm.c;

/* loaded from: classes.dex */
public final /* synthetic */ class a implements BreadcrumbSource, AnalyticsEventLogger, nm.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AnalyticsDeferredProxy f34693a;

    public /* synthetic */ a(AnalyticsDeferredProxy analyticsDeferredProxy) {
        this.f34693a = analyticsDeferredProxy;
    }

    @Override // nm.a
    public void h(c cVar) {
        this.f34693a.lambda$init$2(cVar);
    }

    @Override // com.google.firebase.crashlytics.internal.analytics.AnalyticsEventLogger
    public void logEvent(String str, Bundle bundle) {
        this.f34693a.lambda$getAnalyticsEventLogger$1(str, bundle);
    }

    @Override // com.google.firebase.crashlytics.internal.breadcrumbs.BreadcrumbSource
    public void registerBreadcrumbHandler(BreadcrumbHandler breadcrumbHandler) {
        this.f34693a.lambda$getDeferredBreadcrumbSource$0(breadcrumbHandler);
    }
}
