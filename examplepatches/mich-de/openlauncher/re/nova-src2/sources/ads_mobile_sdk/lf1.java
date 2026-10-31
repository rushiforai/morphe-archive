package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class lf1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public of1 f6226a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f6227b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ of1 f6228c;

    /* renamed from: d, reason: collision with root package name */
    public int f6229d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lf1(of1 of1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6228c = of1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6227b = obj;
        this.f6229d |= Integer.MIN_VALUE;
        return this.f6228c.c(this);
    }
}
