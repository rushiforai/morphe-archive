package com.vungle.ads.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public class k2 extends e1 {

    /* renamed from: c, reason: collision with root package name */
    public Long f46865c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k2(Sdk.SDKMetric.SDKMetricType metricType) {
        super(metricType);
        Intrinsics.g(metricType, "metricType");
    }

    public final void a(Long l9) {
        this.f46865c = l9;
    }

    public final long c() {
        Long l9 = this.f46865c;
        if (l9 != null) {
            return l9.longValue();
        }
        return 0L;
    }
}
