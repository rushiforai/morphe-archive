package g0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class b1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f56468t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ c1 f56469u;

    /* renamed from: v, reason: collision with root package name */
    public int f56470v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b1(c1 c1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56469u = c1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56468t = obj;
        this.f56470v |= Integer.MIN_VALUE;
        return this.f56469u.i(null, null, this);
    }
}
