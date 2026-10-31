package com.amplitude;

import java.util.List;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.collections.ArrayDeque;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONException;

/* loaded from: classes2.dex */
public final class T3 {

    /* renamed from: a, reason: collision with root package name */
    public final K3 f20390a;

    /* renamed from: b, reason: collision with root package name */
    public final u4 f20391b;

    /* renamed from: c, reason: collision with root package name */
    public final M4 f20392c;

    /* renamed from: d, reason: collision with root package name */
    public final G0 f20393d;

    /* renamed from: e, reason: collision with root package name */
    public final Lazy f20394e;

    /* renamed from: f, reason: collision with root package name */
    public final Lazy f20395f;

    /* renamed from: g, reason: collision with root package name */
    public final Lazy f20396g;

    public T3(K3 logger, u4 viewCache, M4 webViewManager, G0 flutterViewManager) {
        Intrinsics.g(logger, "logger");
        Intrinsics.g(viewCache, "viewCache");
        Intrinsics.g(webViewManager, "webViewManager");
        Intrinsics.g(flutterViewManager, "flutterViewManager");
        this.f20390a = logger;
        this.f20391b = viewCache;
        this.f20392c = webViewManager;
        this.f20393d = flutterViewManager;
        this.f20394e = LazyKt.a(S3.f20384a);
        this.f20395f = LazyKt.a(new Q3(this));
        this.f20396g = LazyKt.a(new R3(this));
    }

    public final C0436f2 a(ArrayDeque arrayDeque) throws JSONException {
        Pair pairA;
        J0 j02 = (J0) arrayDeque.removeFirst();
        if (j02 instanceof C0519u) {
            pairA = ((C0514t) this.f20395f.getValue()).a((C0519u) j02);
        } else {
            if (!(j02 instanceof L)) {
                throw new NoWhenBranchMatchedException();
            }
            pairA = ((K) this.f20396g.getValue()).a((L) j02);
        }
        C0436f2 c0436f2 = (C0436f2) pairA.f71683a;
        arrayDeque.addAll((List) pairA.f71684b);
        return c0436f2;
    }
}
