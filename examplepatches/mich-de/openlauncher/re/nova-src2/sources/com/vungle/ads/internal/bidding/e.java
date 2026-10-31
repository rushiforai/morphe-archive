package com.vungle.ads.internal.bidding;

import android.content.Context;
import com.iab.omid.library.vungle.internal.l;
import com.vungle.ads.GzipEncodeError;
import com.vungle.ads.JsonEncodeError;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.k2;
import com.vungle.ads.internal.model.m3;
import com.vungle.ads.internal.model.p3;
import com.vungle.ads.internal.model.u1;
import com.vungle.ads.internal.network.VungleApiClient;
import com.vungle.ads.internal.network.f0;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.util.q;
import com.vungle.ads.internal.util.s;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializersKt;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonKt;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final Context f46747a;

    /* renamed from: b, reason: collision with root package name */
    public k2 f46748b;

    /* renamed from: c, reason: collision with root package name */
    public int f46749c;

    /* renamed from: d, reason: collision with root package name */
    public final Json f46750d;

    /* renamed from: e, reason: collision with root package name */
    public long f46751e;

    public e(Context context) {
        Intrinsics.g(context, "context");
        this.f46747a = context;
        this.f46748b = new k2(Sdk.SDKMetric.SDKMetricType.BID_TOKEN_REQUESTED);
        this.f46750d = JsonKt.Json$default(null, d.f46746a, 1, null);
        com.vungle.ads.internal.util.d dVar = com.vungle.ads.internal.util.d.f47677f;
        com.vungle.ads.internal.util.a.a(new a(this));
    }

    public final String a() {
        VungleApiClient vungleApiClient = (VungleApiClient) LazyKt.b(LazyThreadSafetyMode.f71679a, new c(this.f46747a)).getValue();
        ConfigManager.INSTANCE.getClass();
        u1 u1VarA = vungleApiClient.a(!ConfigManager.t(), ConfigManager.d());
        p3 p3Var = new p3(u1VarA.a(), u1VarA.d(), u1VarA.b(), new m3(f0.d()), this.f46749c);
        Json json = this.f46750d;
        KSerializer<Object> kSerializerSerializer = SerializersKt.serializer(json.getSerializersModule(), Reflection.b(p3.class));
        Intrinsics.e(kSerializerSerializer, "null cannot be cast to non-null type kotlinx.serialization.KSerializer<T of kotlinx.serialization.internal.Platform_commonKt.cast>");
        return json.encodeToString(kSerializerSerializer, p3Var);
    }

    public final b b() {
        this.f46749c++;
        AnalyticsClient.a(AnalyticsClient.INSTANCE, this.f46748b, (s) null, 6);
        try {
            String strA = a();
            boolean z11 = u.f47714a;
            t.a("BidTokenEncoder", "BidToken: " + strA);
            try {
                String str = "6:" + q.a(strA);
                t.a("BidTokenEncoder", "After conversion: " + str);
                return new b(str, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            } catch (Throwable th2) {
                StringBuilder sbA = l.a("Fail to gzip token data. ");
                sbA.append(th2.getLocalizedMessage());
                String string = sbA.toString();
                new GzipEncodeError(string).logErrorNoReturnValue$vungle_ads_release();
                return new b(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, string);
            }
        } catch (Throwable th3) {
            StringBuilder sbA2 = l.a("Failed to encode TokenParameters. ");
            sbA2.append(th3.getLocalizedMessage());
            String string2 = sbA2.toString();
            new JsonEncodeError(string2).logErrorNoReturnValue$vungle_ads_release();
            return new b(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, string2);
        }
    }
}
