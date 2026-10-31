package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ss1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ts1 f9651a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f9652b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ts1 f9653c;

    /* renamed from: d, reason: collision with root package name */
    public int f9654d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ss1(ts1 ts1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9653c = ts1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9652b = obj;
        this.f9654d |= Integer.MIN_VALUE;
        return this.f9653c.a(null, 0, this);
    }
}
