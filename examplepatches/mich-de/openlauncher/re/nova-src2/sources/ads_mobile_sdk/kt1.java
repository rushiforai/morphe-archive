package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class kt1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public it1 f5964a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f5965b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ wt1 f5966c;

    /* renamed from: d, reason: collision with root package name */
    public int f5967d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kt1(wt1 wt1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5966c = wt1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5965b = obj;
        this.f5967d |= Integer.MIN_VALUE;
        return this.f5966c.b(null, null, null, this);
    }
}
