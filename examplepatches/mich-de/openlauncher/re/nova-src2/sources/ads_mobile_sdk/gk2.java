package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class gk2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f3980a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ hk2 f3981b;

    /* renamed from: c, reason: collision with root package name */
    public int f3982c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gk2(hk2 hk2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3981b = hk2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3980a = obj;
        this.f3982c |= Integer.MIN_VALUE;
        return this.f3981b.c(this);
    }
}
