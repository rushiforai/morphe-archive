package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class nk0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f7623a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ tk0 f7624b;

    /* renamed from: c, reason: collision with root package name */
    public int f7625c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public nk0(tk0 tk0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7624b = tk0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7623a = obj;
        this.f7625c |= Integer.MIN_VALUE;
        return this.f7624b.d(this);
    }
}
