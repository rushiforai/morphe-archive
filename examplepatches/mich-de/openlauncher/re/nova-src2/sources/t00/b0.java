package t00;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c0 f88326t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f88327u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c0 f88328v;

    /* renamed from: w, reason: collision with root package name */
    public int f88329w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(c0 c0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88328v = c0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88327u = obj;
        this.f88329w |= Integer.MIN_VALUE;
        return this.f88328v.i(this);
    }
}
