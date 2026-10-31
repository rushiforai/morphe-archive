package com.amplitude;

import java.util.LinkedHashMap;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;

/* renamed from: com.amplitude.v0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public abstract class AbstractC0525v0 {

    /* renamed from: a, reason: collision with root package name */
    public final FunctionReferenceImpl f20787a;

    /* renamed from: b, reason: collision with root package name */
    public final com.amplitude.android.sessionreplay.a f20788b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.a2 f20789c;

    /* renamed from: d, reason: collision with root package name */
    public final LinkedHashMap f20790d;

    /* JADX WARN: Multi-variable type inference failed */
    public AbstractC0525v0(Function1 storeEvents, com.amplitude.android.sessionreplay.a scope, t70.a2 mainDispatcher) {
        Intrinsics.g(storeEvents, "storeEvents");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(mainDispatcher, "mainDispatcher");
        this.f20787a = (FunctionReferenceImpl) storeEvents;
        this.f20788b = scope;
        this.f20789c = mainDispatcher;
        this.f20790d = new LinkedHashMap();
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.FunctionReferenceImpl] */
    public final void a(W1 event) {
        Intrinsics.g(event, "event");
        this.f20787a.invoke(ul.b.P(event));
    }

    public final void a() {
        for (AbstractC0489o0 abstractC0489o0 : this.f20790d.values()) {
            if (abstractC0489o0.c()) {
                abstractC0489o0.f20702f = true;
            }
        }
    }
}
