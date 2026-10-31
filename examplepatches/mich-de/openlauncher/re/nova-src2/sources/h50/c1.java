package h50;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class c1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f59164t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ d1 f59165u;

    /* renamed from: v, reason: collision with root package name */
    public int f59166v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c1(d1 d1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f59165u = d1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f59164t = obj;
        this.f59166v |= Integer.MIN_VALUE;
        return this.f59165u.a(null, this);
    }
}
