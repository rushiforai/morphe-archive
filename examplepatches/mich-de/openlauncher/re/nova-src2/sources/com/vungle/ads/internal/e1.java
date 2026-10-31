package com.vungle.ads.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class e1 {

    /* renamed from: a, reason: collision with root package name */
    public Sdk.SDKMetric.SDKMetricType f46812a;

    /* renamed from: b, reason: collision with root package name */
    public String f46813b;

    public e1(Sdk.SDKMetric.SDKMetricType metricType) {
        Intrinsics.g(metricType, "metricType");
        this.f46812a = metricType;
    }

    public final void a(Sdk.SDKMetric.SDKMetricType sDKMetricType) {
        Intrinsics.g(sDKMetricType, "<set-?>");
        this.f46812a = sDKMetricType;
    }

    public final Sdk.SDKMetric.SDKMetricType b() {
        return this.f46812a;
    }

    public final String a() {
        return this.f46813b;
    }

    public final void a(String str) {
        this.f46813b = str;
    }
}
