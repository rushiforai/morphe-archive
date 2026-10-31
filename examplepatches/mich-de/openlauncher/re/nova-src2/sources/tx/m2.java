package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p2 f89877t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f89878u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p2 f89879v;

    /* renamed from: w, reason: collision with root package name */
    public int f89880w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m2(p2 p2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89879v = p2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89878u = obj;
        this.f89880w |= Integer.MIN_VALUE;
        return this.f89879v.b(this);
    }
}
