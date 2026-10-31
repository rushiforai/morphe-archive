package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f89646t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ d1 f89647u;

    /* renamed from: v, reason: collision with root package name */
    public int f89648v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a1(d1 d1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89647u = d1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89646t = obj;
        this.f89648v |= Integer.MIN_VALUE;
        return this.f89647u.c(this);
    }
}
