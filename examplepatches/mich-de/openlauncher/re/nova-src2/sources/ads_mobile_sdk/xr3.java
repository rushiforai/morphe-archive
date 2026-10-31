package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class xr3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f11807a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ bs3 f11808b;

    /* renamed from: c, reason: collision with root package name */
    public int f11809c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xr3(bs3 bs3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11808b = bs3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11807a = obj;
        this.f11809c |= Integer.MIN_VALUE;
        return bs3.e(this.f11808b, this);
    }
}
