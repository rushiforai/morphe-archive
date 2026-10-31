package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class u31 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f10191a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ v31 f10192b;

    /* renamed from: c, reason: collision with root package name */
    public int f10193c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u31(v31 v31Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10192b = v31Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10191a = obj;
        this.f10193c |= Integer.MIN_VALUE;
        return this.f10192b.d(this);
    }
}
