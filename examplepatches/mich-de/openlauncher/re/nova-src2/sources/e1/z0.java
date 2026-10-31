package e1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class z0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public a1 f51425t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f51426u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ a1 f51427v;

    /* renamed from: w, reason: collision with root package name */
    public int f51428w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z0(a1 a1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f51427v = a1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f51426u = obj;
        this.f51428w |= Integer.MIN_VALUE;
        return this.f51427v.t(this);
    }
}
