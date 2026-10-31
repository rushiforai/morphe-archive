package com.vungle.ads.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p1 extends k2 {

    /* renamed from: d, reason: collision with root package name */
    public boolean f47333d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p1(Sdk.SDKMetric.SDKMetricType metricType) {
        super(metricType);
        Intrinsics.g(metricType, "metricType");
    }

    public final boolean d() {
        return this.f47333d;
    }

    public final void e() {
        this.f47333d = true;
    }
}
