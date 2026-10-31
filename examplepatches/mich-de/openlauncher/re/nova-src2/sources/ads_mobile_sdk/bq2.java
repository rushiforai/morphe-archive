package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class bq2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public od1 f1495a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f1496b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ dq2 f1497c;

    /* renamed from: d, reason: collision with root package name */
    public int f1498d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bq2(dq2 dq2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1497c = dq2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1496b = obj;
        this.f1498d |= Integer.MIN_VALUE;
        return this.f1497c.b(null, this);
    }
}
