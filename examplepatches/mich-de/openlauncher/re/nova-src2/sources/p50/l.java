package p50;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public q50.c f82122t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f82123u;

    /* renamed from: v, reason: collision with root package name */
    public int f82124v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f82123u = obj;
        this.f82124v |= Integer.MIN_VALUE;
        return n.b(null, this);
    }
}
