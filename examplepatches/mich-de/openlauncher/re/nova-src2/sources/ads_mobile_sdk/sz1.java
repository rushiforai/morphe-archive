package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class sz1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f9740a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k02 f9741b;

    /* renamed from: c, reason: collision with root package name */
    public int f9742c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public sz1(k02 k02Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9741b = k02Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9740a = obj;
        this.f9742c |= Integer.MIN_VALUE;
        return this.f9741b.a((b.u7) null, this);
    }
}
