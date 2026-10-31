package p0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class c0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f81134t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ d0 f81135u;

    /* renamed from: v, reason: collision with root package name */
    public int f81136v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(d0 d0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f81135u = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81134t = obj;
        this.f81136v |= Integer.MIN_VALUE;
        return this.f81135u.a(null, 0.0f, this);
    }
}
