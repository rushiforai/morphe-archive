package n1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public n f77654t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f77655u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ n f77656v;

    /* renamed from: w, reason: collision with root package name */
    public int f77657w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(n nVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f77656v = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f77655u = obj;
        this.f77657w |= Integer.MIN_VALUE;
        return this.f77656v.D(this);
    }
}
