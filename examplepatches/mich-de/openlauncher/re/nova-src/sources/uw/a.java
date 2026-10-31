package uw;

import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import p1.e1;
import p1.p1;

/* loaded from: classes4.dex */
public final class a implements p1, e1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e1 f91579a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f91580b;

    public a(e1 state, CoroutineContext coroutineContext) {
        Intrinsics.g(state, "state");
        Intrinsics.g(coroutineContext, "coroutineContext");
        this.f91579a = state;
        this.f91580b = coroutineContext;
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f91580b;
    }

    @Override // p1.y2
    public final Object getValue() {
        return this.f91579a.getValue();
    }

    @Override // p1.e1
    public final void setValue(Object obj) {
        this.f91579a.setValue(obj);
    }
}
