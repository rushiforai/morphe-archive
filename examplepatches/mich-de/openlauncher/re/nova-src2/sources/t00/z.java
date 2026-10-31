package t00;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class z extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public a0 f88427t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f88428u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ a0 f88429v;

    /* renamed from: w, reason: collision with root package name */
    public int f88430w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z(a0 a0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88429v = a0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88428u = obj;
        this.f88430w |= Integer.MIN_VALUE;
        return this.f88429v.i(this);
    }
}
