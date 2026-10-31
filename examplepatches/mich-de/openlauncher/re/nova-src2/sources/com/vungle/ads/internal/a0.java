package com.vungle.ads.internal;

import com.vungle.ads.internal.protos.Sdk;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class a0 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Sdk.SDKMetric.SDKMetricType f46730a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f46731b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.vungle.ads.internal.util.s f46732c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Sdk.SDKMetric.Builder f46733d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(Sdk.SDKMetric.SDKMetricType sDKMetricType, long j11, com.vungle.ads.internal.util.s sVar, Sdk.SDKMetric.Builder builder) {
        super(0);
        this.f46730a = sDKMetricType;
        this.f46731b = j11;
        this.f46732c = sVar;
        this.f46733d = builder;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Logging Metric ");
        sbA.append(this.f46730a);
        sbA.append(" with value ");
        sbA.append(this.f46731b);
        sbA.append(" for placement ");
        com.vungle.ads.internal.util.s sVar = this.f46732c;
        sbA.append(sVar != null ? sVar.f47701a : null);
        sbA.append(" mediation:");
        sbA.append(this.f46733d.getMediationName());
        return sbA.toString();
    }
}
