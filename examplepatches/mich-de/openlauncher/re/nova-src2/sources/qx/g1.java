package qx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class g1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public i1 f84496t;

    /* renamed from: u, reason: collision with root package name */
    public l f84497u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f84498v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ i1 f84499w;

    /* renamed from: x, reason: collision with root package name */
    public int f84500x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g1(i1 i1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84499w = i1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84498v = obj;
        this.f84500x |= Integer.MIN_VALUE;
        return i1.c(this.f84499w, null, this);
    }
}
