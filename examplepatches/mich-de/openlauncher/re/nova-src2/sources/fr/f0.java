package fr;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public dr.a f55606t;

    /* renamed from: u, reason: collision with root package name */
    public i f55607u;

    /* renamed from: v, reason: collision with root package name */
    public dr.b f55608v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f55609w;

    /* renamed from: x, reason: collision with root package name */
    public int f55610x;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55609w = obj;
        this.f55610x |= Integer.MIN_VALUE;
        return h0.d(null, null, null, null, this);
    }
}
