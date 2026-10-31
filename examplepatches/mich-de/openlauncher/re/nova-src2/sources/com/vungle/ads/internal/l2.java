package com.vungle.ads.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public class l2 extends e1 {

    /* renamed from: c, reason: collision with root package name */
    public Long f46870c;

    /* renamed from: d, reason: collision with root package name */
    public Long f46871d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l2(Sdk.SDKMetric.SDKMetricType metricType) {
        super(metricType);
        Intrinsics.g(metricType, "metricType");
    }

    public final long c() {
        long jNanoTime = System.nanoTime();
        Long l9 = this.f46871d;
        long jLongValue = l9 != null ? l9.longValue() : jNanoTime;
        Long l11 = this.f46870c;
        if (l11 != null) {
            jNanoTime = l11.longValue();
        }
        return (jLongValue - jNanoTime) / 1000000;
    }

    public void d() {
        this.f46871d = Long.valueOf(System.nanoTime());
    }

    public void e() {
        this.f46870c = Long.valueOf(System.nanoTime());
    }
}
