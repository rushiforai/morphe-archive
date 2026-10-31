package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class kr1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public rr1 f5939a;

    /* renamed from: b, reason: collision with root package name */
    public c80.a f5940b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f5941c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f5942d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ rr1 f5943e;

    /* renamed from: f, reason: collision with root package name */
    public int f5944f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kr1(rr1 rr1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5943e = rr1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5942d = obj;
        this.f5944f |= Integer.MIN_VALUE;
        return rr1.a(this.f5943e, false, (ContinuationImpl) this);
    }
}
