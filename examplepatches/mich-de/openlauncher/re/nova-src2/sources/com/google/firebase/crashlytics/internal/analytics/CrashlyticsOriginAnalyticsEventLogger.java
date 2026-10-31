package com.google.firebase.crashlytics.internal.analytics;

import android.os.Bundle;
import yl.d;
import yl.e;

/* loaded from: classes.dex */
public class CrashlyticsOriginAnalyticsEventLogger implements AnalyticsEventLogger {
    static final String FIREBASE_ANALYTICS_ORIGIN_CRASHLYTICS = "clx";
    private final d analyticsConnector;

    public CrashlyticsOriginAnalyticsEventLogger(d dVar) {
        this.analyticsConnector = dVar;
    }

    @Override // com.google.firebase.crashlytics.internal.analytics.AnalyticsEventLogger
    public void logEvent(String str, Bundle bundle) {
        ((e) this.analyticsConnector).a(FIREBASE_ANALYTICS_ORIGIN_CRASHLYTICS, str, bundle);
    }
}
