package r10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class u1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v1 f85259t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f85260u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ v1 f85261v;

    /* renamed from: w, reason: collision with root package name */
    public int f85262w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u1(v1 v1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f85261v = v1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f85260u = obj;
        this.f85262w |= Integer.MIN_VALUE;
        return this.f85261v.c(null, this);
    }
}
