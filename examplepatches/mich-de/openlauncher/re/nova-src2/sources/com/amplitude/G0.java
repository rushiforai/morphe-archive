package com.amplitude;

import com.amplitude.android.sessionreplay.config.MaskLevel;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class G0 extends AbstractC0525v0 {

    /* renamed from: e, reason: collision with root package name */
    public final K3 f20241e;

    /* renamed from: f, reason: collision with root package name */
    public volatile MaskLevel f20242f;

    /* renamed from: g, reason: collision with root package name */
    public final K1 f20243g;

    /* JADX WARN: Illegal instructions before constructor call */
    public G0(V2 storeEvents, com.amplitude.android.sessionreplay.a scope, K3 logger, MaskLevel maskLevel, K1 k12) {
        a80.e eVar = t70.y0.f88884a;
        u70.d mainDispatcher = y70.o.f96819a;
        Intrinsics.g(storeEvents, "storeEvents");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(mainDispatcher, "mainDispatcher");
        super(storeEvents, scope, mainDispatcher);
        this.f20241e = logger;
        this.f20242f = maskLevel;
        this.f20243g = k12;
    }
}
