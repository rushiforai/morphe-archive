package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class g1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c80.d f88590t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f88591u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88592v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ h1 f88593w;

    /* renamed from: x, reason: collision with root package name */
    public int f88594x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g1(h1 h1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88593w = h1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88592v = obj;
        this.f88594x |= Integer.MIN_VALUE;
        return this.f88593w.a(null, this);
    }
}
