package io.sentry.protocol;

import com.amplitude.android.TrackingOptions;
import io.branch.search.internal.C3125e3;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes4.dex */
public final class h implements i1 {

    /* renamed from: a, reason: collision with root package name */
    public String f67532a;

    /* renamed from: b, reason: collision with root package name */
    public String f67533b;

    /* renamed from: c, reason: collision with root package name */
    public String f67534c;

    /* renamed from: d, reason: collision with root package name */
    public ConcurrentHashMap f67535d;

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        e3 e3Var = (e3) y1Var;
        e3Var.f();
        if (this.f67532a != null) {
            e3Var.o(TrackingOptions.AMP_TRACKING_OPTION_CITY);
            e3Var.A(this.f67532a);
        }
        if (this.f67533b != null) {
            e3Var.o("country_code");
            e3Var.A(this.f67533b);
        }
        if (this.f67534c != null) {
            e3Var.o(TrackingOptions.AMP_TRACKING_OPTION_REGION);
            e3Var.A(this.f67534c);
        }
        ConcurrentHashMap concurrentHashMap = this.f67535d;
        if (concurrentHashMap != null) {
            for (String str : concurrentHashMap.keySet()) {
                C3125e3.a(this.f67535d, str, e3Var, str, iLogger);
            }
        }
        e3Var.i();
    }
}
