package e20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class p extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public r f52071t;

    /* renamed from: u, reason: collision with root package name */
    public t70.j0 f52072u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f52073v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ r f52074w;

    /* renamed from: x, reason: collision with root package name */
    public int f52075x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52074w = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52073v = obj;
        this.f52075x |= Integer.MIN_VALUE;
        return this.f52074w.f(null, this);
    }
}
