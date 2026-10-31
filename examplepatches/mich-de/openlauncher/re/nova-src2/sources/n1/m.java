package n1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public n f77664t;

    /* renamed from: u, reason: collision with root package name */
    public float f77665u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f77666v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ n f77667w;

    /* renamed from: x, reason: collision with root package name */
    public int f77668x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(n nVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f77667w = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f77666v = obj;
        this.f77668x |= Integer.MIN_VALUE;
        return this.f77667w.H(0.0f, this);
    }
}
