package v2;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.g2;

/* loaded from: classes2.dex */
public final class h0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g2 f91934t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f91935u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ j0 f91936v;

    /* renamed from: w, reason: collision with root package name */
    public int f91937w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h0(j0 j0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f91936v = j0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f91935u = obj;
        this.f91937w |= Integer.MIN_VALUE;
        return this.f91936v.k(0L, null, this);
    }
}
