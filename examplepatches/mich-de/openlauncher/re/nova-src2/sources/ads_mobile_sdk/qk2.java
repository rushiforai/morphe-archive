package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class qk2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f8714a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ rk2 f8715b;

    /* renamed from: c, reason: collision with root package name */
    public int f8716c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qk2(rk2 rk2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8715b = rk2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8714a = obj;
        this.f8716c |= Integer.MIN_VALUE;
        return this.f8715b.c(this);
    }
}
