package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class yh2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f12025a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ dz1 f12026b;

    /* renamed from: c, reason: collision with root package name */
    public int f12027c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yh2(dz1 dz1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12026b = dz1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12025a = obj;
        this.f12027c |= Integer.MIN_VALUE;
        return this.f12026b.a((b.u7) null, this);
    }
}
