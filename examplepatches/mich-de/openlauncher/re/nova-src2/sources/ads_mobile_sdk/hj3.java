package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class hj3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public nj3 f4414a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f4415b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ nj3 f4416c;

    /* renamed from: d, reason: collision with root package name */
    public int f4417d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hj3(nj3 nj3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4416c = nj3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4415b = obj;
        this.f4417d |= Integer.MIN_VALUE;
        return this.f4416c.a((ni.s) null, this);
    }
}
