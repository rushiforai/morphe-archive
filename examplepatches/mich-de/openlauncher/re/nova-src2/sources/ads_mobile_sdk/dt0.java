package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class dt0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public et0 f2616a;

    /* renamed from: b, reason: collision with root package name */
    public c80.a f2617b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f2618c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f2619d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ et0 f2620e;

    /* renamed from: f, reason: collision with root package name */
    public int f2621f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dt0(et0 et0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2620e = et0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2619d = obj;
        this.f2621f |= Integer.MIN_VALUE;
        return this.f2620e.a(false, (ContinuationImpl) this);
    }
}
