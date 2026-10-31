package com.instabridge.mobilesdk.internal.data.api;

import c90.f;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.instabridge.mobilesdk.api.AnalyticsSink;
import com.instabridge.mobilesdk.internal.analytics.Events;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.LinkedHashMap;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import x80.h0;
import x80.m0;
import x80.x;
import x80.y;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0001\u0018\u0000 \u00122\u00020\u0001:\u0001\u0012B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J!\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\b\u0010\t\u001a\u0004\u0018\u00010\bH\u0002¢\u0006\u0004\b\u000b\u0010\fJ\u0017\u0010\u000f\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\rH\u0016¢\u0006\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0011¨\u0006\u0013"}, d2 = {"Lcom/instabridge/mobilesdk/internal/data/api/BackendResponseInterceptor;", "Lx80/y;", "Lcom/instabridge/mobilesdk/api/AnalyticsSink;", "analytics", "<init>", "(Lcom/instabridge/mobilesdk/api/AnalyticsSink;)V", "Lx80/m0;", "response", b.f42142b, "requestBody", b.f42142b, "track", "(Lx80/m0;Ljava/lang/String;)V", "Lx80/x;", "chain", "intercept", "(Lx80/x;)Lx80/m0;", "Lcom/instabridge/mobilesdk/api/AnalyticsSink;", k.O, "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class BackendResponseInterceptor implements y {

    @NotNull
    private static final String CORRELATION_HEADER = "X-Correlation-ID";
    private static final long MAX_PEEK_BYTES = 4096;

    @NotNull
    private final AnalyticsSink analytics;
    public static final int $stable = 8;

    public BackendResponseInterceptor(@NotNull AnalyticsSink analytics) {
        Intrinsics.g(analytics, "analytics");
        this.analytics = analytics;
    }

    private final void track(m0 response, String requestBody) {
        Object objA;
        h0 h0Var = response.f95553a;
        LinkedHashMap linkedHashMapK0 = MapsKt.k0(new Pair("method", h0Var.f95510b), new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, BackendResponseScrubber.INSTANCE.scrubUrl(h0Var.f95509a)), new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, Integer.valueOf(response.f95556d)), new Pair(PglCryptUtils.KEY_MESSAGE, response.f95555c));
        if (requestBody != null) {
            linkedHashMapK0.put("request_body", requestBody);
        }
        if (response.f95559g != null) {
            try {
                int i5 = Result.f71687b;
                objA = response.e(MAX_PEEK_BYTES).string();
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            if (objA instanceof Result.Failure) {
                objA = null;
            }
            String strScrubResponseBody = BackendResponseScrubber.INSTANCE.scrubResponseBody(response.f95553a.f95509a, (String) objA);
            if (strScrubResponseBody != null) {
                linkedHashMapK0.put("body", strScrubResponseBody);
            }
        }
        String strB = response.f95558f.b(CORRELATION_HEADER);
        String str = strB != null ? strB : null;
        if (str != null) {
            linkedHashMapK0.put(CORRELATION_HEADER, str);
        }
        this.analytics.track(Events.BACKEND_RESPONSE, linkedHashMapK0);
    }

    @Override // x80.y
    @NotNull
    public m0 intercept(@NotNull x chain) {
        Object objA;
        Intrinsics.g(chain, "chain");
        try {
            int i5 = Result.f71687b;
            objA = BackendResponseScrubber.INSTANCE.scrubRequestBody(((f) chain).f19892e);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        String str = (String) objA;
        f fVar = (f) chain;
        m0 m0VarB = fVar.b(fVar.f19892e);
        try {
            track(m0VarB, str);
            Unit unit = Unit.f71706a;
        } catch (Throwable th3) {
            int i12 = Result.f71687b;
            ResultKt.a(th3);
        }
        return m0VarB;
    }
}
