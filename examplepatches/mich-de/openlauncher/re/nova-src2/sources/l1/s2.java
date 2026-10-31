package l1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class s2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t2 f73933t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f73934u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ t2 f73935v;

    /* renamed from: w, reason: collision with root package name */
    public int f73936w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s2(t2 t2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f73935v = t2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f73934u = obj;
        this.f73936w |= Integer.MIN_VALUE;
        return this.f73935v.b(this);
    }
}
