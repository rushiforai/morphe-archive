package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class f82 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public i82 f3248a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f3249b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ i82 f3250c;

    /* renamed from: d, reason: collision with root package name */
    public int f3251d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f82(i82 i82Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3250c = i82Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3249b = obj;
        this.f3251d |= Integer.MIN_VALUE;
        return i82.d(this.f3250c, this);
    }
}
