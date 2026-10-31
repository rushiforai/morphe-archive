package com.vungle.ads.internal.downloader;

import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.l2;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final k f46788a;

    /* renamed from: b, reason: collision with root package name */
    public final com.vungle.ads.internal.model.b f46789b;

    /* renamed from: c, reason: collision with root package name */
    public final com.vungle.ads.internal.util.s f46790c;

    /* renamed from: d, reason: collision with root package name */
    public final int f46791d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicBoolean f46792e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicInteger f46793f;

    /* renamed from: g, reason: collision with root package name */
    public final List f46794g;

    /* renamed from: h, reason: collision with root package name */
    public l2 f46795h;

    /* renamed from: i, reason: collision with root package name */
    public l2 f46796i;

    public /* synthetic */ l(k kVar, com.vungle.ads.internal.model.b bVar) {
        this(kVar, bVar, null, 3);
    }

    public final com.vungle.ads.internal.model.b a() {
        return this.f46789b;
    }

    public final int b() {
        return this.f46793f.get();
    }

    public final com.vungle.ads.internal.util.s c() {
        return this.f46790c;
    }

    public final List d() {
        List retryReasons = this.f46794g;
        Intrinsics.f(retryReasons, "retryReasons");
        return b70.g.I1(retryReasons);
    }

    public final boolean e() {
        return this.f46792e.get();
    }

    public final void f() {
        if (this.f46796i != null) {
            return;
        }
        l2 l2Var = new l2(Sdk.SDKMetric.SDKMetricType.ASSET_PARTIAL_DOWNLOAD_DURATION_MS);
        this.f46796i = l2Var;
        l2Var.e();
    }

    public final void g() {
        l2 l2Var = new l2(Sdk.SDKMetric.SDKMetricType.TEMPLATE_DOWNLOAD_DURATION_MS);
        this.f46795h = l2Var;
        l2Var.e();
    }

    public final void h() throws Throwable {
        l2 l2Var = this.f46796i;
        if (l2Var != null) {
            l2Var.d();
            AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
            com.vungle.ads.internal.util.s sVar = this.f46790c;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("percentage=");
            sbA.append(this.f46789b.f46932e);
            sbA.append(" url=");
            sbA.append(this.f46789b.f46929b);
            analyticsClient.a(l2Var, sVar, sbA.toString());
        }
    }

    public final void i() throws Throwable {
        l2 l2Var = this.f46795h;
        if (l2Var != null) {
            l2Var.d();
            AnalyticsClient.INSTANCE.a(l2Var, this.f46790c, this.f46789b.f46929b);
        }
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("DownloadRequest{priority=");
        sbA.append(this.f46788a);
        sbA.append(", url='");
        sbA.append(this.f46789b.f46929b);
        sbA.append("', path='");
        sbA.append(this.f46789b.f46930c);
        sbA.append("', cancelled=");
        sbA.append(this.f46792e);
        sbA.append(", retryAttempt=");
        sbA.append(this.f46793f.get());
        sbA.append(", maxRetries=");
        sbA.append(this.f46791d);
        sbA.append(", logEntry=");
        sbA.append(this.f46790c);
        sbA.append(AbstractJsonLexerKt.END_OBJ);
        return sbA.toString();
    }

    public l(k priority, com.vungle.ads.internal.model.b asset, com.vungle.ads.internal.util.s sVar, int i5) {
        Intrinsics.g(priority, "priority");
        Intrinsics.g(asset, "asset");
        this.f46788a = priority;
        this.f46789b = asset;
        this.f46790c = sVar;
        this.f46791d = i5;
        this.f46792e = new AtomicBoolean(false);
        this.f46793f = new AtomicInteger(0);
        this.f46794g = Collections.synchronizedList(new ArrayList());
    }

    public final void a(String reason) {
        Intrinsics.g(reason, "reason");
        this.f46794g.add(reason);
    }
}
