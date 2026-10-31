package com.vungle.ads.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q1 extends l2 {

    /* renamed from: e, reason: collision with root package name */
    public boolean f47449e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q1(Sdk.SDKMetric.SDKMetricType metricType) {
        super(metricType);
        Intrinsics.g(metricType, "metricType");
    }

    @Override // com.vungle.ads.internal.l2
    public final void d() {
        if (this.f46871d == null) {
            super.d();
        }
    }

    @Override // com.vungle.ads.internal.l2
    public final void e() {
        if (this.f46870c == null) {
            super.e();
        }
    }

    public final boolean f() {
        return this.f47449e;
    }

    public final void g() {
        this.f47449e = true;
    }
}
