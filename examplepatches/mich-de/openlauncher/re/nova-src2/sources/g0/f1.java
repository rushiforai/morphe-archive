package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class f1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f56519t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h1 f56520u;

    /* renamed from: v, reason: collision with root package name */
    public int f56521v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f1(h1 h1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56520u = h1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56519t = obj;
        this.f56521v |= Integer.MIN_VALUE;
        return this.f56520u.f(this);
    }
}
