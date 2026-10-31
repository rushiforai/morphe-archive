package m0;

import e0.f1;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;

/* loaded from: classes2.dex */
public final class a0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public f1 f75387t;

    /* renamed from: u, reason: collision with root package name */
    public SuspendLambda f75388u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f75389v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ b0 f75390w;

    /* renamed from: x, reason: collision with root package name */
    public int f75391x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(b0 b0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75390w = b0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75389v = obj;
        this.f75391x |= Integer.MIN_VALUE;
        return this.f75390w.d(null, null, this);
    }
}
