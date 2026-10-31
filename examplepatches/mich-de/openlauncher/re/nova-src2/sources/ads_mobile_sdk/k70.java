package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class k70 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f5535a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l70 f5536b;

    /* renamed from: c, reason: collision with root package name */
    public int f5537c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k70(l70 l70Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5536b = l70Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5535a = obj;
        this.f5537c |= Integer.MIN_VALUE;
        return this.f5536b.d(this);
    }
}
