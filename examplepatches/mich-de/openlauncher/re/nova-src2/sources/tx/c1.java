package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public a2 f89676t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f89677u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ d1 f89678v;

    /* renamed from: w, reason: collision with root package name */
    public int f89679w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c1(d1 d1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89678v = d1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89677u = obj;
        this.f89679w |= Integer.MIN_VALUE;
        return this.f89678v.g(null, this);
    }
}
