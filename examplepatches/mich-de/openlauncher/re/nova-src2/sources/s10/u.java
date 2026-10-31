package s10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public i f86633t;

    /* renamed from: u, reason: collision with root package name */
    public d0 f86634u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f86635v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ d0 f86636w;

    /* renamed from: x, reason: collision with root package name */
    public int f86637x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(d0 d0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86636w = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86635v = obj;
        this.f86637x |= Integer.MIN_VALUE;
        return this.f86636w.d(null, null, this);
    }
}
