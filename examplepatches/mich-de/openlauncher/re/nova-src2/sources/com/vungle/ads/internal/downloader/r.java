package com.vungle.ads.internal.downloader;

import b.u4;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.util.u;
import kotlin.Result;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class r extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f46797a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(String str) {
        super(1);
        this.f46797a = str;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Object obj2 = ((Result) obj).f71688a;
        String str = this.f46797a;
        if (!(obj2 instanceof Result.Failure)) {
            AnalyticsClient.a(AnalyticsClient.INSTANCE, Sdk.SDKMetric.SDKMetricType.VM_TEMPLATE_PRE_DOWNLOAD_STATUS, 1L, null, str, 4);
            boolean z11 = u.f47714a;
            com.vungle.ads.internal.util.t.a("TemplateDownloadManager", "Pre-download succeeded: " + str);
        }
        String str2 = this.f46797a;
        Throwable thA = Result.a(obj2);
        if (thA != null) {
            AnalyticsClient.a(AnalyticsClient.INSTANCE, Sdk.SDKMetric.SDKMetricType.VM_TEMPLATE_PRE_DOWNLOAD_STATUS, 2L, null, str2, 4);
            boolean z12 = u.f47714a;
            StringBuilder sbK = u4.k("Pre-download failed: ", str2, ", error: ");
            sbK.append(thA.getMessage());
            com.vungle.ads.internal.util.t.b("TemplateDownloadManager", sbK.toString());
        }
        return Unit.f71706a;
    }
}
