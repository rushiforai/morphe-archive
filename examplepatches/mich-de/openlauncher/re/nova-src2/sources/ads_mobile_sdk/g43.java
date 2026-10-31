package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class g43 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f3639a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h43 f3640b;

    /* renamed from: c, reason: collision with root package name */
    public int f3641c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g43(h43 h43Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3640b = h43Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3639a = obj;
        this.f3641c |= Integer.MIN_VALUE;
        return this.f3640b.d(this);
    }
}
