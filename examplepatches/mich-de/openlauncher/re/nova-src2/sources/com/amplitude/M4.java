package com.amplitude;

import android.content.Context;
import androidx.webkit.WebViewFeature;
import com.amplitude.common.Logger;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class M4 extends AbstractC0525v0 {

    /* renamed from: e, reason: collision with root package name */
    public final K3 f20329e;

    /* renamed from: f, reason: collision with root package name */
    public final String f20330f;

    /* renamed from: g, reason: collision with root package name */
    public final Lazy f20331g;

    /* JADX WARN: Illegal instructions before constructor call */
    public M4(I3 storeEvents, com.amplitude.android.sessionreplay.a scope, Context context, K3 logger) {
        Logger logger2;
        a80.e eVar = t70.y0.f88884a;
        u70.d mainDispatcher = y70.o.f96819a;
        Intrinsics.g(storeEvents, "storeEvents");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(context, "context");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(mainDispatcher, "mainDispatcher");
        super(storeEvents, scope, mainDispatcher);
        this.f20329e = logger;
        this.f20330f = b.c0.j("toString(...)");
        this.f20331g = LazyKt.a(new L4(context, this));
        if ((WebViewFeature.a(WebViewFeature.CREATE_WEB_MESSAGE_CHANNEL) && WebViewFeature.a(WebViewFeature.POST_WEB_MESSAGE)) || (logger2 = logger.f20306a) == null) {
            return;
        }
        logger2.warn("WebViewManager: WebMessagePort features are not supported on this device.");
    }
}
