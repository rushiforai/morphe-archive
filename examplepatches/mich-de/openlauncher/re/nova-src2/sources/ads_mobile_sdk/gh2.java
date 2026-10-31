package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class gh2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f3850a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ hh2 f3851b;

    /* renamed from: c, reason: collision with root package name */
    public int f3852c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gh2(hh2 hh2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3851b = hh2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3850a = obj;
        this.f3852c |= Integer.MIN_VALUE;
        return this.f3851b.a((b.u7) null, this);
    }
}
