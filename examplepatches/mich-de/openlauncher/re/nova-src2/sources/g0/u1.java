package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class u1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public long f56716t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f56717u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ v1 f56718v;

    /* renamed from: w, reason: collision with root package name */
    public int f56719w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u1(v1 v1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56718v = v1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56717u = obj;
        this.f56719w |= Integer.MIN_VALUE;
        return this.f56718v.b(0L, 0L, this);
    }
}
