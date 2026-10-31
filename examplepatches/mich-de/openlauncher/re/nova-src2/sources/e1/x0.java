package e1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class x0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f51413t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ a1 f51414u;

    /* renamed from: v, reason: collision with root package name */
    public int f51415v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x0(a1 a1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f51414u = a1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f51413t = obj;
        this.f51415v |= Integer.MIN_VALUE;
        return a1.b(this.f51414u, this);
    }
}
