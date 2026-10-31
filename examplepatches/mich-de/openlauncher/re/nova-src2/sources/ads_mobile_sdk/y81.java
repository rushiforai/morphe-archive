package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class y81 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f11959a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k02 f11960b;

    /* renamed from: c, reason: collision with root package name */
    public int f11961c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y81(k02 k02Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11960b = k02Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11959a = obj;
        this.f11961c |= Integer.MIN_VALUE;
        return this.f11960b.a((b.u7) null, this);
    }
}
