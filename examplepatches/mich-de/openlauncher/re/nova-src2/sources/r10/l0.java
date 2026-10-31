package r10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public String f85165t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f85166u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ m0 f85167v;

    /* renamed from: w, reason: collision with root package name */
    public int f85168w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l0(m0 m0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85167v = m0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85166u = obj;
        this.f85168w |= Integer.MIN_VALUE;
        return this.f85167v.a(null, this);
    }
}
