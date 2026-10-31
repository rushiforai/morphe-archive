package vs;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public o f92967t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f92968u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ o f92969v;

    /* renamed from: w, reason: collision with root package name */
    public int f92970w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(o oVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f92969v = oVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f92968u = obj;
        this.f92970w |= Integer.MIN_VALUE;
        return o.e(this.f92969v, null, this);
    }
}
