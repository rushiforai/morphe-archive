package p50;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public f80.a f82125t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f82126u;

    /* renamed from: v, reason: collision with root package name */
    public int f82127v;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f82126u = obj;
        this.f82127v |= Integer.MIN_VALUE;
        return n.d(null, null, this);
    }
}
